program Project1;

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
  Writeln('|  [ 1 ]      Alunos            |');
  Writeln('|  [ 2 ]   Professores          |');
  Writeln('|  [ 3 ]     Matérias           |');
  Writeln('|  [ 4 ]       Sair             |');
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
  Writeln('|  [ 1 ]     Add Alunos         |');
  Writeln('|  [ 2 ]   Lista De Alunos      |');
  Writeln('|  [ 3 ]       Notas            |');
  Writeln('|  [ 4 ]      Voltar            |');
  Writeln('|_______________________________|');
  WriteLn('Digite a opção que você deseja acessar: ');
end;

//menu adicionar alunos\\
procedure MenuAddAlunos;
var
  nome, cpf: string;
  dataNascimento: TDate;
begin
  Writeln(' _______________________________ ');
  Writeln('|                               |');
  Writeln('|      Adicionar Um Aluno       |');
  Writeln('|_______________________________|');
  WriteLn('Digite o Nome Completo do Aluno: ');
  ReadLn(nome);
  if Length(nome) >= 10 then
  begin
    Write('Digite a Data de Nascimento do Aluno: ');
    ReadLn(dataNascimento);
  end else begin
    Writeln('O nome deve conter no mínimo 10 caracteres');
    ReadLn;
  end;

  Write('Digite o CPF do Aluno: ');
  ReadLn(cpf);
  if Length(cpf) = 11 then begin
    Writeln('Aluno Adicionado com sucesso');
    ReadLn;
  end else begin
    Writeln('O CPF deve conter 11 caracteres');
    ReadLn;
  end;
end;

//menu professores\\
procedure MenuProfessores;
begin
  Writeln(' _______________________________ ');
  Writeln('|                               |');
  Writeln('|        MENU PROFESSORES       |');
  Writeln('|_______________________________|');
  WriteLn('|                               |');
  Writeln('|  [ 1 ]    Add Professor       |');
  Writeln('|  [ 2 ]  Lista De Professores  |');
  Writeln('|  [ 3 ]      Voltar            |');
  Writeln('|_______________________________|');
  WriteLn('Digite a opção que você deseja acessar: ');
end;

//menu adicionar professores\\
procedure MenuAddProf;
var
  nome, cpf: string;
  dataNascimento: TDate;
begin
  Writeln(' _______________________________ ');
  Writeln('|                               |');
  Writeln('|    Adicionar Um Professor     |');
  Writeln('|_______________________________|');
  WriteLn('Digite o Nome Completo do Professor: ');
  ReadLn(nome);
  if Length(nome) >= 10 then
  begin
    WriteLn('Digite a Data de Nascimento do Professor: ');
    ReadLn(dataNascimento);
  end else begin
    Writeln('O nome deve conter no mínimo 10 caracteres');
    ReadLn;
  end;

  Write('Digite o CPF do Professor: ');
  ReadLn(cpf);
  if Length(cpf) = 11 then begin
   WriteLn('Digite a matéria do Professor: ');
   ReadLn;
  end else begin
   Writeln('O CPF deve conter 11 caracteres');
   ReadLn;
  end;
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
