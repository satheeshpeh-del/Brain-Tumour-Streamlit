FROM python:3.10-slim

WORKDIR /app

# Install system dependencies for TensorFlow & OpenCV
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libglib2.0-0 \
    libgl1 \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8501

CMD ["streamlit", "run", "streamlit_brain_tumor_app.py", "--server.port", "8501", "--server.address", "0.0.0.0"]
