.PHONY: default play upgrade run stop start-dev start-stage start-prod galaxy-install help

ifndef ENV
ENV=dev
endif

ifndef CMD
CMD=bash -c "uptime && echo Note: Remember to specify CMD=..."
endif

default: help

play: galaxy-install start-$(ENV)	## Update site
	@cd provision && ./play -i $(ENV) site.yml; cd ..

upgrade: start-$(ENV)			## Upgrade packages
	@cd provision && ./play -i $(ENV) upgrade.yml; cd ..

run: start-$(ENV)			## Run CMD=... on server
	@echo $(CMD)
	@cd provision && ./run all -i $(ENV) -a '$(CMD)' ; cd ..

start-dev:
	@cd provision && vagrant up devmain; cd ..

start-stage:
	@cd provision && vagrant up stagemain; cd ..

start-prod:
	@echo

stop:
	@cd provision && vagrant suspend $(ENV)main; cd ..

galaxy-install:
	@cd provision && ansible-galaxy install nickjj.fail2ban; cd ..
	@cd provision && ansible-galaxy install Datadog.datadog; cd ..
	@cd provision && ansible-galaxy install dochang.docker; cd ..

help:					## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
