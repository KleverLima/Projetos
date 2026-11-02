inherited FrmSubGrupos: TFrmSubGrupos
  Caption = ''
  ClientHeight = 429
  OnDestroy = FormDestroy
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 15
  inherited FrmFrameBarra1: TFrmFrameBarra
    Align = alTop
    inherited Image3: TImage
      ExplicitHeight = 55
    end
    inherited pnTitulo: TPanel
      Constraints.MinHeight = 25
      Visible = False
      inherited LblBarraTitulo: TLabel
        Width = 785
        Caption = 'Subgrupo de Mercadorias'
        ExplicitWidth = 787
        ExplicitHeight = 41
      end
      inherited Image1: TImage
        ExplicitHeight = 53
      end
      inherited Image2: TImage
        Left = 865
        ExplicitLeft = 865
        ExplicitHeight = 53
      end
    end
  end
  inherited FrmFrameBotoes1: TFrmFrameBotoes
    Top = 369
    ExplicitTop = 369
    inherited PanelBotoesBottom: TPanel
      inherited SpbAdicionar: TSpeedButton
        ExplicitLeft = 0
      end
      inherited SpbEditar: TSpeedButton
        ExplicitLeft = 200
      end
      inherited SpbCancelar: TSpeedButton
        ExplicitLeft = 300
      end
      inherited SpbSalvar: TSpeedButton
        ExplicitLeft = 100
      end
      inherited SpbExcluir: TSpeedButton
        ExplicitLeft = 400
      end
      inherited SpbImprimir: TSpeedButton
        ExplicitLeft = 600
      end
      inherited SpbProcurar: TSpeedButton
        ExplicitLeft = 500
      end
    end
  end
  inherited dbEditPesquisar: TIDBEditDialog
    SearchQuery.Strings = (
      'SELECT * FROM CAD_SUBGRUPO'
      'WHERE'
      '%WHERE%')
  end
  inherited pgControl: TPageControl
    Top = 50
    Height = 319
    ExplicitTop = 0
    ExplicitHeight = 369
    inherited tabPrincipal: TTabSheet
      ExplicitHeight = 289
      inherited GroupBox1: TGroupBox
        Height = 289
        ExplicitHeight = 339
        inherited cxGrid: TcxGrid
          Height = 270
          ExplicitHeight = 320
          inherited cxGridDados: TcxGridDBTableView
            inherited cxGridDadosNome: TcxGridDBColumn
              DataBinding.FieldName = 'DESCRICAO'
            end
          end
        end
      end
    end
    inherited tabDetalhe: TTabSheet
      ExplicitHeight = 289
      inherited EditNome: TDBEdit
        DataField = 'DESCRICAO'
      end
    end
  end
  inherited dbTabela: TFDQuery
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_SUBGRUPO')
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
end
