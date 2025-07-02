FROM python:3.12-slim

WORKDIR /app

RUN pip install flask

COPY app.py .
COPY templates/ templates/
COPY static/ static/

CMD ["python", "app.py"]
