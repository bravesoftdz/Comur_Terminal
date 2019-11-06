Unit UConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBClient, Mask, ToolEdit, ADODB,
  Grids, SMDBGrid, SqlExpr, DateUtils, CurrEdit, RzTabs, FMTBcd, DBGrids,
  DBCtrls, TeEngine, Series, TeeProcs, Chart, DbChart, DBFilter, RxLookup,
  NxCollection, RLConsts, Midaslib, ComObj, ComCtrls, CheckLst, IniFiles;

type
  TfConsulta = class(TForm)
    Panel4: TPanel;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label6: TLabel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    cbxMesIni: TComboBox;
    ceAnoIni: TCurrencyEdit;
    SMDBGrid2: TSMDBGrid;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    NxButton1: TNxButton;
    ProgressBar1: TProgressBar;
    DirectoryEdit1: TDirectoryEdit;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    CheckListBox1: TCheckListBox;
    Edit1: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    Label8: TLabel;
    Edit3: TEdit;
    Label9: TLabel;
    Edit4: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid2TitleClick(Column: TColumn);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure cbxMesIniExit(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
  private
    { Private declarations }
    vValorLiquido : Double;
    vSequencial, vContador, vContador10 : Integer;
    vMes, vNomeArq, vTipoPagamento,caminho  : String;
    vArquivo : TextFile;
    vRegistro00, vRegistro05, vRegistro10, vRegistro20, vRegistro30, vRegistro40, vRegistro50, vRegistro90, vRegistro99, vGerar : Boolean;
    procedure prc_Consultar;
    procedure prc_Monta_mAuxiliar;
    procedure prc_Gravar_mAuxiliar(cd_evento : Integer);
    procedure prc_Gravar_Registro00;
    procedure prc_Gravar_Registro05;
    procedure prc_Gravar_Registro10;
    procedure prc_Gravar_Registro20;
    procedure prc_Gravar_Registro30;
    procedure prc_Gravar_Registro40;
    procedure prc_Gravar_Registro40_Vazio;
    procedure prc_Gravar_Registro50;
    procedure prc_Gravar_Registro90;
    procedure prc_Gravar_Registro99;
    procedure prc_Habilita_CheckList;
    procedure prc_Gravar_ArquivoIni;
    procedure prc_Ler_ArquivoIni;
    function fnc_Lpad(S: String; x: Char; Tamanho : Integer) : String;
    function fnc_Rpad(S: String; x: Char; Tamanho : Integer) : String;
    function fnc_RemoveAcento(Str: string): string;
    function fnc_Monta_String(x : String; Tamanho : Integer; Tipo : Integer = 0; CompletarCom : String = ' ') : String;
    function TirarAcento(texto: string): string;
  public
    { Public declarations }

  end;

var
  fConsulta: TfConsulta;

implementation

uses DmdDatabase_EBS, UDMLancamentos_EBS, StrUtils;

{$R *.dfm}

procedure TfConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  prc_Gravar_ArquivoIni;
  Action := Cafree;
end;

procedure TfConsulta.FormShow(Sender: TObject);
begin
  caminho := ExtractFilePath(Application.ExeName) + 'dados.ini';
  if FileExists(caminho) then
    prc_Ler_ArquivoIni;
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;
  vMes   := '';
  prc_Habilita_CheckList;
end;

procedure TfConsulta.prc_Consultar;
var
  vData : TDateTime;
  vData2 : TDateTime;
begin
  vData  := EncodeDate(ceAnoIni.AsInteger,cbxMesIni.ItemIndex+1,01);
  vData2 := EncodeDate(ceAnoIni.AsInteger,cbxMesIni.ItemIndex+1,DaysInMonth(ceAnoIni.AsInteger,cbxMesIni.ItemIndex+1));
  DMLancamentos_EBS.cdsProcEvento.Close;
  DMLancamentos_EBS.sdsProcEvento.SQL.Text := 'SELECT pro.ano ANO, pro.mes MES, pro.valor VALOR, '
                                             + 'CASE WHEN eve.tp_evento = ' + QuotedStr('V') + ' THEN '+ QuotedStr('1')
                                             +      'WHEN eve.tp_evento = ' + QuotedStr('D') + ' THEN '+ QuotedStr('2')
                                             + ' END Tipo_Evento, fun.cd_funcionario COD_FUNCIONARIO, fun.nome NOME, '
                                             + 'pro.cd_evento COD_EVENTO, eve.descricao NOME_EVENTO, ffun.nr_agencia_deposito AGENCIA, ffun.dt_admissao DATA_ADMISSAO, '
                                             + 'concat(cast(ffun.nr_conta_deposito  as char(9)),ffun.dv_conta_deposito) as CONTA_CORRENTE, '
                                             + '(SELECT f.descricao FROM funfuncao b INNER JOIN funcao f ON b.cd_funcao = f.cd_funcao '
                                             + ' WHERE b.dt_final >= '+ QuotedStr(FormatDateTime('YYYY/MM/DD',vData))
                                             + ' AND b.cd_empresa = ' + IntToStr(RxDBLookupCombo1.KeyValue)
                                             + ' AND b.cd_funcionario = fun.cd_funcionario LIMIT 1) NOME_FUNCAO '
                                             + 'FROM procevento pro INNER JOIN funcionario fun ON fun.cd_funcionario = pro.cd_funcionario and fun.cd_empresa = pro.cd_empresa '
                                             + 'INNER JOIN eventog eve ON eve.cd_evento = pro.cd_evento '
                                             + 'LEFT JOIN funfuncional ffun ON ffun.cd_funcionario = fun.cd_funcionario '
                                             + 'WHERE pro.mes = ' + IntToStr(cbxMesIni.ItemIndex + 1) + ' AND pro.ano = '+ ceAnoIni.Text
                                             + ' AND ffun.cd_banco_deposito = 1 AND pro.cd_empresa = ' + IntToStr(RxDBLookupCombo1.KeyValue)
                                             + ' AND pro.tipo <> ' + QuotedStr('1') + 'AND pro.tipo <> ' + Quotedstr('5')
                                             + ' AND ((eve.tp_evento = ' + QuotedStr('V') + ') OR ((eve.tp_evento = ' + QuotedStr('D')+'))) '
                                             + 'order by ffun.nr_agencia_deposito,fun.cd_funcionario,Tipo_Evento, eve.cd_evento';
  DMLancamentos_EBS.cdsProcEvento.Open;
  DMLancamentos_EBS.cdsProcEvento.IndexFieldNames := 'AGENCIA;COD_FUNCIONARIO;TIPO_EVENTO;COD_EVENTO';
  DMLancamentos_EBS.cdsProcEvento.First;
end;

procedure TfConsulta.SMDBGrid2TitleClick(Column: TColumn);
var
  i : Integer;
  ColunaOrdenada : String;
begin
  {ColunaOrdenada := Column.FieldName;
  DMLancamentos_EBS.cdsProcEvento.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid2.Columns.Count - 1 do
    if not (SMDBGrid2.Columns.Items[I] = Column) then
      SMDBGrid2.Columns.Items[I].Title.Color := clBtnFace;}
end;

procedure TfConsulta.btnConsultarClick(Sender: TObject);
begin
  if (cbxMesIni.ItemIndex < 0) or (ceAnoIni.AsInteger < 1900) then
  begin
    ShowMessage('Mês ou Ano inicial inválido!');
    cbxMesIni.SetFocus;
    exit;
  end;
{  if (cbxMesIni.ItemIndex > 8) and (ceAnoIni.AsInteger >= 2018) then
  begin
    //Essa tranca foi colocada para verse eles vão pagar, esta liberada até 01/2018
    ShowMessage('Erro na data, contate o fornecedor do software!');
    RxDBLookupCombo1.SetFocus;
    exit;
  end;}
  if DirectoryEdit1.Text = '' then
  begin
    ShowMessage('Informe um diretório de destino');
    DirectoryEdit1.SetFocus;
    exit;
  end;
  if ComboBox1.ItemIndex = -1 then
  begin
    ShowMessage('Informe um tipo de pagamento');
    ComboBox1.SetFocus;
    exit;
  end;
  if trim(RxDBLookupCombo1.Text) = '' then
  begin
    ShowMessage('Empresa não informada!');
    RxDBLookupCombo1.SetFocus;
    exit;
  end;

  vTipoPagamento := ComboBox1.Items[ComboBox1.ItemIndex];
  case AnsiIndexStr(UpperCase(vTipoPagamento),['CONTRA CHEQUE','FOLHA COMPLEMENTAR','13º SALÁRIO','ABONOS','OUTRAS FOLHAS']) of
   0 : vTipoPagamento := '01';
   1 : vTipoPagamento := '02';
   2 : vTipoPagamento := '03';
   3 : vTipoPagamento := '04';
  else vTipoPagamento := '05';
  end;

  vContador := 0;
  vContador10 := 0;
  ProgressBar1.Max      := 0;
  ProgressBar1.Position := 0;
  ProgressBar1.Visible  := True;
  btnConsultar.Enabled  := False;
  btnConsultar.Refresh;
  Refresh;
  try
    prc_Consultar;
    prc_Monta_mAuxiliar;
    DMLancamentos_EBS.mAuxiliar.IndexFieldNames := 'AGENCIA;CONTACORRENTE;NOMEFUNCIONARIO';
    CurrencyEdit1.AsInteger := vContador;
  finally
    btnConsultar.Enabled  := True;
    ProgressBar1.Visible  := False;
  end;
  DMLancamentos_EBS.mAuxiliar.First;
end;

procedure TfConsulta.btnImprimirClick(Sender: TObject);
var
  i : Integer;
begin
  if not(DMLancamentos_EBS.cdsProcEvento.Active) or (DMLancamentos_EBS.cdsProcEvento.IsEmpty) then
  begin
    ShowMessage('Não existe registro para a impressão!');
    exit;
  end;
  vNomeArq := DirectoryEdit1.Text + '\Banri_' + vMes + '_' + ceAnoIni.Text + '.txt';
  SMDBGrid2.DisableScroll;
  vSequencial := 0;
  vValorLiquido := 0;
  AssignFile(vArquivo,vNomeArq);
  Rewrite(vArquivo);
  if vRegistro00 then
    prc_Gravar_Registro00;
  if vRegistro05 then
    prc_Gravar_Registro05;
  DMLancamentos_EBS.cdsProcEvento.First;
  while not DMLancamentos_EBS.mAuxiliar.Eof do
  begin
    if vRegistro10 then
      prc_Gravar_Registro10;
    if vRegistro20 then
      prc_Gravar_Registro20;
    DMLancamentos_EBS.cdsProcEvento.Locate('COD_FUNCIONARIO',DMLancamentos_EBS.mAuxiliarcd_Funcionario.AsInteger,[loCaseInsensitive]);
    while not DMLancamentos_EBS.cdsProcEvento.Eof do
    begin
      if DMLancamentos_EBS.mAuxiliarcd_Funcionario.AsInteger <> DMLancamentos_EBS.cdsProcEventoCOD_FUNCIONARIO.AsInteger then
        break;
      if (vRegistro30) and (DMLancamentos_EBS.cdsProcEventoTIPO_EVENTO.AsString = '1') then
          prc_Gravar_Registro30;
      if (vRegistro40) and (DMLancamentos_EBS.cdsProcEventoTIPO_EVENTO.AsString = '2') then
          prc_Gravar_Registro40;
      DMLancamentos_EBS.cdsProcEvento.Next;
    end;
    if (vRegistro50) and (vValorLiquido <> 0) then
    begin
       if not (vGerar) then
         prc_Gravar_Registro40_Vazio;
       prc_Gravar_Registro50;
    end;
    DMLancamentos_EBS.mAuxiliar.Next;
  end;
  if vRegistro90 then
    prc_Gravar_Registro90;
  if vRegistro99 then
    prc_Gravar_Registro99;
  CloseFile(vArquivo);
  SMDBGrid2.EnableScroll;
  ShowMessage('Arquivo Gerado com Sucesso!!');
end;

procedure TfConsulta.NxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsulta.prc_Monta_mAuxiliar;
var
  vCodAnt : Integer;
begin
  DMLancamentos_EBS.mAuxiliar.EmptyDataSet;
  ProgressBar1.Max := DMLancamentos_EBS.cdsProcEvento.RecordCount;

  vCodAnt := 0;
  DMLancamentos_EBS.cdsProcEvento.First;
  while not DMLancamentos_EBS.cdsProcEvento.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if vCodAnt <> DMLancamentos_EBS.cdsProcEventoCOD_FUNCIONARIO.AsInteger then
      vContador := vContador + 1;
    prc_Gravar_mAuxiliar(0);
{    if DMLancamentos_EBS.cdsProcEventoTipo_Reg.AsString = '1' then
      prc_Gravar_mAuxiliar(99999)
    else
      prc_Gravar_mAuxiliar(DMLancamentos_EBS.cdsProcEventocd_evento.AsInteger);}

    vCodAnt := DMLancamentos_EBS.cdsProcEventoCOD_FUNCIONARIO.AsInteger;
    DMLancamentos_EBS.cdsProcEvento.Next;
  end;
end;

procedure TfConsulta.prc_Gravar_mAuxiliar(cd_evento: Integer);
begin
  if DMLancamentos_EBS.cdsProcEventoCONTA_CORRENTE.AsString = '' then
    exit;
  if DMLancamentos_EBS.mAuxiliar.Locate('cd_Funcionario',VarArrayOf([DMLancamentos_EBS.cdsProcEventoCOD_FUNCIONARIO.AsInteger]),[locaseinsensitive]) then
    DMLancamentos_EBS.mAuxiliar.Edit
  else
  begin
    DMLancamentos_EBS.mAuxiliar.Insert;
    DMLancamentos_EBS.mAuxiliarcd_Funcionario.AsInteger := DMLancamentos_EBS.cdsProcEventoCOD_FUNCIONARIO.AsInteger;
    DMLancamentos_EBS.mAuxiliarNomeFuncionario.AsString := DMLancamentos_EBS.cdsProcEventoNOME.AsString;
    DMLancamentos_EBS.mAuxiliarNomeFuncao.AsString      := DMLancamentos_EBS.cdsProcEventoNOME_FUNCAO.AsString;
    DMLancamentos_EBS.mAuxiliarAgencia.AsInteger        := StrToInt(DMLancamentos_EBS.cdsProcEventoAGENCIA.AsString);
    DMLancamentos_EBS.mAuxiliarContaCorrente.AsString   := DMLancamentos_EBS.cdsProcEventoCONTA_CORRENTE.AsString;
    DMLancamentos_EBS.mAuxiliarData_Admissao.AsDateTime := DMLancamentos_EBS.cdsProcEventoDATA_ADMISSAO.AsDateTime;
  end;
  DMLancamentos_EBS.mAuxiliar.Post;
end;

procedure TfConsulta.SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
{  if DMLancamentos_EBS.mAuxiliarcd_Evento.AsInteger = 0 then
  begin
    Background  := clAqua;
    AFont.Color := clBlack;
    AFont.Style := [fsBold];
    if (Field.FieldName = 'Nome_Evento') or (Field.FieldName = 'cd_Evento') then
      AFont.Color := clAqua;
  end
  else
  begin
    if DMLancamentos_EBS.mAuxiliarTipo_Evento.AsString = '1' then
    begin
      if (Field.FieldName = 'valor_inss') or (Field.FieldName = 'valor_irrf') or (Field.FieldName = 'valor_liquido') then
      begin
        AFont.Color := clWindow;
        Background  := clWindow;
      end
    end;
    if (Field.FieldName = 'cd_Funcionario') or (Field.FieldName = 'NomeFuncionario') or (Field.FieldName = 'NomeFuncao') then
    begin
      AFont.Color := clWindow;
      Background  := clWindow;
    end

  end;}

end;

procedure TfConsulta.cbxMesIniExit(Sender: TObject);
var
  vMesIni : String;
begin
  vMesIni := cbxMesIni.Items[cbxMesIni.ItemIndex];
  case AnsiIndexStr(UpperCase(vMesIni),['JANEIRO','FEVEREIRO','MARÇO','ABRIL','MAIO','JUNHO','JULHO','AGOSTO','SETEMBRO','OUTUBRO','NOVEMBRO','DEZEMBRO']) of
    0:  vMes := '01';
    1:  vMes := '02';
    2:  vMes := '03';
    3:  vMes := '04';
    4:  vMes := '05';
    5:  vMes := '06';
    6:  vMes := '07';
    7:  vMes := '08';
    8:  vMes := '09';
    9:  vMes := '10';
    10: vMes := '11';
    11: vMes := '12';
  else  vMes := '0';
  end;
end;

procedure TfConsulta.prc_Gravar_Registro00;
var
  vTexto, vTexto2 : String;
begin
  vSequencial := vSequencial + 1;
  vTexto := '00';
  vTexto := vTexto + '041';
  vTexto := vTexto + ceAnoIni.Text;
  vTexto := vTexto + vMes;
  vTexto := vTexto + '01';
  vTexto := vtexto + fnc_Lpad(fnc_RemoveAcento('Nome do convênio'),' ',18);
  vTexto := vTexto + FormatDateTime('yyyymmdd',date);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',4);
  vTexto := vTexto + copy(DMLancamentos_EBS.cdsEmpresarazao.AsString,1,12);
  vTexto := vTexto + ' ';
  vTexto := vTexto + fnc_Rpad(Edit2.Text,'0',6); //código da Empresa
  vTexto := vTexto + fnc_Rpad(Edit1.Text,'0',3);//Código do convênio
  vTexto := vTexto + ' ';
  vTexto := vTexto + vTipoPagamento;
  vTexto := vTexto + '  ' + '00' + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo,vTexto);

