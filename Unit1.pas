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
    btnProxOcorrencia: TButton;
    btnVoltarOcorrencia: TButton;
    tbOcorrencia: TEdit;
    Label4: TLabel;
    procedure btnBuscarPrimeiraTagClick(Sender: TObject);
    procedure btnBuscarUltimaTagClick(Sender: TObject);
    procedure btnProxOcorrenciaClick(Sender: TObject);
    procedure btnVoltarOcorrenciaClick(Sender: TObject);
  private
    OcorrenciaAtual: Integer;
    function ContarOcorrencias(const Xml, Tag: string): Integer;
    function ExtrairTagPorIndice(const Xml, Tag: string; Indice: Integer): string;
    function ValidarTag: Boolean;
    procedure AtualizarResultado;
    procedure AtualizarOcorrenciaTextBox;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//valida a tag
function TForm1.ValidarTag: Boolean;
begin
  Result := Trim(tbTag.Text) <> '';
  if not Result then
    ShowMessage('Informe o nome da tag no campo.');
end;

function TForm1.ContarOcorrencias(const Xml, Tag: string): Integer;
var
  Count, PosAtual: Integer;
  TagAbertura: string;
begin
  Count := 0;
  PosAtual := 1;
  TagAbertura := '<' + Tag + '>';

  while True do
  begin
    PosAtual := PosEx(TagAbertura, Xml, PosAtual);
    if PosAtual = 0 then Break;
    Inc(Count);
    Inc(PosAtual);
  end;

  Result := Count;
end;

procedure TForm1.AtualizarOcorrenciaTextBox;
begin
  tbOcorrencia.Text := IntToStr(OcorrenciaAtual);
end;

function TForm1.ExtrairTagPorIndice(const Xml, Tag: string; Indice: Integer): string;
var
  PosAtual, PosTemp, ConteudoInicio, PosFechamento, Count: Integer;
  TagAbertura, TagFechamento: string;
begin
  Result := '';
  TagAbertura := '<' + Tag + '>';
  TagFechamento := '</' + Tag + '>';
  PosAtual := 1;
  Count := 0;

  while True do
  begin
    PosTemp := PosEx(TagAbertura, Xml, PosAtual);
    if PosTemp = 0 then Break;

    Inc(Count);
    if Count = Indice then
    begin
      ConteudoInicio := PosTemp + Length(TagAbertura);
      PosFechamento := PosEx(TagFechamento, Xml, ConteudoInicio);
      if PosFechamento > 0 then
        Result := Copy(Xml, ConteudoInicio, PosFechamento - ConteudoInicio);
      Break;
    end;

    PosAtual := PosTemp + Length(TagAbertura);
  end;
end;

procedure TForm1.AtualizarResultado;
var
  Xml, Tag: string;
  Total: Integer;
begin
  Xml := tbXMLRET.Text;
  Tag := Trim(tbTag.Text);
  Total := ContarOcorrencias(Xml, Tag);

  if Total = 0 then
  begin
    ShowMessage('Tag "' + Tag + '" não encontrada no XML.');
    Exit;
  end;

  if OcorrenciaAtual < 1 then
    OcorrenciaAtual := 1
  else if OcorrenciaAtual > Total then
    OcorrenciaAtual := Total;

  mmRet.Text := ExtrairTagPorIndice(Xml, Tag, OcorrenciaAtual);
end;

procedure TForm1.btnBuscarPrimeiraTagClick(Sender: TObject);
begin
  if not ValidarTag then Exit;
  OcorrenciaAtual := 1;
  AtualizarResultado;
  AtualizarOcorrenciaTextBox;
end;

procedure TForm1.btnBuscarUltimaTagClick(Sender: TObject);
var
  Xml, Tag: string;
begin
  if not ValidarTag then Exit;
  Xml := tbXMLRET.Text;
  Tag := Trim(tbTag.Text);
  OcorrenciaAtual := ContarOcorrencias(Xml, Tag);
  AtualizarResultado;
  AtualizarOcorrenciaTextBox;
end;

procedure TForm1.btnProxOcorrenciaClick(Sender: TObject);
var
  Total: Integer;
begin
  if not ValidarTag then Exit;
  Total := ContarOcorrencias(tbXMLRET.Text, tbTag.Text);
  if OcorrenciaAtual < Total then
  begin
    Inc(OcorrenciaAtual);
    AtualizarResultado;
    AtualizarOcorrenciaTextBox;
  end
  else
    ShowMessage('Já está na última ocorrência.');
end;

procedure TForm1.btnVoltarOcorrenciaClick(Sender: TObject);
begin
  if not ValidarTag then Exit;
  if OcorrenciaAtual > 1 then
  begin
    Dec(OcorrenciaAtual);
    AtualizarResultado;
    AtualizarOcorrenciaTextBox;
  end
  else
    ShowMessage('Já está na primeira ocorrência.');
end;

end.

