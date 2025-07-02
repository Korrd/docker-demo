FROM python:3.12-slim

WORKDIR /app

# Install Flask
RUN pip install flask

# Copy app and templates
COPY app.py .
COPY templates/ templates/

CMD ["python", "app.py"]