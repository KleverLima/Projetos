object FNfeDetalheAnexo: TFNfeDetalheAnexo
  Left = 320
  Top = 216
  Caption = 'NF-e Detalhes Anexo'
  ClientHeight = 379
  ClientWidth = 1017
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlDadosTributacao: TPageControl
    Left = 0
    Top = 0
    Width = 1017
    Height = 379
    ActivePage = tsIcms
    Align = alClient
    TabOrder = 0
    object tsIcms: TTabSheet
      Caption = 'ICMS'
      ImageIndex = 2
      object PanelDetalheIcms: TPanel
        Left = 0
        Top = 0
        Width = 1009
        Height = 351
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          1009
          351)
        object Bevel1: TBevel
          Left = 5
          Top = 7
          Width = 996
          Height = 337
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        object Label1: TLabel
          Left = 128
          Top = 37
          Width = 474
          Height = 13
          Caption = 
            '[0 = Nacional; 1 = Estrangeira Importa'#231#227'o  direta;  2 = Estrange' +
            'ira Adquirida no  mercado interno]'
        end
        object Label2: TLabel
          Left = 106
          Top = 85
          Width = 541
          Height = 13
          Caption = 
            '[0 = Margem Valor Agregado (%);  1 = Pauta (Valor);  2 = Pre'#231'o T' +
            'abelado M'#225'x. (valor);  3 = valor da opera'#231#227'o]'
        end
        object Label3: TLabel
          Left = 144
          Top = 178
          Width = 841
          Height = 13
          Caption = 
            '[0 = Pre'#231'o tabelado ou m'#225'ximo sugerido;  1 = Lista Negativa (val' +
            'or);  2 = Lista Positiva (valor);  3 = Lista Neutra (valor);  4 ' +
            '= Margem Valor Agregado (%);  5 = Pauta (valor)]'
        end
        object Label4: TLabel
          Left = 665
          Top = 125
          Width = 333
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 
            '[1 = T'#225'xi;  2 = Deficiente F'#237'sico;  3 = Produtor Agropecu'#225'rio;  ' +
            '4 = Frotista/Locadora;  5 = Diplom'#225'tico/Consular;  6 = Utilit'#225'ri' +
            'os e Motocicletas da  Amaz'#244'nia Ocidental e '#193'reas de  Livre Com'#233'r' +
            'cio (Resolu'#231#227'o  714/88 e 790/94 - CONTRAN e  suas altera'#231#245'es);  ' +
            '7 = SUFRAMA;  9 = outros]'
          WordWrap = True
          ExplicitWidth = 756
        end
      end
    end
    object tsPis: TTabSheet
      Caption = 'PIS'
      object PanelDetalhePis: TPanel
        Left = 0
        Top = 0
        Width = 1009
        Height = 351
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          1009
          351)
        object Bevel2: TBevel
          Left = 5
          Top = 7
          Width = 996
          Height = 337
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
      end
    end
    object tsCofins: TTabSheet
      Caption = 'COFINS'
      ImageIndex = 2
      object PanelDetalheCofins: TPanel
        Left = 0
        Top = 0
        Width = 1009
        Height = 351
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          1009
          351)
        object Bevel3: TBevel
          Left = 5
          Top = 7
          Width = 996
          Height = 337
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
      end
    end
    object tsIpi: TTabSheet
      Caption = 'IPI'
      ImageIndex = 3
      object PanelDetalheIpi: TPanel
        Left = 0
        Top = 0
        Width = 1009
        Height = 351
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          1009
          351)
        object Bevel4: TBevel
          Left = 5
          Top = 7
          Width = 996
          Height = 337
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
      end
    end
    object tsImpostoImportacao: TTabSheet
      Caption = 'Imposto Importa'#231#227'o'
      ImageIndex = 4
      object PanelDetalheImpostoImportacao: TPanel
        Left = 0
        Top = 0
        Width = 1009
        Height = 351
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          1009
          351)
        object Bevel5: TBevel
          Left = 5
          Top = 7
          Width = 996
          Height = 337
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
      end
    end
    object tsIssqn: TTabSheet
      Caption = 'ISSQN'
      ImageIndex = 5
      object PanelDetalheIssqn: TPanel
        Left = 0
        Top = 0
        Width = 1009
        Height = 351
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          1009
          351)
        object Bevel6: TBevel
          Left = 5
          Top = 7
          Width = 996
          Height = 337
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        object Label5: TLabel
          Left = 87
          Top = 85
          Width = 294
          Height = 13
          Caption = '[N = NORMAL;  R = RETIDA;  S = SUBSTITUTA;  I = ISENTA]'
        end
      end
    end
    object tsDetalheEspecificoCombustivel: TTabSheet
      Caption = 'Combust'#237'vel'
      ImageIndex = 6
      object PanelDetalheCombustivel: TPanel
        Left = 0
        Top = 0
        Width = 1009
        Height = 351
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
    object tsDetalheEspecificoVeiculo: TTabSheet
      Caption = 'Ve'#237'culo'
      ImageIndex = 7
      object PanelDetalheVeiculo: TPanel
        Left = 0
        Top = 0
        Width = 1009
        Height = 351
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          1009
          351)
        object Bevel8: TBevel
          Left = 5
          Top = 7
          Width = 996
          Height = 337
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        object Label6: TLabel
          Left = 111
          Top = 37
          Width = 769
          Height = 13
          Caption = 
            '[1 = Venda concession'#225'ria;  2 = Faturamento direto para  consumi' +
            'dor final;  3 = Venda direta para grandes  consumidores (frotist' +
            'a, governo,  ...);  0 = Outros]'
        end
        object Label7: TLabel
          Left = 623
          Top = 181
          Width = 354
          Height = 13
          Caption = 
            '[1=Passageiro;  2=Carga;  3=Misto ; 4=Corrida;  5=Tra'#231#227'o;  6=Esp' +
            'ecial]'
        end
        object Label8: TLabel
          Left = 103
          Top = 229
          Width = 132
          Height = 13
          Caption = '[R=Remarcado; N=Normal]'
        end
        object Label9: TLabel
          Left = 343
          Top = 229
          Width = 230
          Height = 13
          Caption = '[1=Acabado;  2=Inacabado;  3=Semi-acabado]'
        end
        object Label10: TLabel
          Left = 103
          Top = 277
          Width = 634
          Height = 13
          Caption = 
            '[0 = N'#227'o h'#225';  1= Aliena'#231#227'o Fiduci'#225'ria;  2 = Arrendamento Mercant' +
            'il;  3 = Reserva de Dom'#237'nio;  4 = Penhor de Ve'#237'culos;  9 = outra' +
            's]'
        end
      end
    end
    object tsDetalheEspecificoMedicamento: TTabSheet
      Caption = 'Medicamento'
      ImageIndex = 8
      object PanelDetalheMedicamento: TPanel
        Left = 0
        Top = 0
        Width = 1009
        Height = 351
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
    object tsDetalheEspecificoArmamento: TTabSheet
      Caption = 'Armamento'
      ImageIndex = 9
      object PanelDetalheArmamento: TPanel
        Left = 0
        Top = 0
        Width = 1009
        Height = 351
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
    object tsDeclaracaoImportacao: TTabSheet
      Caption = 'Declara'#231#227'o Importa'#231#227'o'
      ImageIndex = 10
      object PanelDeclaracaoImportacao: TPanel
        Left = 0
        Top = 0
        Width = 1009
        Height = 351
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 951
        ExplicitHeight = 235
        object PageControlAdicoes: TPageControl
          Left = 0
          Top = 158
          Width = 1009
          Height = 193
          ActivePage = tsDetalheAdicoes
          Align = alBottom
          TabOrder = 0
          object tsDetalheAdicoes: TTabSheet
            Caption = 'Adi'#231#245'es'
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 1001
              Height = 165
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
            end
          end
        end
      end
    end
  end
end
