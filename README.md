[![Coverage Status](https://coveralls.io/repos/dv/hellolocker/badge.svg?branch=master&service=github)](https://coveralls.io/github/dv/hellolocker?branch=master)
[![Code Climate](https://codeclimate.com/github/dv/hellolocker/badges/gpa.svg)](https://codeclimate.com/github/dv/hellolocker)
![Build Status](https://img.shields.io/codeship/97a77c10-19b7-0133-e34a-0a4b5bd32554/master.svg)

# Development

## Guard

Guard uses `terminal-notifier-guard` and thus needs `terminal-notifier` installed:

```
$ brew install terminal-notifier
```

Then just run guard:

```
$ guard
```


# Deployment

`ansible-playbook -i "hellolocker.com," deploy/ansible/deploy.yml`
