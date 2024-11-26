FROM python:3.8-slim
LABEL maintainer="mohammed_haseeb@persistent.com"
 
RUN apt-get clean \ 
    && apt-get -y update
 
RUN apt-get -y install \
    python3 \
    nginx
 
WORKDIR /app
 
COPY requirements.txt /app/requirements.txt
 
RUN pip install -r requirements.txt --src /usr/local/src
 
COPY . .
 
EXPOSE 5000
 
ENTRYPOINT [ "python", "app.py" ]
 
CMD [ "sleep", "60" ]
