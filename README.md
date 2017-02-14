# example-quickstart

Simple example app with [Percy](https://percy.io) visual regression tests.

## Usage:

```bash
$ git clone https://github.com/percy/example-quickstart.git
$ cd example-quickstart/

$ export PERCY_TOKEN=...
$ export PERCY_PROJECT=...
$ gem install bundler  # Only if you don't have bundler installed.
$ bundle install

$ bundle exec ruby visual-tests.rb
```

