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

# Testing

Make sure a PostgreSQL database is running. For example:

```
docker run --rm --name postgresql -e POSTGRES_PASSWORD=postgres -p 5432 postgres
```

If you're running `boot2docker` (a requirement on Mac OS X), forward port 5432 to the docker Host as well:

```
# Run vagrant global-status to get the ID of `boot2docker`
VAGRANT_ID = vagrant global-status | grep boot2docker | awk '{print $1}'
vagrant ssh $VAGRANT_ID -- -N -L 5432:localhost:5432
```

Or easily in one command if you're running dockup:

```
dockssh -N -L 5432:localhost:5432
```

# Deployment


```
ansible-playbook \
  -u deployer \
  -i "hellolocker.com," \
  --extra-vars "database_url=postgresql://user:pass@localhost/my_databaseans" \
  --extra-vars "secret_key_base=randomtokenhere" \
  --extra-vars "hashids_salt=anotherrandomtokenhere" \
  deploy/ansible/deploy.yml
```

## Configure Database

HelloLocker will use the `DATABASE_URL` environment variable to connect to the database. This should be of the form:

```
postgresql://user:pass@localhost/database_name?pool=5
```

## Docker

I'm mounting the `/var/run/postgresql` directory as a volume for the HelloLocker container so it can connect to it. You might want to change this to suit your needs.

### Nginx configuration

We add `env DATABASE_URL` so Nginx wouldn't flush this variable from the environment before booting Passenger.

# Continuous Integration

## Codeship

We use Codeship. To set it up, add the following lines to the "setup" part:

```
pip install ansible
```
