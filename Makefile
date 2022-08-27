install:
<<<<<<< HEAD
	pip	install	--upgrade	pip	&&\
	pip	install	-r	requirements.txt
=======
^Ipip	install	--upgrade	pip	&&\t
^Ipip	install	-r	requirements.txt
>>>>>>> a0627b344e39924315e64a58ace7d1e73e0fdec2

test:
	python -m pytest -vv test_hello.py


lint:
	pylint --disable=R,C hello.py

all: install lint test