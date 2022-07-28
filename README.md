# PySpark Course with Jupyter running localhost

[![CI](https://github.com/paulodchaves/pyspark-course/workflows/CI/badge.svg?branch=master)](https://github.com/paulosdchaves/pyspark-course/actions?query=workflow:CI)
[![codecov](https://codecov.io/gh/paulodchaves/pyspark-course/branch/master/graph/badge.svg?token=byCb4nFNWv)](https://codecov.io/gh/paulodchaves/pyspark-course)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
<a href="https://github.com/paulosdchaves/pyspark-course/graphs/traffic">
<img src="https://visitor-badge.glitch.me/badge?page_id=paulosdchaves.pyspark-course">
</a>

## The course

Treinamento 

## Quickstart

Clonar o projeto em seu ambiente local:

```shell script
git clone https://github.com/paulodchaves/pyspark-course.git
```

# Executando Jupyter localmente

![local_desktop_jupyter.png](/docs/local_desktop_jupyter.png)

Para rodar o Jupyter localmente você precisará de:

- Pelo menos 4G de RAM disponíveis
- Banda larga para baixar imagens Docker

### Dependências?
Docker, docker-compose and makefile.

### Como rodar?

O comando abaixo configurará o ambiente usando o docker-compose para a instancia do PostgresSQL e o Jupyter Notebook inicializara suas configurações internas, criação das credenciais e conexões.
```bash
make setup
```
Ao executar o comando acima, é possível acessar o Airflow em `localhost: 8888`. 

Para checar o código, execute: `make lint`

Para formata o código, execute: `make format`

## Featured Technologies

![featured_technologies.webp](/docs/featured_technologies.webp)

