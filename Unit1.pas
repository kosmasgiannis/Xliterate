unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus ;

type
  TForm1 = class(TForm)
    TntEdit1: TEdit;
    TntEdit2: TEdit;
    TntLabel1: TLabel;
    TntLabel2: TLabel;
    TntMainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    TntLabel3: TLabel;
    transliterate1: TMenuItem;
    Clear1: TMenuItem;
    N1: TMenuItem;
    TntMemo1: TMemo;
    RomanizationasinModernGreek1: TMenuItem;
    Debug1: TMenuItem;
    AlwaysOnTop1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    UseCompoundCharacters1: TMenuItem;
    N2: TMenuItem;
    ComboBox1: TComboBox;
    RoughBreathingGuessing1: TMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure TntEdit1DblClick(Sender: TObject);
    procedure transliterate1Click(Sender: TObject);
    procedure RomanizationasinModernGreek1Click(Sender: TObject);
    procedure AlwaysOnTop1Click(Sender: TObject);
    procedure Debug1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TntEdit2DblClick(Sender: TObject);
    procedure UseCompoundCharacters1Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure RoughBreathingGuessing1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    scheme : string;
    function xlate(str : widestring; scheme:string; compound, moderngreek, roughbreathing : boolean) : widestring;
  end;

var
  Form1: TForm1;

implementation

uses about;

{$R *.dfm}


