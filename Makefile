.PHONY: all

all: schema.json
	bundle install
	echo WIP

.PHONY: clean
clean:
	rm -f schema.json

schema.json:
	wget -qO schema.json https://qiita.com/api/v2/schema
