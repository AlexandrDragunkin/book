html:
python "c:\VENV37\Lib\site-packages\asciidoc-py3-master\asciidoc.py" -a stylesheet="themes/asciidoctor-clean.custom.css" -a source-highlighter=pygments  -a pygments-style=friendly -a '!example-caption'  -a sectanchors  book_ru.asciidoc





	asciidoctor \
		-a stylesheet=theme/asciidoctor-clean.custom.css \
		-a source-highlighter=pygments \
		-a pygments-style=friendly \
		-a '!example-caption' \
		-a sectanchors \
		*.asciidoc

test: html
	pytest tests.py --tb=short -vv

update-code:
	# git submodule update --init --recursive
	cd code && git fetch
	./checkout-branches-for-ci.py

count-todos:
	ls *.asciidoc | xargs grep -c TODO | sed  s/:/\\t/

diagrams: html
	./render-diagrams.py $(CHAP)
