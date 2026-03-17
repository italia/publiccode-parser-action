# publiccode.yml parser action for GitHub

[![Join the #publiccode channel](https://img.shields.io/badge/Slack%20channel-%23publiccode-blue.svg?logo=slack)](https://developersitalia.slack.com/messages/CAM3F785T)
[![Get invited](https://slack.developers.italia.it/badge.svg)](https://slack.developers.italia.it/)

A GitHub action based upon the [Go parser and validator](https://github.com/italia/publiccode-parser-go)
for [publiccode.yml](https://github.com/publiccodeyml/publiccode.yml) files.

`publiccode.yml` is an international standard for describing public software, which
should be placed at the root of Free/Libre and Open Source software repositories.

This parser performs syntactic and semantic validation according to the
[official spec](https://yml.publiccode.tools).

## Examples

Include this action in your repo by creating `.github/workflows/publiccode-yml-validation.yml`
and edit where needed:

```yml
on: [pull_request]

jobs:
  publiccode_yml_validation:
    runs-on: ubuntu-latest
    name: publiccode.yml validation
    steps:
    - uses: actions/checkout@v5
    - uses: italia/publiccode-parser-action@v1
      with:
        publiccode: 'publiccode.yml'
```

### Comments in the PR

If you want this action to report results as inline comments in the pull request:

```yml
on: [pull_request]

jobs:
  publiccode_yml_validation:
    runs-on: ubuntu-latest
    name: publiccode.yml validation
    steps:
    - uses: actions/checkout@v5
    - uses: italia/publiccode-parser-action@v1
      with:
        publiccode: 'publiccode.yml' # relative path to your publiccode.yml
        comment-on-pr: true
      env:
        REVIEWDOG_GITHUB_API_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### Skipping network checks

To disable all checks that reference external resources, including remote URLs
and local files (e.g. `logo: img/logo.svg`, `screenshots: [img/screen.png]`):

```yml
- uses: italia/publiccode-parser-action@v1
  with:
    publiccode: 'publiccode.yml'
    no-external-checks: true
```

To only skip checks that require network connections (URL reachability and
oEmbed) while still checking that local files exist in the repository:

```yml
- uses: italia/publiccode-parser-action@v1
  with:
    publiccode: 'publiccode.yml'
    no-network: true
```

## Contributing

Contributing is always appreciated.
Feel free to open issues, fork or submit a Pull Request.
If you want to know more about how to add new fields, check out [CONTRIBUTING.md](CONTRIBUTING.md).
In order to support other country-specific extensions in addition to Italy some
refactoring might be needed.

## Maintainers

This software is maintained by the
[Developers Italia](https://developers.italia.it/) team.

## License

© 2020-present Dipartimento per la Trasformazione Digitale - Presidenza del Consiglio dei
Ministri

Licensed under the EUPL v1.2.
The version control system provides attribution for specific lines of code.

## Remarks

This GitHub Action is published in the GitHub Marketplace.
As such, you can find the [Terms of Service here](https://docs.github.com/en/free-pro-team@latest/github/site-policy/github-marketplace-terms-of-service).
Also, [here](https://docs.github.com/en/free-pro-team@latest/github/site-policy/github-marketplace-developer-agreement)
you can find the GitHub Marketplace Developer Agreement.
