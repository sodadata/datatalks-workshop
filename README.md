# Soda Core Workshop - DataTalks.club

This is a repository with sample database docker setup for Soda Core workshop.

## Install Soda Core with PostgreSQL

Please make sure that you have at least Python 3.7 installed. We recommend that
you install Soda Core in a dedicated virtual environment. You can use `python3
-m venv .venv` to create the virtual environment and activate using `source
.venv/bin/activate`.

Install latest `soda-core-postgres` package using `pip install
soda-core-postgres` and verify that soda command works as expected.

```
➜ soda
Usage: soda [OPTIONS] COMMAND [ARGS]...

  Soda Core CLI version 3.0.0b9

Options:
  --help  Show this message and exit.

Commands:
  scan    runs a scan
  update  updates a distribution reference file
```

# Setup PostgreSQL databases with sample data

Install docker if you don't have already. Clone this repository and switch to
db-docker directory. Run `docker compose up` command which will start the two
databases we will be using during the workshop. You should see the following in
your terminal:

```
➜ docker compose up
[+] Running 3/3
 ⠿ Network datatalks-workshop_default             Created                                                                               0.1s
 ⠿ Container datatalks-workshop-demo-target-db-1  Created                                                                               0.2s
 ⠿ Container datatalks-workshop-demo-src-db-1     Created                                                                               0.2s
Attaching to datatalks-workshop-demo-src-db-1, datatalks-workshop-demo-target-db-1
...
...
datatalks-workshop-demo-src-db-1     | 2022-04-25 13:44:13.371 UTC [1] LOG:  database system is ready to accept connections

```
