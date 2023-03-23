
.PHONY: build

all: base fresh incremental

base:
	docker build -f base.Dockerfile -t lyuhau/ark-ded:base .

fresh:
	docker build -f fresh.Dockerfile -t lyuhau/ark-ded:fresh .
	docker tag lyuhau/ark-ded:fresh lyuhau/ark-ded:incremental
	docker tag lyuhau/ark-ded:fresh lyuhau/ark-ded:latest

incremental:
	docker build -f incremental.Dockerfile -t lyuhau/ark-ded:incremental .
	docker tag lyuhau/ark-ded:incremental lyuhau/ark-ded:latest

publish:
	docker push lyuhau/ark-ded:latest
