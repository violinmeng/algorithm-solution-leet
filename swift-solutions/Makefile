

lint:
	swift run --package-path BuildTools swiftlint
	
format:
	swift run -c release --package-path BuildTools swiftformat .
	
precommit: lint format

.PHONY: lint format precommit
