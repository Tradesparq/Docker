#### Start with

```bash
sudo docker run -it -d --restart="always" --name proxy -p 80:80 \
  --env API_ADDRESS="http://192.168.15.123:3020" \
  --env USER_ADDRESS="http://192.168.15.123:8080" \
  --env PUBLIC_ADDRESS="http://192.168.15.123:3000" \
  tradesparq/nginx-proxy
```

#### Or

```bash
sudo docker run -it -d --restart="always" --name proxy -p 80:80 \
  --link api:api \
  --link gentilis:user \
  --link public:public \
  tradesparq/nginx-proxy
```
