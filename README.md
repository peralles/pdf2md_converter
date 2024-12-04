# Document to Markdown Converter

Um conversor robusto que transforma diversos tipos de documentos em arquivos Markdown, incluindo PDFs, DOCX, PPTX, Excel, TXT e RTF, com suporte especial para PDFs protegidos e digitalizados.

## Características

- Suporte para múltiplos formatos:
  - PDF (incluindo PDFs protegidos e digitalizados)
  - DOCX (documentos Word)
  - PPTX (apresentações PowerPoint)
  - Excel (.xlsx, .xls)
  - TXT (arquivos de texto)
  - RTF (Rich Text Format)

- Recursos avançados para PDFs:
  - Múltiplos métodos de extração de texto
  - Suporte a PDFs protegidos
  - OCR para PDFs digitalizados
  - Detecção automática do melhor método de extração

- Recursos para Excel:
  - Suporte a múltiplas planilhas
  - Conversão de tabelas para formato Markdown
  - Preservação de nomes das planilhas
  - Suporte a formatos antigos (.xls) e novos (.xlsx)

- Sistema de relatórios detalhados:
  - Rastreamento de arquivos convertidos com sucesso
  - Detalhamento de falhas de conversão
  - Logs detalhados do processo

## Pré-requisitos

1. Python 3.11 ou superior
2. Tesseract OCR (para suporte a PDFs digitalizados)
3. Poppler (necessário para pdf2image)

### Configurando o Ambiente Virtual

1. Crie um ambiente virtual:
```bash
python -m venv venv
```

2. Ative o ambiente virtual:

No macOS/Linux:
```bash
source venv/bin/activate
```

No Windows:
```bash
.\venv\Scripts\activate
```

3. Após ativar o ambiente virtual, seu prompt deve mostrar `(venv)` no início.

### Instalação no macOS

1. Instale o Tesseract OCR e os pacotes de idiomas:
```bash
brew install tesseract tesseract-lang
```

2. Instale o Poppler:
```bash
brew install poppler
```

3. Instale as dependências Python:
```bash
pip install -r requirements.txt
```

## Uso

Execute o script especificando os diretórios de entrada e saída:

```bash
python document2md.py --input_dir <diretório_entrada> --output_dir <diretório_saída>
```

### Exemplo:
```bash
python document2md.py --input_dir ~/Documents/files --output_dir ~/Documents/markdown
```

## Uso com Docker

Se você preferir usar Docker, fornecemos uma solução containerizada que inclui todas as dependências necessárias.

### Pré-requisitos para Docker
- Docker
- Docker Compose

### Executando com Docker

Use o script fornecido para executar o conversor:

```bash
./run_converter.sh <diretório_entrada> <diretório_saída>
```

Exemplo:
```bash
./run_converter.sh ~/Documents/files ~/Documents/markdown
```

O script irá:
1. Construir a imagem Docker com todas as dependências
2. Montar os diretórios de entrada e saída no container
3. Executar a conversão
4. Os arquivos convertidos estarão disponíveis no diretório de saída especificado

### Executando Manualmente com Docker Compose

Alternativamente, você pode definir as variáveis de ambiente e usar o docker-compose diretamente:

```bash
export INPUT_DIR=/caminho/para/entrada
export OUTPUT_DIR=/caminho/para/saida
docker-compose up --build
```

## Processo de Conversão

O script utiliza diferentes métodos para cada tipo de documento:

1. **PDFs**
   - PyMuPDF (método principal)
   - PDFPlumber (método alternativo)
   - OCR com Tesseract (para PDFs digitalizados)

2. **Excel**
   - Pandas para leitura de dados
   - Conversão automática para tabelas Markdown
   - Preservação da estrutura de múltiplas planilhas

3. **Outros Formatos**
   - DOCX: python-docx
   - PPTX: python-pptx
   - RTF: striprtf
   - TXT: leitura direta

## Saída

O script gera:

1. **Arquivos Markdown**
   - Um arquivo .md para cada documento convertido
   - Mantém a estrutura de diretórios original
   - Preserva títulos e formatação básica
   - Tabelas formatadas para Excel

2. **Relatório de Conversão**
   - Lista de arquivos convertidos com sucesso
   - Detalhes de falhas de conversão
   - Arquivos ignorados e motivos
   - Timestamp para rastreamento

3. **Logs Detalhados**
   - Arquivo conversion.log
   - Informações sobre cada etapa do processo
   - Mensagens de erro detalhadas
   - Útil para diagnóstico de problemas

## Tratamento de Erros

O script lida com vários cenários de erro:

- PDFs protegidos com senha
- Documentos corrompidos
- PDFs digitalizados
- Arquivos vazios
- Formatos não suportados

## Limitações

- OCR requer instalação do Tesseract
- Alguns PDFs fortemente protegidos podem não ser convertidos
- A qualidade do OCR depende da qualidade da digitalização
- Alguns elementos de formatação complexa podem ser perdidos

## Contribuindo

Contribuições são bem-vindas! Por favor, sinta-se à vontade para submeter pull requests ou reportar problemas.
