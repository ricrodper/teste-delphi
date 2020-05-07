unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uClasses;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Funcionario: TFuncionario;
  Dependente: TDependente;
  DAO: TFuncionarioDAO;
begin
  DAO := TFuncionarioDAO.Create;
  try
    // cria o funcion�rio Ricardo com 1 dependente
    Funcionario := TFuncionario.Create;
    try
      Funcionario.Nome := 'Ricardo';
      Funcionario.CPF := '0123456789';
      Funcionario.Salario := 15000;

      // cria o dependente do Ricardo
      Dependente := TDependente.Create;
      Dependente.Nome := 'Dependente do Ricardo';
      Dependente.IsCalculaIR := False;
      Dependente.IsCalculaINSS := True;

      // adiciona o dependente na lista
      Funcionario.Dependentes.Add(Dependente);

      // salva no banco de dados
      // nesse momento, ele vai salvar os dependentes tamb�m (veja a uClasses)
      DAO.SalvarFuncionario(Funcionario);
    finally
      FreeAndNil(Funcionario);
    end;



  { ******************************************************** }



    // cria o funcion�rio Jo�o com 1 dependente
    Funcionario := TFuncionario.Create;
    try
      Funcionario.Nome := 'Jo�o';
      Funcionario.CPF := '0123456789';
      Funcionario.Salario := 15000;

      // cria o dependente do Andr�
      Dependente := TDependente.Create;
      Dependente.Nome := 'Dependente do Jo�o';
      Dependente.IsCalculaIR := False;
      Dependente.IsCalculaINSS := True;

      // adiciona o dependente na lista
      Funcionario.Dependentes.Add(Dependente);

      // salva no banco de dados
      // nesse momento, ele vai salvar os dependentes tamb�m (veja a uClasses)
      DAO.SalvarFuncionario(Funcionario);
    finally
      FreeAndNil(Funcionario);
    end;

  finally
    DAO.Free;
  end;
end;

end.
