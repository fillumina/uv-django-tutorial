# Create a django project with uv

Being many django default configuration hard to be correctly managed by [vscode](https://code.visualstudio.com/) here is a solution for a setup that seems to work well. You just have to follow the steps as shown in the git history.

## Main features

- buildable and runnable with [docker](https://www.docker.com/) with the default internal [sqlite](https://www.sqlite.org/) database

- buildable and runnable with [docker compose](https://docs.docker.com/compose/) with [postgresql](https://www.postgresql.org/) database

- settable default super user password (see `docker-compose.yml` and `Dockerfile`)

- use `.env` to set the postgresql password (should not be versioned but here it is for clarity)

- [vscode](https://code.visualstudio.com/) will happily work with it. 
  Run it with `code .`  in the `src` folder, it will ask about the **git repository** (use the one in parent folder) and **python interpreter** (use the one in `.venv`). Remember to copy the files in `src/.vscode` as they are in this project and to modify the project name in `.vscode/settings.json` and then it will:
  
  - find the correct libraries and open sources in the `.venv` environment
  
  - run and debug the project (use the run icon on the upper right and select `Python debugger: debug using launch.json`)
  
  - run and debug tests (but would not be able to open the corresponding file unfortunately)

- A `docker-compose.yml` file can sit in the base folder so that `Dockerfile` can be in `src`  and both will be versioned

- `.git` in the base folder keeps all project versioned

## uv

[uv](https://docs.astral.sh/uv/) is a fantastic python package manager with several features including:

- symlinking binaries and libraries to drastically improve speed and save space

- compatible with python [venv](https://docs.python.org/3/library/venv.html) 

- compatible with [pip](https://pypi.org/)

Strangely uv is configured by default to *hard link* dependencies and if it isn't possible (i.e. the project is on a different filesystem than `$HOME`) to just copy them. This completely deactivate one of its most compelling feature. Luckly it is possible to activate *soft linking* by creating a file named `~/config/uv/uv.toml` containing the following line:

```
link-mode = "symlink"
```

## Resulting tree

The target is to have the following tree:

```
project-name
    +-- .git/
    +-- .gitignore
    +-- docker-compose.yml
    +-- .env
    +-- README.md
    +-- src
        +-- django-project-name/
        +-- .venv/
        +-- .vscode/
        +-- Dockerfile
        +-- .env
        +-- manage.py
        +-- uv.lock
        +-- README.md
        +-- pyproject.toml
        +-- .python-version
```

`vscode` should be started in the `src` directory which is the project base and working directory.

## How to execute

### Local development

Just use the `./manage.py` script that is configured to use the `.venv` environment by using a specific [shebang]([Bash Shebang | Linuxize](https://linuxize.com/post/bash-shebang/)). Run it with:

```
./manage.py runserver 0.0.0.0:8000
```

Or, because `./start.sh` is configured to work inside the container and will not work here, use `./start_local.sh`

### Docker

To execute the docker image using the internal `sqlite3` database create the image in the `src` directory with:

```
docker build -t uvdjangotutorial . 
```

and execute it with:

```
docker run -p 8000:8000 uvdjangotutorial
```

## Docker compose

With docker compose it is possible to run the application together with an external db like [postgresql](https://www.postgresql.org/). To build the image in the base directory (the parent of `src`):

```
docker compose build
```

To run it:

```
docker compose up
```

To stop it:

```
docker compose down
```


