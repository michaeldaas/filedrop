FROM python:3.12

WORKDIR /app
ADD . /app/

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

VOLUME /app/uploads

RUN adduser -uid 3000 upload_user
USER upload_user

ENV FLASK_APP=filedrop.py
CMD flask run --host=0.0.0.0

