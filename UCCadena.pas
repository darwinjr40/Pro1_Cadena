unit UCCadena;

interface
 uses sysutils,Vcl.Dialogs, math;
 Const MaxC = 1024;
       separadores= [' ',',','.',';',':'];
       letras = ['A'..'Z','a'..'z'];

 type
   Cadena = class
     private
       longitud:word;
       caracteres:array [1..Maxc] of char;
        //valor
     public
//-------------------------------------------------------------
       procedure setLongitud(x : Word);
       procedure AdicionarCaracter (c:char);
       procedure adicionarPalabra(x : String);
       procedure InsertarCaracter (p:byte;c:char);

       function BuscarPalabra(pal:string):word;
       function sacarPalabra(var pos:byte): String;
       procedure eliminarPalabra(pal:string);

       function fechaMenor():string;
       function intFecha(x:string):Cardinal;

       Procedure EliminarCaracter (p:byte);
   //    Procedure EliminarCaracter2 (c:char);
       procedure ModificarCaracter(p:byte;c:char);
       function ObtenerCaracter (p:word):char;
//--------------------------------------------------------------
       procedure ModificarString(s: string);
       function ToStr : string;
       function getLongitud():Word;
       function getCaracter(pos : byte) : char;
       function LongCadena(c:string):word;
//--------------------------------------------------------------

//--------------------------------------------------------------
       function CantidadConsonantes:word;
       procedure InvertirCadena;
       procedure Intercambiar(a,b:word);
       procedure UpperCase;
       Procedure LowerCase;
       Function CantidadPalabras:byte;


       function  sacarNumero(var pos:byte):integer;
       function  sacarOperador(var pos:byte):char;
       function polinomio(x: Byte):Integer;

       procedure mostrarNumeros();
       function polinomioN(x: Byte):Integer;
      { Procedure PalabraN;
       procedure EliminarPalabra (p:byte); no es muy pr?ctico usar este }
       procedure EliminarPalabra2(c:string);
   end;
implementation

{ Cadena }

function Cadena.LongCadena(c:string): word;
begin
   result:=longitud;
end;

procedure Cadena.AdicionarCaracter(c: char);
begin
   longitud:= longitud+1;   //longitud = 3
   caracteres[longitud]:= c;//['a','b','c']
end;

procedure Cadena.InsertarCaracter(p: byte; c: char);
var
  i: Word;
begin
 if(p>0) and (p<=longitud) then
 begin
   longitud:=longitud+1;
    for i := longitud downto p+1 do
         caracteres[i]:=caracteres[i-1];
    caracteres[p]:=c;
 end else raise Exception.Create('Posici?n fuera de rango');
end;

procedure Cadena.EliminarCaracter(p: byte);
var i:byte;
begin
 if (p>0) and (p<=Longitud) then
    begin
    for i := p to longitud-1 do
         caracteres[i]:=caracteres[i+1];
     longitud:=longitud-1;
 end else raise Exception.Create('Posici?n fuera de rango');

end;

procedure Cadena.eliminarPalabra(pal: string);
var i, pos :Byte;
begin
  pos := BuscarPalabra(pal);
  if pos > 0 then begin
    for I := 1 to Length(pal) do
      EliminarCaracter(pos);
  end;
end;

procedure Cadena.ModificarCaracter(p: byte; c: char);
begin
if (p>0) and (p<=longitud) then  begin
caracteres[p]:=c;
end else raise Exception.Create('Posici?n fuera de Rango')
end;


function Cadena.ObtenerCaracter(p: word): char;
begin
if (p>0) and (p<=longitud) then
  result:= caracteres[p];
  raise Exception.Create('Posici?n fuera de rango');
end;

function Cadena.polinomio(x: Byte): Integer;
var i : Byte;
    n, r:Integer;
    op :Char;
begin
  i := 1;
  r := 0;
  n := 0;
  while i<= longitud do begin
    op := sacarOperador(i);
    case op of
      '-':n := -sacarNumero(i);
      '+':n := +sacarNumero(i);
    end;
    r := r + n * x;
  end;
  result := r;
