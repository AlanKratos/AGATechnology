unit unitValidaCnpjCpf;

interface

function ValidaCPF(pNumeroCPF: string): boolean;
function ValidaCNPJ(pNumeroCNPJ:string): Boolean;

implementation


uses SysUtils;

function ValidaCpf(pNumeroCPF: string): Boolean;
{Testa se o CPF é válido ou não}
Var
d1,d4,xx,nCount,resto,digito1,digito2 : Integer;
Check : String;
Begin
//Deleta a mascara do CPF
  Delete(pNumeroCPF, AnsiPos('.', pNumeroCPF), 1);
  Delete(pNumeroCPF, AnsiPos('.', pNumeroCPF), 1);
  Delete(pNumeroCPF, AnsiPos('/', pNumeroCPF), 1);
  Delete(pNumeroCPF, AnsiPos('-', pNumeroCPF), 1);
if ((pNumeroCPF = '00000000000') or (pNumeroCPF = '11111111111') or
(pNumeroCPF = '22222222222') or (pNumeroCPF = '33333333333') or
(pNumeroCPF = '44444444444') or (pNumeroCPF = '55555555555') or
(pNumeroCPF = '66666666666') or (pNumeroCPF = '77777777777') or
(pNumeroCPF = '88888888888') or (pNumeroCPF = '99999999999') or
(pNumeroCPF = '') or (Length(pNumeroCPF) <> 11)) then
  begin
    ValidaCPF := False;
    Exit;
  end;

if pNumeroCPF = '           ' then
begin
  ValidaCPF := True;
  Exit;
end;
d1 := 0; d4 := 0; xx := 1;
for nCount := 1 to Length( pNumeroCPF )-2 do
    begin
    if Pos( Copy( pNumeroCPF, nCount, 1 ), '/-.' ) = 0 then
       begin
       d1 := d1 + ( 11 - xx ) * StrToInt( Copy( pNumeroCPF, nCount, 1 ) );
       d4 := d4 + ( 12 - xx ) * StrToInt( Copy( pNumeroCPF, nCount, 1 ) );
       xx := xx+1;
       end;
    end;
resto := (d1 mod 11);
if resto < 2 then
   begin
   digito1 := 0;
   end
else
   begin
   digito1 := 11 - resto;
   end;
d4 := d4 + 2 * digito1;
resto := (d4 mod 11);
if resto < 2 then
   begin
   digito2 := 0;
   end
else
   begin
   digito2 := 11 - resto;
   end;
Check := IntToStr(Digito1) + IntToStr(Digito2);
if Check <> copy(pNumeroCPF,succ(length(pNumeroCPF)-2),2) then
   begin
   Result := False;
   end
else
   begin
   Result := True;
   end
end;


Function ValidaCNPJ(pNumeroCNPJ: string): boolean;
var
  cnpj: string;
  dg1, dg2: integer;
  x, total: integer;
  ret: boolean;
begin
//Deleta a mascara do CNPJ
  Delete(pNumeroCNPJ, AnsiPos('.', pNumeroCNPJ), 1);
  Delete(pNumeroCNPJ, AnsiPos('.', pNumeroCNPJ), 1);
  Delete(pNumeroCNPJ, AnsiPos('/', pNumeroCNPJ), 1);
  Delete(pNumeroCNPJ, AnsiPos('-', pNumeroCNPJ), 1);
if pNumeroCNPJ = '00000000000000' then
begin
  ValidaCNPJ := False;
  Exit;
end
else if pNumeroCNPJ = '              ' then
begin
  ValidaCNPJ := True;
  Exit;
end

else
ret:=False;
cnpj:='';
//Analisa os formatos
if Length(pNumeroCNPJ) = 18 then
  if (Copy(pNumeroCNPJ,3,1) + Copy(pNumeroCNPJ,7,1) + Copy(pNumeroCNPJ,11,1) +
    Copy(pNumeroCNPJ,16,1) = '../-') then
    begin
      cnpj:=Copy(pNumeroCNPJ,1,2) + Copy(pNumeroCNPJ,4,3) + Copy(pNumeroCNPJ,8,3) +
        Copy(pNumeroCNPJ,12,4) + Copy(pNumeroCNPJ,17,2);
      ret:=True;
    end;
  if Length(pNumeroCNPJ) = 14 then
    begin
      cnpj := pNumeroCNPJ;
      ret:=True;
    end;
  if ret then
    begin
      try
      //1° digito
        total:=0;
        for x := 1 to 12 do
        begin
          if x < 5 then
            Inc(total, StrToInt(Copy(cnpj, x, 1)) * (6 - x))
          else
            Inc(total, StrToInt(Copy(cnpj, x, 1)) * (14 - x));
        end;
      dg1:=11 - (total mod 11);
      if dg1 > 9 then
        dg1:=0;
      //2° digito
      total:=0;
        for x:=1 to 13 do
        begin
          if x < 6 then
            Inc(total, StrToInt(Copy(cnpj, x, 1)) * (7 - x))
           else
             Inc(total, StrToInt(Copy(cnpj, x, 1)) * (15 - x));
        end;
          dg2:=11 - (total mod 11);
        if dg2 > 9 then
          dg2:=0;
        //Validação final
        if (dg1 = StrToInt(Copy(cnpj, 13, 1))) and (dg2 = StrToInt(Copy(cnpj, 14, 1))) then
          ret:=True
        else
          ret:=False;
    except
      ret:=False;
    end;
    //Inválidos
  end;
  ValidaCNPJ:=ret;
end;


end.

