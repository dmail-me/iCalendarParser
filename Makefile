SWIFTLINT = swiftlint

.PHONY: test
test: 
	swift test

.PHONY: lint
lint:
	$(SWIFTLINT) --strict

.PHONY: correct
correct:
	$(SWIFTLINT) autocorrect