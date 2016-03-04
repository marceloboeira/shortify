# Shortify
> URL Shortener

### Setup

Assuming that you already had Mongo and Ruby/Bundler installed, you can just run: `bundle install`

### Running

Once everything is installed, you can run: `bin/rails server`

If you use `foreman`, there is two options available:

* `foreman start -f Procfile` - Runs the default web server
* `foreman start -f Procfile.dev` - Runs the webserver as also a mongodb server

Hopefully by now the project is running

---

## Commit Policy

```
feature: Add hat wobble
 ^--^  ^------------^
 |     |
 |     +-> Summary in present tense
 |
 +-------> Type: chore, doc, feature, fix, refactor, style, or test
```

### Available tags:

 * **chore**: Add oyster build script
 * **doc**: Explain hat wobble
 * **feature**: Add beta sequence
 * **fix**: Remove broken confirmation message
 * **refactor**: Share logic between 4d3d3d3 and flarhgunnstow
 * **style**: Convert tabs to spaces
 * **test**: Ensure Tayne retains clothing

> Based on [this](http://seesparkbox.com/foundry/semantic_commit_messages).
