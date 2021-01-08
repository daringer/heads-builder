# heads-builder - Simple Docker-based HEADS building

The following stuff can be done using this micro-repository.

* get a heads checkout
```
make get-heads
```

* build the docker image used for building (make sure your docker daemon is up and running)
```
make image
```

* change into the heads-builder docker and build heads
```
make 
# you will end inside the docker
cd /heads
make BOARD=the_board_you_would_like_to_build_for
```
