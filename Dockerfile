# Use official python slim image
FROM python:3.10-slim

# set working dir
WORKDIR /app

# copy only requirements first (cache)
COPY app/requirements.txt /app/requirements.txt

# install deps
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# copy app code
COPY app/ /app

# expose port
EXPOSE 5000

# ensure db file is created on startup
CMD ["python", "main.py"]
