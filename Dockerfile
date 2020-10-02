FROM python:3.8-buster

RUN apt-get update && apt-get install gcc

RUN python3.8 -m ensurepip
RUN pip3 install --upgrade pip

RUN pip3 install pylint==2.6.0


FROM python:3.8-alpine
RUN apk add --no-cache --update python3
ENV MULTIDICT_NO_EXTENSIONS=1
ENV YARL_NO_EXTENSIONS=1
COPY --from=0 /usr/local/bin/pylint /usr/local/bin/pylint
COPY --from=0 /usr/local/lib/python3.8/site-packages/astroid /usr/local/lib/python3.8/site-packages/astroid
COPY --from=0 /usr/local/lib/python3.8/site-packages/wrapt /usr/local/lib/python3.8/site-packages/wrapt
COPY --from=0 /usr/local/lib/python3.8/site-packages/lazy_object_proxy /usr/local/lib/python3.8/site-packages/lazy_object_proxy
COPY --from=0 /usr/local/lib/python3.8/site-packages/six.py /usr/local/lib/python3.8/site-packages/six.py
COPY --from=0 /usr/local/lib/python3.8/site-packages/isort /usr/local/lib/python3.8/site-packages/isort
COPY --from=0 /usr/local/lib/python3.8/site-packages/pylint /usr/local/lib/python3.8/site-packages/pylint
COPY --from=0 /usr/local/lib/python3.8/site-packages/toml /usr/local/lib/python3.8/site-packages/toml
