unit UCCadena;

interface
 uses sysutils;
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
       function LongCadena(c:string):word;
       procedure AdicionarCaracter (c:char);
       procedure InsertarCaracter (p:byte;c:char);
       Procedure EliminarCaracter (p:byte);
   //    Procedure EliminarCaracter2 (c:char);
       procedure ModificarCaracter(p:byte;c:char);
       function ObtenerCaracter (p:word):char;
//--------------------------------------------------------------
       procedure ModificarString(s: string);
       function ToStr : string;
//--------------------------------------------------------------

//--------------------------------------------------------------
       function CantidadConsonantes:word;
       procedure InvertirCadena;
       procedure Intercambiar(a,b:word);
       procedure UpperCase;
       Procedure LowerCase;
       Function CantidadPalabras:byte;
       function BuscarPalabra(pal:string):word;
       procedure sacarPalabra(var pos:byte; var palabra :String );
      { Procedure PalabraN;
       procedure EliminarPalabra (p:byte); no es muy pr�ctico usar este }
       procedure EliminarPalabra2 (c:string);
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
 end else raise Exception.Create('Posici�n fuera de rango');
end;

procedure Cadena.EliminarCaracter(p: byte);
var i:byte;
begin
 if (p>0) and (p<=Longitud) then
    begin
    for i := p to longitud-1 do
         caracteres[i]:=caracteres[i+1];
     longitud:=longitud-1;
 end else raise Exception.Create('Posici�n fuera de rango');

end;

procedure Cadena.ModificarCaracter(p: byte; c: char);
begin
if (p>0) and (p<=longitud) then  begin
caracteres[p]:=c;
end else raise Exception.Create('Posici�n fuera de Rango')
end;


function Cadena.ObtenerCaracter(p: word): char;
begin
if (p>0) and (p<=longitud) then
  result:= caracteres[p];
  raise Exception.Create('Posici�n fuera de rango');
end;
//----------------------------------------------
//caracteres[ ,h,o,l,a, ,c,o,m,o]   pos =1   palabra=""
//pos = 7     palabra = "hola"
//sacarPalabra(var i,var  pal);  //i = 1;    pal=""
//i= 7     pal ="hola"

procedure Cadena.sacarPalabra(var pos: byte; var palabra: String);
var i : Byte;
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

procedure Cadena.UpperCase;
var
  I: Integer;  //A may�sculas
begin
 for I := 1 to longitud do
   begin
     if caracteres[i] in ['a'..'z'] then
     begin
        caracteres[i]:=  chr(ord(caracteres[i])-32);
     end;

     case caracteres[i] of
          '�':caracteres[i]:='�';
          '�':caracteres[i]:='�';
          '�':caracteres[i]:='�';
          '�':caracteres[i]:='�';
          '�':caracteres[i]:='�';
          '�':caracteres[i]:='�';
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
       //if caracteres[i] = '�' then caracteres[i]:= '�';
       case caracteres[i] of
         '�':caracteres[i]:='�';
         '�':caracteres[i]:='�';
         '�':caracteres[i]:='�';
         '�':caracteres[i]:='�';
         '�':caracteres[i]:='�';
         '�':caracteres[i]:='�';
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

Function Cadena.BuscarPalabra(pal: string): word;
var i: Byte;
    res:Word;
    palabra : string;
begin
  i := 1;
  palabra := '';
  res := 0;
  while(i <= longitud)do begin
    sacarPalabra(i, palabra); //i=1; palabra=''
                              //i = 8    palabra = 'hola';
    if palabra = pal then   begin
       res := i - Length(palabra);
       i := longitud + 1;
    end;
  end;
  result := res;
end;

procedure Cadena.EliminarPalabra2(c: string);
begin
   //hola
end;
//"2x + 3x - 6x"... x = 3
// "2*3 + 3*3 - 6*3"
end.
