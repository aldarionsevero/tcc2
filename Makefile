TARGET = TCC2_Luiz_Fernando_Oliveira.pdf

BIBTEX = bibtex
LATEX = pdflatex
DVIPS = dvips
PS2PDF = ps2pdf

VERSION = 0.1.0

FIXOS_DIR = fixos
FIXOS_SOURCES = informacoes.tex novosComandos.tex fichaCatalografica.tex \
		folhaDeAprovacao.tex pacotes.tex comandos.tex setup.tex	\
		listasAutomaticas.tex indiceAutomatico.tex

FIXOS_FILES = $(addprefix $(FIXOS_DIR)/, $(FIXOS_SOURCES))

EDITAVEIS_DIR = editaveis

EDITAVEIS_FILES = $(addprefix $(EDITAVEIS_DIR)/, *.tex) $(wildcard editaveis/conteudo/*.tex) 

MAIN_FILE = tcc.tex
DVI_FILE  = $(addsuffix .dvi, $(basename $(MAIN_FILE)))
AUX_FILE  = $(addsuffix .aux, $(basename $(MAIN_FILE)))
PS_FILE   = $(addsuffix .ps, $(basename $(MAIN_FILE)))
PDF_FILE  = $(addsuffix .pdf, $(basename $(MAIN_FILE)))

SOURCES = $(FIXOS_FILES) $(EDITAVEIS_FILES) $(wildcard figuras/*.*) $(wildcard editaveis/anexos-apendices/*.*)

NPROCS := 1
OS := $(shell uname)
export NPROCS

ifeq ($J,)

ifeq ($(OS),Linux)
  NPROCS := $(shell grep -c ^processor /proc/cpuinfo)
else ifeq ($(OS),Darwin)
  # NPROCS := $(shell system_profiler | awk '/Number of CPUs/ {print $$4}{next;}')
  NPROCS := 1
endif # $(OS)

else
  NPROCS := $J
endif # $J

.PHONY: all clean dist-clean

all: 
	@echo "Using" $(NPROCS) "jobs"
	@make $(TARGET) -j$(NPROCS)
	pdfinfo $(TARGET)
     
$(TARGET): $(MAIN_FILE) $(SOURCES) bibliografia.bib
	$(MAKE) clean
	$(LATEX) $(MAIN_FILE)
	$(BIBTEX) $(AUX_FILE) -ters
	#makeglossaries $(basename $(MAIN_FILE))
	#makeindex $(addsuffix .glo, $(basename $(MAIN_FILE))) -s $(addsuffix .ist, $(basename $(MAIN_FILE))) -t $(addsuffix .glg, $(basename $(MAIN_FILE))) -o $(addsuffix .gls, $(basename $(MAIN_FILE)))
	$(LATEX) -interaction=batchmode $(MAIN_FILE)
	$(LATEX) -interaction=batchmode $(MAIN_FILE)
	@mv $(PDF_FILE) $(TARGET)

clean:
	rm -f *~ *.dvi *.ps *.backup *.aux *.log
	rm -f *.lof *.lot *.bbl *.blg *.brf *.toc *.idx *.lol
	rm -f *.pdf
	
dist: clean
	tar vczf start-x_latex-$(VERSION).tar.gz *

dist-clean: clean
	rm -f $(PDF_FILE) $(TARGET)
