object Form1: TForm1
  Left = 357
  Top = 383
  Width = 730
  Height = 297
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 13
    Caption = 'Cole o XML aqui:'
  end
  object Label2: TLabel
    Left = 336
    Top = 8
    Width = 90
    Height = 13
    Caption = 'Tag (sem '#39'<'#39' e '#39'/>'#39'):'
  end
  object Label3: TLabel
    Left = 336
    Top = 128
    Width = 41
    Height = 13
    Caption = 'Retorno:'
  end
  object Label4: TLabel
    Left = 648
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Ocorrencia:'
  end
  object tbXMLRET: TMemo
    Left = 8
    Top = 24
    Width = 321
    Height = 209
    TabOrder = 0
  end
  object tbTag: TEdit
    Left = 336
    Top = 24
    Width = 297
    Height = 21
    TabOrder = 1
  end
  object btnBuscarPrimeiraTag: TButton
    Left = 336
    Top = 56
    Width = 145
    Height = 25
    Caption = 'Buscar Primeira Ocorr'#234'ncia'
    TabOrder = 2
    OnClick = btnBuscarPrimeiraTagClick
  end
  object btnBuscarUltimaTag: TButton
    Left = 488
    Top = 56
    Width = 145
    Height = 25
    Caption = 'Buscar '#218'ltima Ocorr'#234'ncia'
    TabOrder = 3
    OnClick = btnBuscarUltimaTagClick
  end
  object mmRet: TMemo
    Left = 336
    Top = 152
    Width = 297
    Height = 89
    TabOrder = 4
  end
  object btnProxOcorrencia: TButton
    Left = 336
    Top = 88
    Width = 145
    Height = 25
    Caption = 'Pr'#243'xima Ocorr'#234'ncia'
    TabOrder = 5
    OnClick = btnProxOcorrenciaClick
  end
  object btnVoltarOcorrencia: TButton
    Left = 488
    Top = 88
    Width = 145
    Height = 25
    Caption = 'Voltar Ocorr'#234'ncia'
    TabOrder = 6
    OnClick = btnVoltarOcorrenciaClick
  end
  object tbOcorrencia: TEdit
    Left = 648
    Top = 24
    Width = 57
    Height = 21
    TabOrder = 7
  end
end
