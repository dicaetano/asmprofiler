object frmMain: TfrmMain
  Left = 391
  Top = 330
  Caption = 'Profile Result Viewer'
  ClientHeight = 388
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    686
    388)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 69
    Height = 13
    Caption = 'Application dir:'
  end
  object vtTree: TVirtualStringTree
    Left = 8
    Top = 40
    Width = 681
    Height = 315
    Anchors = [akLeft, akTop, akRight, akBottom]
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.MainColumn = -1
    Header.Options = [hoColumnResize, hoDrag]
    TabOrder = 0
    ExplicitWidth = 659
    Columns = <>
  end
  object btnOpenViewer: TBitBtn
    Left = 8
    Top = 366
    Width = 97
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Open viewer'
    TabOrder = 1
    OnClick = btnOpenViewerClick
  end
  object lbItems: TListBox
    Left = 8
    Top = 40
    Width = 681
    Height = 316
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = 1
    ItemHeight = 13
    Sorted = True
    TabOrder = 2
    OnDblClick = lbItemsDblClick
    ExplicitWidth = 659
  end
  object Button1: TButton
    Left = 589
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    Visible = False
    OnClick = Button1Click
  end
  object edtdir: TEdit
    Left = 90
    Top = 8
    Width = 503
    Height = 21
    TabOrder = 4
    Text = 'edtdir'
    OnChange = edtDirChange
  end
end
