install:
^Ipip	install	--upgrade	pip	&&\t
^Ipip	install	-r	requirements.txt

test:
^Ipython -m pytest -vv test_hello.py


lint:
^Ipylint --disable=R,C hello.py

all: install lint test