end;

function TfConsulta.fnc_Lpad(S: String; x: Char;
  Tamanho: Integer): String;
var
  i : Integer;
begin
  S := UpperCase(S);
  Result := S;
  i := Tamanho - Length(S);
  if i < 1 then
    exit;
  result := S + StringOfChar(x, i);
end;

function TfConsulta.fnc_Rpad(S: String; x: Char; Tamanho: Integer): String;
var
  i : Integer;
begin
  Result := S;
  i := Tamanho - Length(S);
  if i < 1 then
    exit;
  Result := StringOfChar(x, i) + S;
end;

function TfConsulta.fnc_RemoveAcento(Str: string): string;
const
  ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  i : Integer;
begin
  for i := 1 to Length(Str) do
  if Pos(Str[i],ComAcento) <> 0 then
    Str[i] := SemAcento[Pos(Str[i], ComAcento)];
  Result := Str;
end;

procedure TfConsulta.prc_Habilita_CheckList;
var
  i : integer;
  x : String;
begin
  for i := 0 to CheckListBox1.Items.Count - 1 do
  begin
    x := CheckListBox1.Items.Strings[i];
   if (x = 'Registro 00') or (x = 'Registro 05') or (x = 'Registro 10') or
      (x = 'Registro 20') or (x = 'Registro 30') or (x = 'Registro 40') or
      (x = 'Registro 50') or (x = 'Registro 90') or (x = 'Registro 99') then
     CheckListBox1.Checked[i] := True;
   vRegistro00 := True;
   vRegistro05 := True;
   vRegistro10 := True;
   vRegistro20 := True;
   vRegistro30 := True;
   vRegistro40 := True;
   vRegistro50 := True;
   vRegistro90 := True;
   vRegistro99 := True;
   ComboBox1.ItemIndex := 0;
  end;
