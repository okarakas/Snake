unit wall;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;
type
  TForm3 = class(TForm)
    procedure FormActivate(Sender: TObject);
  end;
var
  Form3: TForm3;
implementation
uses Snakep;
{$R *.DFM}

procedure TForm3.FormActivate(Sender: TObject);
begin
if form1.CanFocus then form1.SetFocus;
end;

end.
