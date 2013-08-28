unit uFormZintTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, zint, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, RTTI, Vcl.ComCtrls;

type
  TForm46 = class(TForm)
    imgResult: TImage;
    Panel1: TPanel;
    edData: TEdit;
    comType: TComboBox;
    lblError: TLabel;
    btPrint: TButton;
    comPrinter: TComboBox;
    GroupBox1: TGroupBox;
    edWhitespaceWidth: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    edFrameWidth: TEdit;
    rbBox: TRadioButton;
    rbBind: TRadioButton;
    rbNone: TRadioButton;
    cbHRT: TCheckBox;
    cbRAM: TComboBox;
    Label3: TLabel;
    edMHS: TEdit;
    Label4: TLabel;
    FontDialog1: TFontDialog;
    ButtonFont: TButton;
    btSVG: TButton;
    FileSaveDialog1: TFileSaveDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure edDataChange(Sender: TObject);
    procedure comTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btPrintClick(Sender: TObject);
    procedure ButtonFontClick(Sender: TObject);
    procedure btSVGClick(Sender: TObject);
  private
    procedure GenBarcode;
    function GenSymbol: TZintSymbol;
  public
    { Public-Deklarationen }
  end;

var
  Form46: TForm46;

implementation

{$R *.dfm}

uses zint_render_wmf, zint_render_canvas, Printers, zint_render_svg, zint_helper;

procedure TForm46.btPrintClick(Sender: TObject);
var
  symbol : TZintSymbol;
  rt  : TZintCanvasRenderTarget;
begin
  lblError.Caption := '';

  symbol:=GenSymbol;
  try
    symbol.Encode(edData.Text);

    Printer.PrinterIndex:=comPrinter.ItemIndex;
    Printer.BeginDoc;
    rt:=TZintCanvasRenderTarget.Create(Printer.Canvas);
    rt.RenderAdjustMode:=TZintRenderAdjustMode(cbRAM.ItemIndex);
    rt.Font.Assign(ButtonFont.Font);
    rt.HexagonScale:=StrToFloatDef(edMHS.Text, 1);
    rt.Left:=Printer.Canvas.ClipRect.Width/3;
    rt.Top:=Printer.Canvas.ClipRect.Height/3;
    rt.WidthDesired:=Printer.Canvas.ClipRect.Width/3;
    rt.HeightDesired:=Printer.Canvas.ClipRect.Height/3;
    try
      Symbol.Render(rt);
    finally
      rt.Free;
      Printer.EndDoc;
    end;

  except
    on E : Exception do
      lblError.Caption := e.Message;
  end;
  symbol.Free;
end;

procedure TForm46.btSVGClick(Sender: TObject);
var
  sl : TStringList;
  symbol : TZintSymbol;
  rt  : TZintSVGRenderTarget;
begin
  if FileSaveDialog1.Execute then
  begin
    sl:=TStringList.Create;
    try
      lblError.Caption := '';

      symbol:=GenSymbol;
      try
        symbol.Encode(edData.Text);

        rt:=TZintSVGRenderTarget.Create(sl);
        rt.ForegroundColor:='black';
        rt.BackgroundColor:='white';
        rt.Transparent:=false;
        rt.RenderAdjustMode:=TZintRenderAdjustMode(cbRAM.ItemIndex);
        rt.Font:=ButtonFont.Font.Name;
        rt.HexagonScale:=StrToFloatDef(edMHS.Text, 1);
        rt.Left:=0;
        rt.Top:=0;
        rt.WidthDesired:=300;
        rt.HeightDesired:=300;
        try
          Symbol.Render(rt);
        finally
          rt.Free;
        end;

      except
        on E : Exception do
          lblError.Caption := e.Message;
      end;
      symbol.Free;

      sl.SaveToFile(FileSaveDialog1.FileName);
    finally
      sl.free;
    end;
  end;
end;

procedure TForm46.ButtonFontClick(Sender: TObject);
begin
  if FontDialog1.Execute() then
    ButtonFont.Font.Assign(FontDialog1.Font);
  ButtonFont.Font.Size:=14;
  GenBarcode;
end;

procedure TForm46.comTypeChange(Sender: TObject);
begin
  GenBarcode;
end;

procedure TForm46.edDataChange(Sender: TObject);
begin
  GenBarcode;
end;

procedure TForm46.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  for i := Low(ZintSymbologies) to High(ZintSymbologies) do
    comType.Items.AddObject(ZintSymbologies[i].DisplayName, TObject(ZintSymbologies[i].Symbology));

  comType.ItemIndex := 0;

  comPrinter.Items.Assign(Printer.Printers);
  comPrinter.ItemIndex:=0;
end;

procedure TForm46.FormShow(Sender: TObject);
begin
  GenBarcode;
end;

function TForm46.GenSymbol: TZintSymbol;
begin
  Result := TZintSymbol.Create;
  Result.symbology := Integer(comType.Items.Objects[comType.ItemIndex]);
  Result.input_mode := UNICODE_MODE;

  if rbBox.Checked then
    Result.output_options:=Result.output_options or BARCODE_BOX
  else
  if rbBind.Checked then
    Result.output_options:=Result.output_options or BARCODE_BIND;

  Result.whitespace_width:=StrToIntDef(edWhitespaceWidth.Text, 0);
  Result.border_width:=StrToIntDef(edFrameWidth.Text, 0);
  if cbHRT.Checked then
    Result.show_hrt:= 1
  else
    Result.show_hrt:= 0;
end;

procedure TForm46.GenBarcode;
var
  symbol : TZintSymbol;
  wmf : TMetafile;
  rt  : TZintWMFRenderTarget;
begin
  imgResult.Picture.Graphic := nil;
  lblError.Caption := '';

  symbol:=GenSymbol;
  try
    symbol.Encode(edData.Text, true);

    wmf:=TMetafile.Create;
    wmf.SetSize(imgResult.Width, imgResult.Height);
    rt:=TZintWMFRenderTarget.Create(wmf);
    rt.HexagonScale:=StrToFloatDef(edMHS.Text, 1);
    rt.Font.Assign(ButtonFont.Font);
    rt.RenderAdjustMode:=TZintRenderAdjustMode(cbRAM.ItemIndex);
    try
      Symbol.Render(rt);
      imgResult.Picture.Graphic:=wmf;
    finally
      rt.Free;
      wmf.Free;
    end;

  except
    on E : Exception do
      lblError.Caption := e.Message;
  end;
  symbol.Free;
end;

end.
