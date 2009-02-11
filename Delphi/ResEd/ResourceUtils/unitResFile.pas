unit unitResFile;

interface

uses Windows, Classes, SysUtils, ConTnrs, unitResourceElement, dialogs;

type
TResourceList = class (TResourceModule)
private
  fResourceList : TObjectList;
protected
  function GetResourceCount: Integer; override;
  function GetResourceElement(idx: Integer): TResourceElement; override;
public
  constructor Create;
  destructor Destroy; override;
  procedure Assign (src : TResourceModule);
  procedure InsertResource (idx : Integer; Element : TResourceElement); override;
  procedure DeleteResource (idx : Integer); override;
  function AddResource (Element : TResourceElement) : Integer; override;
  function IndexOfResource (Element : TResourceElement) : Integer; override;
  procedure SortResources; override;
end;

TResModule = class (TResourceList)
private
  f16Bit : boolean;
  procedure ParseResource(header, data: PAnsiChar; dataSize: Integer);
protected
public
  procedure SaveToStream (stream : TStream); override;
  procedure LoadFromStream (stream : TStream); override;
end;

implementation

{ TResModule }

procedure TResModule.ParseResource (header, data : PAnsiChar; dataSize : Integer);
var
  p : PAnsiChar;
  sName, sType : string;
  res : TResourceElement;
  language, memoryFlags : word;
  version, dataVersion, characteristics : DWORD;

  function GetName : string;
  begin
    if PWord (p)^ = $ffff then
    begin
      Inc (p, sizeof (word));
      result := IntToStr (PWord (p)^);
      Inc (p, sizeof (word))
    end
    else
    begin
      result := WideString (PWideChar (p));
      Inc (p, (Length (result) + 1) * sizeof (WideChar))
    end
  end;

begin
  p := header;
  Inc (p, 2 * sizeof (Integer));
  sType := GetName;
  sName := GetName;

  if (Integer (p) mod 4) <> 0 then
    Inc (p, 4 - Integer (p) mod 4);

  dataVersion := PDWORD (p)^;
  Inc (p, sizeof (DWORD));
  memoryFlags := PWORD (p)^;
  Inc (p, sizeof (word));
  language := PWORD (p)^;
  Inc (p, sizeof (word));
  version := PDWORD (p)^;
  Inc (p, sizeof (DWORD));
  characteristics := PDWORD (p)^;
  Inc (p, sizeof (DWORD));

  if (dataSize <> 0) or (sName <> '0') then
  begin
    res := TResourceElement.CreateResourceElement (self, language, sName, sType, dataSize, data);
    res.Characteristics := characteristics;
    res.Version := version;
    res.MemoryFlags := memoryFlags;
    res.DataVersion := dataVersion;
    AddResource (res)
  end
  else       // NB!!!  32 bit .RES files start with a dummy '32-bit indicator'
             // resource !!!  Is this documented?  I don't think so!

    f16Bit := False;
end;

procedure TResModule.LoadFromStream(stream: TStream);
var
  buffer, p, q : PAnsiChar;
  bufLen, n, DataSize, HeaderSize, ChunkSize : Integer;
begin
  bufLen := stream.Size;
  GetMem (buffer, bufLen);
  try
    stream.ReadBuffer (buffer^, bufLen);             // Read the entite file

    p := buffer;
    n := 0;
    f16Bit := True;
                                              // Parse each resource
    while n + 2 * sizeof (Integer) < bufLen do
    begin
      DataSize := PInteger (p)^;
      q := p;
      Inc (q, SizeOf  (Integer));
      HeaderSize := PInteger (q)^;
      q := p;
      Inc (q, HeaderSize);

      ParseResource (p, q, DataSize);
      ChunkSize := DataSize + HeaderSize;
      ChunkSize := ((ChunkSize + 3) div 4) * 4;
      Inc (p, ChunkSize);
      Inc (n, ChunkSize);
    end;

  finally
    FreeMem (buffer)
  end;
  SortResources
end;

