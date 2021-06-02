unit Score;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;
type
  TForm2 = class(TForm)
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    procedure Label2DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  end;
var
  Form2: TForm2;
  ad:string[21];
  i,ara,top:byte;
implementation
uses Snakep;
{$R *.DFM}
procedure TForm2.Label2DblClick(Sender: TObject);
begin
top:=listbox1.Items.Count;
if top>0 then begin
        ara:=0;
        while(ara<top)and(puan<=strtoint(trim(copy(listbox1.Items[ara],17,5)))) do inc(ara);
        if ara<10 then begin
           ad:=copy(inputbox('HIGH','Please write your name:',trim(copy(ad,1,15))),1,15);
           if ad<>''then begin
           ad:=ad+stringofchar(' ',16-length(ad))+inttostr(puan);
           listbox1.Items.Add('');
           for i:=top-1 downto ara do listbox1.items.Move(i,i+1);
           if listbox1.items.Count>10 then listbox1.items.Delete(10);
           listbox1.items[ara]:=ad;
           listbox1.itemindex:=ara;
           listbox1.Items.SaveToFile('Score.cfg');
           form2.Showmodal;
           end;
        end;
end else begin
ad:=copy(inputbox('HIGH','Please write your name:',trim(copy(ad,1,15))),1,15);
if ad<>''then begin
ad:=ad+stringofchar(' ',16-length(ad))+inttostr(puan);
listbox1.items.add(ad);
listbox1.itemindex:=0;
listbox1.Items.SaveToFile('Score.cfg');
form2.Showmodal;
end;
end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
if application.MessageBox('Are you sure you want to delete the leaderboard??',
   'CONFIRM',mb_yesno+mb_iconquestion+mb_defbutton2)=idyes then begin
listbox1.Items.Clear;
listbox1.Items.SaveToFile('Score.cfg');
end;
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=27 then close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
if fileexists('Score.cfg')then listbox1.Items.LoadFromFile('Score.cfg');
end;

end.
