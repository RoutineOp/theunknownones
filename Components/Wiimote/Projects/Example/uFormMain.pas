unit uFormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uWiimote, StdCtrls, ExtCtrls, pngimage, uEffectPNGImage, uEffectPNG,
  ComCtrls, TeEngine, Series, TeeProcs, Math;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    btn_Connnect: TButton;
    Wiimote1: TWiimote;
    pb_Battery: TProgressBar;
    tm_Battery: TTimer;
    tm_Leds: TTimer;
    pb_IRPoints: TProgressBar;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    btn_CalibX: TButton;
    btn_CalibY: TButton;
    btn_CalibZ: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_ConnnectClick(Sender: TObject);
    procedure Wiimote1Connected(Sender: TObject);
    procedure Wiimote1Disconnected(Sender: TObject);
    procedure tm_BatteryTimer(Sender: TObject);
    procedure Wiimote1Status(Sender: TObject);
    procedure tm_LedsTimer(Sender: TObject);
    procedure Wiimote1NewReport(const AReport: TwmReport);
    procedure btn_CalibXClick(Sender: TObject);
    procedure btn_CalibYClick(Sender: TObject);
    procedure btn_CalibZClick(Sender: TObject);
    procedure Wiimote1ButtonDown(AButton: TwmButton);
    procedure Wiimote1ButtonUp(AButton: TwmButton);
  private
    procedure SetCP;
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn_CalibXClick(Sender: TObject);
begin
  Wiimote1.CalibrateAccelXNow;
end;

procedure TForm1.btn_CalibYClick(Sender: TObject);
begin
  Wiimote1.CalibrateAccelYNow;
end;

procedure TForm1.btn_CalibZClick(Sender: TObject);
begin
  Wiimote1.CalibrateAccelZNow;
end;

procedure TForm1.btn_ConnnectClick(Sender: TObject);
begin
  if Wiimote1.Connected then
    Wiimote1.Disconnect
  else
  begin
    Wiimote1.Connect(ListBox1.Items[ListBox1.ItemIndex]);
    Wiimote1.IRSensitivity := wmiSense1;
    Wiimote1.IRMode := wmiExtended;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;

  ReportMemoryLeaksOnShutdown := true;

  TwmDeviceConnection.ListDevices(ListBox1.Items);

  ListBox1.ItemIndex := 0;
end;

procedure TForm1.SetCP;
var
  CP : TPoint;
  Middle : TPoint;
  P1, P2 : TPoint;
const
  SensorBarBelow = true;
  ScreenFactor = 1.25;
begin
  if Wiimote1.IRPointCount = 2 then
  begin
    P1 := Wiimote1.IRPointPos[0];
    P2 := Wiimote1.IRPointPos[1];

    Middle.X := Round((P1.X + P2.X) / 2);
    Middle.Y := Round((P1.Y + P2.Y) / 2);
  end
  else if Wiimote1.IRPointCount = 1 then
    Middle := Wiimote1.IRPointPos[0]
  else
    exit;

  Middle.X := 1024 - Middle.X;

  if not SensorBarBelow then
    Middle.Y := 768 - Middle.Y;

  Cp.X := Round(((Middle.X * (Screen.Width * ScreenFactor)) / 1024) - (Screen.Width * ((ScreenFactor - 1) / 2)));
  Cp.Y := Round(((Middle.Y * (Screen.Height * ScreenFactor)) / 768) - (Screen.Height * ((ScreenFactor - 1) / 2)));

  SetCursorPos(Cp.X, CP.Y);

end;

procedure TForm1.tm_BatteryTimer(Sender: TObject);
begin
  Wiimote1.RequestStatus;
end;

procedure TForm1.tm_LedsTimer(Sender: TObject);
begin
  if Random(3) = 1 then
    Wiimote1.LedsOn := Wiimote1.LedsOn + [wmLED1]
  else
    Wiimote1.LedsOn := Wiimote1.LedsOn - [wmLED1];

  if Random(3) = 1 then
    Wiimote1.LedsOn := Wiimote1.LedsOn + [wmLED2]
  else
    Wiimote1.LedsOn := Wiimote1.LedsOn - [wmLED2];

  if Random(3) = 1 then
    Wiimote1.LedsOn := Wiimote1.LedsOn + [wmLED3]
  else
    Wiimote1.LedsOn := Wiimote1.LedsOn - [wmLED3];

  if Random(3) = 1 then
    Wiimote1.LedsOn := Wiimote1.LedsOn + [wmLED4]
  else
    Wiimote1.LedsOn := Wiimote1.LedsOn - [wmLED4];
end;

procedure TForm1.Wiimote1ButtonDown(AButton: TwmButton);
var
  Event : Cardinal;
begin
  Event := 0;

  case AButton of
    wmbA: Event := MOUSEEVENTF_LEFTDOWN;
    wmbB: Event := MOUSEEVENTF_RIGHTDOWN;
    wmbPlus: ;
    wmbMinus: ;
    wmbHome: ;
    wmbOne: ;
    wmbTwo: ;
    wmbUp: ;
    wmbDown: ;
    wmbLeft: ;
    wmbRight: ;
  end;

  if Event <> 0 then  
    mouse_event(Event, 0, 0, 0, 0);
end;

procedure TForm1.Wiimote1ButtonUp(AButton: TwmButton);
var
  Event : Cardinal;
begin
  Event := 0;

  case AButton of
    wmbA: Event := MOUSEEVENTF_LEFTUP;
    wmbB: Event := MOUSEEVENTF_RIGHTUP;
    wmbPlus: ;
    wmbMinus: ;
    wmbHome: ;
    wmbOne: ;
    wmbTwo: ;
    wmbUp: ;
    wmbDown: ;
    wmbLeft: ;
    wmbRight: ;
  end;

  if Event <> 0 then  
    mouse_event(Event, 0, 0, 0, 0);
end;

procedure TForm1.Wiimote1Connected(Sender: TObject);
begin
  btn_Connnect.Caption := 'Disconnect';
end;

procedure TForm1.Wiimote1Disconnected(Sender: TObject);
begin
  btn_Connnect.Caption := 'Connect';
end;

procedure TForm1.Wiimote1NewReport(const AReport: TwmReport);
begin
  if AReport is TwmInputReportButtonsAccelIR then
    SetCP;

  pb_IRPoints.Position := Wiimote1.IRPointCount;


end;

procedure TForm1.Wiimote1Status(Sender: TObject);
begin
  pb_Battery.Position := Wiimote1.BatteryPercent;


end;

end.
