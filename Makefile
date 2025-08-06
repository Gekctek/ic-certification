.PHONY: check docs test check-strict

check:
	find src -type f -name '*.mo' -print0 | xargs -0 $(shell mops toolchain bin moc) $(shell mops sources) --check

all: check-strict docs test

check-strict:
	find src -type f -name '*.mo' -print0 | xargs -0 $(shell mops toolchain bin moc) $(shell mops sources) -Werror --check
docs:
	$(shell dirname $(shell mops toolchain bin moc))/mo-doc
test:
	mops test
