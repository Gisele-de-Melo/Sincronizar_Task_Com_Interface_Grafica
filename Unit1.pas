//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit Unit1;

interface

uses
  System.Classes, System.SysUtils, System.Threading, Vcl.Forms, Vcl.StdCtrls, Vcl.Controls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    procedure LoadData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  LoadData;
end;

procedure TForm1.LoadData;
begin
  // Iniciar a tarefa em segundo plano
  TTask.Run(
    procedure
    var
      I: Integer;
    begin
      for I := 1 to 100 do
      begin
        Sleep(50); // Simula uma operação demorada
        // Atualiza a UI
        TThread.Synchronize(nil,
          procedure
          begin
            Label1.Caption := 'Progresso: ' + I.ToString + '%';
          end);
      end;
    end);
end;

end.
