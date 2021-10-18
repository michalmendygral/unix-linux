# Info
The purpose is to run processes parallel and collect logs into one file  

## Installing / Getting started

[nohup](https://www.geeksforgeeks.org/nohup-command-in-linux-with-examples/ )

## Configuration/Run

```
$ echo "" > nohup.file & nohup ./hello_world.sh >> nohup.file & nohup ./witaj_swiecie.sh >> nohup.file & echo "start"
$ tail nohup.file -f
```

OR using wait 

```
 echo "" > nohup.file & nohup ./hello_world.sh >> nohup.file & nohup ./witaj_swiecie.sh >> nohup.file & wait; ./end.sh >> nohup.file
```

## Worth to note 
