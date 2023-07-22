# Personal Scripts

> Collection of my personal scripts

<!-- toc -->

- [Introduction](#introduction)
- [Installation](#installation)
- [License](#license)

<!-- tocstop -->

## Introduction

This repository consists of a few main subdirectories:

| Directory              | Purpose                                                                               |
|------------------------|---------------------------------------------------------------------------------------|
| `scripts/`             | primary scripts (added into _PATH_)                                                   |
| `cron/`                | scripts executed by cron (not added to _PATH_)                                        |
| `deamons/`             | scripts executed automatically on system start and kept running (not added to _PATH_) |
| `system-dependencies/` | helpers to install system-wide dependencies                                           |

## Installation

You probably don't want to actually install all my scripts…
So this section is mostly for my future self :\) .

Install project dependencies:

```bash
make bootstrap
```

Install project system-wide:

```bash
make install
```

Or just run everything mentioned (and more):

```bash
make
```

## License

This project is licensed under the MIT License, see
[LICENSE.txt](LICENSE.txt) for full license details.
