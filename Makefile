TESTS := tests/argument-parser-sample-test.sh
SHUNIT2 := vendors/shunit2/src/shunit2

help:
	@echo 'Usage:'
	@echo '    help  show this screen and exit'
	@echo '    test  run unit test'

test: $(SHUNIT2) $(TESTS)
	sh $^

$(SHUNIT2):
	git submodule init
	git submodule update

