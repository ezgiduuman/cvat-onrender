FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libsm6 \
    libxext6 \
    libgl1 \
    libglib2.0-0 \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone CVAT from GitHub
RUN git clone https://github.com/opencv/cvat.git .

# Install server dependencies
WORKDIR /app/cvat
RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 8080

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8080"]
