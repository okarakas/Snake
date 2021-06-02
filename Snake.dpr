program Snake;

uses
  Forms,
  Snakep in 'Snakep.pas' {Form1},
  Score in 'Score.pas' {Form2},
  wall in 'wall.pas' {Form3};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  form3.Show;
  Application.CreateForm(TForm2, Form2);

  
  Application.Run;
end.