end;

procedure TfConsulta.CheckListBox1ClickCheck(Sender: TObject);
var
  i : integer;
begin
  prc_Habilita_CheckList;
  vRegistro05 := False;
  vRegistro10 := False;
  vRegistro20 := False;
  vRegistro30 := False;
  vRegistro40 := False;
  vRegistro50 := False;
  for i := 0 to CheckListBox1.Items.Count - 1 do
  begin
    case AnsiIndexStr(CheckListBox1.Items.Strings[i],['Registro 05','Registro 10','Registro 20','Registro 30','Registro 40','Registro 50']) of
      0 : if CheckListBox1.Checked[i] then vRegistro05 := True;
      1 : if CheckListBox1.Checked[i] then vRegistro10 := True;
      2 : if CheckListBox1.Checked[i] then vRegistro20 := True;
      3 : if CheckListBox1.Checked[i] then vRegistro30 := True;
      4 : if CheckListBox1.Checked[i] then vRegistro40 := True;
      5 : if CheckListBox1.Checked[i] then vRegistro50 := True;
    end;
  end;
end;

procedure TfConsulta.prc_Gravar_Registro05;
var
  vTexto : String;
begin
  vSequencial := vSequencial + 1;
  vTexto := '05';
  vTexto := vTexto + fnc_Lpad(fnc_RemoveAcento(Edit3.Text),' ',70);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo,vTexto);
