FROM python:3.8

LABEL mantainer="gootsev@gmail.com"
ENV S3_BUCKET="gootsev-next-netflix"
ENV AWS_ACCESS_KEY_ID="AKIAQQGCY6KBVDE7RN44"
ENV AWS_SECRET_ACCESS_KEY="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"
ENV AWS_DEFAULT_REGION="eu-west-1"
ENV AWS_REGION="eu-west-1"

WORKDIR /app/
COPY ./small-co-api/ /app/
RUN pip install poetry
RUN make .venv; exit 0

ENTRYPOINT poetry run waitress-serve api.app:app


