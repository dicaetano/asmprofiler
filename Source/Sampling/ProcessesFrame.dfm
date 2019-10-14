object framProcesses: TframProcesses
  Left = 0
  Top = 0
  Width = 594
  Height = 436
  TabOrder = 0
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 2
    Top = 2
    Width = 590
    Height = 432
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    Caption = ' Processes '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 543
    object pnlProcess: TPanel
      Left = 2
      Top = 15
      Width = 586
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 539
      object btnRefreshProcesses: TBitBtn
        Left = 171
        Top = 1
        Width = 85
        Height = 25
        Action = actRefresh
        Caption = 'Refresh'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6
          A4C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFE
          FCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBC2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEFCFBFEFCFBFEFCFBFEFCFBD8EBD6018A02018A02D8EBD6FEFCFBFEFC
          FBC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFBF7FEFBF7018A02D8EAD201
          8A02D8EAD2D8EAD2018A02FEFBF7FEFBF7C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEF9F4FEF9F4018A02018A02D8E8D0FEF9F4FEF9F4D8E8D0FEF9F4FEF9
          F4C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF7F0FEF7F0018A02018A0201
          8A02FEF7F0FEF7F0FEF7F0FEF7F0FEF7F0C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEF5ECFEF5ECFEF5ECFEF5ECFEF5EC018A02018A02018A02FEF5ECFEF5
          ECC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FEF3E9D8E3C7FEF3E9FE
          F3E9D8E3C7018A02018A02FEF3E9FEF3E9C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFF1E5FFF1E5018A02D9E2C3D9E2C3018A02D9E2C3018A02FFF1E5FFF1
          E5C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FFF0E2FFF0E2D9E1C1018A0201
          8A02D9E1C1DDCFC2DDCFC2DDCFC2DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEEDEFFEEDEFFEEDEFFEEDEFFEEDEFFEEDEC5B5A9C3B4A8C2B3A7C1B2
          A6C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FFECDAFFECDAFFECDAFFECDAFF
          ECDAFFECDAB0A296B0A296B0A296B0A296C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEAD7FFEAD7FFEAD7FFEAD7FFEAD7C9B9ACFBF8F4FBF8F4E6DAD9C2A6
          A4FF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4FFE8D3FFE8D3FFE8D3FFE8D3FF
          E8D3C9B9ACFBF8F4DFCEC7C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          C2A6A4FFE6D0FFE6D0FFE6D0FFE6D0FFE6D0C9B9ACDFCEC7C2A6A4FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2
          A6A4C2A6A4C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 0
      end
      object btnLiveView: TBitBtn
        Left = 262
        Top = 1
        Width = 85
        Height = 25
        Action = actLiveView
        Caption = 'Live View'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
          BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
          2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
          00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
          B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
          EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
          FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
          C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
          FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
          E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
          C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
          C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
          DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
          86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
        TabOrder = 1
      end
      object btnProfileIt: TBitBtn
        Left = 354
        Top = 1
        Width = 85
        Height = 25
        Action = actProfileIt
        Caption = 'Profile it'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000010000000000000101
          0100020202000303030004040400050505000606060007070700080808000909
          09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
          1100121212001313130014141400151515001616160017171700181818001919
          19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
          2100222222002323230024242400252525002626260027272700282828002929
          29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
          3100323232003333330034343400353535003636360037373700383838003939
          39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F003F454B003F4A
          56003F50620040556C00405A7600405F80003F6690003E6C9E003E72AB003D77
          B6003C7BBF003C7FC7003B82CE003B84D4003A87D9003684DF003380E400307D
          E8002E7AEB002B78EE002A75F0002873F1002772F200246EF300236BF4002168
          F500236BF400256EF4002772F2002974F2002A76F0002C79EF002F7CED00327F
          EA003583E7003987E2003E8BDD004089D9004188D4004487CF004685C9004983
          C2004C81BA00507FB100557CA6005A799B005E78950061778E00657688006A75
          81006E7378007272710073737300757575007676760077777700787878007979
          79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7E0083827F008784
          7F008D87800091888100948A81009A8F8600A08D8C00AA879800B875A900CC56
          C200DF36D900F214F100FD04FD00FE01FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE06FE00FE17
          FB00FC2BF700FB42F300F772F200F59DF000F3C0F000F3D6F000F2E3F200F2EA
          F300F2F0F300F3F4F400F4F6F500F6F8F600F8FAF700F9F9F500F9F9F300F9F9
          F000F8F8EB00F8F5E400F8F3DF00F8F1DA00F7EFD400F3EAD000EFE6CC00EDE3
          C800EBE1C500E9DDC200E6D7BE00E6D2B300E8CFAE00E9CCA800E8C9A400E7C6
          A100E6C29E00E5BF9A00E5BE9800E5BC9400E7BC9100E7B98C00E8B68700E8B3
          8100E8B07C00E5AC7800E5A97400E4A77000E4A46D00E1A26B00E0A06A00DE9F
          6800DE9D6500DB996100D7955E00D4925B00D08E5800CF8C5600CE8A5300CC88
          5100CA864F00CA844D00C8824C00C5804B00C27E4A00BD7C4A00BA7A4900BA74
          4000B8703900B96B3000B8672700B9642000BA611A00BA5D1300BA5B1000BA5A
          0E00BA580B00B8560A00B7550A00B6540A00B4520A00B14E0A00AE4B0900A844
          0600A43E0300A13B0200A13A0100A0390100A03A0100A13A01009A9A9A9A9AF7
          ECF2F6F6F49A9A9A9A9A9A9A9AFDE5DFD75985DCEDF0FD9A9A9A9A9AFDDDDBCD
          BC59AFB9C1E5F2FB9A9A9A9AE9D6CDBCC6CED0CEBEBBEBF89A9A9AF8D5DCBBBE
          BEBEBFCFD1BCCBF5FB9A9AEAD5CDB6BBBDC1C3BED0C7C5F2FB9A9AE6D56262B6
          BA8142C0C75959F1FB9A9AEBD3CAB6B6B6C18173C6C7C6F2FB9A9AF8D5D3B8B6
          B6B6B88773C2D4F2FD9A9A9AE9D5C9B6B6B6B6B6C4CAEEF69A9A9A9AFDDFD6CD
          BB62B1B8C9ECF2FD9A9A9A9A9AFDE4DADA85D9DDEDEFFD9A9A9A9A9A9A9AFDFD
          EBECEDEFFBFD9A9A9A9A9A9A9A9A9A9AF9F9F9FD9A9A9A9A9A9A9A9A9A9A9AFD
          EAE6F2F7FA9A9A9A9A9A9A9A9A9A9AFBFDFDFDFDFD9A9A9A9A9A}
        TabOrder = 2
      end
      object btnInject: TBitBtn
        Left = 448
        Top = 1
        Width = 135
        Height = 25
        Action = actInjectDll
        Caption = 'Inject AsmProfiler.dll'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000010000FF00FF000062
          00000065000000680000006E0000036B0400046E08000276030004760700007D
          0000037A0500047B050006720A0009760E0009780E0000605300006757000063
          5F00026C5B00005F7800006375000184010007800C00088C0D0000970000059F
          07000C8513000D88190011841300108019001296110012892100148E28001D93
          2E001B9A2D001A9E3500249D380018A32E0027B84C0036BA510033C34E002EC6
          5C0036CF540044DD65004BE47E000066CE000268D000056BD300076DD300076D
          D4000B6DD7000A70D8000D73DB000E74DB001177DE00197FDE001277E600187E
          E000197EEA001C82E9002288E0002286EB002186EE00278CEC00298FEB00288E
          EE002A90EE002F95ED003499FE00379CFF003BA0EE003FA5FA003DA2FF0045AB
          FF004AAFFF0058BDFF0000CCFF0011EEED005DC3FF0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000033000000000000000000000000003137313100004D4C0000
          000000000031434A31000000004D4C0000313131313F472E0000000000000000
          32323F4B4B3F3100000000000000001338473C4649452E000000000000001C22
          14414B393E452E0000000000000C1F2C27113E45363B310000000000000E2924
          2B1E0F3A4533310000000000000E29231A19150F3831000000000000000E2625
          160A190A1200000000000000001F1B17150A0404004D4C000000000021280802
          0204020000004D4C0000001D2A17020000000000000000000000040608020000
          0000000000000000000020040000000000000000000000000000}
        TabOrder = 3
      end
    end
    object lbProcesses: TListBox
      AlignWithMargins = True
      Left = 5
      Top = 44
      Width = 580
      Height = 383
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      OnDblClick = lbProcessesDblClick
      OnKeyPress = lbProcessesKeyPress
      ExplicitWidth = 533
    end
    object sbFilter: TSearchBox
      Left = 5
      Top = 18
      Width = 162
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TextHint = 'F2 - Filter'
      OnChange = sbFilterChange
      OnKeyDown = sbFilterKeyDown
    end
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 144
    Top = 72
    object actRefresh: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshExecute
    end
    object actLiveView: TAction
      Caption = 'Live View'
      OnExecute = actLiveViewExecute
    end
    object actProfileIt: TAction
      Caption = 'Profile it'
      OnExecute = actProfileItExecute
    end
    object actInjectDll: TAction
      Caption = 'Inject AsmProfiler.dll (instrumenting)'
      OnExecute = actInjectDllExecute
    end
  end
end