end;

procedure TfConsulta.prc_Gravar_Registro10;
var
  vTexto : String;
begin
  vSequencial := vSequencial + 1;
  vContador10 := vContador10 + 1;
  vTexto := '10';
  vTexto := vTexto + fnc_Rpad(IntToStr(DMLancamentos_EBS.mAuxiliarAgencia.AsInteger),'0',4);
  vTexto := vTexto + fnc_Lpad(DMLancamentos_EBS.mAuxiliarContaCorrente.AsString,'0',10);
  vTexto := vTexto + fnc_Rpad(IntToStr(DMLancamentos_EBS.mAuxiliarcd_Funcionario.AsInteger),'0',16);
  vTexto := vTexto + fnc_Lpad(Copy(DMLancamentos_EBS.mAuxiliarNomeFuncionario.AsString,1,35),' ',35);
  vTexto := vTexto + '     ';
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo,vTexto);
end;

procedure TfConsulta.prc_Gravar_Registro20;
var
  vTexto : String;
begin
  vSequencial := vSequencial + 1;
  vTexto := '20';
  vTexto := vTexto + fnc_Lpad(DMLancamentos_EBS.cdsEmpresarazao.AsString,' ',48);
  vTexto := vTexto + fnc_Lpad(' ', ' ',22);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo,vTexto);

  vSequencial := vSequencial + 1;
  vTexto := '20';
  vTexto := vTexto + fnc_Lpad(vMes + '/' + ceAnoIni.Text,' ',48);
  vTexto := vTexto + fnc_Lpad(' ', ' ',22);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo,vTexto);

  vSequencial := vSequencial + 1;
  vTexto := '20';
  vTexto := vTexto + fnc_Lpad(DMLancamentos_EBS.cdsEmpresacnpj_cpf.AsString,' ',48);
  vTexto := vTexto + fnc_Lpad(' ', ' ',22);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo,vTexto);

  vSequencial := vSequencial + 1;
  vTexto := '20';
  vTexto := vTexto + fnc_Lpad(DMLancamentos_EBS.mAuxiliarNomeFuncionario.AsString,' ',48);
  vTexto := vTexto + fnc_Lpad(' ', ' ',22);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo,vTexto);

  vSequencial := vSequencial + 1;
  vTexto := '20';
  vTexto := vTexto + fnc_Lpad(DMLancamentos_EBS.mAuxiliarNomeFuncao.AsString,' ',48);
  vTexto := vTexto + fnc_Lpad(' ', ' ',22);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo,vTexto);

  vSequencial := vSequencial + 1;
  vTexto := '20';
  vTexto := vTexto + fnc_Lpad(DMLancamentos_EBS.mAuxiliarData_Admissao.AsString,' ',48);
  vTexto := vTexto + fnc_Lpad(' ', ' ',22);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo,vTexto);
