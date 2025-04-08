FROM python:3.10-slim

# System-Dependencies installieren
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libsm6 \
    libxext6 \
    libgl1 \
    libglib2.0-0 \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Arbeitsverzeichnis setzen
WORKDIR /app

# requirements.txt ins Image kopieren
COPY requirements.txt .

# Abhängigkeiten installieren
RUN pip install --upgrade pip && pip install -r requirements.txt

# Projektdateien kopieren (z. B. Django-Projekt etc.)
COPY . .

# Port öffnen
EXPOSE 8080

# Startbefehl
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8080"]