end;

function Cadena.polinomioN(x: Byte): Integer;
var i:Byte;
    resultado, exp : Word;
               aux, xd :Integer;
begin
  while i <= longitud do begin
    aux := sacarNumero(i);
    if i<= longitud then begin
      if (caracteres[i] = 'x') then begin
        if (caracteres[i+1] in['0'..'9']) then
            exp := sacarNumero(i)
        else
            exp := 1;
        xd := trunc(power(x,exp));
        resultado := resultado + aux *xd ;
      end else begin
        resultado := resultado + aux;
      end;
    end;
  end;
  result := resultado + aux;
end;

//----------------------------------------------
//caracteres[ ,h,o,l,a, ,c,o,m,o]   pos =1   palabra=""
//pos = 7     palabra = "hola"
//sacarPalabra(var i,var  pal);  //i = 1;    pal=""
//i= 7     pal ="hola"

function Cadena.sacarNumero(var pos:byte): integer;
const  NUMEROS = ['0'..'9'];
VAR num : Integer;
    x :string;
begin
 x := '0';
 num := 0;
  while (pos <=longitud) and (not(caracteres[pos] in NUMEROS))  do   begin //salte los separadores
    if caracteres[pos] = '-' then
      x:= '-';
    Inc(pos);   //pos = pos + 1
  end;
  while (pos <=longitud) and (caracteres[pos] in NUMEROS)  do   begin //salte los separadores
    x := x + caracteres[pos];
    Inc(pos);
  end;      //'-2'

  result := StrToInt(x);
end;

function Cadena.sacarOperador(var pos: byte): char;
const  OPERADOR = ['-','+'];
VAR
    x :char;
begin
 x := '+';
  while (pos <=longitud) and (not(caracteres[pos] in OPERADOR))  do   begin //salte los separadores
    Inc(pos);   //pos = pos + 1
  end;
  while (pos <=longitud) and (caracteres[pos] in OPERADOR)  do   begin //salte los separadores
    x := caracteres[pos];
    Inc(pos);
  end;
  result := x;
end;

function Cadena.sacarPalabra(var pos: byte): String;
var i : Byte;
    palabra : string;
begin
  palabra := '';   // ' '   in   separadores[' ', ',', '.']
  while (pos <=longitud) and (caracteres[pos] in separadores)  do   begin //salte los separadores
    Inc(pos);   //pos = pos + 1
  end;
  //pos = 3 ----------------
  while (pos <=longitud) and not(caracteres[pos]  in separadores)  do   begin//concatene la palabra
    palabra := palabra + caracteres[pos];//palabra ="" --> palabra="hola"
    Inc(pos);   //pos = pos + 1
  end;
  result:= palabra;
end;

procedure Cadena.setLongitud(x: Word);
begin
  longitud := x;
end;

//----------------------------------------------
procedure Cadena.ModificarString(s: string);
var
  I: Integer;
begin
   longitud := length(s);
   for I := 1 to longitud do
       caracteres[i]:= s [i];
end;

procedure Cadena.mostrarNumeros;
var i : Byte;
    n:Integer;
begin
  i := 1;
  while i<= longitud do begin
    n := sacarNumero(i);
    ShowMessage(IntToStr(n));

  end;
end;

function Cadena.ToStr: string;
var s:string;   i:word;
begin
s:='';
for I := 1 to longitud do
     s:=s+caracteres[i];
  result:=s;

end;

//-----------------------------------------------

function Cadena.CantidadConsonantes: word;
var i,cont:word;
begin
cont:=0;
   for I := 1 to longitud do
    begin
    if ((caracteres[i] in ['b'..'z']) and not (caracteres[i] in ['e','i','o','u']))
         OR (caracteres[i] in ['B'..'Z']) and not (caracteres[i] in ['E','I','O','U'])  then
       inc(cont);
    end;
 result:=cont;
end;

procedure Cadena.InvertirCadena;
var i,r:word;
begin
r:=longitud;
   for i := 1 to (longitud div 2) do
      begin
        intercambiar(i,r);
        dec(r);
      end;
