object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'CADENA'
  ClientHeight = 508
  ClientWidth = 851
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 851
    Height = 508
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 56
    ExplicitTop = 304
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 87
      Height = 25
      Caption = 'CADENA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 40
      Top = 81
      Width = 87
      Height = 25
      Caption = 'Posici'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 40
      Top = 143
      Width = 80
      Height = 25
      Caption = 'Auxiliar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 384
      Top = 32
      Width = 7
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TxtEntrada: TEdit
      Left = 168
      Top = 31
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object TxtPos: TEdit
      Left = 168
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object TxtAux: TEdit
      Left = 168
      Top = 150
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Button1: TButton
      Left = 40
      Top = 241
      Width = 75
      Height = 25
      Caption = 'cargar'
      TabOrder = 3
      OnClick = Button1Click
    end
    object StringGrid1: TStringGrid
      Left = 40
      Top = 272
      Width = 777
      Height = 65
      ColCount = 10
      DefaultColWidth = 30
      DefaultRowHeight = 20
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 2
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object Button2: TButton
      Left = 144
      Top = 241
      Width = 75
      Height = 25
      Caption = 'descargar'
      TabOrder = 5
      OnClick = Button2Click
    end
  end
  object MainMenu1: TMainMenu
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object CargarCadena: TMenuItem
        Caption = 'Insertar Palabra'
        OnClick = CargarCadenaClick
      end
      object Mostrar: TMenuItem
        Caption = 'Eliminar Palabra'
        OnClick = MostrarClick
      end
      object longitud: TMenuItem
        Caption = 'Longitud de Cadena'
        OnClick = longitudClick
      end
      object Adicionar: TMenuItem
        Caption = 'Adicionar Caracter'
        OnClick = AdicionarClick
      end
      object Insertar: TMenuItem
        Caption = 'Insertar Caracter'
        OnClick = InsertarClick
      end
      object EliminarPos: TMenuItem
        Caption = 'Eliminar Caracter seg'#250'n posici'#243'n'
        OnClick = EliminarPosClick
      end
      object EliminarChar: TMenuItem
        Caption = 'Eliminar Caracteres seg'#250'n caracter'
        OnClick = EliminarCharClick
      end
      object ModificarChar: TMenuItem
        Caption = 'Modificar Caracter'
        OnClick = ModificarCharClick
      end
      object ObtenerChar: TMenuItem
        Caption = 'Obtener Caracter seg'#250'n Posici'#243'n'
        OnClick = ObtenerCharClick
      end
    end
    object Metodos21: TMenuItem
      Caption = 'Metodos 2'
      object Metodos22: TMenuItem
        Caption = 'Convertir a May'#250'sculas'
        OnClick = Metodos22Click
      end
      object ConvertiraMinsculas1: TMenuItem
        Caption = 'Convertir a Min'#250'sculas'
        OnClick = ConvertiraMinsculas1Click
      end
      object InvertirCadena1: TMenuItem
        Caption = 'Invertir Cadena'
        OnClick = InvertirCadena1Click
      end
      object ContarConsonantes1: TMenuItem
        Caption = 'Contar Consonantes'
        OnClick = ContarConsonantes1Click
      end
      object ContarPalabras1: TMenuItem
        Caption = 'Contar Palabras'
        OnClick = ContarPalabras1Click
      end
      object whileposlongitudandcaracteresposinseparadoresdobeginsaltelosseparadores1: TMenuItem
        Caption = 'return PosPalabra'
        OnClick = whileposlongitudandcaracteresposinseparadoresdobeginsaltelosseparadores1Click
      end
    end
    object examen1: TMenuItem
      Caption = 'examen'
      object polinomioWord1: TMenuItem
        Caption = 'polinomio:Word'
        OnClick = polinomioWord1Click
      end
      object fechaMenor1: TMenuItem
        Caption = 'fechaMenor'
        OnClick = fechaMenor1Click
      end
    end
  end
end
