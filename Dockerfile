FROM python:3.5-alpine
COPY . /code
WORKDIR /code
ENV DEAD_SIMPLE_INTERFACE_CONFIG="/code/config.py"
RUN python setup.py install
RUN pip install gunicorn
ARG PORT="8915"
ENV PORT=$PORT
ARG WORKERS="4"
ENV WORKERS=$WORKERS
ARG TIMEOUT="30"
ENV TIMEOUT=$TIMEOUT
CMD gunicorn dead_simple_interface:app -w ${WORKERS} -t ${TIMEOUT} -b 0.0.0.0:${PORT}
