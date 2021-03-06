# Shortify
> URL Shortener

The complete assignment description is available at the [docs/ASSIGNMENT.md](docs/ASSIGNMENT.md) file.

Some information about stack choice is available at the [docs/COMMENTS.md](docs/COMMENTS.md) file.

### Setup

Assuming that you already had Mongo and Ruby/Bundler installed, you can just run: `bundle install`

### Running

After complete the setup, you can run: `bin/rails server`

If you use `foreman`, there is two options available:

* `foreman start -f Procfile` - Runs the default web server
* `foreman start -f Procfile.dev` - Runs the webserver and also a local mongodb server

Hopefully by now the project is running

### Tests

To run the tests, make sure mongo is up, then: `bundle exec rspec`

---

## Usage

### API

Shortify has a built in REST like API, where you can manage your Shortened URLs.
More information at the [`docs/API.md`](docs/API.md) file.

### Gateway

The API provides a shortened url, based on the host of the environment. The host can be set in the settings file of each environment.

Basically every shortened url will look like: `http://shfy.ca/a32b7` -> `http://{HOST}/{SLUG}`

#### Redirecting

Currently the request status for the redirection is hardcoded to 301, mostly because it seems the right thing to do, once you have the DNS caching. That should be revisited if you want to have statistics of access.

---

### Benchmarks

The benchmarks were perfomed with [ApacheBench](https://httpd.apache.org/docs/2.4/programs/ab.html), running along with the webserver on my own local machine, the resuts were satisfatory, considering the stack and the conditions.

**Test params**:

- Goal: 10k requests
- Conditions: 100 concurrent requests
- Url: http://localhost:5000/example_slug
- Command line example: `ab -c 100 -n 10000 -g results.data http://localhost:5000/example`

**Results**
> results ploted with [gnuplot](http://gnuplot.info)

![benchmark](./docs/benchmark.png "benchmark")

## Roadmap

Some nice things I would like to implement in the future.

- [ ] API dynamic documentation (Swagger)
- [ ] API Authentication
- [ ] Custom Cache-control (Related to stats vs crawlers)
- [ ] Improve api-database reliability
- [ ] Improve benchmarks
- [ ] Pretty error pages
- [ ] Grape/Mongo validators (Url/Slug)
- [ ] Search/get by slug
- [ ] Expiration Date
- [ ] Statistics (Access, origins, user-agent...)
- [ ] Automated deploy
- [ ] Logging (GrapeLogger/Middleware logger)
- [ ] Monitoring (NewRelic)
