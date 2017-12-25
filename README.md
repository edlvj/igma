# Igma

##Requirements
```
ruby 2.3.1
postgresql
redis
```
## Setup

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% bundle exec hanami db prepare

% HANAMI_ENV=test bundle exec hanami db prepare
```
How to seed to db:

```
% bundle exec rake seed
```

How to run the development server:

```
% foreman start
```

How to run tests:

```
% bundle exec rake
```

Instagram Api on sandbox mode and available only one user 'edwardlovejoy'