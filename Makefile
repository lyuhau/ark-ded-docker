
.PHONY: build

build:
	docker build -t lyuhau/ark-ded:latest .

publish:
  docker push lyuhau/ark-ded:latest
