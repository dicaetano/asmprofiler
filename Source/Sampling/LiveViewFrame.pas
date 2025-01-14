unit LiveViewFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, mcProcessSampler, ActnList,
  System.Actions, Vcl.ComCtrls;

type
  TProfileNotify  = procedure(aProcessId: Integer) of object;

  TframLiveView = class(TFrame)
    GroupBox1: TGroupBox;
    pnlThreads: TPanel;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    pnlStack: TPanel;
    chkAutoRefresh: TCheckBox;
    chkRaw: TCheckBox;
    btnRefreshThreads: TBitBtn;
    btnRefreshStack: TBitBtn;
    Button1: TBitBtn;
    GroupBox3: TGroupBox;
    edtFile: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtPID: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    lblDuration: TLabel;
    ActionList1: TActionList;
    actRefreshThreads: TAction;
    actRefreshStack: TAction;
    actTryStackwalk64API: TAction;
    btnProfileIt: TBitBtn;
    tmrRefresh: TTimer;
    edtInterval: TEdit;
    lvThreads: TListView;
    chkAutoRefreshThreads: TCheckBox;
    tmrRefreshThreads: TTimer;
    chkCPU: TCheckBox;
    chkCreation: TCheckBox;
    procedure actRefreshThreadsExecute(Sender: TObject);
    procedure actRefreshStackExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
    procedure actTryStackwalk64APIExecute(Sender: TObject);
    procedure btnProfileItClick(Sender: TObject);
    procedure chkAutoRefreshClick(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure chkRawClick(Sender: TObject);
    procedure edtIntervalChange(Sender: TObject);
    procedure lvThreadsColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvThreadsCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lvThreadsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure tmrRefreshThreadsTimer(Sender: TObject);
    procedure chkAutoRefreshThreadsClick(Sender: TObject);
    procedure chkCreationClick(Sender: TObject);
    procedure chkCPUClick(Sender: TObject);
  private
    FProcessObject: TProcessSampler;
    FOnProfileItClick: TProfileNotify;

    FDescending: Boolean;
    FSortedColumn: Integer;
    FUpdatingThreads: Boolean;

    procedure SetProcessObject(const Value: TProcessSampler);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;

    property ProcessObject: TProcessSampler read FProcessObject write SetProcessObject;
    property OnProfileItClick: TProfileNotify read FOnProfileItClick write FOnProfileItClick;
  end;

implementation

uses
  mcThreadSampler, mcThreadUtils, DateUtils;

{$R *.dfm}

procedure TframLiveView.ActionList1Update(Action: TBasicAction; var Handled: Boolean);
begin
  actRefreshThreads.Enabled := (ProcessObject <> nil);
  actRefreshStack.Enabled   := (ProcessObject <> nil) and (lvThreads.ItemIndex >= 0);
end;

procedure TframLiveView.actRefreshStackExecute(Sender: TObject);
var
  ts: TThreadSampler;
begin
  if FUpdatingThreads then
    Exit;

  Screen.Cursor := crHourGlass;
  Memo1.Lines.BeginUpdate;
  try
    Memo1.Clear;
    if lvThreads.ItemIndex >= 0 then
    begin
      ts := TThreadSampler(lvThreads.Items[lvThreads.ItemIndex].Data);
      ts.MakeStackDump(-1);
      lblDuration.Caption := Format('%4.3fms',[ts.GetDumpMakingDuration * MSecsPerDay]);
      Memo1.Lines.Text    := ts.TraceLastDump(chkRaw.Checked);
    end;
  finally
    Memo1.Lines.EndUpdate;
    Screen.Cursor := crDefault;
  end;
end;

procedure TframLiveView.actRefreshThreadsExecute(Sender: TObject);
var
  i: Integer;
  ts: TThreadSampler;
  item: TListItem;
begin
  if ProcessObject = nil then
    Exit;

  lvThreads.Items.BeginUpdate;
  try
    ProcessObject.RefreshThreads;
    lvThreads.Clear;

    for i := 0 to ProcessObject.ThreadCount - 1 do
    begin
      ts := ProcessObject.Threads[i];
      item := lvThreads.Items.Add;
      item.Caption := ts.ThreadId.ToString;
      item.SubItems.Add(DateTimeToStr(ts.Creationtime));
      item.SubItems.Add(FormatDateTime('hh:mm:ss', ts.Kerneltime + ts.Usertime));
      item.Data := ts;
    end;

  finally
    lvThreads.Items.EndUpdate;
  end;
end;

procedure TframLiveView.actTryStackwalk64APIExecute(Sender: TObject);
var
  ts: TThreadSampler;
  pa: TPointerArray;
  i: Integer;
begin
  Screen.Cursor := crHourGlass;
  Memo1.Lines.BeginUpdate;
  try
    ts := TThreadSampler(lvThreads.Items[lvThreads.ItemIndex].Data);
    if ts.ThreadId = GetCurrentThreadId then
    begin
      MessageDlg('Stackwalk64 API does not work on the same thread!', mtError, [mbOK], 0);
      Exit;
    end;

    pa := mcThreadUtils.GetCompleteThreadStack_64(
                                   TProcessSampler(ts.ProcessObject).ProcessHandle,
                                   ts.ThreadId);
    Memo1.Lines.Clear;
    for i := 0 to High(pa) do
      Memo1.Lines.Add( TProcessSampler(ts.ProcessObject).GetLocationInfo(pa[i]) );

    lblDuration.Caption := Format('%4.3fms',[GetSnapshotMakingDuration * MSecsPerDay]);
  finally
    Memo1.Lines.EndUpdate;
    Screen.Cursor := crDefault;
  end;
end;

procedure TframLiveView.btnProfileItClick(Sender: TObject);
begin
  if ProcessObject <> nil then
  begin
    if Assigned(OnProfileItClick) then
      OnProfileItClick(ProcessObject.ProcessId);
  end;
end;

procedure TframLiveView.chkAutoRefreshClick(Sender: TObject);
begin
  tmrRefresh.Interval := StrToInt(edtInterval.Text);
  tmrRefresh.Enabled := chkAutoRefresh.Checked;
end;

procedure TframLiveView.chkAutoRefreshThreadsClick(Sender: TObject);
begin
  tmrRefreshThreads.Enabled := chkAutoRefreshThreads.Checked;
end;

procedure TframLiveView.chkCPUClick(Sender: TObject);
var
  w: Integer;
begin
  w := 0;
  if chkCPU.Checked then
    w := 100;

  lvThreads.Columns[2].Width := w;
end;

procedure TframLiveView.chkCreationClick(Sender: TObject);
var
  w: Integer;
begin
  w := 0;
  if chkCreation.Checked then
    w := 130;

  lvThreads.Columns[1].Width := w;
end;

procedure TframLiveView.chkRawClick(Sender: TObject);
begin
  actRefreshStack.Execute;
end;

constructor TframLiveView.Create(AOwner: TComponent);
begin
  inherited;
  FSortedColumn := 2;
  FDescending := True;
end;

destructor TframLiveView.Destroy;
begin
  ProcessObject.Free;
  inherited;
end;

procedure TframLiveView.edtIntervalChange(Sender: TObject);
begin
  chkAutoRefresh.Checked := False;
  chkAutoRefresh.Caption := 'Auto Refresh (' + FloatToStr(StrToIntDef(edtInterval.Text, 0) / 1000) + 's)';
  tmrRefresh.Interval := StrToInt(edtInterval.Text);
end;

procedure TframLiveView.lvThreadsChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  actRefreshStack.Execute;
end;

procedure TframLiveView.lvThreadsColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> FSortedColumn then
  begin
    FSortedColumn := Column.Index;
    FDescending := False;
  end
  else
    FDescending := not FDescending;

  TListView(Sender).SortType := stText;
end;

procedure TframLiveView.lvThreadsCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if FSortedColumn = 0 then
  begin
    Compare := 0;
    if Item1.Caption.ToInteger < Item2.Caption.ToInteger then
      Compare := -1
    else
    if Item1.Caption.ToInteger > Item2.Caption.ToInteger then
      Compare := 1;
  end
  else
  if FSortedColumn = 1 then
    Compare := CompareDateTime(StrToDateTime(Item1.SubItems[FSortedColumn-1]), StrToDateTime(Item2.SubItems[FSortedColumn-1]))
  else
  if FSortedColumn = 2 then
    Compare := CompareTime(StrToTime(Item1.SubItems[FSortedColumn-1]), StrToTime(Item2.SubItems[FSortedColumn-1]))
  else
    Compare := CompareText(Item1.SubItems[FSortedColumn-1], Item2.SubItems[FSortedColumn-1]);

  if FDescending then
    Compare := -Compare;
end;

procedure TframLiveView.SetProcessObject(const Value: TProcessSampler);
begin
  if FProcessObject <> nil then
    FProcessObject.Free;

  FProcessObject := Value;

  if ProcessObject <> nil then                       
  begin
    edtPID.Text  := IntToStr(ProcessObject.ProcessId);
    edtFile.Text := ProcessObject.ProcessExe;

    actRefreshThreads.Execute;   //load threads
    lvThreads.ItemIndex := 0;
    actRefreshStack.Execute;     //show stack of first thread
  end;
end;

procedure TframLiveView.tmrRefreshThreadsTimer(Sender: TObject);
var
  id: integer;
  item: TListItem;
begin
  id := -1;
  tmrRefreshThreads.Enabled := False;
  FUpdatingThreads := True;
  lvThreads.Items.BeginUpdate;
  try
    if lvThreads.ItemIndex <> -1 then
      id := lvThreads.Items[lvThreads.ItemIndex].Caption.ToInteger;

    actRefreshThreads.Execute;
  finally
    if id <> -1 then
    begin
      item := lvThreads.FindCaption(-1, id.ToString, False, False, False);
      if item <> nil then
        lvThreads.ItemIndex := item.Index;
    end;
    FUpdatingThreads := False;
    lvThreads.Items.EndUpdate;
    tmrRefreshThreads.Enabled := True;
  end;
end;

procedure TframLiveView.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  try
    actRefreshStack.Execute;
  finally
    tmrRefresh.Enabled := True;
  end;
end;

end.
