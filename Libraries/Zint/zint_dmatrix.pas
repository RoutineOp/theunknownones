unit zint_dmatrix;

{
  Based on Zint (done by Robin Stuart and the Zint team)
  http://github.com/zint/zint

  Translation by TheUnknownOnes
  http://theunknownones.net

  License: Apache License 2.0

  Status:
    3432bc9aff311f2aea40f0e9883abfe6564c080b complete
}

{$IFDEF FPC}
{$mode objfpc}{$H+}
{$ENDIF}

interface

uses
  zint;

function dmatrix(symbol : zint_symbol; source : AnsiString; _length : Integer) : Integer;

implementation

uses
  zint_reedsol, zint_common;

const
  MAXBARCODE = 3116;

  DM_ASCII = 1;
  DM_C40 = 2;
  DM_TEXT = 3;
  DM_X12 = 4;
  DM_EDIFACT = 5;
  DM_BASE256 = 6;

c40_shift : array[0..127] of Integer = (
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 );

c40_value : array[0..127] of Integer = (
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,
	3,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,4,5,6,7,8,9,10,11,12,13,
	15,16,17,18,19,20,21,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,
	22,23,24,25,26,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31 );

text_shift : array[0..127] of Integer = (
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
	2, 2, 2, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3 );

text_value : array[0..127] of Integer = (
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,
	3,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,4,5,6,7,8,9,10,11,12,13,
	15,16,17,18,19,20,21,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,
	22,23,24,25,26,0,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,27,28,29,30,31 );

intsymbol : array[0..29] of Integer = (
	0,1,3,5,7,8,10,12,13,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,2,4,6,9,11,14 );

matrixH : array[0..29] of Integer = (
	10, 12, 8, 14, 8, 16, 12, 18, 20, 12, 22, 16, 24, 26, 16, 32, 36, 40, 44, 48,
	52, 64, 72, 80, 88, 96, 104, 120, 132, 144 );

matrixW : array[0..29] of Integer = (
	10, 12, 18, 14, 32, 16, 26, 18, 20, 36, 22, 36, 24, 26, 48, 32, 36, 40, 44,
	48, 52, 64, 72, 80, 88, 96, 104, 120, 132, 144 );

matrixFH : array[0..29] of Integer = (
	10, 12, 8, 14, 8, 16, 12, 18, 20, 12, 22, 16, 24, 26, 16, 16, 18, 20, 22, 24,
	26, 16, 18, 20, 22, 24, 26, 20, 22, 24 );

matrixFW : array[0..29] of Integer = (
	10, 12, 18, 14, 16, 16, 26, 18, 20, 18, 22, 18, 24, 26, 24, 16, 18, 20, 22,
	24, 26, 16, 18, 20, 22, 24, 26, 20, 22, 24 );

matrixbytes : array[0..29] of Integer = (
	3, 5, 5, 8, 10, 12, 16, 18, 22, 22, 30, 32, 36, 44, 49, 62, 86, 114, 144,
	174, 204, 280, 368, 456, 576, 696, 816, 1050, 1304, 1558 );

matrixdatablock : array[0..29] of Integer = (
	3, 5, 5, 8, 10, 12, 16, 18, 22, 22, 30, 32, 36, 44, 49, 62, 86, 114, 144,
	174, 102, 140, 92, 114, 144, 174, 136, 175, 163, 156 );

matrixrsblock : array[0..29] of Integer = (
	5, 7, 7, 10, 11, 12, 14, 14, 18, 18, 20, 24, 24, 28, 28, 36, 42, 48, 56, 68,
	42, 56, 36, 48, 56, 68, 56, 68, 62, 62 );

procedure ecc200placementbit(var _array : TArrayOfInteger; NR : Integer; NC : Integer; r : Integer; c : Integer; p : Integer; b : Byte);
begin
  if (r < 0) then
  begin
    Inc(r, NR);
    Inc(c, 4 - ((NR + 4) mod 8));
  end;
  if (c < 0) then
  begin
    Inc(c, NC);
    Inc(r, 4 - ((NC + 4) mod 8));
  end;
  _array[r * NC + c] := (p shl 3) + Ord(b);
end;

procedure ecc200placementblock(var _array : TArrayOfInteger; NR : Integer; NC : Integer; r : Integer; c : Integer; p : Integer);
begin
  ecc200placementbit(_array, NR, NC, r - 2, c - 2, p, 7);
  ecc200placementbit(_array, NR, NC, r - 2, c - 1, p, 6);
  ecc200placementbit(_array, NR, NC, r - 1, c - 2, p, 5);
  ecc200placementbit(_array, NR, NC, r - 1, c - 1, p, 4);
  ecc200placementbit(_array, NR, NC, r - 1, c - 0, p, 3);
  ecc200placementbit(_array, NR, NC, r - 0, c - 2, p, 2);
  ecc200placementbit(_array, NR, NC, r - 0, c - 1, p, 1);
  ecc200placementbit(_array, NR, NC, r - 0, c - 0, p, 0);
