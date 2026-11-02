object FrmFrameBarra: TFrmFrameBarra
  Left = 0
  Top = 0
  Width = 634
  Height = 50
  ParentCustomHint = False
  Anchors = []
  BiDiMode = bdLeftToRight
  Constraints.MinHeight = 50
  Color = clHotLight
  ParentBackground = False
  ParentBiDiMode = False
  ParentColor = False
  ParentShowHint = False
  ShowHint = False
  TabOrder = 0
  OnResize = FrameResize
  object Image3: TImage
    Left = 0
    Top = 0
    Width = 433
    Height = 25
    ParentCustomHint = False
    Center = True
    ParentShowHint = False
    ShowHint = False
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 631
    Height = 50
    BevelKind = bkSoft
    BevelOuter = bvNone
    Color = clHotLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object LblBarraTitulo: TLabel
      AlignWithMargins = True
      Left = 70
      Top = 3
      Width = 492
      Height = 40
      Margins.Left = 15
      Margins.Right = 10
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = '<titulo do m'#243'dulo>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      GlowSize = 1
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      OnDblClick = LblBarraTituloDblClick
      ExplicitLeft = 71
      ExplicitTop = 0
      ExplicitWidth = 427
      ExplicitHeight = 47
    end
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 55
      Height = 46
      Align = alLeft
      Center = True
      Proportional = True
      Transparent = True
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 43
    end
    object Image2: TImage
      Left = 572
      Top = 0
      Width = 55
      Height = 46
      Align = alRight
      Center = True
      Proportional = True
      Transparent = True
      ExplicitLeft = 380
      ExplicitTop = 1
      ExplicitHeight = 43
    end
  end
end
