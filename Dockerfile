# FROM python:3.10-slim

# ENV PYTHONUNBUFFERED True
# ENV APP_HOME /app
# WORKDIR $APP_HOME
# COPY . ./

# RUN pip install --no-cache-dir -r requirements.txt
# CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app

FROM python:3.9

WORKDIR /app

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY . ./

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
