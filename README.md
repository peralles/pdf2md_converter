# PDF to Markdown Converter

Um conversor robusto que transforma documentos PDF, DOCX, PPTX, TXT e RTF em arquivos Markdown, com suporte especial para PDFs protegidos e digitalizados.

## Características

- Suporte para múltiplos formatos:
  - PDF (incluindo PDFs protegidos e digitalizados)
  - DOCX (documentos Word)
  - PPTX (apresentações PowerPoint)
  - TXT (arquivos de texto)
  - RTF (Rich Text Format)

- Recursos avançados para PDFs:
  - Múltiplos métodos de extração de texto
  - Suporte a PDFs protegidos
  - OCR para PDFs digitalizados
  - Detecção automática do melhor método de extração

- Sistema de relatórios detalhados:
  - Rastreamento de arquivos convertidos com sucesso
  - Detalhamento de falhas de conversão
  - Logs detalhados do processo

## Pré-requisitos

1. Python 3.11 ou superior
2. Tesseract OCR (para suporte a PDFs digitalizados)
3. Poppler (necessário para pdf2image)

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
python pdf2md.py --input_dir <diretório_entrada> --output_dir <diretório_saída>
```

### Exemplo:
```bash
python pdf2md.py --input_dir ~/Documents/pdfs --output_dir ~/Documents/markdown
```

## Processo de Conversão

O script utiliza uma abordagem em camadas para extrair texto dos PDFs:

1. **PyMuPDF (método principal)**
   - Rápido e preciso
   - Melhor para PDFs bem formatados
   - Preserva formatação básica

2. **PDFPlumber (método alternativo)**
   - Usado quando PyMuPDF falha
   - Melhor para alguns PDFs protegidos
   - Bom para layouts complexos

3. **OCR com Tesseract (último recurso)**
   - Usado para PDFs digitalizados
   - Converte PDFs em imagens
   - Extrai texto das imagens
   - Suporte a múltiplos idiomas

## Saída

O script gera:

1. **Arquivos Markdown**
   - Um arquivo .md para cada documento convertido
   - Mantém a estrutura de diretórios original
   - Preserva títulos e formatação básica

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
