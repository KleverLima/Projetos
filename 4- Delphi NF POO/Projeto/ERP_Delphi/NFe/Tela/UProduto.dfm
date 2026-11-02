inherited FProduto: TFProduto
  Tag = 1
  Left = 316
  Top = 148
  Caption = 'Produto'
  ClientHeight = 548
  ClientWidth = 942
  ExplicitWidth = 958
  ExplicitHeight = 587
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 942
    Height = 517
    ActivePage = PaginaEdits
    ExplicitWidth = 942
    ExplicitHeight = 517
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 934
      ExplicitHeight = 489
      inherited PanelGrid: TPanel
        Width = 934
        Height = 489
        ExplicitWidth = 934
        ExplicitHeight = 489
        inherited PanelFiltroRapido: TPanel
          Top = 437
          Width = 934
          ExplicitTop = 437
          ExplicitWidth = 934
          inherited BotaoConsultar: TSpeedButton
            Left = 802
            ExplicitLeft = 857
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitWidth = 934
      ExplicitHeight = 489
      inherited PanelEdits: TPanel
        Width = 934
        Height = 489
        ExplicitWidth = 934
        ExplicitHeight = 489
        object ScrollBox: TScrollBox
          Left = 4
          Top = 4
          Width = 926
          Height = 481
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            926
            481)
          object BevelEdits: TBevel
            Tag = 1
            Left = 7
            Top = 8
            Width = 909
            Height = 137
            Anchors = [akLeft, akTop, akRight]
            Constraints.MinWidth = 753
          end
          object PanelProdutoDadosBase: TPanel
            Left = 8
            Top = 9
            Width = 908
            Height = 135
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              908
              135)
            object EditGrupoProduto: TLabeledEdit
              Left = 69
              Top = 21
              Width = 363
              Height = 21
              TabStop = False
              Color = clInfoBk
              EditLabel.Width = 6
              EditLabel.Height = 13
              EditLabel.Caption = '  '
              ReadOnly = True
              TabOrder = 0
            end
            object EditSubGrupoProduto: TLabeledEdit
              Left = 432
              Top = 21
              Width = 465
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              EditLabel.Width = 6
              EditLabel.Height = 13
              EditLabel.Caption = '  '
              ReadOnly = True
              TabOrder = 2
            end
            object EditMarcaProduto: TLabeledEdit
              Left = 495
              Top = 64
              Width = 402
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              EditLabel.Width = 6
              EditLabel.Height = 13
              EditLabel.Caption = '  '
              ReadOnly = True
              TabOrder = 1
            end
            object EditUnidadeProduto: TLabeledEdit
              Left = 69
              Top = 64
              Width = 359
              Height = 21
              TabStop = False
              Color = clInfoBk
              EditLabel.Width = 6
              EditLabel.Height = 13
              EditLabel.Caption = '  '
              ReadOnly = True
              TabOrder = 4
            end
            object EditAlmoxarifado: TLabeledEdit
              Left = 69
              Top = 106
              Width = 359
              Height = 21
              TabStop = False
              Color = clInfoBk
              EditLabel.Width = 6
              EditLabel.Height = 13
              EditLabel.Caption = '  '
              ReadOnly = True
              TabOrder = 3
            end
            object EditTributGrupoTributario: TLabeledEdit
              Left = 604
              Top = 106
              Width = 293
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              EditLabel.Width = 6
              EditLabel.Height = 13
              EditLabel.Caption = '  '
              ReadOnly = True
              TabOrder = 5
            end
          end
          object PageControlDadosProduto: TPageControl
            Left = 7
            Top = 163
            Width = 909
            Height = 314
            ActivePage = tsProdutoPrincipal
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            OnChange = PageControlDadosProdutoChange
            object tsProdutoPrincipal: TTabSheet
              Caption = 'Principal'
              object PanelProdutoPrincipal: TPanel
                Left = 0
                Top = 0
                Width = 901
                Height = 286
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  901
                  286)
                object GroupBoxRG: TGroupBox
                  Left = 8
                  Top = 150
                  Width = 879
                  Height = 108
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Valores Principais'
                  TabOrder = 3
                end
                object EditNome: TLabeledEdit
                  Left = 8
                  Top = 60
                  Width = 516
                  Height = 21
                  EditLabel.Width = 31
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Nome:'
                  MaxLength = 100
                  TabOrder = 5
                end
                object EditGtin: TLabeledEdit
                  Left = 8
                  Top = 18
                  Width = 119
                  Height = 21
                  EditLabel.Width = 28
                  EditLabel.Height = 13
                  EditLabel.Caption = 'GTIN:'
                  MaxLength = 14
                  TabOrder = 0
                end
                object EditCodigoInterno: TLabeledEdit
                  Left = 133
                  Top = 18
                  Width = 391
                  Height = 21
                  EditLabel.Width = 76
                  EditLabel.Height = 13
                  EditLabel.Caption = 'C'#243'digo Interno:'
                  MaxLength = 60
                  TabOrder = 1
                end
                object EditNcm: TLabeledEdit
                  Left = 530
                  Top = 18
                  Width = 206
                  Height = 21
                  EditLabel.Width = 49
                  EditLabel.Height = 13
                  EditLabel.Caption = 'NCM [F1]:'
                  MaxLength = 8
                  TabOrder = 2
                  OnExit = EditNcmExit
                  OnKeyDown = EditNcmKeyDown
                end
                object EditDescricaoPdv: TLabeledEdit
                  Left = 530
                  Top = 60
                  Width = 357
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  EditLabel.Width = 72
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Descri'#231#227'o PDV:'
                  MaxLength = 30
                  TabOrder = 4
                end
              end
            end
            object tsDadosComplementares: TTabSheet
              Caption = 'Dados Complementares'
              ImageIndex = 2
              object PanelDadosComplementares: TPanel
                Left = 0
                Top = 0
                Width = 901
                Height = 286
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  901
                  286)
                object ImagemProduto: TImage
                  Left = 11
                  Top = 25
                  Width = 250
                  Height = 250
                  Center = True
                  PopupMenu = PopupMenu1
                  Transparent = True
                  OnClick = ImagemProdutoClick
                end
                object Label1: TLabel
                  Left = 8
                  Top = 6
                  Width = 98
                  Height = 13
                  Caption = 'Imagem do Produto:'
                end
                object EditCodigoLst: TLabeledEdit
                  Left = 267
                  Top = 18
                  Width = 42
                  Height = 21
                  EditLabel.Width = 21
                  EditLabel.Height = 13
                  EditLabel.Caption = 'LST:'
                  MaxLength = 4
                  TabOrder = 0
                end
                object EditExTipi: TLabeledEdit
                  Left = 315
                  Top = 18
                  Width = 42
                  Height = 21
                  EditLabel.Width = 36
                  EditLabel.Height = 13
                  EditLabel.Caption = 'EXTIPI:'
                  MaxLength = 3
                  TabOrder = 1
                end
                object EditTotalizadorParcial: TLabeledEdit
                  Left = 267
                  Top = 60
                  Width = 90
                  Height = 21
                  EditLabel.Width = 91
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Totalizador Parcial:'
                  MaxLength = 10
                  TabOrder = 2
                end
                object GroupBoxValoresPaf: TGroupBox
                  Left = 267
                  Top = 130
                  Width = 623
                  Height = 67
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Valores para PAF:'
                  TabOrder = 3
                end
              end
            end
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 942
    ExplicitWidth = 942
    inherited BotaoSair: TSpeedButton
      Left = 838
      ExplicitLeft = 913
    end
    inherited BotaoExportar: TSpeedButton
      Left = 738
      ExplicitLeft = 823
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 628
      ExplicitLeft = 743
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 728
      ExplicitLeft = 903
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 528
      ExplicitLeft = 663
    end
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Top = 23
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 720
    Top = 24
  end
  object PopupMenu1: TPopupMenu
    Images = FDataModule.ImagensCadastros
    Left = 224
    Top = 467
    object CarregarImaem1: TMenuItem
      Caption = 'Carregar Imagem'
      ImageIndex = 28
      OnClick = CarregarImaem1Click
    end
  end
end
