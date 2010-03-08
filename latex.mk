MAIN_BASENAMES ?=
INPUT_EXTENSION ?= .tex
OUTPUT_EXTENSION ?= .pdf # Don't forget to change $(LATEX_BUILD_OPTIONS) for different output formats

MAKEFILE_EXTENSION ?= .mk

# A list of *all* LaTeX build dependencies.
# If you give only the basename (not an actual filename), the dependency will be converted. If you give the full name (an actual filename that already exists), it will not be converted.
DEPENDENCIES ?=

# How to build the LaTeX file.
LATEX_BUILD_COMMAND ?= rubber
LATEX_BUILD_OPTIONS ?= --force --pdf --short --quiet
export TEXINPUTS=.:/home/ankur/latex//:/home/ankur/.texmf-config//:

# How to generate the makefiles for the dependencies.
LATEXGENMAKE ?= latexgenmake
LATEXGENMAKE_OPTIONS ?=

# How to show the PDF.
PDF_VIEWER ?= evince

# The working directory where the build process will happen.
OBJ_DIR ?= tmp

all: $(addsuffix $(OUTPUT_EXTENSION),$(MAIN_BASENAMES)) showpdf

clean:
	rm -rf $(OBJ_DIR)

clean-makefiles:
	rm $(addsuffix $(MAKEFILE_EXTENSION),$(addprefix $(OBJ_DIR)/,$(DEPENDENCIES)))

showpdf: $(addprefix showpdf-,$(addsuffix $(OUTPUT_EXTENSION),$(MAIN_BASENAMES)))

# For each main file, the phony target showpdf-something.pdf opens a PDF viewer for something.pdf
$(addprefix showpdf-,$(addsuffix $(OUTPUT_EXTENSION),$(MAIN_BASENAMES))): showpdf-%: %
	if [ ! `pgrep -fx '$(PDF_VIEWER) $<'` ]; then $(PDF_VIEWER) $< >/dev/null 2>&1 & fi

.PHONY: all clean dep clean-makefiles showpdf $(addprefix showpdf-,$(addsuffix $(OUTPUT_EXTENSION),$(MAIN_BASENAMES)))

# Creates the final output file in the same directory as the main LaTeX file.
$(addsuffix $(OUTPUT_EXTENSION),$(MAIN_BASENAMES)): %: $(OBJ_DIR)/%
	cp $< $@

# Builds the output file in the objdir.
$(addprefix $(OBJ_DIR)/,$(addsuffix $(OUTPUT_EXTENSION),$(MAIN_BASENAMES))): %$(OUTPUT_EXTENSION): %$(INPUT_EXTENSION) $(addprefix $(OBJ_DIR)/,$(DEPENDENCIES))
	@mkdir -p $(OBJ_DIR)
	cd $(OBJ_DIR); $(LATEX_BUILD_COMMAND) $(LATEX_BUILD_OPTIONS) $(patsubst $(OBJ_DIR)/%,%,$<)

# For each dependency, generates a makefile to handle it. Here are the possible cases:
# 1. If the dependency's full name, with extension, is given, then the makefile will be empty.
# 2. If the dependency's basename is given, then
# 	a. If the script doesn't know how to convert the most source-like extension to a LaTeX known file format, then the makefile will just point the dependency's basename to this file, performing no conversion.
#	b. If the script does know how to convert it, then it will do 2a, and it will add the instructions for converting the source file to a LaTeX known format in the objdir.
$(addsuffix $(MAKEFILE_EXTENSION),$(addprefix $(OBJ_DIR)/,$(DEPENDENCIES))):
	@mkdir -p $(dir $@)
	$(LATEXGENMAKE) $(LATEXGENMAKE_OPTIONS) $(patsubst $(OBJ_DIR)/%,%,$(basename $@)) $(OBJ_DIR) > $@

# For cases 1 and 2a above, where no actual commands are given to create the file in the objdir, this copies the file in the sourcedir into the objdir.
# For cp, the "-r --dereference" causes directories and links to be copied as well.
$(OBJ_DIR)/%: %
	@mkdir -p $(OBJ_DIR)
	cp -r --dereference $< $@

# Includes the dependency makefiles, but only if we're not cleaning (to avoid building them only to delete them immediately).
# See http://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_node/make_88.html#SEC87
ifeq ($(findstring clean,$(MAKECMDGOALS)),)
-include $(addsuffix $(MAKEFILE_EXTENSION),$(addprefix $(OBJ_DIR)/,$(DEPENDENCIES)))
endif

