FROM python:3.8

LABEL mantainer="gootsev@gmail.com"

WORKDIR /app/
COPY ./small-co-api/ /app/
RUN pip install poetry
RUN make .venv; exit 0

ENTRYPOINT poetry run waitress-serve api.app:app
