library projectLibVrbCryptIni;

{ -----------------------------------------------------------------------------
  MIT License

  Copyright (c) 2025 Vinícius Ruan Brandalize

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
------------------------------------------------------------------------------- }

{$mode objfpc}{$H+}

uses
  Classes,
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  ucryptini, Interfaces, SysUtils;

var
  INI: TCryptIniFile;

  procedure inicializar(Arquivo, key, MD5: PChar); stdcall; Export;
  begin
    INI           := TCryptIniFile.Create(Arquivo);
    INI.KeyPhrase := key;
    INI.MD5Hash   := MD5;
  end;

  procedure finalizar(); stdcall; Export;
  begin
    if Assigned(INI) then
      INI.Free;
  end;

  procedure LerString(Secao, Identificador: PChar; out Valor: String); stdcall; Export;
  begin
    Valor := INI.ReadString(Secao, Identificador, '');
  end;

  procedure LerInteger(Secao, Identificador: PChar; out Valor: Integer); stdcall; Export;
  begin
    Valor := INI.ReadInteger(Secao, Identificador, 0);
  end;

  procedure LerData(Secao, Identificador: PChar; out Valor: TDate); stdcall; Export;
  begin
    Valor := INI.ReadDate(Secao, Identificador, Now);
  end;

  procedure LerHora(Secao, Identificador: PChar; out Valor: TTime); stdcall; Export;
  begin
    Valor := INI.ReadTime(Secao, Identificador, Now);
  end;

  procedure LerDataHora(Secao, Identificador: PChar; out Valor: TDateTime); stdcall; Export;
  begin
    Valor := INI.ReadDateTime(Secao, Identificador, Now);
  end;

  procedure LerBoolean(Secao, Identificador: PChar; out Valor: Boolean); stdcall; Export;
  begin
    Valor := INI.ReadBool(Secao, Identificador, false);
  end;

  procedure EscreverString(Secao, Identificador, Valor: PChar); stdcall; Export;
  begin
    INI.WriteString(Secao, Identificador, Valor);
  end;

  procedure EscreverInteger(Secao, Identificador: PChar; Valor: Integer); stdcall; Export;
  begin
    INI.WriteInteger(Secao, Identificador, Valor);
  end;

  procedure EscreverData(Secao, Identificador: PChar; Valor: TDate); stdcall; Export;
  begin
    INI.WriteDate(Secao, Identificador, Valor);
  end;

  procedure EscreverHora(Secao, Identificador: PChar; Valor: TTime); stdcall; Export;
  begin
    INI.WriteTime(Secao, Identificador, Valor);
  end;

  procedure EscreverDataHora(Secao, Identificador: PChar; Valor: TDateTime); stdcall; Export;
  begin
    INI.WriteDateTime(Secao, Identificador, Valor);
  end;

  procedure EscreverBoolean(Secao, Identificador: PChar; Valor: Boolean); stdcall; Export;
  begin
    INI.WriteBool(Secao, Identificador, Valor);
  end;

  procedure ExisteSecao(Secao: PChar; out Existe: Boolean); stdcall; Export;
  begin
    Existe := INI.SectionExists(Secao);
  end;

  procedure ExisteValor(Secao, Identificador: PChar; out Existe: Boolean); stdcall; Export;
  begin
    Existe := INI.ValueExists(Secao, Identificador);
  end;

exports
  inicializar,
  finalizar,
  LerString,
  LerInteger,
  LerData,
  LerHora,
  LerDataHora,
  LerBoolean,
  EscreverString,
  EscreverInteger,
  EscreverData,
  EscreverHora,
  EscreverDataHora,
  EscreverBoolean,
  ExisteSecao,
  ExisteValor;

{$R *.res}

begin



end.

