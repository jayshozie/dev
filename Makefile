GREEN  := $(shell tput -Txterm setaf 2)
RESET  := $(shell tput -Txterm sgr0)

# i think i'll use it for building/rebuilding stuff

run:

install:

dry:

help:
	@echo ''
	@echo 'Usage:'
	@echo "  ${GREEN}make run [module]${RESET}   copy module's config files"
	@echo "  ${GREEN}make dry [module]${RESET}   test config files (for available modules)"
	@echo '  ${GREEN}make install${RESET}        install/update all modules'
	@echo '  ${GREEN}make help${RESET}           show this help'
	@echo ''

.PHONY: help install run dry
