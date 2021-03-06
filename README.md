# vipaturks

**vipaturks** is an intelligent annotation platform embedded with active sample mining, based on the famous [DataTurks](https://github.com/DataTurks/DataTurks).

The abundant features and friendly UI are the main reason why we choose Dataturks.


##  Updating
- 2019.11.13, deploy original DataTurks, build docker image successfully.


## usage
build *.jar

```bash
cd hope
mvn package -DskipTests 
```

build docker image
```bash
docker build -t vipa/vipaturks:1.0 -f hope/docker/Dockerfile .
```

run image as container

```bash
docker run --name=vipa_turks -d -p 80:80 vipa/vipaturks:1.0  
```

## Reference

- DataTurks: https://github.com/DataTurks/DataTurks
- Active Sample Mining: [Cost-Effective Object Detection: Active Sample Mining with Switchable Selection Criteria](https://arxiv.org/pdf/1807.00147.pdf)