end;

procedure ecc200placementcornerA(var _array : TArrayOfInteger; NR : Integer; NC : Integer; p : Integer);
begin
  ecc200placementbit(_array, NR, NC, NR - 1, 0, p, 7);
  ecc200placementbit(_array, NR, NC, NR - 1, 1, p, 6);
  ecc200placementbit(_array, NR, NC, NR - 1, 2, p, 5);
  ecc200placementbit(_array, NR, NC, 0, NC - 2, p, 4);
  ecc200placementbit(_array, NR, NC, 0, NC - 1, p, 3);
  ecc200placementbit(_array, NR, NC, 1, NC - 1, p, 2);
  ecc200placementbit(_array, NR, NC, 2, NC - 1, p, 1);
  ecc200placementbit(_array, NR, NC, 3, NC - 1, p, 0);
end;

procedure ecc200placementcornerB(var _array : TArrayOfInteger; NR : Integer; NC : Integer; p : Integer);
begin
  ecc200placementbit(_array, NR, NC, NR - 3, 0, p, 7);
  ecc200placementbit(_array, NR, NC, NR - 2, 0, p, 6);
  ecc200placementbit(_array, NR, NC, NR - 1, 0, p, 5);
  ecc200placementbit(_array, NR, NC, 0, NC - 4, p, 4);
  ecc200placementbit(_array, NR, NC, 0, NC - 3, p, 3);
  ecc200placementbit(_array, NR, NC, 0, NC - 2, p, 2);
  ecc200placementbit(_array, NR, NC, 0, NC - 1, p, 1);
  ecc200placementbit(_array, NR, NC, 1, NC - 1, p, 0);
end;

procedure ecc200placementcornerC(var _array : TArrayOfInteger; NR : Integer; NC : Integer; p : Integer);
begin
  ecc200placementbit(_array, NR, NC, NR - 3, 0, p, 7);
  ecc200placementbit(_array, NR, NC, NR - 2, 0, p, 6);
  ecc200placementbit(_array, NR, NC, NR - 1, 0, p, 5);
  ecc200placementbit(_array, NR, NC, 0, NC - 2, p, 4);
  ecc200placementbit(_array, NR, NC, 0, NC - 1, p, 3);
  ecc200placementbit(_array, NR, NC, 1, NC - 1, p, 2);
  ecc200placementbit(_array, NR, NC, 2, NC - 1, p, 1);
  ecc200placementbit(_array, NR, NC, 3, NC - 1, p, 0);
end;

procedure ecc200placementcornerD(var _array : TArrayOfInteger; NR : Integer; NC : Integer; p : Integer);
begin
  ecc200placementbit(_array, NR, NC, NR - 1, 0, p, 7);
  ecc200placementbit(_array, NR, NC, NR - 1, NC - 1, p, 6);
  ecc200placementbit(_array, NR, NC, 0, NC - 3, p, 5);
  ecc200placementbit(_array, NR, NC, 0, NC - 2, p, 4);
  ecc200placementbit(_array, NR, NC, 0, NC - 1, p, 3);
  ecc200placementbit(_array, NR, NC, 1, NC - 3, p, 2);
  ecc200placementbit(_array, NR, NC, 1, NC - 2, p, 1);
  ecc200placementbit(_array, NR, NC, 1, NC - 1, p, 0);
end;

// Annex M placement alorithm main function
procedure ecc200placement(var _array : TArrayOfInteger; NR : Integer; NC : Integer);
var
  r, c, p : Integer;
begin
  // invalidate
  for r := 0 to NR - 1 do
    for c := 0 to NC - 1 do
      _array[r * NC + c] := 0;
  // start
  p := 1;
  r := 4;
  c := 0;
  repeat
    // check corner
    if (r = NR) and (c = 0) then
    begin ecc200placementcornerA(_array, NR, NC, p); Inc(p); end;
    if (r = NR - 2) and (c = 0) and ((NC mod 4) <> 0) then
    begin ecc200placementcornerB(_array, NR, NC, p); Inc(p); end;
    if (r = NR - 2) and (c = 0) and ((NC mod 8) = 4) then
    begin ecc200placementcornerC(_array, NR, NC, p); Inc(p); end;
    if (r = NR + 4) and (c = 2) and ((NC mod 8) = 0) then
    begin ecc200placementcornerD(_array, NR, NC, p); Inc(p); end;
    // up/right
    repeat
      if (r < NR) and (c >= 0) and (_array[r * NC + c] = 0) then
      begin ecc200placementblock(_array, NR, NC, r, c, p); Inc(p); end;
      Dec(r, 2);
      Inc(c, 2);
    until not ((r >= 0) and (c < NC));
    Inc(r);
    Inc(c, 3);
    // down/left
    repeat
      if (r >= 0) and (c < NC) and (_array[r * NC + c] = 0) then
      begin ecc200placementblock(_array, NR, NC, r, c, p); Inc(p); end;
      Inc(r, 2);
      Dec(c, 2);
    until not ((r < NR) and (c >= 0));
    Inc(r, 3);
    Inc(c);
  until not ((r < NR) or (c < NC));
  // unfilled corner
  if (_array[NR * NC - 1] = 0) then
  begin
    _array[NR * NC - 1] := 1; _array[NR * NC - NC - 2] := 1;
  end;
