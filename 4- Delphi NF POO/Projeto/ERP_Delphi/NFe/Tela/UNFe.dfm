inherited FNFe: TFNFe
  Left = 328
  Top = 125
  Caption = 'Nota Fiscal Eletr'#244'nica'
  ClientHeight = 576
  ClientWidth = 1041
  ExplicitWidth = 1057
  ExplicitHeight = 615
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 1041
    Height = 545
    ActivePage = PaginaEdits
    ExplicitWidth = 1041
    ExplicitHeight = 545
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 1033
      ExplicitHeight = 517
      inherited PanelGrid: TPanel
        Width = 1033
        Height = 517
        ExplicitWidth = 1033
        ExplicitHeight = 517
        inherited PanelFiltroRapido: TPanel
          Top = 465
          Width = 1033
          ExplicitTop = 465
          ExplicitWidth = 1033
          inherited BotaoConsultar: TSpeedButton
            Left = 901
            ExplicitLeft = 896
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitWidth = 1033
      ExplicitHeight = 517
      inherited PanelEdits: TPanel
        Width = 1033
        Height = 517
        ExplicitWidth = 1033
        ExplicitHeight = 517
        object ScrollBox: TScrollBox
          Left = 4
          Top = 4
          Width = 1025
          Height = 509
          Align = alClient
          TabOrder = 0
          object BevelEdits: TBevel
            Left = 0
            Top = 32
            Width = 1021
            Height = 360
            Align = alClient
            ExplicitLeft = 312
            ExplicitTop = 112
            ExplicitWidth = 50
            ExplicitHeight = 50
          end
          object ActionToolBarEdits: TActionToolBar
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 1015
            Height = 26
            ActionManager = ActionManager
            BiDiMode = bdRightToLeft
            Caption = 'ActionToolBarEdits'
            Color = clMenuBar
            ColorMap.DisabledFontColor = 7171437
            ColorMap.HighlightColor = clWhite
            ColorMap.BtnSelectedFont = clBlack
            ColorMap.UnusedColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Orientation = boRightToLeft
            ParentBiDiMode = False
            ParentFont = False
            Spacing = 0
          end
          object PageControlEdits: TPageControl
            Left = 0
            Top = 32
            Width = 1021
            Height = 360
            ActivePage = TabSheetDadosNotaFiscal
            Align = alClient
            TabOrder = 1
            object TabSheetDadosNotaFiscal: TTabSheet
              Caption = 'Dados da NF-e'
              object PanelDadosNotaFiscal: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 332
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                BiDiMode = bdLeftToRight
                Ctl3D = True
                UseDockManager = False
                DoubleBuffered = False
                FullRepaint = False
                ParentBiDiMode = False
                ParentBackground = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ShowCaption = False
                TabOrder = 0
                DesignSize = (
                  1013
                  332)
                object EditNumeroNfe: TLabeledEdit
                  Left = 566
                  Top = 66
                  Width = 84
                  Height = 21
                  Anchors = [akTop, akRight]
                  EditLabel.Width = 41
                  EditLabel.Height = 13
                  EditLabel.Caption = 'N'#250'mero:'
                  ReadOnly = True
                  TabOrder = 0
                end
                object EditSerie: TLabeledEdit
                  Left = 498
                  Top = 66
                  Width = 62
                  Height = 21
                  Anchors = [akTop, akRight]
                  EditLabel.Width = 28
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Serie:'
                  ReadOnly = True
                  TabOrder = 2
                end
                object EditNaturezaOperacao: TLabeledEdit
                  Left = 650
                  Top = 23
                  Width = 353
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  EditLabel.Width = 113
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Natureza da Opera'#231#227'o:'
                  ReadOnly = True
                  TabOrder = 4
                end
                object GroupBoxDestinatario: TGroupBox
                  Left = 8
                  Top = 136
                  Width = 995
                  Height = 191
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Destinat'#225'rio:'
                  TabOrder = 3
                  DesignSize = (
                    995
                    191)
                  object EditDestinatarioCpfCnpj: TLabeledEdit
                    Left = 69
                    Top = 32
                    Width = 136
                    Height = 21
                    EditLabel.Width = 58
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CPF / CNPJ:'
                    MaxLength = 14
                    TabOrder = 0
                  end
                  object EditDestinatarioIE: TLabeledEdit
                    Left = 672
                    Top = 115
                    Width = 138
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 91
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Inscri'#231#227'o Estadual:'
                    MaxLength = 14
                    TabOrder = 10
                  end
                  object EditDestinatarioTelefone: TLabeledEdit
                    Left = 816
                    Top = 115
                    Width = 169
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 46
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Telefone:'
                    MaxLength = 14
                    TabOrder = 12
                  end
                  object EditDestinatarioLogradouro: TLabeledEdit
                    Left = 87
                    Top = 73
                    Width = 478
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 59
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Logradouro:'
                    MaxLength = 60
                    TabOrder = 3
                  end
                  object EditDestinatarioNumero: TLabeledEdit
                    Left = 571
                    Top = 73
                    Width = 100
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 41
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Numero:'
                    MaxLength = 60
                    TabOrder = 4
                  end
                  object EditDestinatarioBairro: TLabeledEdit
                    Left = 9
                    Top = 115
                    Width = 200
                    Height = 21
                    EditLabel.Width = 32
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Bairro:'
                    MaxLength = 60
                    TabOrder = 6
                  end
                  object EditDestinatarioCEP: TLabeledEdit
                    Left = 9
                    Top = 73
                    Width = 72
                    Height = 21
                    EditLabel.Width = 23
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CEP:'
                    MaxLength = 8
                    TabOrder = 2
                  end
                  object EditDestinatarioCidade: TLabeledEdit
                    Left = 284
                    Top = 115
                    Width = 337
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 37
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Cidade:'
                    MaxLength = 60
                    TabOrder = 7
                  end
                  object EditDestinatarioUF: TLabeledEdit
                    Left = 627
                    Top = 115
                    Width = 39
                    Height = 21
                    Anchors = [akTop, akRight]
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 8
                  end
                  object EditDestinatarioComplemento: TLabeledEdit
                    Left = 677
                    Top = 73
                    Width = 308
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 69
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Complemento:'
                    MaxLength = 60
                    TabOrder = 5
                  end
                  object EditDestinatarioRazao: TLabeledEdit
                    Left = 211
                    Top = 32
                    Width = 774
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 101
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Raz'#227'o Social / Nome:'
                    MaxLength = 60
                    TabOrder = 1
                  end
                  object EditDestinatarioEmail: TLabeledEdit
                    Left = 153
                    Top = 159
                    Width = 832
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 32
                    EditLabel.Height = 13
                    EditLabel.Caption = 'E-Mail:'
                    MaxLength = 60
                    TabOrder = 9
                  end
                  object EditDestinatarioSuframa: TLabeledEdit
                    Left = 9
                    Top = 159
                    Width = 138
                    Height = 21
                    EditLabel.Width = 52
                    EditLabel.Height = 13
                    EditLabel.Caption = 'SUFRAMA:'
                    MaxLength = 15
                    TabOrder = 11
                  end
                end
                object EditChaveAcesso: TLabeledEdit
                  Left = 9
                  Top = 65
                  Width = 318
                  Height = 22
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  EditLabel.Width = 87
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Chave de Acesso:'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 5
                end
                object EditCodigoNumerico: TLabeledEdit
                  Left = 354
                  Top = 66
                  Width = 138
                  Height = 21
                  Anchors = [akTop, akRight]
                  EditLabel.Width = 74
                  EditLabel.Height = 13
                  EditLabel.Caption = 'C'#243'd. Num'#233'rico:'
                  ReadOnly = True
                  TabOrder = 7
                end
                object EditDigitoChaveAcesso: TLabeledEdit
                  Left = 327
                  Top = 65
                  Width = 21
                  Height = 22
                  Anchors = [akTop, akRight]
                  AutoSize = False
                  EditLabel.Width = 17
                  EditLabel.Height = 13
                  EditLabel.Caption = 'DV:'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 6
                end
                object EditOperacaoFiscal: TLabeledEdit
                  Left = 70
                  Top = 23
                  Width = 314
                  Height = 21
                  TabStop = False
                  Color = clInfoBk
                  EditLabel.Width = 6
                  EditLabel.Height = 13
                  EditLabel.Caption = '  '
                  ReadOnly = True
                  TabOrder = 1
                end
              end
            end
            object TabSheetProdutos: TTabSheet
              Caption = 'Produtos / Servi'#231'os'
              ImageIndex = 1
              object PanelDetalhes: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 331
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                ParentBackground = False
                TabOrder = 0
                object ActionToolBar1: TActionToolBar
                  AlignWithMargins = True
                  Left = 4
                  Top = 4
                  Width = 1005
                  Height = 26
                  ActionManager = ActionManager
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBarEdits'
                  Color = clMenuBar
                  ColorMap.DisabledFontColor = 7171437
                  ColorMap.HighlightColor = clWhite
                  ColorMap.BtnSelectedFont = clBlack
                  ColorMap.UnusedColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Orientation = boRightToLeft
                  ParentBiDiMode = False
                  ParentFont = False
                  Spacing = 0
                end
              end
              object PanelDetalhesAnexo: TPanel
                Left = 0
                Top = 331
                Width = 1013
                Height = 1
                Align = alBottom
                BevelInner = bvLowered
                BevelOuter = bvNone
                TabOrder = 1
                ExplicitTop = 333
              end
            end
            object TabSheetDocumentosReferenciados: TTabSheet
              Caption = 'Documentos Referenciados'
              ImageIndex = 2
              object PageControlReferenciado: TPageControl
                Left = 0
                Top = 32
                Width = 1013
                Height = 300
                ActivePage = TabSheetReferenciadoNfe
                Align = alClient
                TabOrder = 0
                ExplicitTop = 56
                ExplicitHeight = 298
                object TabSheetReferenciadoNfe: TTabSheet
                  Caption = 'NF-e'
                end
                object TabSheetReferenciadoNf: TTabSheet
                  Caption = 'NF 1/1A'
                  ImageIndex = 1
                end
                object TabSheetReferenciadoCte: TTabSheet
                  Caption = 'CT-e'
                  ImageIndex = 2
                end
                object TabSheetReferenciadoRural: TTabSheet
                  Caption = 'NF Produtor Rural'
                  ImageIndex = 3
                end
                object TabSheetReferenciadoCupom: TTabSheet
                  Caption = 'Cupom Fiscal'
                  ImageIndex = 4
                end
              end
              object ActionToolBar2: TActionToolBar
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 1007
                Height = 26
                ActionManager = ActionManager
                BiDiMode = bdRightToLeft
                Caption = 'ActionToolBarEdits'
                Color = clMenuBar
                ColorMap.DisabledFontColor = 7171437
                ColorMap.HighlightColor = clWhite
                ColorMap.BtnSelectedFont = clBlack
                ColorMap.UnusedColor = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Orientation = boRightToLeft
                ParentBiDiMode = False
                ParentFont = False
                Spacing = 0
              end
            end
            object TabSheetEntregaRetirada: TTabSheet
              Caption = 'Entrega / Retirada'
              ImageIndex = 6
              object PanelEntregaRetirada: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 332
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                BiDiMode = bdLeftToRight
                Ctl3D = True
                UseDockManager = False
                DoubleBuffered = False
                FullRepaint = False
                ParentBiDiMode = False
                ParentBackground = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ShowCaption = False
                TabOrder = 0
                DesignSize = (
                  1013
                  332)
                object GroupBoxEntrega: TGroupBox
                  Left = 8
                  Top = 35
                  Width = 995
                  Height = 113
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Dados para entrega:'
                  TabOrder = 0
                  DesignSize = (
                    995
                    113)
                  object EditEntregaCpfCnpj: TLabeledEdit
                    Left = 9
                    Top = 31
                    Width = 136
                    Height = 21
                    EditLabel.Width = 58
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CPF / CNPJ:'
                    MaxLength = 14
                    TabOrder = 0
                  end
                  object EditEntregaLogradouro: TLabeledEdit
                    Left = 154
                    Top = 31
                    Width = 413
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 59
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Logradouro:'
                    MaxLength = 60
                    TabOrder = 1
                  end
                  object EditEntregaNumero: TLabeledEdit
                    Left = 577
                    Top = 31
                    Width = 100
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 41
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Numero:'
                    MaxLength = 60
                    TabOrder = 2
                  end
                  object EditEntregaBairro: TLabeledEdit
                    Left = 9
                    Top = 76
                    Width = 200
                    Height = 21
                    EditLabel.Width = 32
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Bairro:'
                    MaxLength = 60
                    TabOrder = 4
                  end
                  object EditEntregaCidade: TLabeledEdit
                    Left = 284
                    Top = 76
                    Width = 655
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 37
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Cidade:'
                    MaxLength = 60
                    TabOrder = 6
                  end
                  object EditEntregaUf: TLabeledEdit
                    Left = 946
                    Top = 76
                    Width = 39
                    Height = 21
                    Anchors = [akTop, akRight]
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 5
                  end
                  object EditEntregaComplemento: TLabeledEdit
                    Left = 685
                    Top = 31
                    Width = 300
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 69
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Complemento:'
                    MaxLength = 60
                    TabOrder = 3
                  end
                end
                object GroupBoxRetirada: TGroupBox
                  Left = 8
                  Top = 165
                  Width = 995
                  Height = 113
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Dados para retirada:'
                  TabOrder = 1
                  DesignSize = (
                    995
                    113)
                  object EditRetiradaCpfCnpj: TLabeledEdit
                    Left = 9
                    Top = 31
                    Width = 136
                    Height = 21
                    EditLabel.Width = 58
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CPF / CNPJ:'
                    MaxLength = 14
                    TabOrder = 0
                  end
                  object EditRetiradaLogradouro: TLabeledEdit
                    Left = 154
                    Top = 31
                    Width = 413
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 59
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Logradouro:'
                    MaxLength = 60
                    TabOrder = 1
                  end
                  object EditRetiradaNumero: TLabeledEdit
                    Left = 577
                    Top = 31
                    Width = 100
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 41
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Numero:'
                    MaxLength = 60
                    TabOrder = 2
                  end
                  object EditRetiradaBairro: TLabeledEdit
                    Left = 9
                    Top = 76
                    Width = 200
                    Height = 21
                    EditLabel.Width = 32
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Bairro:'
                    MaxLength = 60
                    TabOrder = 4
                  end
                  object EditRetiradaCidade: TLabeledEdit
                    Left = 284
                    Top = 76
                    Width = 655
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 37
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Cidade:'
                    MaxLength = 60
                    TabOrder = 6
                  end
                  object EditRetiradaUf: TLabeledEdit
                    Left = 946
                    Top = 76
                    Width = 39
                    Height = 21
                    Anchors = [akTop, akRight]
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 5
                  end
                  object EditRetiradaComplemento: TLabeledEdit
                    Left = 685
                    Top = 31
                    Width = 300
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 69
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Complemento:'
                    MaxLength = 60
                    TabOrder = 3
                  end
                end
                object ActionToolBar3: TActionToolBar
                  AlignWithMargins = True
                  Left = 4
                  Top = 4
                  Width = 1005
                  Height = 26
                  ActionManager = ActionManager
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBarEdits'
                  Color = clMenuBar
                  ColorMap.DisabledFontColor = 7171437
                  ColorMap.HighlightColor = clWhite
                  ColorMap.BtnSelectedFont = clBlack
                  ColorMap.UnusedColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Orientation = boRightToLeft
                  ParentBiDiMode = False
                  ParentFont = False
                  Spacing = 0
                end
              end
            end
            object TabSheetTransporte: TTabSheet
              Caption = 'Transporte'
              ImageIndex = 2
              object PanelTransporte: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 332
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                BiDiMode = bdLeftToRight
                Ctl3D = True
                UseDockManager = False
                DoubleBuffered = False
                FullRepaint = False
                ParentBiDiMode = False
                ParentBackground = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ShowCaption = False
                TabOrder = 0
                DesignSize = (
                  1013
                  332)
                object GroupBoxTransportador: TGroupBox
                  Left = 8
                  Top = 50
                  Width = 995
                  Height = 99
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Transportador:'
                  TabOrder = 1
                  DesignSize = (
                    995
                    99)
                  object EditTransportadorCpfCnpj: TLabeledEdit
                    Left = 70
                    Top = 31
                    Width = 136
                    Height = 21
                    EditLabel.Width = 58
                    EditLabel.Height = 13
                    EditLabel.Caption = 'CPF / CNPJ:'
                    MaxLength = 14
                    TabOrder = 0
                  end
                  object EditTransportadorIE: TLabeledEdit
                    Left = 679
                    Top = 31
                    Width = 306
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 91
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Inscri'#231#227'o Estadual:'
                    MaxLength = 14
                    TabOrder = 2
                  end
                  object EditTransportadorLogradouro: TLabeledEdit
                    Left = 10
                    Top = 72
                    Width = 510
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 59
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Logradouro:'
                    MaxLength = 60
                    TabOrder = 3
                  end
                  object EditTransportadorCidade: TLabeledEdit
                    Left = 526
                    Top = 72
                    Width = 414
                    Height = 21
                    Anchors = [akTop, akRight]
                    EditLabel.Width = 37
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Cidade:'
                    MaxLength = 60
                    TabOrder = 5
                  end
                  object EditTransportadorUF: TLabeledEdit
                    Left = 946
                    Top = 72
                    Width = 39
                    Height = 21
                    Anchors = [akTop, akRight]
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 4
                  end
                  object EditTransportadorRazaoSocial: TLabeledEdit
                    Left = 212
                    Top = 31
                    Width = 461
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 105
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Raz'#227'o Social / Nome::'
                    MaxLength = 60
                    TabOrder = 1
                  end
                end
                object GroupBoxTransporteRetencaoICMS: TGroupBox
                  Left = 292
                  Top = 155
                  Width = 711
                  Height = 60
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Reten'#231#227'o ICMS:'
                  TabOrder = 7
                  object EditRetencaoIcmsUf: TLabeledEdit
                    Left = 10
                    Top = 34
                    Width = 39
                    Height = 21
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 0
                  end
                end
                object GroupBoxVeiculo: TGroupBox
                  Left = 8
                  Top = 155
                  Width = 278
                  Height = 60
                  Caption = 'Ve'#237'culo:'
                  TabOrder = 4
                  object EditVeiculoRntc: TLabeledEdit
                    Left = 136
                    Top = 34
                    Width = 133
                    Height = 21
                    EditLabel.Width = 31
                    EditLabel.Height = 13
                    EditLabel.Caption = 'RNTC:'
                    MaxLength = 20
                    TabOrder = 2
                  end
                  object EditVeiculoPlaca: TLabeledEdit
                    Left = 55
                    Top = 34
                    Width = 75
                    Height = 21
                    EditLabel.Width = 29
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Placa:'
                    MaxLength = 8
                    TabOrder = 1
                  end
                  object EditVeiculoUf: TLabeledEdit
                    Left = 10
                    Top = 34
                    Width = 39
                    Height = 21
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 0
                  end
                end
                object GroupBoxReboque: TGroupBox
                  Left = 8
                  Top = 221
                  Width = 401
                  Height = 102
                  Anchors = [akLeft, akTop, akBottom]
                  Caption = 'Reboque:'
                  TabOrder = 5
                  ExplicitHeight = 104
                end
                object GroupBoxVolumes: TGroupBox
                  Left = 415
                  Top = 221
                  Width = 588
                  Height = 102
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Caption = 'Volumes:'
                  TabOrder = 3
                  ExplicitHeight = 104
                  object GroupBoxLacres: TGroupBox
                    Left = 344
                    Top = 15
                    Width = 242
                    Height = 87
                    Align = alRight
                    Caption = 'Lacres:'
                    TabOrder = 0
                  end
                end
                object EditTransporteVagao: TLabeledEdit
                  Left = 204
                  Top = 22
                  Width = 109
                  Height = 21
                  CharCase = ecUpperCase
                  EditLabel.Width = 34
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Vag'#227'o:'
                  MaxLength = 2
                  TabOrder = 0
                end
                object EditTransporteBalsa: TLabeledEdit
                  Left = 319
                  Top = 22
                  Width = 109
                  Height = 21
                  CharCase = ecUpperCase
                  EditLabel.Width = 29
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Balsa:'
                  MaxLength = 2
                  TabOrder = 2
                end
                object ActionToolBar4: TActionToolBar
                  Left = 518
                  Top = 3
                  Width = 492
                  Height = 24
                  ActionManager = ActionManager
                  Align = alCustom
                  Anchors = [akLeft, akTop, akRight]
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBarEdits'
                  Color = clMenuBar
                  ColorMap.DisabledFontColor = 7171437
                  ColorMap.HighlightColor = clWhite
                  ColorMap.BtnSelectedFont = clBlack
                  ColorMap.UnusedColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Orientation = boRightToLeft
                  ParentBiDiMode = False
                  ParentFont = False
                  Spacing = 0
                end
              end
            end
            object TabSheetCobranca: TTabSheet
              Caption = 'Cobran'#231'a'
              ImageIndex = 7
              object PanelCobranca: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 332
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                ParentBackground = False
                TabOrder = 0
                object PanelFatura: TPanel
                  Left = 1
                  Top = 33
                  Width = 1011
                  Height = 123
                  Align = alTop
                  BevelOuter = bvLowered
                  TabOrder = 0
                  ExplicitTop = 31
                  DesignSize = (
                    1011
                    123)
                  object GroupBoxFatura: TGroupBox
                    Left = 8
                    Top = 6
                    Width = 994
                    Height = 107
                    Anchors = [akLeft, akTop, akRight]
                    Caption = 'Fatura:'
                    TabOrder = 0
                    DesignSize = (
                      994
                      107)
                    object EditFaturaNumero: TLabeledEdit
                      Left = 10
                      Top = 33
                      Width = 973
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      EditLabel.Width = 41
                      EditLabel.Height = 13
                      EditLabel.Caption = 'N'#250'mero:'
                      MaxLength = 60
                      TabOrder = 0
                    end
                  end
                end
                object GroupBox1: TGroupBox
                  Left = 1
                  Top = 156
                  Width = 1011
                  Height = 175
                  Align = alClient
                  Caption = 'Duplicatas'
                  TabOrder = 1
                  ExplicitTop = 154
                  ExplicitHeight = 179
                end
                object ActionToolBar5: TActionToolBar
                  AlignWithMargins = True
                  Left = 4
                  Top = 4
                  Width = 1005
                  Height = 26
                  ActionManager = ActionManager
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBarEdits'
                  Color = clMenuBar
                  ColorMap.DisabledFontColor = 7171437
                  ColorMap.HighlightColor = clWhite
                  ColorMap.BtnSelectedFont = clBlack
                  ColorMap.UnusedColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Orientation = boRightToLeft
                  ParentBiDiMode = False
                  ParentFont = False
                  Spacing = 0
                end
              end
            end
            object TabSheetInformacoesAdicionais: TTabSheet
              Caption = 'Informa'#231#245'es Adicionais'
              ImageIndex = 4
              object PanelInformacoesAdicionais: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 334
                Align = alClient
                TabOrder = 0
                DesignSize = (
                  1013
                  332)
                object GroupBox2: TGroupBox
                  Left = 8
                  Top = 11
                  Width = 995
                  Height = 64
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Informa'#231#245'es de Com'#233'rcio Exterior:'
                  TabOrder = 0
                  DesignSize = (
                    995
                    64)
                  object EditComexLocalEmbarque: TLabeledEdit
                    Left = 54
                    Top = 31
                    Width = 931
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 79
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Local Embarque:'
                    MaxLength = 60
                    TabOrder = 1
                  end
                  object EditComexUfEmbarque: TLabeledEdit
                    Left = 9
                    Top = 31
                    Width = 39
                    Height = 21
                    CharCase = ecUpperCase
                    EditLabel.Width = 17
                    EditLabel.Height = 13
                    EditLabel.Caption = 'UF:'
                    MaxLength = 2
                    TabOrder = 0
                  end
                end
                object GroupBox3: TGroupBox
                  Left = 8
                  Top = 91
                  Width = 995
                  Height = 64
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Informa'#231#245'es de Compras:'
                  TabOrder = 1
                  DesignSize = (
                    995
                    64)
                  object EditCompraPedido: TLabeledEdit
                    Left = 199
                    Top = 31
                    Width = 370
                    Height = 21
                    EditLabel.Width = 36
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Pedido:'
                    MaxLength = 60
                    TabOrder = 1
                  end
                  object EditCompraNotaEmpenho: TLabeledEdit
                    Left = 9
                    Top = 31
                    Width = 184
                    Height = 21
                    CharCase = ecUpperCase
                    EditLabel.Width = 74
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Nota Empenho:'
                    MaxLength = 22
                    TabOrder = 0
                  end
                  object EditCompraContrato: TLabeledEdit
                    Left = 575
                    Top = 31
                    Width = 410
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    EditLabel.Width = 47
                    EditLabel.Height = 13
                    EditLabel.Caption = 'Contrato:'
                    MaxLength = 60
                    TabOrder = 2
                  end
                end
              end
            end
            object TabSheetRespostaSefaz: TTabSheet
              Caption = 'Respostas Sefaz'
              ImageIndex = 3
              object MemoRespostas: TMemo
                Left = 0
                Top = 0
                Width = 1013
                Height = 334
                Align = alClient
                ScrollBars = ssVertical
                TabOrder = 0
              end
            end
          end
          object PageControlTotais: TPageControl
            Left = 0
            Top = 392
            Width = 1021
            Height = 113
            ActivePage = tsTotaisGeral
            Align = alBottom
            TabOrder = 2
            object tsTotaisGeral: TTabSheet
              Caption = 'Totais Geral'
              object PanelTotais: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 85
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                ParentBackground = False
                TabOrder = 0
              end
            end
            object tsOutrosTotais: TTabSheet
              Caption = 'Outros Totais'
              ImageIndex = 1
              object PanelOutrosTotais: TPanel
                Left = 0
                Top = 0
                Width = 1013
                Height = 85
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                ParentBackground = False
                TabOrder = 0
              end
            end
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 1041
    ExplicitWidth = 1041
    inherited BotaoSair: TSpeedButton
      Left = 937
      ExplicitLeft = 932
    end
    inherited BotaoExportar: TSpeedButton
      Left = 837
      ExplicitLeft = 832
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 737
      ExplicitLeft = 732
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 627
      ExplicitLeft = 622
    end
    inherited BotaoAlterar: TSpeedButton
      ExplicitLeft = 287
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 637
      ExplicitLeft = 632
    end
  end
  inherited PopupMenuExportar: TPopupMenu
    Left = 24
    Top = 0
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Left = 124
    Top = 65535
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 264
    Top = 0
  end
  object ActionManager: TActionManager
    ActionBars.ShowHints = False
    ActionBars = <
      item
      end
      item
        Items = <
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end>
      end
      item
      end
      item
        Items = <
          item
            Caption = '-'
          end>
      end
      item
      end
      item
        Items = <
          item
            Action = ActionAtualizarTotais
            Caption = 'A&tualizar Totais'
            ImageIndex = 30
          end
          item
            Caption = '-'
          end
          item
            Action = ActionConsultarSefaz
            Caption = '&Consultar Sefaz'
            ImageIndex = 36
          end
          item
            Action = ActionCancelarNfe
            Caption = 'C&ancelar NF-e'
            ImageIndex = 34
          end
          item
            Caption = '-'
          end
          item
            Action = ActionSelecionarCertificado
            Caption = 'S&elecionar Certificado'
            ImageIndex = 27
          end
          item
            Action = ActionImprimirDanfe
            Caption = '&Imprimir DANFE'
            ImageIndex = 4
          end
          item
            Action = ActionEnviar
            Caption = 'E&nviar'
            ImageIndex = 33
          end
          item
            Action = ActionAssinar
            Caption = 'Assina&r'
            ImageIndex = 35
          end
          item
            Action = ActionValidar
            Caption = '&Validar'
            ImageIndex = 32
          end
          item
            Action = ActionGerarXml
            Caption = '&Gerar XML'
            ImageIndex = 18
          end>
        ActionBar = ActionToolBarEdits
      end
      item
      end
      item
        Items = <
          item
            Action = ActionExcluirItem
            Caption = '&Excluir Item da Nota'
            ImageIndex = 10
          end
          item
            Action = ActionIncluirItem
            Caption = '&Incluir Item na Nota'
            ImageIndex = 31
          end>
        ActionBar = ActionToolBar1
      end
      item
        Items = <
          item
            Action = ActionExcluirDocumentosReferenciados
            Caption = '&Excluir Documentos Referenciados'
            ImageIndex = 10
          end>
        ActionBar = ActionToolBar2
      end
      item
        Items = <
          item
            Action = ActionExcluirEntregaRetirada
            Caption = '&Excluir Dados Entrega/Retirada'
            ImageIndex = 10
          end>
        ActionBar = ActionToolBar3
      end
      item
        Items = <
          item
            Action = ActionExcluirTransporte
            Caption = '&Excluir Dados Transporte'
            ImageIndex = 10
          end>
        ActionBar = ActionToolBar4
      end
      item
        Items = <
          item
            Action = ActionExcluirCobranca
            Caption = '&Excluir Dados Cobran'#231'a'
            ImageIndex = 10
          end>
        ActionBar = ActionToolBar5
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 427
    StyleName = 'Platform Default'
    object ActionIncluirItem: TAction
      Category = 'NFe'
      Caption = 'Incluir Item na Nota'
      ImageIndex = 31
      OnExecute = ActionIncluirItemExecute
    end
    object ActionExcluirItem: TAction
      Category = 'NFe'
      Caption = 'Excluir Item da Nota'
      ImageIndex = 10
      OnExecute = ActionExcluirItemExecute
    end
    object ActionExcluirDocumentosReferenciados: TAction
      Category = 'NFe'
      Caption = 'Excluir Documentos Referenciados'
      ImageIndex = 10
      OnExecute = ActionExcluirDocumentosReferenciadosExecute
    end
    object ActionExcluirEntregaRetirada: TAction
      Category = 'NFe'
      Caption = 'Excluir Dados Entrega/Retirada'
      ImageIndex = 10
      OnExecute = ActionExcluirEntregaRetiradaExecute
    end
    object ActionExcluirTransporte: TAction
      Category = 'NFe'
      Caption = 'Excluir Dados Transporte'
      ImageIndex = 10
      OnExecute = ActionExcluirTransporteExecute
    end
    object ActionExcluirCobranca: TAction
      Category = 'NFe'
      Caption = 'Excluir Dados Cobran'#231'a'
      ImageIndex = 10
      OnExecute = ActionExcluirCobrancaExecute
    end
    object ActionSelecionarCertificado: TAction
      Category = 'NFe'
      Caption = 'Selecionar Certificado'
      ImageIndex = 27
      OnExecute = ActionSelecionarCertificadoExecute
    end
    object ActionConsultarSefaz: TAction
      Category = 'NFe'
      Caption = 'Consultar Sefaz'
      ImageIndex = 36
      OnExecute = ActionConsultarSefazExecute
    end
    object ActionImprimirDanfe: TAction
      Category = 'NFe'
      Caption = 'Imprimir DANFE'
      ImageIndex = 4
      OnExecute = ActionImprimirDanfeExecute
    end
    object ActionCancelarNfe: TAction
      Category = 'NFe'
      Caption = 'Cancelar NF-e'
      ImageIndex = 34
      OnExecute = ActionCancelarNfeExecute
    end
    object ActionEnviar: TAction
      Category = 'NFe'
      Caption = 'Enviar'
      ImageIndex = 33
      OnExecute = ActionEnviarExecute
    end
    object ActionAssinar: TAction
      Category = 'NFe'
      Caption = 'Assinar'
      ImageIndex = 35
      OnExecute = ActionAssinarExecute
    end
    object ActionValidar: TAction
      Category = 'NFe'
      Caption = 'Validar'
      ImageIndex = 32
      OnExecute = ActionValidarExecute
    end
    object ActionAtualizarTotais: TAction
      Category = 'NFe'
      Caption = 'Atualizar Totais'
      ImageIndex = 30
      OnExecute = ActionAtualizarTotaisExecute
    end
    object ActionGerarXml: TAction
      Category = 'NFe'
      Caption = 'Gerar XML'
      ImageIndex = 18
      OnExecute = ActionGerarXmlExecute
    end
  end
end
