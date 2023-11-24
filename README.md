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

## Documentation on the codebase

TBD
