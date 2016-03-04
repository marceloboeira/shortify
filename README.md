# Shortify
> URL Shortener

The complete assignment description is available at the [docs/ASSIGNMENT.md](docs/ASSIGNMENT.md) file.

Some information about stack choice is available at the [docs/COMMENTS.md](docs/COMMENTS.md) file.

### Setup

Assuming that you already had Mongo and Ruby/Bundler installed, you can just run: `bundle install`

### Running

Once everything is installed, you can run: `bin/rails server`

If you use `foreman`, there is two options available:

* `foreman start -f Procfile` - Runs the default web server
* `foreman start -f Procfile.dev` - Runs the webserver as also a mongodb server

Hopefully by now the project is running

---

## Usage

### API

Shortify has a built in REST like API, where you can manage your Shortened URLs.
More information at the [`docs/API.md`](docs/API.md) file.

