FROM ubuntu:20.04
EXPOSE 80
RUN apt-get update && \
    apt-get install -y python3-pip redis-server

COPY . ./app
WORKDIR /app
RUN pip3 install --no-cache-dir -r requirements.txt && pip3 install --upgrade flask werkzeug

RUN service redis-server start

ENV REDIS_HOST=localhost

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

CMD ["flask", "run", "--host=0.0.0.0"]
