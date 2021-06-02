object Form2: TForm2
  Left = 190
  Top = 399
  BorderStyle = bsDialog
  Caption = 'Score Table'
  ClientHeight = 229
  ClientWidth = 233
  Color = 16711808
  Constraints.MaxHeight = 268
  Constraints.MaxWidth = 249
  Constraints.MinHeight = 268
  Constraints.MinWidth = 249
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 23
    Top = 2
    Width = 33
    Height = 15
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 159
    Top = 2
    Width = 29
    Height = 15
    Caption = 'Point'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnDblClick = Label2DblClick
  end
  object ListBox1: TListBox
    Left = 13
    Top = 16
    Width = 204
    Height = 174
    Color = 8447743
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 10485760
    Font.Height = -15
    Font.Name = 'Default'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 13
    Top = 195
    Width = 142
    Height = 28
    Caption = 'Close'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
    Spacing = 10
  end
  object Panel1: TPanel
    Left = 154
    Top = 18
    Width = 3
    Height = 173
    Color = clRed
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 156
    Top = 195
    Width = 61
    Height = 28
    Caption = 'Delete'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TabStop = False
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
      33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
      33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
      333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
      03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
      33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
      0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
      3333333337FFF7F3333333333000003333333333377777333333}
    NumGlyphs = 2
    Spacing = 1
  end
end
