# snapcrashbug

This SNAP is a simple GTK application which crashes when run under Wayland (Ubuntu 17.10)

Download the .snap file and install it with
```
snap install prova1_0.1_amd64.snap --dangerous
```
Execute it
```
prova1
```
And enjoy the crash
```
journalctl -xe
```
 prova1[2476]: segfault at 0 ip 00007f0c8dcc9dd6 sp 00007ffcd6197dd0 error 4 in libwayland-client.so.0.3.0[7f0c8dcc4000+c000]


TO BUILD IT:

I build it with docker + xenial, by copying and pasting one line at a time

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

