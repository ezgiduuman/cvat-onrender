FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    libsm6 \
    libxext6 \
    libgl1 \
    libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/opencv/cvat.git /opt/cvat

WORKDIR /opt/cvat

RUN pip install --upgrade pip && \
    pip install -r requirements/development.txt && \
    pip install -r cvat/requirements.txt

EXPOSE 8080

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8080"]
