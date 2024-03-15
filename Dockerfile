FROM python:3.8-slim

WORKDIR /app

COPY . .

RUN apt-get update && \
    apt-get install -y curl && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --upgrade flask werkzeug

EXPOSE 80

ARG REDIS_HOST="localhost"
ENV REDIS_HOST=$REDIS_HOST

HEALTHCHECK --timeout=2s \
  CMD curl -f localhost:5000 || exit 1

CMD ["flask", "run", "--host=0.0.0.0"]
