unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, UCCadena;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    TxtEntrada: TEdit;
    TxtPos: TEdit;
    TxtAux: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Mostrar: TMenuItem;
    CargarCadena: TMenuItem;
    longitud: TMenuItem;
    Adicionar: TMenuItem;
    Insertar: TMenuItem;
    EliminarPos: TMenuItem;
    EliminarChar: TMenuItem;
    ModificarChar: TMenuItem;
    ObtenerChar: TMenuItem;
    Metodos21: TMenuItem;
    Metodos22: TMenuItem;
    ConvertiraMinsculas1: TMenuItem;
    InvertirCadena1: TMenuItem;
    ContarConsonantes1: TMenuItem;
    ContarPalabras1: TMenuItem;
    whileposlongitudandcaracteresposinseparadoresdobeginsaltelosseparadores1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MostrarClick(Sender: TObject);
    procedure CargarCadenaClick(Sender: TObject);
    procedure AdicionarClick(Sender: TObject);
    procedure longitudClick(Sender: TObject);
    procedure InsertarClick(Sender: TObject);
    procedure EliminarPosClick(Sender: TObject);
    procedure EliminarCharClick(Sender: TObject);
    procedure ModificarCharClick(Sender: TObject);
    procedure ObtenerCharClick(Sender: TObject);
    procedure ConvertiraMinsculas1Click(Sender: TObject);
    procedure Metodos22Click(Sender: TObject);
    procedure InvertirCadena1Click(Sender: TObject);
    procedure ContarConsonantes1Click(Sender: TObject);
    procedure ContarPalabras1Click(Sender: TObject);
    procedure whileposlongitudandcaracteresposinseparadoresdobeginsaltelosseparadores1Click(
      Sender: TObject);
  private
    { Private declarations }
    C:Cadena;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   C:=Cadena.Create;
end;

procedure TfrmPrincipal.MostrarClick(Sender: TObject);
begin
   label4.caption:= c.ToStr;
end;

procedure TfrmPrincipal.CargarCadenaClick(Sender: TObject);
begin
   C.ModificarString(txtEntrada.Text);
end;

//---------------------------------------------------------------------


procedure TfrmPrincipal.longitudClick(Sender: TObject);
begin
     Label4.caption:= 'La longitud es: '+ IntToStr(c.LongCadena(txtEntrada.text));
    // label4.caption:='La longitud es: '+ c.ToStr;
end;

procedure TfrmPrincipal.AdicionarClick(Sender: TObject);
begin
    C.AdicionarCaracter(txtaux.Text[1]);
   //
   //label4.caption:= c.ToStr;
end;

procedure TfrmPrincipal.InsertarClick(Sender: TObject);
begin
   C.InsertarCaracter(StrToInt(txtPos.text),txtAux.text[1]);
end;



procedure TfrmPrincipal.EliminarPosClick(Sender: TObject);
begin
    C.EliminarCaracter(StrToInt(TxtPos.Text));
end;

procedure TfrmPrincipal.EliminarCharClick(Sender: TObject);
begin
  //A�n no implementado en UCCadena
end;

procedure TfrmPrincipal.ModificarCharClick(Sender: TObject);
begin
   C.ModificarCaracter(StrToInt(txtPos.text),txtAux.text[1]);
end;

procedure TfrmPrincipal.ObtenerCharClick(Sender: TObject);
begin
   Label4.caption:=c.ObtenerCaracter(StrToInt(TxtPos.text));
end;
procedure TfrmPrincipal.whileposlongitudandcaracteresposinseparadoresdobeginsaltelosseparadores1Click(
  Sender: TObject);
var palabra : string;
begin
  palabra := InputBox('ingrese la palabra a buscar','','hola');
  Label4.Caption := IntToStr(C.BuscarPalabra(palabra));
end;

//-----------------------------------------------------------------
//metodos 2
procedure TfrmPrincipal.Metodos22Click(Sender: TObject);
begin
   C.UpperCase;
end;

procedure TfrmPrincipal.ConvertiraMinsculas1Click(Sender: TObject);
begin
    C.LowerCase;
end;

procedure TfrmPrincipal.InvertirCadena1Click(Sender: TObject);
begin
    c.InvertirCadena;
end;

procedure TfrmPrincipal.ContarConsonantes1Click(Sender: TObject);
begin
   label4.caption:= IntToStr(C.CantidadConsonantes);
end;

procedure TfrmPrincipal.ContarPalabras1Click(Sender: TObject);
begin
   label4.caption:=IntToStr(C.CantidadPalabras);
end;

end.
