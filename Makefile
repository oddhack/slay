# Copyright (c) 2016 Jon Leech
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Path to asciidoctor binary
ASCIIDOC = asciidoctor
# Path to dblatex binary.
DBLATEX = dblatex

SLAY = slay
FILES = $(SLAY).adoc joel.adoc

all: $(SLAY).html $(SLAY).pdf

$(SLAY).html: $(FILES)
	$(ASCIIDOC) -b html5 -o $@ $(SLAY).adoc

$(SLAY).pdf: $(FILES)
	$(ASCIIDOC) -b docbook $(SLAY).adoc
	$(DBLATEX) $(SLAY).xml
	-rm $(SLAY).xml

clean:
	-rm -f *.html