function ispunctuation(ch : widechar):boolean;
begin
 result:=false;
 if (ch='''') or (pos(ch,widestring(' .,<>/?;:[]{}=+-_|()&*^%$#@!~`\"')) > 0) then result:=true;
end;

function isupperGreek(ch : widechar) : boolean;
begin
 case ord(ch) of
  $390..$3A1,
  $3A3..$3A9,
  $386,
  $388,
  $389,
  $38A,
  $38C,
  $38E,
  $38F,
  $3AA: result := true;
 else
  result := false;
 end;
end;

function maplc(ch, pch, nch, nnch : Widechar; var advance : integer; compound, moderngreek, roughbreathing : boolean) : Widestring;
begin

 advance:=1;

 case ord(ch) of

  $3B1, $3AC: if ((ord(nch)=$3C5) or (ord(nch)=$3CD)) then
        begin
         result:='au';
         advance:=2;
        end
        else result:='a';
  $391, $386: if ((ord(nch)=$3C5) or (ord(nch)=$3CD)) then
        begin
         result:='Au';
         advance:=2;
        end
        else
        if ((ord(nch)=$3A5) or (ord(nch)=$38E)) then
        begin
         result:='AU';
         advance:=2;
        end
        else result:='A';

  $3B2: if moderngreek then result:='v' else result:='b';
  $392: if moderngreek then result:='V' else result:='B';

  $3B3: if (ord(nch)=$3B3) then
        begin
         result:='ng';
         advance:=2;
        end
        else if (ord(nch)=$3BA) then
        begin
         if ((moderngreek) and ((ispunctuation(pch)) or (ispunctuation(nnch)))) then
           result:='gk'
         else
           result:='nk';
         advance:=2;
        end
        else if (ord(nch)=$3BE) then
        begin
         result:='nx';
         advance:=2;
        end
        else if (ord(nch)=$3c7) then
        begin
         result:='nch';
         advance:=2;
        end
        else result:='g';

  $393: if (ord(nch)=$3B3) then
        begin
         result:='Ng';
         advance:=2;
        end
        else if (ord(nch)=$3BA) then
        begin
         if ((moderngreek) and ((ispunctuation(pch)) or (ispunctuation(nnch)))) then
           result:='Gk'
         else
           result:='Nk';
         advance:=2;
        end
        else if (ord(nch)=$3BE) then
        begin
         result:='Nx';
         advance:=2;
        end
        else if (ord(nch)=$3c7) then
        begin
         result:='Nch';
         advance:=2;
        end
        else if (ord(nch)=$393) then
        begin
         result:='NG';
         advance:=2;
        end
        else if (ord(nch)=$39A) then
        begin
         if ((moderngreek) and ((ispunctuation(pch)) or (ispunctuation(nnch)))) then
           result:='GK'
         else
           result:='NK';
         advance:=2;
        end
        else if (ord(nch)=$39E) then
        begin
         result:='NX';
         advance:=2;
        end
        else if (ord(nch)=$3a7) then
        begin
         result:='NCH';
         advance:=2;
        end
        else result:='G';

  $3B4: result:='d';
  $394: result:='D';

  $3b5, $3ad: if ((ord(nch)=$3C5) or (ord(nch)=$3CD)) then
        begin
         result:='eu';
         advance:=2;
        end
        else result:='e';
  $395, $388: if ((ord(nch)=$3C5) or (ord(nch)=$3CD)) then
        begin
         result:='Eu';
         advance:=2;
        end
        else
        if ((ord(nch)=$3A5) or (ord(nch)=$38E)) then
        begin
         result:='EU';
         advance:=2;
        end
        else result:='E';

  $3B6: result:='z';
  $396: result:='Z';

  $3b7, $3AE: if compound then result:=WideChar($113) else begin result:='e'; result:=result+WideChar($304); end;
  $397, $389: if compound then result:=WideChar($112) else begin result:='E'; result:=result+WideChar($304); end;

  $3b8: result:='th';
  $398: if isupperGreek(nch) or ispunctuation(nch) then result:='TH' else result:='Th';

  $3b9, $3AF, $3CA, $390: result:='i';
  $399, $38A, $3AA: result:='I';

  $3BA: result:='k';
  $39A: result:='K';

  $3BB: result:='l';
  $39B: result:='L';

  $3BC: if ((moderngreek) and ((ord(nch)=$3C0) and ispunctuation(pch))) then
        begin
         result:='b';
         advance:=2;
        end
        else result:='m';
  $39C: if ((moderngreek) and (((ord(nch)=$3C0) or (ord(nch)=$3A0))  and ispunctuation(pch))) then
        begin
         result:='B';
         advance:=2;
        end
        else result:='M';

  $3BD: if ((moderngreek) and ((ord(nch)=$3C4) and ispunctuation(pch))) then
        begin
         if compound then result:=WideChar($1e0f) else begin result:='d'; result:=result+WideChar($331); end;
         advance:=2;
        end
        else result:='n';
  $39D: if ((moderngreek) and (((ord(nch)=$3C4) or (ord(nch)=$3A4))  and ispunctuation(pch))) then
        begin
         if compound then result:=WideChar($1e0e) else begin result:='D'; result:=result+WideChar($331); end;
         advance:=2;
        end
        else result:='N';

  $3BE: result:='x';
  $39E: result:='X';

  $3BF, $3CC: if ((ord(nch)=$3C5) or (ord(nch)=$3CD)) then
        begin
         result:='ou';
         advance:=2;
        end
        else result:='o';
  $39F, $38C: if ((ord(nch)=$3C5) or (ord(nch)=$3CD)) then
        begin
         result:='Ou';
         advance:=2;
        end
        else
        if ((ord(nch)=$3A5) or (ord(nch)=$38E)) then
        begin
         result:='OU';
         advance:=2;
        end
        else result:='O';

  $3C0: result:='p';
  $3A0: result:='P';
  $3C1: begin result:='r'; if ((roughbreathing) and (ispunctuation(pch))) then result:=result+'h'; end;
  $3A1: begin result:='R';
        if (roughbreathing) then
        if ((isupperGreek(nch)) or (ispunctuation(nch))) then result:=result+'H' else result:=result+'h'; end;
  $3C3, $3C2: result:='s';
  $3A3: result:='S';

  $3C4: result:='t';
  $3A4: result:='T';

  $3C5, $3CD,$3CB, $3B0: begin result:='y'; if ((roughbreathing) and (ispunctuation(pch))) then result:='h'+result; end;
  $3A5, $38E, $3AB: begin result:='Y';
        if (roughbreathing) then
        if ((isupperGreek(nch)) or (ispunctuation(nch))) then result:='H'+result else result:='Hy'; end;


  $3C6: result:='ph';
  $3A6: if isupperGreek(nch) or ispunctuation(nch) then result:='PH' else result:='Ph';

  $3C7: result:='ch';
  $3A7: if isupperGreek(nch) or ispunctuation(nch) then result:='CH' else result:='Ch';

  $3C8: result:='ps';
  $3A8: if isupperGreek(nch) or ispunctuation(nch) then result:='PS' else result:='Ps';

  $3C9, $3CE: if compound then result:=WideChar($14d) else begin result:='o'; result:=result+WideChar($304); end;
  $3A9, $38F: if compound then result:=WideChar($14c) else begin result:='O'; result:=result+WideChar($304); end;

 else
  result:=ch;
 end;

end;

function Tform1.xlate(str : widestring; scheme:string; compound, moderngreek, roughbreathing : boolean) : widestring;
var  advance, i,len : integer;
     pch, nch, ch, nnch: WideChar;

begin
 tntmemo1.Lines.Clear;
 result:='';
 len:=length(str);
 str:=' '+str+'  ';

 advance:=1;
 i:=2;
 while i<=len+1 do
 begin
  ch :=str[i];
  pch:=str[i-1];
  nch:=str[i+1];
  nnch:=str[i+2];

  if debug1.Checked then tntmemo1.lines.Add(str[i]+' $'+wideformat('%x:',[ord(ch)]));
  result:=result+maplc(ch, pch, nch, nnch, advance, compound, moderngreek, roughbreathing);
  i:=i+advance;
 end;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm1.Clear1Click(Sender: TObject);
begin
  tntedit1.Text:='';
  tntedit2.Text:='';
  tntedit1.SetFocus;
end;

procedure TForm1.TntEdit1DblClick(Sender: TObject);
begin
 tntedit1.SelectAll;
end;

procedure TForm1.transliterate1Click(Sender: TObject);
begin
  scheme := 'LC';
  tntedit2.Text:=xlate(tntedit1.Text,scheme,UseCompoundCharacters1.Checked, RomanizationasinModernGreek1.Checked, RoughBreathingGuessing1.Checked);
end;

procedure TForm1.RomanizationasinModernGreek1Click(Sender: TObject);
begin
  RomanizationasinModernGreek1.Checked:= not RomanizationasinModernGreek1.Checked;
end;

procedure TForm1.AlwaysOnTop1Click(Sender: TObject);
begin
  AlwaysOnTop1.Checked:= not AlwaysOnTop1.Checked;
  if AlwaysOnTop1.Checked then
  begin
   with Self do
     SetWindowPos(Handle, // handle to window
                  HWND_TOPMOST, // placement-order handle {*}
                  Left,  // horizontal position
                  Top,   // vertical position
                  Width,
                  Height,
                  // window-positioning options
                  SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  end
  else
  begin
   with Self do
     SetWindowPos(Handle, // handle to window
                  HWND_NOTOPMOST, // placement-order handle {*}
                  Left,  // horizontal position
                  Top,   // vertical position
                  Width,
                  Height,
                  // window-positioning options
                  SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

  end;

end;

procedure TForm1.Debug1Click(Sender: TObject);
begin
  debug1.Checked:= not debug1.Checked;
  tntmemo1.Visible:=debug1.Checked;
  if debug1.Checked then
  begin
   height:=411;
  end
  else
  begin
   height:= 130;
  end;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  form2.showmodal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  tntmemo1.Visible:=debug1.Checked;
  if debug1.Checked then
  begin
   height:=411;
  end
  else
  begin
   height:= 130;
  end;
  ComboBox1.Items.Clear;
  ComboBox1.Items := screen.Fonts;
  ComboBox1.Text := 'Tahoma';
end;

procedure TForm1.TntEdit2DblClick(Sender: TObject);
begin
 tntedit2.SelectAll;
end;

procedure TForm1.UseCompoundCharacters1Click(Sender: TObject);
begin
 UseCompoundCharacters1.Checked:=not UseCompoundCharacters1.Checked;
end;

procedure TForm1.ComboBox1Click(Sender: TObject);
begin
 tntedit1.Font.Name := ComboBox1.Text;
 tntedit2.Font.Name := ComboBox1.Text;
end;

procedure TForm1.RoughBreathingGuessing1Click(Sender: TObject);
begin
   RoughBreathingGuessing1.Checked:=not RoughBreathingGuessing1.Checked;
end;

end.
