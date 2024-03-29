BASEHEADSDIR=$(shell pwd)
HEADSDIR=wdir1
CONTNAME=heads_$(HEADSDIR)
SRCDIR=$(BASEHEADSDIR)/$(HEADSDIR)

DOCKERDIR=$(BASEHEADSDIR)/builder
DOCKERUIDGID=--user $(shell id -u):$(shell id -g)
#DOCKERUIDGID=

#REPO=https://github.com/Nitrokey/heads.git
REPO=https://github.com/osresearch/heads.git


all:
	-docker stop $(CONTNAME)
	-docker rm $(CONTNAME)
	docker run -ti $(DOCKERUIDGID) --name $(CONTNAME) --mount type=bind,source=$(SRCDIR),target=/heads heads-builder

image:
	docker build -t heads-builder $(DOCKERDIR)

get-heads:
	git clone $(REPO) $(HEADSDIR)

get-heads-librem-mini:
	git clone https://github.com/Nitrokey/heads.git $(HEADSDIR)
	pushd $(HEADSDIR)
	git checkout librem_mini
	popd