end;

procedure Cadena.Intercambiar(a, b: word);
var aux:char;
begin
  aux:=caracteres[a];
  caracteres[a]:=caracteres[b];
  caracteres[b]:=aux;
end;

                        //'10-01-2009' : 20090110
function Cadena.intFecha(x: string): Cardinal;
const numero=[0..9];
var n,i: Byte;
      r, resultado:string;
begin
  n := Length(x);
  resultado := '';
  for I := 1 to n do begin
    if x[i]<>'-' then begin
      r := r +x[i]   //r =10
    end else begin
      resultado := r + resultado;
      r:=''
    end;
  end;
  result := StrToInt(r+resultado);
end;

procedure Cadena.UpperCase;
var
  I: Integer;  //A may?sculas
begin
 for I := 1 to longitud do
   begin
     if caracteres[i] in ['a'..'z'] then
     begin
        caracteres[i]:=  chr(ord(caracteres[i])-32);
     end;

     case caracteres[i] of
          '?':caracteres[i]:='?';
          '?':caracteres[i]:='?';
          '?':caracteres[i]:='?';
          '?':caracteres[i]:='?';
          '?':caracteres[i]:='?';
          '?':caracteres[i]:='?';
     end;

      end;
end;


procedure cadena.LowerCase;    //a minusculas
var
    i:word;
begin
    for I := 1 to longitud do
    begin
     if caracteres[i] in ['A'..'Z'] then
       begin
         caracteres[i]:= chr(ord(caracteres[i])+32)       //(chr(ord(caracteres[i]))+32);
       end;
       //if caracteres[i] = '?' then caracteres[i]:= '?';
       case caracteres[i] of
         '?':caracteres[i]:='?';
         '?':caracteres[i]:='?';
         '?':caracteres[i]:='?';
         '?':caracteres[i]:='?';
         '?':caracteres[i]:='?';
         '?':caracteres[i]:='?';
         end;
    end;
end;

function Cadena.CantidadPalabras: byte;
var
  I: Integer; contador:byte;
begin
 i:=1;
 contador:=0;
while i<=longitud do
  begin
     if not (caracteres[i] in Separadores) and
     (caracteres[i+1] in Separadores) then begin
         inc(Contador);
     end;
     inc(i);
  end;
  if not (caracteres[i] in Separadores) then
    inc(contador);

result:=contador;
end;

procedure Cadena.adicionarPalabra(x: String);
var i,l : Word;
begin
  for I := 1 to Length(x) do
    AdicionarCaracter(x[i]);
end;

Function Cadena.BuscarPalabra(pal: string): word;
var i: Byte;
    pos:Word;
    palabra : string;
begin
  i := 1;
  palabra := '';
  pos := 0;
  while(i <= longitud)do begin
    palabra := sacarPalabra(i); //i=1; palabra=''
                              //i = 8    palabra = 'hola';
    if palabra = pal then   begin
       pos := i - Length(palabra);
       i := longitud + 1;
    end;
  end;
  result := pos;
end;

procedure Cadena.EliminarPalabra2(c: string);
begin
   //hola
end;

function Cadena.fechaMenor: string;
var i:Byte;
    fecha, fecha2:string;
begin
  fecha := sacarPalabra(i);//'10-01-2009'
  //ShowMessage(IntToStr(intFecha(fecha)));
  while i <= longitud do begin
    fecha2 := sacarPalabra(i);//'05-12-2017'
    //ShowMessage(IntToStr(intFecha(fecha2)));
    //   20171205       <     20090110
    if (intFecha(fecha2) < intFecha(fecha)) then
      fecha := fecha2;
  end;
  result:= fecha;
end;

function Cadena.getCaracter(pos: byte): char;
begin
  if (pos > 0) and (pos <= longitud) then  //validar posicion
    result := caracteres[pos];

end;

function Cadena.getLongitud: Word;
begin
 Result := longitud;
end;

//"2x + 3x - 6x"... x = 3
// "2*3 + 3*3 - 6*3"
end.
