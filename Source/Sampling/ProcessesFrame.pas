unit ProcessesFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, Buttons, ActnList, System.Actions, Vcl.WinXCtrls;

type
  TLiveViewNotify = procedure(aProcessId: Integer) of object;
  TProfileNotify  = procedure(aProcessId: Integer) of object;

  TframProcesses = class(TFrame)
    ActionList1: TActionList;
    actRefresh: TAction;
    actLiveView: TAction;
    actProfileIt: TAction;
    GroupBox1: TGroupBox;
    pnlProcess: TPanel;
    btnRefreshProcesses: TBitBtn;
    btnLiveView: TBitBtn;
    btnProfileIt: TBitBtn;
    lbProcesses: TListBox;
    btnInject: TBitBtn;
    actInjectDll: TAction;
    sbFilter: TSearchBox;
    procedure actRefreshExecute(Sender: TObject);
    procedure actLiveViewExecute(Sender: TObject);
    procedure actProfileItExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
    procedure lbProcessesDblClick(Sender: TObject);
    procedure actInjectDllExecute(Sender: TObject);
    procedure sbFilterChange(Sender: TObject);
    procedure lbProcessesKeyPress(Sender: TObject; var Key: Char);
    procedure sbFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FOnProfileItClick: TProfileNotify;
    FOnLiveViewClick: TLiveViewNotify;
    procedure RefreshProcess(AProcessName: string = '');
    procedure OpenSelectedProcess;
  protected
    procedure ProfileItClicked(aProcessId: Integer);
  public
    procedure AfterConstruction;override;

    property OnLiveViewClick: TLiveViewNotify read FOnLiveViewClick write FOnLiveViewClick;
    property OnProfileItClick: TProfileNotify read FOnProfileItClick write FOnProfileItClick;
  end;

implementation

uses
  mcThreadUtils, LiveViewFrame, mcProcessSampler, BaseActionForm, uDllInjection, _uAsmProfDllInterface;

{$R *.dfm}

procedure TframProcesses.actInjectDllExecute(Sender: TObject);
var
  sDll: string;
  iprocessid: integer;
begin
  if lbProcesses.ItemIndex >= 0 then
  begin
    iprocessid := THandle(lbProcesses.Items.Objects[lbProcesses.ItemIndex]);

    sDll := ExtractFilePath(Application.ExeName) + C_AsmProfiler_dll; //'AsmProfiler.dll';
    if uDllInjection.InjectDllIntoProcess(sDll, C_StartDllInjectionHook, iprocessid) then
      MessageDlg(Format('"%s" injected',[sDll]), mtInformation, [mbOK], 0)
    else
      MessageDlg('Injection failed!', mtError, [mbOK], 0);
  end;
end;

procedure TframProcesses.ActionList1Update(Action: TBasicAction; var Handled: Boolean);
begin
  actLiveView.Enabled  := (lbProcesses.ItemIndex >= 0);
  actProfileIt.Enabled := (lbProcesses.ItemIndex >= 0);
end;

procedure TframProcesses.actLiveViewExecute(Sender: TObject);
var
  iprocessid: integer;
  fram: TframLiveView;
begin
  if lbProcesses.ItemIndex >= 0 then
  begin
    iprocessid := THandle(lbProcesses.Items.Objects[lbProcesses.ItemIndex]);

    if Assigned(OnLiveViewClick) then
      OnLiveViewClick(iprocessid)
    else
    begin
      fram := TframLiveView.Create(nil);
      fram.Name := fram.Name + IntToHex(Integer(fram),8);

      if iprocessid > 0 then
        fram.ProcessObject  := TProcessSampler.Create(iprocessid);
      //fram.OnProfileItClick := OnProfileItClick;
      fram.OnProfileItClick := ProfileItClicked;

      TfrmAction.ShowFormWithFrame(fram,
                                   Format('Live View (PID: %d)',[iprocessid]),
                                   Self);   //close forms after we are closed  
    end;
  end;
end;

procedure TframProcesses.actProfileItExecute(Sender: TObject);
var
  iprocessid: integer;
begin
  if lbProcesses.ItemIndex >= 0 then
  begin
    iprocessid := THandle(lbProcesses.Items.Objects[lbProcesses.ItemIndex]);

    if Assigned(OnProfileItClick) then
      OnProfileItClick(iprocessid);

    //close if started from "Profiling frame -> Select process"
    if Parent is TForm then
      if fsModal in (Parent as TForm).FormState then
        (Parent as TForm).ModalResult := mrOk;
  end;
end;

procedure TframProcesses.actRefreshExecute(Sender: TObject);
begin
  RefreshProcess;
end;

procedure TframProcesses.AfterConstruction;
begin
  inherited;
  actInjectDll.Enabled := FileExists(C_AsmProfiler_dll);
  actRefresh.Execute;
end;

procedure TframProcesses.OpenSelectedProcess;
begin
  //if started from "Profiling frame -> Select process"
  if Parent is TForm then
    if fsModal in (Parent as TForm).FormState then
      actProfileIt.Execute
    else
      actLiveView.Execute;
end;

procedure TframProcesses.RefreshProcess(AProcessName: string = '');
var
  str: TStrings;
  i: Integer;
begin
  str := nil;
  Screen.Cursor := crHourGlass;
  lbProcesses.Items.BeginUpdate;
  try
    lbProcesses.Items.Clear;
    str := mcThreadUtils.GetAllRunningProcesses;
    //reverse: new processes on top, these are most likely to get profiled by user (instead of old system processes)
    for i := str.Count - 1 downto 0 do
      if (AProcessName.IsEmpty) or (not AProcessName.IsEmpty and str[i].ToUpper.Contains(AProcessName.ToUpper)) then
        lbProcesses.Items.AddObject(str[i], str.Objects[i]);
  finally
    lbProcesses.Items.EndUpdate;
    Screen.Cursor := crDefault;
    str.Free;
  end;
end;

procedure TframProcesses.sbFilterChange(Sender: TObject);
begin
  RefreshProcess(sbFilter.Text);
end;

procedure TframProcesses.sbFilterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
  begin
    lbProcesses.SetFocus;
    lbProcesses.Selected[0] := True;
  end;

end;

procedure TframProcesses.lbProcessesDblClick(Sender: TObject);
begin
  OpenSelectedProcess;
end;

procedure TframProcesses.lbProcessesKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    OpenSelectedProcess;
end;

procedure TframProcesses.ProfileItClicked(aProcessId: Integer);
begin
  if Assigned(OnProfileItClick) then
  begin
    OnProfileItClick(aProcessId);

    //close if started from "Profiling frame -> Select process -> Live view"
    if Parent is TForm then
      if fsModal in (Parent as TForm).FormState then
        (Parent as TForm).ModalResult := mrOk;
  end;
end;

end.
