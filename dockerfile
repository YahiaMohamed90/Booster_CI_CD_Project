from ubuntu
RUN apt-get update -qq
RUN apt-get -y install python3.6
RUN apt -y install python3-pip
RUN apt install python-is-python3
RUN mkdir /simpleapp
COPY . /simpleApp/
WORKDIR /simpleApp
RUN pip3 install -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
CMD [ "python", "./manage.py", "runserver", "0.0.0.0:8000"]
