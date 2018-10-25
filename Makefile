.PHONY: all gems

gems:
	bundle install

all: gems backups/raw_json/authenticated_user

backups/raw_json/authenticated_user:
	./backup-item.authenticated_user_items.sh

.PHONY: clean
clean:
	rm -rf backups
