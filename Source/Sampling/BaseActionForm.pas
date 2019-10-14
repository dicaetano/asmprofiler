unit BaseActionForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Vcl.WinXCtrls;

type
  TfrmAction = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;

    class procedure ShowFormWithFrame(aFrame: TFrame; const aFormCaption: string; aOwner: TComponent = nil);
    class function ShowModalFormWithFrame(aFrame: TFrame; const aFormCaption: string): TModalResult;
  end;

implementation

{$R *.dfm}

{ TfrmAction }

destructor TfrmAction.Destroy;
begin
  inherited;

  //delphi bug?
  if Screen.FormCount = 1 then
    Application.MainForm.SetFocus;
  Application.BringToFront;
end;

procedure TfrmAction.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Action = caHide then
    Action := caFree;

  //delphi bug?
  Application.BringToFront;
end;

procedure TfrmAction.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

    procedure Search(AControl: TWinControl);
    var
      i: Integer;
    begin
      if  AControl.ControlCount = 0 then
      begin
        if AControl is TSearchBox then
          AControl.SetFocus;
      end
      else
      for i := 0 to AControl.ControlCount-1 do
        Search(TWinControl(AControl.Controls[i]));
    end;

begin
  if Key = VK_F2 then
  begin
    Search(Self);
  end;
end;

class procedure TfrmAction.ShowFormWithFrame(aFrame: TFrame; const aFormCaption: string; aOwner: TComponent = nil);
var frm: TfrmAction;
begin
  if aOwner = nil then
    frm := TfrmAction.Create(Application)
  else
    frm := TfrmAction.Create(aOwner);
  frm.Caption   := aFormCaption;
  aFrame.Parent := frm;
  aFrame.Align  := alClient;
  //set owner if no one set, so frame gets freed when form closes
  if aFrame.Owner = nil then
    frm.InsertComponent(aFrame);
//    aFrame.Owner := frm;

  frm.Top  := Screen.ActiveCustomForm.Top  + 25;
  frm.Left := Screen.ActiveCustomForm.Left + 25;

  frm.Show;
end;

class function TfrmAction.ShowModalFormWithFrame(aFrame: TFrame; const aFormCaption: string): TModalResult;
var frm: TfrmAction;
begin
  frm := TfrmAction.Create(Application);
  frm.Caption   := aFormCaption;
  aFrame.Parent := frm;
  aFrame.Align  := alClient;

  frm.Top  := Screen.ActiveCustomForm.Top  + 25;
  frm.Left := Screen.ActiveCustomForm.Left + 25;

  Result := frm.ShowModal;
end;

end.
