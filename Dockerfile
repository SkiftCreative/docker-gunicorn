FROM skiftcreative/supervisor:latest

MAINTAINER Shawn McElroy <shawn@skift.io>

RUN pip3 install -U pip
RUN pip3 install -U gunicorn \
    && mkdir -p /deploy/app /deploy/run

WORKDIR /deploy/app

# add the gunicorn config file, you should override this file
# if you need custom gunicorn settings
COPY gunicorn_config.py /deploy

# add gunicorn config
COPY gunicorn.conf /etc/supervisor/conf.d/

# by default gunicorn will listen on :5000 so make it available
EXPOSE 5000