end;

procedure TfConsulta.prc_Gravar_Registro30;
var
  vTexto, vTexto2, x, y : String;

begin
  vGerar := False;
  vSequencial := vSequencial + 1;
  vTexto := '30';
  vTexto2 := fnc_Rpad(IntToStr(DMLancamentos_EBS.cdsProcEventoCOD_EVENTO.AsInteger),'0',3) + ' ' +
             TirarAcento(DMLancamentos_EBS.cdsProcEventoNOME_EVENTO.AsString);
  x := fnc_Monta_String(vTexto2, 35, 1, ' ');
  y := fnc_Monta_String(FormatFloat('R$ #,##0.00',DMLancamentos_EBS.cdsProcEventoVALOR.AsFloat),13,0,' ');
  vTexto2 := x + y;
  vTexto2 := fnc_Lpad(vTexto2,' ',48);
  vTexto := vTexto + vTexto2;
  vTexto := vTexto + fnc_Lpad(' ',' ',22);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  vValorLiquido := vValorLiquido + DMLancamentos_EBS.cdsProcEventoVALOR.AsFloat;
  Writeln(vArquivo, vTexto);
end;

procedure TfConsulta.prc_Gravar_Registro40;
var
  vTexto, vTexto2, x, y : String;
begin
  vGerar := True;
  vSequencial := vSequencial + 1;
  vTexto := '40';
  vTexto2 := fnc_Rpad(IntToStr(DMLancamentos_EBS.cdsProcEventoCOD_EVENTO.AsInteger),'0',3) + ' ' +
             TirarAcento(DMLancamentos_EBS.cdsProcEventoNOME_EVENTO.AsString);
  x := fnc_Monta_String(vTexto2, 35, 1, ' ');
  y := fnc_Monta_String(FormatFloat('R$ #,##0.00',DMLancamentos_EBS.cdsProcEventoVALOR.AsFloat),13,0,' ');
  vTexto2 := x + y;
  vTexto2 := fnc_Lpad(vTexto2,' ',48);
  vTexto := vTexto + vTexto2;
  vTexto := vTexto + fnc_Lpad(' ',' ',22);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  vValorLiquido := vValorLiquido - DMLancamentos_EBS.cdsProcEventoVALOR.AsFloat;
  Writeln(vArquivo, vTexto);
