# Personal Scripts

> Collection of my personal scripts

<!-- toc -->

- [Introduction](#introduction)
- [Installation](#installation)
- [License](#license)

<!-- tocstop -->

## Introduction

This repository consists of a few main subdirectories:

| Directory       | Purpose                                                                               |
|-----------------|---------------------------------------------------------------------------------------|
| `scripts/`      | primary scripts (added into _PATH_)                                                   |
| `cron/`         | scripts executed by cron (not added to _PATH_)                                        |
| `deamons/`      | scripts executed automatically on system start and kept running (not added to _PATH_) |
| `dependencies/` | project runtime dependencies                                                          |
| `setup/`        | installation helpers                                                                  |

## Installation

You probably don't want to actually install all my scripts…
So this section is mostly for my future self :\) .

Install project dependencies:

```bash
make bootstrap
```

Build project:

```bash
make build
```

Install project system-wide:

```bash
make install
```

Or run everything at once:

```bash
make all install
```

## License

This project is licensed under the MIT License, see
[LICENSE.txt](LICENSE.txt) for full license details.
