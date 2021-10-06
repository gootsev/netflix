FROM python:3.8

LABEL mantainer="gootsev@gmail.com"
ENV S3_BUCKET="gootsev-next-netflix"

WORKDIR /app/
COPY ./small-co-api/ /app/
RUN pip install poetry
RUN make .venv; exit 0

ENTRYPOINT poetry run waitress-serve api.app:app
