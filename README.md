# publiccode.yml parser action for Github

[![Join the #publiccode channel](https://img.shields.io/badge/Slack%20channel-%23publiccode-blue.svg?logo=slack)](https://developersitalia.slack.com/messages/CAM3F785T)
[![Get invited](https://slack.developers.italia.it/badge.svg)](https://slack.developers.italia.it/) [![CircleCI](https://circleci.com/gh/italia/publiccode-parser-action.svg?style=svg)](https://circleci.com/gh/italia/publiccode-parser-action)

A Github action based upon the [Go parser and validator](https://github.com/italia/publiccode-parser-go)
for [publiccode.yml](https://github.com/italia/publiccode.yml) files.

`publiccode.yml` is an international standard for describing public software, which
should be placed at the root of Free/Libre and Open Source software repositories.

This parser performs syntactic and semantic validation according to the
[official spec](https://docs.italia.it/italia/developers-italia/publiccodeyml-en/en/master/index.html).

## Examples

Include this action in your repo by creating `.github/workflows/publiccode-validation.yml`
and edit where needed:

```yml
on: [push, pull_request]

jobs:
  publiccode_validation:
    runs-on: ubuntu-latest
    name: publiccode validation
    steps:
    - name: publiccode validation process
      id: pcvalidation
      uses: actions/publiccode-parser-action@v0.0.2-alpha
      with:
        publiccode: 'publiccode.yml' # relative path to your publiccode.yml
    # Use the output from the `pcvalidation` step
    - echo "Validation ${{ steps.pcvalidation.outputs.validation }}"
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

© 2020 Dipartimento per la Trasformazione Digitale - Presidenza del Consiglio dei
Ministri

Licensed under the EUPL.
The version control system provides attribution for specific lines of code.

## Remarks

This GitHub Action is published in the Github Marketplace.
As such, you can find the [Terms of Service here](https://docs.github.com/en/free-pro-team@latest/github/site-policy/github-marketplace-terms-of-service).
Also, [here](https://docs.github.com/en/free-pro-team@latest/github/site-policy/github-marketplace-developer-agreement)
you can find the GitHub Marketplace Developer Agreement.