end;

procedure TfConsulta.prc_Gravar_Registro40_Vazio;
var
  vTexto, vTexto2, x, y : String;
begin
  vGerar := True;
  vSequencial := vSequencial + 1;
  vTexto := '40';
  vTexto2 := fnc_Rpad(IntToStr(0),'0',3) + ' ';
  x := fnc_Monta_String(vTexto2, 35, 1, ' ');
  y := fnc_Monta_String(FormatFloat('R$ #,##0.00',0),13,0,' ');
  vTexto2 := x + y;
  vTexto2 := fnc_Lpad(vTexto2,' ',48);
  vTexto := vTexto + vTexto2;
  vTexto := vTexto + fnc_Lpad(' ',' ',22);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo, vTexto);
end;


procedure TfConsulta.prc_Ler_ArquivoIni;
var
  ArquivoINI : TIniFile;
begin
  ArquivoINI := TIniFile.create(caminho);
  DirectoryEdit1.Text := ArquivoINI.ReadString('CONFIGURACOES','CAMINHO','');
  Edit1.Text := ArquivoINI.ReadString('CONFIGURACOES','CONVENIO','');
  Edit2.Text := ArquivoINI.ReadString('CONFIGURACOES','COD_EMPRESA','');
  Edit3.Text := ArquivoINI.ReadString('CONFIGURACOES','CABECALHO','');
  Edit4.Text := ArquivoINI.ReadString('CONFIGURACOES','RODAPE','');
