
.PHONY: build start

build:
	docker-compose build

start:
	INSTANCE=instance1 SAVE=$$(grep instance1/config/instance-opts.ini -oPe '^AltSaveDirectoryName=\K.+' || echo -n SavedArks) docker-compose up -d ark-ded