end;

// calculate and append ecc code, and if necessary interleave
procedure ecc200(var binary : TArrayOfByte; bytes : Integer; datablock : Integer; rsblock : Integer; skew : Integer);
var
  blocks, b : Integer;
  n, p : Integer;
  buf, ecc : TArrayOfByte;
begin
  SetLength(buf, 256);
  SetLength(ecc, 256);
  blocks := (bytes + 2) div datablock;
  rs_init_gf($12d);
  rs_init_code(rsblock, 1);
  for b := 0 to blocks - 1 do
  begin
    p := 0;
    n := b;
    while n < bytes do
    begin
      buf[p] := binary[n];
      Inc(p);
      Inc(n, blocks);
    end;
    rs_encode(p, buf, ecc);
    p := rsblock - 1;  // comes back reversed
    n := b;
    while n < rsblock * blocks do
    begin
      if (skew <> 0) then
      begin
        { Rotate ecc data to make 144x144 size symbols acceptable }
        { See http://groups.google.com/group/postscriptbarcode/msg/5ae8fda7757477da }
        if (b < 8) then
        begin
          binary[bytes + n + 2] := ecc[p];
          Dec(p);
        end
        else
        begin
          binary[bytes + n - 8] := ecc[p];
          Dec(p);
        end;
      end
      else
      begin
        binary[bytes + n] := ecc[p];
        Dec(p);
      end;
      Inc(n, blocks);
    end;
  end;
  rs_free();
end;

function isx12(source : AnsiChar) : Integer;
var
  _source : Byte absolute source;
begin
  if (_source = 13) then begin result := 1; exit; end;
  if (_source = 42) then begin result := 1; exit; end;
  if (_source = 62) then begin result := 1; exit; end;
  if (_source = 32) then begin result := 1; exit; end;
  if ((source >= '0') and (source <= '9')) then begin result := 1; exit; end;
  if ((source >= 'A') and (source <= 'Z')) then begin result := 1; exit; end;

  result := 0; exit;
end;

procedure dminsert(var binary_string : AnsiString; posn : Integer; newbit : AnsiChar);
{ Insert a character into the middle of a string at position posn }
var
  i, _end : Integer;
begin
  SetLength(binary_string, Length(binary_string) + 1);
  _end := strlen(binary_string);
  for i := _end downto posn + 1 do
    binary_string[i] := binary_string[i - 1];

  binary_string[posn] := newbit;
end;

procedure insert_value(var binary_stream : TArrayOfByte; posn : Integer; streamlen : Integer; newbit : Byte);
var
  i : Integer;
begin
  for i := streamlen downto posn + 1 do
    binary_stream[i] := binary_stream[i - 1];

  binary_stream[posn] := newbit;
end;

function look_ahead_test(source : AnsiString; sourcelen : Integer; position : Integer; current_mode : Integer; gs1 : Integer) : Integer;
{ A custom version of the 'look ahead test' from Annex P }
{ This version is deliberately very reluctant to end a data stream with EDIFACT encoding }
var
  ascii_count, c40_count, text_count, x12_count, edf_count, b256_count, best_count : Single;
  sp, done, best_scheme : Integer;
  reduced_char : AnsiChar;
begin
  { step (j) }
  if (current_mode = DM_ASCII) then
  begin
    ascii_count := 0.0;
    c40_count := 1.0;
    text_count := 1.0;
    x12_count := 1.0;
    edf_count := 1.0;
    b256_count := 1.25;
  end
  else
  begin
    ascii_count := 1.0;
    c40_count := 2.0;
    text_count := 2.0;
    x12_count := 2.0;
    edf_count := 2.0;
    b256_count := 2.25;
  end;

  case current_mode of
    DM_C40: c40_count := 0.0;
    DM_TEXT: text_count := 0.0;
    DM_X12: x12_count := 0.0;
    DM_EDIFACT: edf_count := 0.0;
    DM_BASE256: b256_count := 0.0;
  end;

  sp := position;
  while (sp <= sourcelen) and (sp <= (position + 8)) do
  begin
    if (source[sp] <= #127) then reduced_char := source[sp] else reduced_char := AnsiChar(Ord(source[sp]) - 127);

    if ((source[sp] >= '0') and (source[sp] <= '9')) then ascii_count := ascii_count + 0.5 else ascii_count := ascii_count + 1.0;
    if (source[sp] > #127) then ascii_count := ascii_count+ 1.0;

    done := 0;
    if (reduced_char = ' ') then begin c40_count := c40_count+ (2.0 / 3.0); done := 1; end;
    if ((reduced_char >= '0') and (reduced_char <= '9')) then begin c40_count := c40_count + (2.0 / 3.0); done := 1; end;
    if ((reduced_char >= 'A') and (reduced_char <= 'Z')) then begin c40_count := c40_count + (2.0 / 3.0); done := 1; end;
    if (source[sp] > #127) then c40_count := c40_count + (4.0 / 3.0);
    if (done = 0) then c40_count := c40_count + (4.0 / 3.0);

    done := 0;
    if (reduced_char = ' ') then begin text_count := text_count + (2.0 / 3.0); done := 1; end;
    if ((reduced_char >= '0') and (reduced_char <= '9')) then begin text_count := text_count + (2.0 / 3.0); done := 1; end;
    if ((reduced_char >= 'a') and (reduced_char <= 'z')) then begin text_count := text_count + (2.0 / 3.0); done := 1; end;
    if (source[sp] > #127) then text_count := text_count + (4.0 / 3.0);
    if (done = 0) then text_count := text_count + (4.0 / 3.0);

    if (isx12(source[sp]) <> 0) then x12_count := x12_count + (2.0 / 3.0) else x12_count := x12_count + 4.0;

    { step (p) }
    done := 0;
    if ((source[sp] >= ' ') and (source[sp] <= '^')) then edf_count := edf_count + (3.0 / 4.0) else edf_count := edf_count + 6.0;
    if ((gs1 <> 0) and (source[sp] = '[')) then edf_count := edf_count + 6.0;
    if (sp >= (sourcelen - 5)) then edf_count := edf_count + 6.0; { MMmmm fudge! }

    { step (q) }
    if ((gs1 <> 0) and (source[sp] = '[')) then b256_count := b256_count + 4.0 else b256_count := b256_count + 1.0;

    Inc(sp);
  end;

  best_count := ascii_count;
  best_scheme := DM_ASCII;

  if (b256_count <= best_count) then
  begin
    best_count := b256_count;
    best_scheme := DM_BASE256;
  end;

  if (edf_count <= best_count) then
  begin
    best_count := edf_count;
    best_scheme := DM_EDIFACT;
  end;

  if (text_count <= best_count) then
  begin
    best_count := text_count;
    best_scheme := DM_TEXT;
  end;

  if (x12_count <= best_count) then
  begin
    best_count := x12_count;
    best_scheme := DM_X12;
  end;

  if (c40_count <= best_count) then
  begin
    best_count := c40_count;
    best_scheme := DM_C40;
  end;

  result := best_scheme; exit;
end;

function dm200encode(symbol : zint_symbol; source : AnsiString; var target : TArrayOfByte; var last_mode : Integer; _length : Integer) : Integer;
{ Encodes data using ASCII, C40, Text, X12, EDIFACT or Base 256 modes as appropriate }
{ Supports encoding FNC1 in supporting systems }
var
  sp, tp, i, gs1 : Integer;
  current_mode, next_mode : Integer;
  inputlen : Integer;
  c40_buffer,
  text_buffer,
  x12_buffer : array[0..5] of Integer;
  c40_p, text_p, x12_p : Integer;
  edifact_buffer : array[0..7] of Integer;
  edifact_p : Integer;
  binary : AnsiString;
  shift_set, value : Integer;
  iv : Integer;
  binary_count : Integer;
  prn, temp : Integer;
begin
  inputlen := _length;

  sp := 1;
  tp := 0;
  FillChar(c40_buffer[0], Length(c40_buffer), 0);
  c40_p := 0;
  FillChar(text_buffer[0], Length(text_buffer), 0);
  text_p := 0;
  FillChar(x12_buffer[0], Length(x12_buffer), 0);
  x12_p := 0;
  FillChar(edifact_buffer[0], Length(edifact_buffer), 0);
  edifact_p := 0;
  strcpy(binary, '');

  { step (a) }
  current_mode := DM_ASCII;
  next_mode := DM_ASCII;

  if (symbol.input_mode = GS1_MODE) then gs1 := 1 else gs1 := 0;

  if (gs1 <> 0) then
  begin
    target[tp] := 232; Inc(tp);
    concat(binary, ' ');
  end; { FNC1 }

  if (symbol.output_options and READER_INIT) <> 0 then
  begin
    if (gs1 <> 0) then
    begin
      strcpy(symbol.errtxt, 'Cannot encode in GS1 mode and Reader Initialisation at the same time');
      result := ZERROR_INVALID_OPTION; exit;
    end
    else
    begin
      target[tp] := 234; Inc(tp); { Reader Programming }
      concat(binary, ' ');
    end;
  end;

  while (sp <= inputlen) do
  begin

    current_mode := next_mode;

    { step (b) - ASCII encodation }
    if (current_mode = DM_ASCII) then
    begin
      next_mode := DM_ASCII;

      if (((sp + 1) <= inputlen) and (istwodigits(source, sp) <> 0)) then
      begin
        target[tp] := (10 * ctoi(source[sp])) + ctoi(source[sp + 1]) + 130;
        Inc(tp); concat(binary, ' ');
        Inc(sp, 2);
      end
      else
      begin
        next_mode := look_ahead_test(source, inputlen, sp, current_mode, gs1);

        if (next_mode <> DM_ASCII) then
        begin
          case next_mode of
            DM_C40: begin target[tp] := 230; Inc(tp); concat(binary, ' '); end;
            DM_TEXT: begin target[tp] := 239; Inc(tp); concat(binary, ' '); end;
            DM_X12: begin target[tp] := 238; Inc(tp); concat(binary, ' '); end;
            DM_EDIFACT: begin target[tp] := 240; Inc(tp); concat(binary, ' '); end;
            DM_BASE256: begin target[tp] := 231; Inc(tp); concat(binary, ' '); end;
          end;
        end
        else
        begin
          if (source[sp] > #127) then
          begin
            target[tp] := 235; { FNC4 }
            Inc(tp);
            target[tp] := (Ord(source[sp]) - 128) + 1;
            Inc(tp); concat(binary, '  ');
          end
          else
          begin
            if ((gs1 <> 0) and (source[sp] = '[')) then
              target[tp] := 232 { FNC1 }
            else
              target[tp] := Ord(source[sp]) + 1;
            Inc(tp);
            concat(binary, ' ');
          end;
          Inc(sp);
        end;
      end;

    end;

    { step (c) C40 encodation }
    if (current_mode = DM_C40) then
    begin
      next_mode := DM_C40;
      if (c40_p = 0) then
        next_mode := look_ahead_test(source, inputlen, sp, current_mode, gs1);

      if (next_mode <> DM_C40) then
      begin
        target[tp] := 254; Inc(tp); concat(binary, ' ');{ Unlatch }
        next_mode := DM_ASCII;
      end
      else
      begin
        if (source[sp] > #127) then
        begin
          c40_buffer[c40_p] := 1; Inc(c40_p);
          c40_buffer[c40_p] := 30; Inc(c40_p); { Upper Shift }
          shift_set := c40_shift[Ord(source[sp]) - 128];
          value := c40_value[Ord(source[sp]) - 128];
        end
        else
        begin
          shift_set := c40_shift[Ord(source[sp])];
          value := c40_value[Ord(source[sp])];
        end;

        if ((gs1 <> 1) and (source[sp] = '[')) then
        begin
          shift_set := 2;
          value := 27; { FNC1 }
        end;

        if (shift_set <> 0) then
        begin
          c40_buffer[c40_p] := shift_set - 1; Inc(c40_p);
        end;
        c40_buffer[c40_p] := value; Inc(c40_p);

        if (c40_p >= 3) then
        begin
          iv := (1600 * c40_buffer[0]) + (40 * c40_buffer[1]) + (c40_buffer[2]) + 1;
          target[tp] := iv div 256; Inc(tp);
          target[tp] := iv mod 256; Inc(tp);
          concat(binary, '  ');

          c40_buffer[0] := c40_buffer[3];
          c40_buffer[1] := c40_buffer[4];
          c40_buffer[2] := c40_buffer[5];
          c40_buffer[3] := 0;
          c40_buffer[4] := 0;
          c40_buffer[5] := 0;
          Dec(c40_p, 3);
        end;
        Inc(sp);
      end;
    end;

    { step (d) Text encodation }
    if (current_mode = DM_TEXT) then
    begin
      next_mode := DM_TEXT;
      if (text_p = 0) then
        next_mode := look_ahead_test(source, inputlen, sp, current_mode, gs1);

      if (next_mode <> DM_TEXT) then
      begin
        target[tp] := 254; Inc(tp); concat(binary, ' ');{ Unlatch }
        next_mode := DM_ASCII;
      end
      else
      begin
        if (source[sp] > #127) then
        begin
          text_buffer[text_p] := 1; Inc(text_p);
          text_buffer[text_p] := 30; Inc(text_p); { Upper Shift }
          shift_set := text_shift[Ord(source[sp]) - 128];
          value := text_value[Ord(source[sp]) - 128];
        end
        else
        begin
          shift_set := text_shift[Ord(source[sp])];
          value := text_value[Ord(source[sp])];
        end;

        if ((gs1 <> 0) and (source[sp] = '[')) then
        begin
          shift_set := 2;
          value := 27; { FNC1 }
        end;

        if (shift_set <> 0) then
        begin
          text_buffer[text_p] := shift_set - 1; Inc(text_p);
        end;
        text_buffer[text_p] := value; Inc(text_p);

        if (text_p >= 3) then
        begin
          iv := (1600 * text_buffer[0]) + (40 * text_buffer[1]) + (text_buffer[2]) + 1;
          target[tp] := iv div 256; Inc(tp);
          target[tp] := iv mod 256; Inc(tp);
          concat(binary, '  ');

          text_buffer[0] := text_buffer[3];
          text_buffer[1] := text_buffer[4];
          text_buffer[2] := text_buffer[5];
          text_buffer[3] := 0;
          text_buffer[4] := 0;
          text_buffer[5] := 0;
          Dec(text_p, 3);
        end;
        Inc(sp);
      end;
    end;

    { step (e) X12 encodation }
    if (current_mode = DM_X12) then
    begin
      value := 0;

      next_mode := DM_X12;
      if (text_p = 0) then
        next_mode := look_ahead_test(source, inputlen, sp, current_mode, gs1);

      if (next_mode <> DM_X12) then
      begin
        target[tp] := 254; Inc(tp); concat(binary, ' ');{ Unlatch }
        next_mode := DM_ASCII;
      end
      else
      begin
        if (source[sp] = #13) then value := 0;
        if (source[sp] = '*') then value := 1;
        if (source[sp] = '>') then value := 2;
        if (source[sp] = ' ') then value := 3;
        if ((source[sp] >= '0') and (source[sp] <= '9')) then value := (Ord(source[sp]) - Ord('0')) + 4;
        if ((source[sp] >= 'A') and (source[sp] <= 'Z')) then value := (Ord(source[sp]) - Ord('A')) + 14;

        x12_buffer[x12_p] := value; Inc(x12_p);

        if (x12_p >= 3) then
        begin
          iv := (1600 * x12_buffer[0]) + (40 * x12_buffer[1]) + (x12_buffer[2]) + 1;
          target[tp] := iv div 256; Inc(tp);
          target[tp] := iv mod 256; Inc(tp);
          concat(binary, '  ');

          x12_buffer[0] := x12_buffer[3];
          x12_buffer[1] := x12_buffer[4];
          x12_buffer[2] := x12_buffer[5];
          x12_buffer[3] := 0;
          x12_buffer[4] := 0;
          x12_buffer[5] := 0;
          Dec(x12_p, 3);
        end;
        Inc(sp);
      end;
    end;

    { step (f) EDIFACT encodation }
    if (current_mode = DM_EDIFACT) then
    begin
      value := 0;

      next_mode := DM_EDIFACT;
      if (edifact_p = 3) then
        next_mode := look_ahead_test(source, inputlen, sp, current_mode, gs1);

      if (next_mode <> DM_EDIFACT) then
      begin
        edifact_buffer[edifact_p] := 31; Inc(edifact_p);
        next_mode := DM_ASCII;
      end
      else
      begin
        if ((source[sp] >= '@') and (source[sp] <= '^')) then value := Ord(source[sp]) - Ord('@');
        if ((source[sp] >= ' ') and (source[sp] <= '?')) then value := Ord(source[sp]);

        edifact_buffer[edifact_p] := value; Inc(edifact_p);
        Inc(sp);
      end;

      if (edifact_p >= 4) then
      begin
        target[tp] := (edifact_buffer[0] shl 2) + ((edifact_buffer[1] and $30) shr 4); Inc(tp);
        target[tp] := ((edifact_buffer[1] and $0f) shl 4) + ((edifact_buffer[2] and $3c) shr 2); Inc(tp);
        target[tp] := ((edifact_buffer[2] and $03) shl 6) + edifact_buffer[3]; Inc(tp);
        concat(binary, '   ');

        edifact_buffer[0] := edifact_buffer[4];
        edifact_buffer[1] := edifact_buffer[5];
        edifact_buffer[2] := edifact_buffer[6];
        edifact_buffer[3] := edifact_buffer[7];
        edifact_buffer[4] := 0;
        edifact_buffer[5] := 0;
        edifact_buffer[6] := 0;
        edifact_buffer[7] := 0;
        Dec(edifact_p, 4);
      end;
    end;

    { step (g) Base 256 encodation }
    if (current_mode = DM_BASE256) then
    begin
      next_mode := look_ahead_test(source, inputlen, sp, current_mode, gs1);

      if (next_mode = DM_BASE256) then
      begin
        target[tp] := Ord(source[sp]);
        Inc(tp);
        Inc(sp);
        concat(binary, 'b');
      end
      else
        next_mode := DM_ASCII;
    end;

    if (tp > 1558) then
    begin
      result := 0; exit;
    end;

  end; { while }

  { Empty buffers }
  if (c40_p = 2) then
  begin
    target[tp] := 254; Inc(tp); { unlatch }
    target[tp] := Ord(source[inputlen - 2]) + 1; Inc(tp);
    target[tp] := Ord(source[inputlen - 1]) + 1; Inc(tp);
    concat(binary, '   ');
    current_mode := DM_ASCII;
  end;
  if (c40_p = 1) then
  begin
    target[tp] := 254; Inc(tp); { unlatch }
    target[tp] := Ord(source[inputlen - 1]) + 1; Inc(tp);
    concat(binary, '  ');
    current_mode := DM_ASCII;
  end;

  if (text_p = 2) then
  begin
    target[tp] := 254; Inc(tp); { unlatch }
    target[tp] := Ord(source[inputlen - 2]) + 1; Inc(tp);
    target[tp] := Ord(source[inputlen - 1]) + 1; Inc(tp);
    concat(binary, '   ');
    current_mode := DM_ASCII;
  end;
  if (text_p = 1) then
  begin
    target[tp] := 254; Inc(tp); { unlatch }
    target[tp] := Ord(source[inputlen - 1]) + 1; Inc(tp);
    concat(binary, '  ');
    current_mode := DM_ASCII;
  end;

  if (x12_p = 2) then
  begin
    target[tp] := 254; Inc(tp); { unlatch }
    target[tp] := Ord(source[inputlen - 2]) + 1; Inc(tp);
    target[tp] := Ord(source[inputlen - 1]) + 1; Inc(tp);
    concat(binary, '   ');
    current_mode := DM_ASCII;
  end;
  if (x12_p = 1) then
  begin
    target[tp] := 254; Inc(tp); { unlatch }
    target[tp] := Ord(source[inputlen - 1]) + 1; Inc(tp);
    concat(binary, '  ');
    current_mode := DM_ASCII;
  end;

  { Add length and randomising algorithm to b256 }
  i := 0;
  while (i < tp) do
  begin
    if (binary[i] = 'b') then
    begin
      if ((i = 0) or ((i <> 0) and (binary[i - 1] <> 'b'))) then
      begin
        { start of binary data }
        binary_count := 0;
        while (binary[binary_count + i] = 'b') do
          Inc(binary_count);

        if (binary_count <= 249) then
        begin
          dminsert(binary, i, 'b');
          insert_value(target, i, tp, binary_count); Inc(tp);
        end
        else
        begin
          dminsert(binary, i, 'b');
          dminsert(binary, i + 1, 'b');
          insert_value(target, i, tp, (binary_count div 250) + 249); Inc(tp);
          insert_value(target, i + 1, tp, binary_count mod 250); Inc(tp);
        end;
      end;
    end;
    Inc(i);
  end;

  for i := 0 to tp - 1 do
  begin
    if (binary[i] = 'b') then
    begin
      prn := ((149 * (i + 1)) mod 255) + 1;
      temp := target[i] + prn;
      if (temp <= 255) then target[i] := temp else target[i] := temp - 256;
    end;
  end;

  last_mode := current_mode;
  result := tp; exit;
end;

procedure add_tail(var target : TArrayOfByte; tp : Integer; tail_length : Integer; last_mode : Integer);
{ adds unlatch and pad bits }
var
  i, prn, temp : Integer;
begin
  case last_mode of
    DM_C40,
    DM_TEXT,
    DM_X12:
    begin
      target[tp] := 254; Inc(tp); { Unlatch }
      Dec(tail_length);
    end;
  end;

  for i := tail_length downto 1 do
  begin
    if (i = tail_length) then
    begin
      target[tp] := 129; Inc(tp); { Pad }
    end
    else
    begin
      prn := ((149 * (tp + 1)) mod 253) + 1;
      temp := 129 + prn;
      if (temp <= 254) then
      begin
        target[tp] := temp; Inc(tp);
      end
      else
      begin
        target[tp] := temp - 254; Inc(tp);
      end;
    end;
  end;
end;

function data_matrix_200(symbol : zint_symbol; source : AnsiString; _length : Integer) : Integer;
var
  skew : Integer;
  binary : TArrayOfByte;
  binlen : Integer;
  symbolsize, optionsize, calcsize : Integer;
  taillength, error_number : Integer;
  H, W, FH, FW, datablock, bytes, rsblock : Integer;
  last_mode : Integer;
  grid : TArrayOfByte;
  i : Integer;
  x, y, NC, NR : Integer;
  places : TArrayOfInteger;
  v : Integer;
begin
  skew := 0;
  error_number := 0;

  SetLength(binary, 2200);
  binlen := dm200encode(symbol, source, binary, last_mode, _length);

  if (binlen = 0) then
  begin
    strcpy(symbol.errtxt, 'Data too long to fit in symbol');
    result := ZERROR_TOO_LONG; exit;
  end;

  if ((symbol.option_2 >= 1) and (symbol.option_2 <= 30)) then
    optionsize := intsymbol[symbol.option_2 - 1]
  else
    optionsize := -1;

  calcsize := 29;
  for i := 29 downto 0 do
  begin
    if (matrixbytes[i] >= binlen) then
      calcsize := i;
  end;

  if (symbol.option_3 = DM_SQUARE) then
  begin
    { Force to use square symbol }
    case calcsize of
      2,
      4,
      6,
      9,
      11,
      14:
        Inc(calcsize);
    end;
  end;

  symbolsize := optionsize;
  if (calcsize > optionsize) then
  begin
    symbolsize := calcsize;
    if (optionsize <> -1) then
    begin
      { flag an error }
      error_number := ZWARN_INVALID_OPTION;
      strcpy(symbol.errtxt, 'Data does not fit in selected symbol size');
    end;
  end;

  H := matrixH[symbolsize];
  W := matrixW[symbolsize];
  FH := matrixFH[symbolsize];
  FW := matrixFW[symbolsize];
  bytes := matrixbytes[symbolsize];
  datablock := matrixdatablock[symbolsize];
  rsblock := matrixrsblock[symbolsize];

  taillength := bytes - binlen;

  if (taillength <> 0) then
  begin
    add_tail(TArrayOfByte(binary), binlen, taillength, last_mode);
  end;

  // ecc code
  if (symbolsize = 29) then skew := 1;
  ecc200(binary, bytes, datablock, rsblock, skew);
  begin      // placement
    NC := W - 2 * (W div FW);
    NR := H - 2 * (H div FH);
    SetLength(places, NC * NR);
    ecc200placement(places, NR, NC);
    SetLength(grid, W * H);
    FillChar(grid[0], SizeOf(grid), 0);
    y := 0;
    while y < H do
    begin
      for x := 0 to W - 1 do
        grid[y * W + x] := 1;
      x := 0;
      while x < W do
      begin
        grid[(y + FH - 1) * W + x] := 1;
        Inc(x, 2)
      end;
      Inc(y, FH);
    end;
    x := 0;
    while x < W do
    begin
      for y := 0 to H - 1 do
        grid[y * W + x] := 1;
      y := 0;
      while y < H do
      begin
        grid[y * W + x + FW - 1] := 1;
        Inc(y, 2);
      end;
      Inc(x, FW);
    end;
    for y := 0 to NR - 1 do
    begin
      for x := 0 to NC - 1 do
      begin
        v := places[(NR - y - 1) * NC + x];
        if ((v = 1) or ((v > 7) and ((binary[(v shr 3) - 1] and (1 shl (v and 7))) <> 0))) then
          grid[(1 + y + 2 * (y div (FH - 2))) * W + 1 + x + 2 * (x div (FW - 2))] := 1;
      end;
    end;
    for y := H - 1 downto 0 do
    begin
      for x := 0 to W - 1 do
      begin
        if (grid[W * y + x] <> 0) then
          set_module(symbol, (H - y) - 1, x);
      end;
      symbol.row_height[(H - y) - 1] := 1;
    end;
    SetLength(grid, 0);
    SetLength(places, 0);
  end;

  symbol.rows := H;
  symbol.width := W;

  result := error_number; exit;
end;

function dmatrix(symbol : zint_symbol; source : AnsiString; _length : Integer) : Integer;
var
  error_number : Integer;
begin
  if (symbol.option_1 <= 1) then
    { ECC 200 }
    error_number := data_matrix_200(symbol, source, _length)
  else
  begin
    { ECC 000 - 140 }
    strcpy(symbol.errtxt, 'Older Data Matrix standards are no longer supported');
    error_number := ZERROR_INVALID_OPTION;
  end;

  result := error_number; exit;
end;


end.