end;

procedure TfConsulta.prc_Gravar_ArquivoIni;
var
  ArquivoINI : TIniFile;
begin
  ArquivoINI := TIniFile.create(Caminho);
  ArquivoINI.WriteString('CONFIGURACOES','CAMINHO',DirectoryEdit1.Text);
  ArquivoINI.WriteString('CONFIGURACOES','CONVENIO',Edit1.text);
  ArquivoINI.WriteString('CONFIGURACOES','COD_EMPRESA',Edit2.text);
  ArquivoINI.WriteString('CONFIGURACOES','CABECALHO',Edit3.Text);
  ArquivoINI.WriteString('CONFIGURACOES','RODAPE',Edit4.Text);
  ArquivoINI.Free;
end;

procedure TfConsulta.prc_Gravar_Registro90;
var
 vTexto : String;
begin
  vSequencial := vSequencial + 1;
  vTexto := '90';
  vTexto := vTexto + fnc_Lpad(fnc_RemoveAcento(Edit4.Text),' ',48);
  vTexto := vTexto + fnc_Lpad(' ',' ',22);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo, vTexto);
end;

procedure TfConsulta.prc_Gravar_Registro99;
var
  vTexto : String;
begin
  vSequencial := vSequencial + 1;
  vTexto := '99';
  vTexto := vTexto + fnc_Rpad(IntToStr(vContador10),'0',6);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  vTexto := vTexto + fnc_Lpad(' ',' ',56);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo,vTexto);
