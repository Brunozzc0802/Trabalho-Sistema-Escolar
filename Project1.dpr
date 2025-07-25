﻿program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Windows;

var
  opcaoDoUsuario, opcaoMenuAlunos, opcaoMenuProf: string;

procedure LimparTela;
begin
  WinExec('cmd /c cls', SW_HIDE);
end;

//menu inicial\\
procedure MenuInicial;
begin
  LimparTela;
  Sleep(100);
  Writeln(' _______________________________ ');
  Writeln('|          Bem - Vindo          |');
  Writeln('|         MENU PRINCIPAL        |');
  Writeln('|_______________________________|');
  WriteLn('|                               |');
  Writeln('|  [ 1 ]  Alunos                |');
  Writeln('|  [ 2 ]  Professores           |');
  Writeln('|  [ 3 ]  Turmas                |');
  Writeln('|  [ 4 ]  Sair                  |');
  Writeln('|_______________________________|');
  WriteLn('Digite a opção que você deseja acessar: ');
end;

//menu alunos\\
procedure MenuAlunos;
begin
  Writeln(' _______________________________ ');
  Writeln('|                               |');
  Writeln('|          MENU ALUNOS          |');
  Writeln('|_______________________________|');
  WriteLn('|                               |');
  Writeln('|  [ 1 ]  Add Alunos            |');
  Writeln('|  [ 2 ]  Lista De Alunos       |');
  Writeln('|  [ 3 ]  Notas                 |');
  Writeln('|  [ 4 ]  Voltar                |');
  Writeln('|_______________________________|');
  WriteLn('Digite a opção que você deseja acessar: ');
end;


//menu professores\\
procedure MenuProfessores;
begin
  Writeln(' _______________________________ ');
  Writeln('|                               |');
  Writeln('|        MENU PROFESSORES       |');
  Writeln('|_______________________________|');
  WriteLn('|                               |');
  Writeln('|  [ 1 ]  Add Professor         |');
  Writeln('|  [ 2 ]  Lista De Professores  |');
  Writeln('|  [ 3 ]  Voltar                |');
  Writeln('|_______________________________|');
  WriteLn('Digite a opção que você deseja acessar: ');
end;

//função validar nome\\

function ValidarNome(const nome: string): Boolean;
begin
  Result := Length(nome) >= 10;
  if not Result then
    Writeln('O nome deve conter no mínimo 10 caracteres');
end;

//função validar data\\
function ValidarData(const dataStr: string; out data: TDate): Boolean;
var
  dia, mes, ano: Integer;
begin
  Result := False;

  if Length(dataStr) <> 8 then
  begin
    Writeln('Data deve conter exatamente 8 dígitos (DDMMAAAA)');
    Exit;
  end;

  try
    dia := StrToInt(Copy(dataStr, 1, 2));
    mes := StrToInt(Copy(dataStr, 3, 2));
    ano := StrToInt(Copy(dataStr, 5, 4));

    if (dia < 1) or (dia > 31) then
      Writeln('Dia inválido! Deve estar entre 1 e 31')
    else if (mes < 1) or (mes > 12) then
      Writeln('Mês inválido! Deve estar entre 1 e 12')
    else if (ano < 1900) or (ano > 2025) then
      Writeln('Ano inválido! Deve estar entre 1900 e 2025')
    else
    begin
      data := EncodeDate(ano, mes, dia);
      Result := True;
    end;
  except
    on E: Exception do
      Writeln('Formato inválido! Use o formato DDMMAAAA');
  end;
end;

//função validar cpf\\
function ValidarCPF(const cpf: string): Boolean;
begin
  Result := Length(cpf) = 11;
  if not Result then
    Writeln('O CPF deve conter exatamente 11 caracteres');
end;

//menu adicionar alunos
procedure MenuAddAlunos;
var
  nome, cpf, dataStr: string;
  dataNascimento: TDate;
begin
  Writeln(' _______________________________ ');
  Writeln('|                               |');
  Writeln('|      Adicionar Um Aluno       |');
  Writeln('|_______________________________|');

  repeat
    WriteLn('Digite o Nome Completo do Aluno: ');
    ReadLn(nome);
  until ValidarNome(nome);

  repeat
    WriteLn('Digite a Data de Nascimento do Aluno: ');
    ReadLn(dataStr);
  until ValidarData(dataStr, dataNascimento);

  repeat
    WriteLn('Digite o CPF do Aluno: ');
    ReadLn(cpf);
  until ValidarCPF(cpf);

  Writeln('Aluno Adicionado com sucesso!');
  ReadLn;
end;

//menu adicionar prof
procedure MenuAddProf;
var
  nome, cpf, materia, dataStr: string;
  dataNascimento: TDate;
begin
  Writeln(' _______________________________ ');
  Writeln('|                               |');
  Writeln('|    Adicionar Um Professor     |');
  Writeln('|_______________________________|');

  repeat
    WriteLn('Digite o Nome Completo do Professor: ');
    ReadLn(nome);
  until ValidarNome(nome);

  repeat
    WriteLn('Digite a Data de Nascimento do Professor: ');
    ReadLn(dataStr);
  until ValidarData(dataStr, dataNascimento);

  repeat
    WriteLn('Digite o CPF do Professor: ');
    ReadLn(cpf);
  until ValidarCPF(cpf);

  WriteLn('Digite a Matéria do Professor: ');
  ReadLn(materia);

  Writeln('Professor Adicionado com sucesso!');
  ReadLn;
end;

begin
  try
    repeat
      MenuInicial;
      ReadLn(opcaoDoUsuario);

      if (opcaoDoUsuario = '2') then begin
        repeat
          LimparTela;
          sleep(100);
          MenuProfessores;
          ReadLn(opcaoMenuProf);

          if (opcaoMenuProf = '1') then begin
            LimparTela;
            sleep(100);
            MenuAddProf;
          end;
        until (opcaoMenuProf = '3');
      end;


      if (opcaoDoUsuario = '1') then begin
        repeat
          LimparTela;
          sleep(100);
          MenuAlunos;
          ReadLn(opcaoMenuAlunos);

          if (opcaoMenuAlunos = '1') then begin
            LimparTela;
            sleep(100);
            MenuAddAlunos;
          end;
        until (opcaoMenuAlunos = '4');
      end;

    until (opcaoDoUsuario = '4');

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.


//Por enquanto oque fizemos?
//Criamos o menu inicial
//Criamos o menu de alunos
//Criamos o Adicionar Alunos
//fizemos a função de voltar para o menu principal
//fizemos o menu de professores e de adicionar professor
