FROM python:3.7-alpine

RUN apk add --no-cache --update gcc build-base

RUN python3.7 -m ensurepip
RUN pip3 install --upgrade pip

RUN pip3 install pylint==2.4.4


FROM python:3.7-alpine
RUN apk add --no-cache --update python3

COPY --from=0 /usr/local/bin/pylint /usr/local/bin/pylint
COPY --from=0 /usr/local/lib/python3.7/site-packages/astroid /usr/local/lib/python3.7/site-packages/astroid
COPY --from=0 /usr/local/lib/python3.7/site-packages/wrapt /usr/local/lib/python3.7/site-packages/wrapt
COPY --from=0 /usr/local/lib/python3.7/site-packages/lazy_object_proxy /usr/local/lib/python3.7/site-packages/lazy_object_proxy
COPY --from=0 /usr/local/lib/python3.7/site-packages/six.py /usr/local/lib/python3.7/site-packages/six.py
COPY --from=0 /usr/local/lib/python3.7/site-packages/isort /usr/local/lib/python3.7/site-packages/isort
COPY --from=0 /usr/local/lib/python3.7/site-packages/pylint /usr/local/lib/python3.7/site-packages/pylint
