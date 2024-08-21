# Devops Web App


### install the node packages in the web container:
```sh
→ docker-compose run web npm install
```
> Docker will download all of the images for the container.

### start up the app:
```sh
→ docker-compose up
```

###  NOTE this app uses two env variables:

- PORT: the listening PORT. With docker-compose, use port 5000 since this is hardcoded in docker-compose
- API_HOST: the full url to call the API app in the form of: http://API-url:API-Port

These two variables need to be set with docker-compose (WEB_PORT, API_HOST).

### Expected result:
The web interface should be accissble from any browser on the url:
```
http://<web hostname>:<web port, ex:5000>
``` 
It should open a web page with a timestamp as fetched from the API and a colorful logo. This would confirm the demo app is working and the connection to the API and DB has worked successfully.