procedure TResModule.SaveToStream(stream: TStream);
var
  res : TResourceElement;
  dataSize, headerSize, totalSize : Integer;
  header : array [0..1023] of ansichar;
  i : Integer;

  function GetResHeader (header : PAnsiChar) : DWORD;
  var
    pos : DWORD;
    len, dw : DWORD;
    w : word;
    i : Integer;
    ws : WideString;
  begin
    pos := 0;
    ZeroMemory (header, 1024);

    i := ResourceNameToInt (res.ResourceType);
    if i = -1 then
    begin
      ws := res.ResourceType;
      len := (Length (ws) + 1) * sizeof (WideChar);
      Move (PWideChar (ws)^, header [pos], len);
      Inc (pos, len)
    end
    else
    begin
      w := $ffff;
      Move (w, header [pos], sizeof (w));
      Inc (pos, sizeof (w));

      w := Word (i);
      Move (w, header [pos], sizeof (w));
      Inc (pos, sizeof (w))
    end;

    i := ResourceNameToInt (res.ResourceName);
    if i = -1 then
    begin
      ws := res.ResourceName;
      len := (Length (ws) + 1) * sizeof (WideChar);
      Move (PWideChar (ws)^, header [pos], len);
      Inc (pos, len)
    end
    else
    begin
      w := $ffff;
      Move (w, header [pos], sizeof (w));
      Inc (pos, sizeof (w));

      w := Word (i);
      Move (w, header [pos], sizeof (w));
      Inc (pos, sizeof (w))
    end;

    if (pos mod 4) <> 0 then
      Inc (pos, 4 - (pos mod 4));

    dw := res.DataVersion;
    Move (dw, header [pos], sizeof (DWORD));
    Inc (pos, sizeof (DWORD));

    w := res.MemoryFlags;
    Move (w, header [pos], sizeof (WORD));
    Inc (pos, sizeof (WORD));

    w := res.ResourceLanguage;
    Move (w, header [pos], sizeof (WORD));
    Inc (pos, sizeof (WORD));

    dw := res.Version;
    Move (dw, header [pos], sizeof (DWORD));
    Inc (pos, sizeof (DWORD));

    dw := res.Characteristics;
    Move (dw, header [pos], sizeof (DWORD));
    Inc (pos, sizeof (DWORD));
    result := pos;
  end;

begin
  if not f16Bit then               // Write 32-bit resource indicator (An empty type 0 resource)
  begin
    res := TResourceElement.CreateNew (nil, 0, '0');
    try
      dataSize := res.Data.Size;

      stream.WriteBuffer (dataSize, sizeof (dataSize));
      headerSize := GetResHeader (header);

      totalSize := headerSize + 2 * sizeof (DWORD);

      stream.WriteBuffer (totalSize, sizeof (headerSize));
      stream.WriteBuffer (header, headerSize);
    finally
      res.Free
    end
  end;

  dataSize := 0;
  if ResourceCount > 0 then
    for i := 0 to ResourceCount - 1 do
    begin
      res := ResourceElement [i];
      dataSize := res.Data.Size;

      stream.WriteBuffer (dataSize, sizeof (dataSize));
      headerSize := GetResHeader (header);

      totalSize := headerSize + 2 * sizeof (DWORD);

      stream.WriteBuffer (totalSize, sizeof (headerSize));
      stream.WriteBuffer (header, headerSize);
      stream.WriteBuffer (res.Data.Memory^, dataSize);

      totalSize := dataSize + totalSize;
      ZeroMemory (@header, sizeof (header));

      if (totalSize mod 4) <> 0 then
        stream.WriteBuffer (header, 4 - (totalSize mod 4));
    end
end;

{ TResourceList }

function TResourceList.AddResource(Element: TResourceElement): Integer;
begin
  Result := fResourceList.Add (Element);
end;

procedure TResourceList.Assign(src: TResourceModule);
var
  i : Integer;
  res : TResourceElement;
begin
  fResourceList.Clear;

  for i := 0 to src.ResourceCount - 1 do
  begin
    res := TResourceElement.CreateResourceElement (
      Self,
      src.ResourceElement [i].ResourceLanguage,
      src.ResourceElement [i].ResourceName,
      src.ResourceElement [i].ResourceType,
      src.ResourceElement [i].Data.Size,
      src.ResourceElement [i].Data.Memory);

    fResourceList.Add (res)
  end
end;

constructor TResourceList.Create;
begin
  fResourceList := TObjectList.Create;
end;

procedure TResourceList.DeleteResource(idx: Integer);
var
  res : TResourceElement;
begin
  res := ResourceElement [idx];
  inherited;
  idx := IndexOfResource (Res);
  if idx <> -1 then
    fResourceList.Delete (idx)
end;

destructor TResourceList.Destroy;
begin
  fResourceList.Free;
  inherited;
end;

function TResourceList.GetResourceCount: Integer;
begin
  result := fResourceList.Count
end;

function TResourceList.GetResourceElement(idx: Integer): TResourceElement;
begin
  result := TResourceElement (fResourceList [idx])
end;

function TResourceList.IndexOfResource(Element: TResourceElement): Integer;
begin
  result := fResourceList.IndexOf (Element)
end;

procedure TResourceList.InsertResource(idx: Integer;
  Element: TResourceElement);
begin
  fResourceList.Insert (idx, Element)
end;

procedure TResourceList.SortResources;
begin
  fResourceList.Sort (compareElement);
end;

end.
