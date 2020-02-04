FROM python:3.7-alpine
MAINTAINER Liz Sayle

# Run python in unbuffered mode (don't buffer output)
ENV PYTHONUNBUFFERED 1

# Copy requirements on the image
COPY ./requirements.txt /requirements.txt

# Install requirements
RUN pip install -r /requirements.txt

# Create empty /app folder
RUN mkdir /app

# Make /app default location
WORKDIR /app

# Copy local /app folder onto image /app folder
COPY ./app /app

# Create user for running applications
RUN adduser -D user

# Run application using new user account (never run from root)
USER user
