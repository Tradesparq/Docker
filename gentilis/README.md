### tradesparq/gentilis

#### Usage
```bash
sudo docker run -it -d --restart="always" --privileged=true --name="gentilis" --env=VIRTUAL_HOST=user.albicilla.com \
  -v /home/sirius/tradesparq/gentilis:/data/http -p 80:80 tradesparq/gentilis
```