end;

procedure TfConsulta.prc_Gravar_Registro50;
var
  vTexto, vTexto2, x, y : String;
begin
  vSequencial := vSequencial + 1;
  vTexto := '50';
  vTexto2 := 'Valor Liquido ';
  x := fnc_Monta_String(vTexto2, 35, 1, ' ');
  y := fnc_Monta_String(FormatFloat('R$ #,##0.00',vValorLiquido),13,0,' ');
  vTexto2 := x + y;
  vTexto2 := fnc_Lpad(vTexto2,' ',48);
  vTexto := vTexto + vTexto2;
  vTexto := vTexto + fnc_Lpad(' ',' ',22);
  vTexto := vTexto + fnc_Rpad(IntToStr(vSequencial),'0',8);
  Writeln(vArquivo, vTexto);
  vValorLiquido := 0;
end;

function TfConsulta.fnc_Monta_String(x: String; Tamanho : Integer ; Tipo : Integer = 0;
  CompletarCom: String = ' '): String;
var
  t : Integer;
  s : String;
begin
  //Tipo = Lado que será completado.
  //Tipo 0 = Left(Esquerda)
  //Tipo 1 = Right(Direita)
  s := CompletarCom;
  t := tamanho - length(x);
  s := DupeString(s, t);

  if Tamanho < Length(x) then
    if Tipo = 0 then
      x := Copy(x, Length(x) - (Tamanho - 1), Tamanho)
    else
      x := Copy(x, 1, Tamanho);

   if Tipo = 0 then
     Result := s + x
   else
     Result := x + s;
end;

function TfConsulta.TirarAcento(texto: string): string;
var
  i : Integer;
begin
  //Texto := Trim(AnsiUpperCase(Texto));
  for i := 1 to Length(texto) do
  begin
    if Pos(Texto[i],' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
    begin
      case Texto[i] of
        'Á', 'À', 'Â', 'Ä', 'Ã': Texto[i] := 'A';
        'á', 'à', 'â', 'ä', 'ã': Texto[i] := 'a';
        'É', 'È', 'Ê', 'Ë': Texto[i] := 'E';
        'é', 'è', 'ê', 'ë': Texto[i] := 'e';
        'Í', 'Ì', 'Î', 'Ï': Texto[i] := 'I';
        'í', 'ì', 'î', 'ï': Texto[i] := 'i';
        'Ó', 'Ò', 'Ô', 'Ö', 'Õ': Texto[i] := 'O';
        'ó', 'ò', 'ô', 'ö', 'õ': Texto[i] := 'o';
        'Ú', 'Ù', 'Û', 'Ü': Texto[i] := 'U';
        'ú', 'ù', 'û', 'ü': Texto[i] := 'u';
        'Ç': Texto[i] := 'C';
        'ç': Texto[i] := 'c';
        'Ñ': Texto[i] := 'N';
        'ñ': Texto[i] := 'n';
        'º': Texto[i] := 'o';
      else
        Texto[i] := ' ';
      end;
    end;
  end;
  Texto := StringReplace(Texto, '&', 'e',[rfReplaceAll, rfIgnoreCase]);
  Texto := StringReplace(Texto, 'º', ' ',[rfReplaceAll, rfIgnoreCase]);
  Texto := StringReplace(Texto, 'ª', ' ',[rfReplaceAll, rfIgnoreCase]);
  //Result := AnsiUpperCase(Texto);
  Result := Texto;
end;

initialization
  RLConsts.SetVersion(3,72,'B');

end.

