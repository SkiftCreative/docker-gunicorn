FROM skiftcreative/supervisor:2.7

MAINTAINER Shawn McElroy <shawn@skift.io>

RUN pip install -U gunicorn \
    && mkdir -p /deploy/app /deploy/run

WORKDIR /deploy/app

# add the gunicorn config file, you should override this file
# if you need custom gunicorn settings
COPY gunicorn_config.py /deploy/

# add gunicorn config
COPY supervisord.conf /etc/supervisord.conf

# by default gunicorn will listen on :5000 so make it available
EXPOSE 5000
