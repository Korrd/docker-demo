# Build stage
FROM python:3.12-slim AS builder

WORKDIR /app

# Install dependencies in a virtual environment
RUN python -m venv /venv \
    && /venv/bin/pip install --upgrade pip \
    && /venv/bin/pip install flask

# Copy source code
COPY app.py .
COPY templates/ templates/
COPY static/ static/

# Final stage
FROM python:3.12-slim AS final

WORKDIR /app

# Copy virtual environment from builder
COPY --from=builder /venv /venv

# Copy app source
COPY --from=builder /app /app

# Use the venv's Python and pip
ENV PATH="/venv/bin:$PATH"

CMD ["python", "app.py"]
