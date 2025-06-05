unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils;

type
  TForm1 = class(TForm)
    tbXMLRET: TMemo;
    Label1: TLabel;
    tbTag: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnBuscarPrimeiraTag: TButton;
    btnBuscarUltimaTag: TButton;
    mmRet: TMemo;
    procedure btnBuscarPrimeiraTagClick(Sender: TObject);
    procedure btnBuscarUltimaTagClick(Sender: TObject);
  private
    { Private declarations }
    function ExtrairXMotivoPorIndice(const Xml: string; Indice: Integer): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


function TForm1.ExtrairXMotivoPorIndice(const Xml: string; Indice: Integer): string;
var
  PosicaoAtual, PosicaoTemp, TagInicio, TagFim, Count: Integer;
  TagAbertura, TagFechamento: string;
begin
  Result := '';
  TagAbertura := '<' + tbTag.Text + '>';
  TagFechamento := '</' + tbTag.Text + '>';
  PosicaoAtual := 1;
  Count := 0;

  while True do
  begin
    PosicaoTemp := PosEx(TagAbertura, Xml, PosicaoAtual);
    if PosicaoTemp = 0 then
      Break;

    Inc(Count);
    if Count = Indice then
    begin
      TagInicio := PosicaoTemp + Length(TagAbertura);
      TagFim := PosEx(TagFechamento, Xml, TagInicio);
      if TagFim > 0 then
        Result := Copy(Xml, TagInicio, TagFim - TagInicio);
      Break;
    end;

    PosicaoAtual := PosicaoTemp + Length(TagAbertura);
  end;
end;

procedure TForm1.btnBuscarPrimeiraTagClick(Sender: TObject);
var
  Xml: string;
begin
  Xml := tbXMLRET.Text;
  mmRet.Text := ExtrairXMotivoPorIndice(Xml, 1);
end;

procedure TForm1.btnBuscarUltimaTagClick(Sender: TObject);
var
  Xml: string;
begin
  Xml := tbXMLRET.Text;
  mmRet.Text := ExtrairXMotivoPorIndice(Xml, 2);
end;

end.

