# vagrant-mongodb

|host |role|IP address    |
|-----|----|--------------|
|mongo0|Primary  |192.168.33.200|
|mongo1|Secondary|192.168.33.201|
|mongo2|Hidden   |192.168.33.202|

## Usage

```
$ vagrant up
$ vagrant ssh mongo0
vagrant@mongo0:~$ cat /vagrant/repl.sh | mongo
```

## Dependency
- [vagrant-hostmanager](https://github.com/devopsgroup-io/vagrant-hostmanager)
