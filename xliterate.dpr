program xliterate;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  about in 'about.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Xliterate 1.0';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
