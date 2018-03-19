# snapcrashbug

This SNAP crashes when run under Wayland (Ubuntu 17.10)

I build it with docker + xenial

```
mkdir ~/test-snap-crash
cd ~/test-snap-crash
git clone https://github.com/giox069/snapcrashbug.git
cd snapcrashbug

sudo docker run --name cbbuilder -e LC_ALL=C.UTF-8 -e LANG=C.UTF-8 -v $PWD:$PWD -w $PWD -td ubuntu:xenial

sudo docker exec -i cbbuilder apt-get update -q
sudo docker exec -i cbbuilder apt-get upgrade -y
sudo docker exec -i cbbuilder apt-get install -y git-core snapcraft

sudo docker exec -i cbbuilder snapcraft

# cleanup
sudo docker exec -i cbbuilder snapcraft clean
sudo docker stop cbbuilder
sudo docker rm cbbuilder
```

