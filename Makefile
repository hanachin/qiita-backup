.PHONY: all

all:
	bundle install
	./backup-item.authenticated_user_items.sh

.PHONY: clean
clean:
	rm -rf backups
