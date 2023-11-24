# Ilium API

## Install

Make sure you have a running postgres server with a role under your username.

Setup your database with:

```shell
bin/rails db:create db:migrate db:seed
```

You will need a token for JWT HMAC marshalling.

```shell
export AUTH_KEY=$(bin/rails secret)
```

Run your server as usual

```shell
bin/rails s
```

You can run your specs and lint your code with:

```shell
bin/bundle exec rspec
gem install rubocop
rubocop
```

(Rubocop wasn't included in the bundle to minimize time spent on config)

## Provision Heroku

Spin up a dyno with:

```shell
heroku apps:create ilium-api
heroku git:remote -a ilium-api
set APP ilium-api

git push heroku main
heroku addons:create heroku-postgresql:mini

heroku run rake db:migrate
heroku run rake db:seed
heroku ps:scale web=1
heroku config:set AUTH_KEY=(bin/rails secret)
```

You can test the API by logging in:

```shell
❯ http POST $API/authentication email='user@sample.com' password='test'
HTTP/1.1 201 Created
[...]

{
    "jwt": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJyb2xlIjoibWVtYmVyIn0.x0CGBU8JFJBwwYAcaeI99DPiUkL04fL5RA3g-dNcfkU",
    "role": "member"
}
```

## Documentation on the codebase

TBD
