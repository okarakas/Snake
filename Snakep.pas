unit Snakep;
interface
uses
  Windows, SysUtils, Classes, Controls, Forms,
  StdCtrls, Buttons, ComCtrls, Menus,jpeg,
  MPlayer, ExtDlgs, ExtCtrls, Dialogs;
type
  TForm1 = class(TForm)
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Game1: TMenuItem;
    New1: TMenuItem;
    Pause1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    Level1: TMenuItem;
    VeryEasy: TMenuItem;
    Easy: TMenuItem;
    Medium: TMenuItem;
    Hard: TMenuItem;
    VeryHard: TMenuItem;
    Timer2: TTimer;
    Panel2: TPanel;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    Settings1: TMenuItem;
    BackC1: TMenuItem;
    CapC1: TMenuItem;
    BackI1: TMenuItem;
    ColorDialog1: TColorDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    Select1: TMenuItem;
    Delete1: TMenuItem;
    Label4: TLabel;
    Label5: TLabel;
    Tane: TSpeedButton;
    Bas: TSpeedButton;
    Default1: TMenuItem;
    Image2: TImage;
    Score1: TMenuItem;
    Help2: TMenuItem;
    Mp: TMediaPlayer;
    Timer3: TTimer;
    Auto2: TMenuItem;
    Timer22: TTimer;
    Bas2: TSpeedButton;
    Tane2: TSpeedButton;
    Label42: TLabel;
    Label22: TLabel;
    N3: TMenuItem;
    One: TMenuItem;
    Two: TMenuItem;
    N5: TMenuItem;
    Control1: TMenuItem;
    Mouse1: TMenuItem;
    Keyboard1: TMenuItem;
    Auto1: TMenuItem;
    Panel3: TPanel;
    ProgressBar2: TProgressBar;
    Yem: TSpeedButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure New1Click(Sender: TObject);
    procedure Pause1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure YemClick(Sender: TObject);
    procedure VeryEasyClick(Sender: TObject);
    procedure EasyClick(Sender: TObject);
    procedure MediumClick(Sender: TObject);
    procedure HardClick(Sender: TObject);
    procedure VeryHardClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BackC1Click(Sender: TObject);
    procedure CapC1Click(Sender: TObject);
    procedure Select1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Default1Click(Sender: TObject);
    procedure Score1Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure AppDeactivate(Sender: TObject);
    procedure Auto2Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MainMenu1Change(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure hareket2;
    procedure Timer22Timer(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OneClick(Sender: TObject);
    procedure TwoClick(Sender: TObject);
    procedure yeni;
    procedure yeni2;
    procedure Mouse1Click(Sender: TObject);
    procedure Keyboard1Click(Sender: TObject);
    procedure Auto1Click(Sender: TObject);
  end;
var
  Form1: TForm1;
  Buton,buton2:array of tspeedbutton;
  i,kont,uzn,uzn2,son,son2,sonleft,sontop,sonleft2,sontop2,puan,puan2:integer;
  yon:byte=4;
  yon2:byte=4;
  xx,yy,xx2,yy2:shortint;
  carpti:boolean;
  birim:byte;
  carpis,carpis2:byte;

implementation
uses Score, wall;
{$R *.DFM}


procedure TForm1.yeni;
begin
panel3.show;
for i:=0 to uzn-1 do buton[i].Destroy;
uzn:=5;
son:=uzn-1;
puan:=0;
yon:=4;
label2.Caption:='0';
label4.Caption:=label2.Caption;

for i:=0 to 100 do begin
    progressbar2.Position:=i;
    application.ProcessMessages;
    sleep(10);
end;    
setlength(buton,uzn);
for i:=0 to uzn-1 do begin
buton[i]:=tspeedbutton.Create(form1);
buton[i].Left:=240-(i*20);
buton[i].top:=400;
buton[i].width:=20;
buton[i].height:=20;
buton[i].Parent:=form1;
buton[i].Glyph:=tane.Glyph;
buton[i].Flat:=true;
end;
buton[0].Glyph:=bas.Glyph;
sonleft:=160;
sontop:=400;
timer2.tag:=0;
panel3.hide;
if Pause1.Checked=false then Pause1click(Pause1);
end;

procedure TForm1.yeni2;
begin
for i:=0 to uzn2-1 do buton2[i].Destroy;
uzn2:=5;
son2:=uzn2-1;
puan2:=0;
yon2:=4;
label22.Caption:='0';
label42.Caption:='0';

setlength(buton2,uzn2);
for i:=0 to uzn2-1 do begin
buton2[i]:=tspeedbutton.Create(form1);
buton2[i].Left:=240-(i*20);
buton2[i].top:=80;
buton2[i].width:=20;
buton2[i].height:=20;
buton2[i].Parent:=form1;
buton2[i].Glyph:=tane2.Glyph;
buton2[i].Flat:=true;
end;
buton2[0].Glyph:=bas2.Glyph;
sonleft2:=160;
sontop2:=80;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
show;
update;
application.OnDeactivate:=appdeactivate;
Cursor:=crnone;
randomize;
birim:=5;
Progressbar1.Show;
panel3.Hide;
label5.Caption:='Paused';
yeni;
image1.Hide;
yem.Show;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Keyboard1.Checked then
case key of
37:if buton[0].left=buton[(son mod (uzn-1))+1].left then yon:=2;
38:if buton[0].top=buton[(son mod (uzn-1))+1].top then yon:=1;
39:if buton[0].left=buton[(son mod (uzn-1))+1].left then yon:=4;
40:if buton[0].top=buton[(son mod (uzn-1))+1].top then yon:=3;
end;
case key of
27:if Pause1.Tag=0 then begin
      Pause1.Tag:=1;
      Pause1.Click;
   end;
107:for i:=1 to 10 do begin
    setlength(buton,uzn+1);
    buton[uzn]:=tspeedbutton.Create(form1);
    buton[uzn].left:=buton[son].Left-20;
    buton[uzn].top:=buton[son].top;
    buton[uzn].width:=20;
    buton[uzn].height:=20;
    buton[uzn].Glyph:=tane.Glyph;
    buton[uzn].Flat:=true;
    buton[uzn].Parent:=form1;
    uzn:=uzn+1;
    end;
else case key of
     105,33:if yon in[2,4]then yon:=1 else yon:=4;
     97,35 :if yon in[2,4]then yon:=3 else yon:=2;
     end;
end;
if Two.Checked then begin
case key of
68:if buton2[0].left=buton2[(son2 mod (uzn2-1))+1].left then yon2:=2;
82:if buton2[0].top=buton2[(son2 mod (uzn2-1))+1].top then yon2:=1;
71:if buton2[0].left=buton2[(son2 mod (uzn2-1))+1].left then yon2:=4;
70:if buton2[0].top=buton2[(son2 mod (uzn2-1))+1].top then yon2:=3;
end;
end;

if (Pause1.Checked)and(key in[37,38,39,40,68,82,70,71,105,33,97,35]) then Pause1click(sender);
end;

procedure TForm1.hareket2;
begin
case yon2 of
1:begin xx2:=0; yy2:=-20; end;
2:begin xx2:=-20; yy2:=0; end;
3:begin xx2:=0; yy2:=20; end;
4:begin xx2:=20; yy2:=0; end;
end;

carpti:=false;
for i:=1 to uzn2-1 do
    if (buton2[0].left+xx2=buton2[i].left)and(buton2[0].top+yy2=buton2[i].top)then begin
       carpti:=true;
       break;
       end;
if (buton2[0].left+xx2<0)or(buton2[0].left+xx2>480)or
   (buton2[0].top+yy2<20)or(buton2[0].top+yy2>460)or carpti
   then begin

if Auto2.Checked then begin
if carpis2>10 then begin
      timer1.Enabled:=false;
      beep;
      if puan2-birim*5<0 then puan2:=0
                         else puan2:=puan2-birim*5;
         label22.Caption:=inttostr(puan2);
         label42.Caption:=label22.Caption;
         showmessage('Blue Snake Struck.'+#10+#10+'Points:'+#10+'Blue   = '+inttostr(puan)+#10+'Red = '+inttostr(puan2));

      New1.click;
      yem.Click;
      exit;
end else inc(carpis2);


if yon2 in[1,3]then begin
   if yem.left=buton2[0].left then yon2:=random(2)*2+2
      else begin
           if yem.left>buton2[0].left then yon2:=4
                                      else yon2:=2;

           yy2:=0;
           if yon2=2 then xx2:=-20 else xx2:=20;
           carpti:=false;
           for i:=1 to uzn2-1 do
               if (buton2[0].left+xx2=buton2[i].left)and(buton2[0].top=buton2[i].top)then begin
                  carpti:=true;
                  break;
                  end;
           if (buton2[0].left+xx2<0)or(buton2[0].left+xx2>480)or carpti
              then if yon2=2 then yon2:=4 else yon2:=2;

           end;

end else
    if yem.top=buton2[0].top then yon2:=random(2)*2+1
    else begin
         if yem.top>buton2[0].top then yon2:=3
                                  else yon2:=1;

         xx2:=0;
         if yon2=1 then yy2:=-20 else yy2:=20;
         carpti:=false;
         for i:=1 to uzn2-1 do
             if (buton2[0].left=buton2[i].left)and(buton2[0].top+yy2=buton2[i].top)then begin
                carpti:=true;
                break;
                end;
         if (buton2[0].top+yy2<20)or(buton2[0].top+yy2>460)or carpti
            then if yon2=1 then yon2:=3 else yon2:=1;

         end;
exit;
end;

   if timer22.tag=1 then begin
      timer1.Enabled:=false;
      beep;
      if puan2-birim*5<0 then puan2:=0
                         else puan2:=puan2-birim*5;
      label22.Caption:=inttostr(puan2);
      label42.Caption:=label22.Caption;
      showmessage('Blue Snake Struck.'+#10+#10+'Points:'+#10+'Blue   = '+inttostr(puan)+#10+'Red = '+inttostr(puan2));
      New1.Click;
      yemclick(yem);
   end else timer22.Enabled:=true;
   exit;
end;
timer22.tag:=0;
sonleft2:=buton2[son2].left;
sontop2:=buton2[son2].top;
buton2[son2].left:=buton2[0].left;
buton2[son2].top:=buton2[0].top;
if son2=1 then son2:=uzn2-1 else son2:=son2-1;
buton2[0].Left:=buton2[0].left+xx2;
buton2[0].top:=buton2[0].top+yy2;


if (buton2[0].Left=yem.Left)and(buton2[0].top=yem.top)then begin
setlength(buton2,uzn2+1);
buton2[uzn2]:=tspeedbutton.Create(form1);
buton2[uzn2].left:=buton2[1].Left;
buton2[uzn2].top:=buton2[1].top;
buton2[uzn2].width:=20;
buton2[uzn2].height:=20;
buton2[uzn2].Glyph:=tane2.Glyph;
buton2[uzn2].Flat:=true;
buton2[uzn2].Parent:=form1;
uzn2:=uzn2+1;
beep;
for i:=1 to son2-1 do begin
    buton2[i].Left:=buton2[i+1].Left;
    buton2[i].top:=buton2[i+1].top;
end;
buton2[son2].Left:=sonLeft2;
buton2[son2].top:=sontop2;

   YemClick(yem);
   puan2:=puan2+birim;
   label22.Caption:=inttostr(puan2);
   label42.Caption:=label22.Caption;;
end;

if Auto2.Checked then begin
carpis2:=0;
if yon2 in[1,3]then begin
   if buton2[0].top=yem.top then begin
      if yem.left>buton2[0].left then yon2:=4
                                 else yon2:=2;
   end;

end else
if buton2[0].left=yem.left then begin
      if yem.top>buton2[0].top then yon2:=3
                               else yon2:=1;
   end;
end;


end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if Two.Checked then begin
   hareket2;
   if timer1.Enabled=false then exit;
end;
case yon of
1:begin xx:=0; yy:=-20; end;
2:begin xx:=-20; yy:=0; end;
3:begin xx:=0; yy:=20; end;
4:begin xx:=20; yy:=0; end;
end;

carpti:=false;
for i:=1 to uzn-1 do
    if (buton[0].left+xx=buton[i].left)and(buton[0].top+yy=buton[i].top)then begin
       carpti:=true;
       break;
       end;
if (buton[0].left+xx<0)or(buton[0].left+xx>480)or
   (buton[0].top+yy<20)or(buton[0].top+yy>460)or carpti
   then begin

if Auto1.Checked then begin
if carpis>10 then begin
      timer1.Enabled:=false;
      beep;
      if Two.Checked then begin
         if puan-birim*5<0 then puan:=0
                            else puan:=puan-birim*5;
         label2.Caption:=inttostr(puan);
         label4.Caption:=label2.Caption;
         showmessage('Red Snake Struck.'+#10+#10+'Points:'+#10+'Blue   = '+inttostr(puan)+#10+'Red = '+inttostr(puan2));
      end else showmessage('Finished'+#10+#10+'Your Points= '+inttostr(puan));
      if (puan>0)and(One.checked) then form2.label2dblclick(sender);
      New1.Click;
      yemclick(sender);
      exit;
end else inc(carpis);


if yon in[1,3]then begin
   if yem.left=buton[0].left then yon:=random(2)*2+2
      else begin
           if yem.left>buton[0].left then yon:=4
                                     else yon:=2;

           yy:=0;
           if yon=2 then xx:=-20 else xx:=20;
           carpti:=false;
           for i:=1 to uzn-1 do
               if (buton[0].left+xx=buton[i].left)and(buton[0].top=buton[i].top)then begin
                  carpti:=true;
                  break;
                  end;
           if (buton[0].left+xx<0)or(buton[0].left+xx>480)or carpti
              then if yon=2 then yon:=4 else yon:=2;

           end;

end else
    if yem.top=buton[0].top then yon:=random(2)*2+1
    else begin
         if yem.top>buton[0].top then yon:=3
                                 else yon:=1;

         xx:=0;
         if yon=1 then yy:=-20 else yy:=20;
         carpti:=false;
         for i:=1 to uzn-1 do
             if (buton[0].left=buton[i].left)and(buton[0].top+yy=buton[i].top)then begin
                carpti:=true;
                break;
                end;
         if (buton[0].top+yy<20)or(buton[0].top+yy>460)or carpti
            then if yon=1 then yon:=3 else yon:=1;

         end;
exit;
end;

   if timer2.tag=1 then begin
      timer1.Enabled:=false;
      beep;
      if One.Checked then begin
         showmessage('Game Over'+#10+#10+'Points= '+inttostr(puan));
         if puan>0 then form2.label2dblclick(sender);
      end else begin
          if puan-birim*5<0 then puan:=0
                            else puan:=puan-birim*5;
          label2.Caption:=inttostr(puan);
          label4.Caption:=label2.Caption;
          showmessage('Red Snake Struck.'+#10+#10+'Points:'+#10+'Blue   = '+inttostr(puan)+#10+'Red = '+inttostr(puan2));
      end;
      New1.Click;
      yemclick(sender);
   end else timer2.Enabled:=true;
   exit;
end;
timer2.tag:=0;
sonleft:=buton[son].left;
sontop:=buton[son].top;
buton[son].left:=buton[0].left;
buton[son].top:=buton[0].top;
if son=1 then son:=uzn-1 else son:=son-1;
buton[0].Left:=buton[0].left+xx;
buton[0].top:=buton[0].top+yy;

if (buton[0].Left=yem.Left)and(buton[0].top=yem.top)then begin
setlength(buton,uzn+1);
buton[uzn]:=tspeedbutton.Create(form1);
buton[uzn].left:=buton[1].Left;
buton[uzn].top:=buton[1].top;
buton[uzn].width:=20;
buton[uzn].height:=20;
buton[uzn].Glyph:=tane.Glyph;
buton[uzn].Flat:=true;
buton[uzn].Parent:=form1;
uzn:=uzn+1;
beep;
for i:=1 to son-1 do begin
    buton[i].Left:=buton[i+1].Left;
    buton[i].top:=buton[i+1].top;
end;
buton[son].Left:=sonLeft;
buton[son].top:=sontop;

   YemClick(Sender);
   puan:=puan+birim;
   label2.Caption:=inttostr(puan);
   label4.Caption:=label2.Caption;;
end;

if Auto1.Checked then begin
carpis:=0;
if yon in[1,3]then begin
   if buton[0].top=yem.top then begin
      if yem.left>buton[0].left then yon:=4
                                else yon:=2;
   end;

end else
if buton[0].left=yem.left then begin
      if yem.top>buton[0].top then yon:=3
                                else yon:=1;
   end;
end;

end;

procedure TForm1.New1Click(Sender: TObject);
begin
yeni;
if Two.Checked then yeni2;
end;

procedure TForm1.Pause1Click(Sender: TObject);
begin
Pause1.Checked:=not Pause1.Checked;
if Pause1.Checked then begin
   timer1.Enabled:=false;
   progressbar1.Hide;
   end else begin
   timer1.Enabled:=true;
   progressbar1.show;
   end;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.YemClick(Sender: TObject);
begin
repeat
yem.Left:=20+random(24)*20;
yem.top:=20+random(23)*20;
carpti:=true;
for i:=0 to uzn-1 do
    if (yem.left=buton[i].left)and(yem.top=buton[i].top)then begin
       carpti:=false;
       continue;
       end;
until carpti;
end;

procedure TForm1.VeryEasyClick(Sender: TObject);
begin
timer1.Interval:=1000;
progressbar1.Position:=1;
birim:=1;
VeryEasy.Checked:=true;
end;

procedure TForm1.EasyClick(Sender: TObject);
begin
timer1.Interval:=400;
progressbar1.Position:=2;
birim:=3;
Easy.Checked:=true;
end;

procedure TForm1.MediumClick(Sender: TObject);
begin
timer1.Interval:=150;
progressbar1.Position:=3;
birim:=5;
Medium.Checked:=true;
end;

procedure TForm1.HardClick(Sender: TObject);
begin
timer1.Interval:=80;
progressbar1.Position:=4;
birim:=7;
Hard.Checked:=true;
end;

procedure TForm1.VeryHardClick(Sender: TObject);
begin
timer1.Interval:=10;
progressbar1.Position:=5;
birim:=10;
VeryHard.Checked:=true;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
timer2.tag:=1;
timer2.Enabled:=false;
end;

procedure TForm1.BackC1Click(Sender: TObject);
begin
if colordialog1.Execute then color:=colordialog1.Color;
end;

procedure TForm1.CapC1Click(Sender: TObject);
begin
if colordialog1.Execute then panel2.color:=colordialog1.Color;
end;

procedure TForm1.Select1Click(Sender: TObject);
begin
if openpicturedialog1.Execute then begin
   image1.Picture.LoadFromFile(openpicturedialog1.filename);
   image1.Show;
end;
end;

procedure TForm1.Delete1Click(Sender: TObject);
begin
image1.Hide;
end;

procedure TForm1.Default1Click(Sender: TObject);
begin
image1.Picture:=image2.picture;
image1.show;
end;

procedure TForm1.Score1Click(Sender: TObject);
begin
form2.ShowModal;
end;

procedure TForm1.Help2Click(Sender: TObject);
begin
Showmessage('Snake:'+#10+#10+
'The aim of the game is to stretch the snake and increase the score by collecting the baits within the movement area.'+#10+
'The game can be played with 4 direction keys, if desired, with 2 keys END and PAGEUP keys (or numlock 1-9 keys).'+#10+
'Speed can be changed with keys 1,2,3,4,5 during the movement.'+#10+
'See menus for other features and hotkeys.'+#10+#10+
'Have a good time!...');
end;

procedure TForm1.AppDeactivate(Sender: TObject);
begin
Pause1.Checked:=true;
timer1.Enabled:=false;
progressbar1.Hide;
end;



procedure TForm1.Auto2Click(Sender: TObject);
begin
Auto2.Checked:=not Auto2.Checked;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=27 then Pause1.Tag:=0;
end;

procedure TForm1.MainMenu1Change(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
Pause1.Checked:=false;
Pause1.click;
end;

procedure TForm1.Timer22Timer(Sender: TObject);
begin
timer22.tag:=1;
timer22.Enabled:=false;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Mouse1.Checked then begin
if Pause1.Checked then Pause1.Click;
if (x<buton[0].left)and(buton[0].left=buton[(son mod (uzn-1))+1].left) then yon:=2;
if (y<buton[0].top)and(buton[0].top=buton[(son mod (uzn-1))+1].top) then yon:=1;
if (x>buton[0].left+20)and(buton[0].left=buton[(son mod (uzn-1))+1].left) then yon:=4;
if (y>buton[0].top+20)and(buton[0].top=buton[(son mod (uzn-1))+1].top) then yon:=3;
end;
end;

procedure TForm1.TwoClick(Sender: TObject);
begin
if Two.Checked=false then begin
Two.Checked:=true;
label2.Left:=298;
label4.Left:=298;
label22.show;
label42.show;
New1.Click;
end;
end;

procedure TForm1.OneClick(Sender: TObject);
begin
if One.Checked=false then begin
One.Checked:=true;
for i:=0 to uzn2-1 do buton2[i].hide;
label2.Left:=220;
label4.Left:=220;
label22.Hide;
label42.Hide;
New1.Click;
end;
end;

procedure TForm1.Mouse1Click(Sender: TObject);
begin
Mouse1.Checked:=not Mouse1.Checked;
if Mouse1.Checked then cursor:=crarrow
                 else cursor:=crnone;
end;

procedure TForm1.Keyboard1Click(Sender: TObject);
begin
Keyboard1.Checked:=not Keyboard1.Checked;
end;

procedure TForm1.Auto1Click(Sender: TObject);
begin
Auto1.Checked:=not Auto1.Checked;
end;

end.
