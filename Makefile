all: deploy

.PHONY: deploy
deploy:
	$(MAKE) -C torb/webapp/go
	sudo systemctl restart torb.go
