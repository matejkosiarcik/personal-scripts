# Scripts

> Collection of my personal scripts

Consists of few directories:

- `scripts/` - main scripts (added into _PATH_)
- `cron/` - scripts executed by cron (not added to _PATH_)
- `deamons/` - scripts executed automatically on system start (not added to _PATH_)
- `system-dependencies/` - helpers to install system-wide dependencies

## Installation

You probably don't want to actually install all my scripts...
So this section is mostly for my future self :\) .

Install project dependencies:

```bash
make bootstrap
```

Install project system-wide:

```bash
make install
```
