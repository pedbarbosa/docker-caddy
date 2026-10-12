# docker-caddy
Caddy build with Cloudflare DNS module

`./rebuild` builds, tests and publishes the image with [docker-image-refresh](https://gist.github.com/pedbarbosa/5a6ea23c8bcaf90f063eb0a082277d79), which runs `./test <image>` before tagging it `latest`.

The [Publish image](.github/workflows/publish.yml) workflow checks the published image daily and runs `./rebuild` when it's out of date: new commits (other than docs and CI), a new `caddy` base image, Alpine package updates, or a new release of a module built in with `--with`. It can also be run by hand, with `force` to publish regardless. It needs a `DOCKERHUB_TOKEN` repository secret, a Docker Hub access token with Read, Write and Delete access so old tags can be pruned, and sends failures to the Slack incoming webhook in the `SLACK_WEBHOOK_URL` secret.
