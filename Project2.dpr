program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'RunPe_By Onexite';
  //TStyleManager.TrySetStyle('Slate Classico');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
