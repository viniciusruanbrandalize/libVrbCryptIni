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

  function LerString(Arquivo, Chave, MD5, Secao, Identificador, Default: PChar): PChar; stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      Result := PChar(INI.ReadString(Secao, Identificador, Default));
    finally
      FreeAndNil(INI);
    end;
  end;

  function LerString255(Arquivo, Chave, MD5, Secao, Identificador, Default: PChar): ShortString; stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      Result := INI.ReadString(Secao, Identificador, Default);
    finally
      FreeAndNil(INI);
    end;
  end;

  function LerInteger(Arquivo, Chave, MD5, Secao, Identificador: PChar; Default: Integer): Integer; stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      Result := INI.ReadInteger(Secao, Identificador, Default);
    finally
      FreeAndNil(INI);
    end;
  end;

  function LerData(Arquivo, Chave, MD5, Secao, Identificador: PChar; Default: TDate): TDate; stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      Result := INI.ReadDate(Secao, Identificador, Default);
    finally
      FreeAndNil(INI);
    end;
  end;

  function LerHora(Arquivo, Chave, MD5, Secao, Identificador: PChar; Default: TTime): TTime; stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      Result := INI.ReadTime(Secao, Identificador, Default);
    finally
      FreeAndNil(INI);
    end;
  end;

  function LerDataHora(Arquivo, Chave, MD5, Secao, Identificador: PChar; Default: TDateTime): TDateTime; stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      Result := INI.ReadDateTime(Secao, Identificador, Default);
    finally
      FreeAndNil(INI);
    end;
  end;

  function LerBoolean(Arquivo, Chave, MD5, Secao, Identificador: PChar; Default: Boolean): Boolean; stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      Result := INI.ReadBool(Secao, Identificador, Default);
    finally
      FreeAndNil(INI);
    end;
  end;

  procedure EscreverString(Arquivo, Chave, MD5, Secao, Identificador, Valor: PChar); stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      INI.WriteString(Secao, Identificador, Valor);
    finally
      FreeAndNil(INI);
    end;
  end;

  procedure EscreverInteger(Arquivo, Chave, MD5, Secao, Identificador: PChar; Valor: Integer); stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      INI.WriteInteger(Secao, Identificador, Valor);
    finally
      FreeAndNil(INI);
    end;
  end;

  procedure EscreverData(Arquivo, Chave, MD5, Secao, Identificador: PChar; Valor: TDate); stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      INI.WriteDate(Secao, Identificador, Valor);
    finally
      FreeAndNil(INI);
    end;
  end;

  procedure EscreverHora(Arquivo, Chave, MD5, Secao, Identificador: PChar; Valor: TTime); stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      INI.WriteTime(Secao, Identificador, Valor);
    finally
      FreeAndNil(INI);
    end;
  end;

  procedure EscreverDataHora(Arquivo, Chave, MD5, Secao, Identificador: PChar; Valor: TDateTime); stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      INI.WriteDateTime(Secao, Identificador, Valor);
    finally
      FreeAndNil(INI);
    end;
  end;

  procedure EscreverBoolean(Arquivo, Chave, MD5, Secao, Identificador: PChar; Valor: Boolean); stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      INI.WriteBool(Secao, Identificador, Valor);
    finally
      FreeAndNil(INI);
    end;
  end;

  function ExisteSecao(Arquivo, Chave, MD5, Secao: PChar): Boolean; stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      Result := INI.SectionExists(Secao);
    finally
      FreeAndNil(INI);
    end;
  end;

  function ExisteValor(Arquivo, Chave, MD5, Secao, Identificador: PChar): Boolean; stdcall; Export;
  begin
    INI := TCryptIniFile.Create(Arquivo);
    try
      INI.KeyPhrase := Chave;
      INI.MD5Hash   := MD5;
      Result := INI.ValueExists(Secao, Identificador);
    finally
      FreeAndNil(INI);
    end;
  end;

exports
  LerString,
  LerString255,
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

