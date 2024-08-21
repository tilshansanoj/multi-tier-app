# Devops API App


### install the node packages in the web container:
```sh
→ docker-compose run api npm install
```
> Docker will download all necessary images for the container.

### start up the app:
```sh
→ docker-compose up
```

###  NOTE this app uses two env variables:

- PORT: the listening PORT. With docker-compose, use port 5000 since this is hardcoded in docker-compose.
- DB: the postgresql url to connect in the form of: postgres://username:password@dbhostname:dbport/database

These two variables need to be set with docker-compose (API_PORT, API_DB).

### Expected result:
The api should be accessible on the url:   
```
http://<api hostname>:<api port>/api/status
```
The page should output the date as selected from the DB. This would confirm the call to the API is working and the API connected successfully to the DB.
