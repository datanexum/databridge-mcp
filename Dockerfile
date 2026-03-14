FROM python:3.12-slim

LABEL maintainer="DataBridge AI <hello@databridgeai.com>"
LABEL description="DataBridge AI — Financial Data Implementation Engine"

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for layer caching
COPY pyproject.toml README.md LICENSE ./
COPY databridge/ databridge/
COPY src/ src/
COPY databridge-ce/ databridge-ce/
COPY run_ui.py run_server.py start_services.py ./

# Install the package + Flask for the UI server
RUN pip install --no-cache-dir -e ".[all]" 2>/dev/null || pip install --no-cache-dir pandas pydantic click rich fastmcp
RUN pip install --no-cache-dir flask

# Copy demo data
COPY data/ data/

# Copy demo COA samples for demo mode
RUN mkdir -p examples
COPY samples/ examples/

# Environment
ENV PYTHONUNBUFFERED=1
ENV DATABRIDGE_TOOL_MODE=slim
ENV DATABRIDGE_REQUIRE_DATASHIELD=1
ENV FLASK_DEBUG=0

# Expose UI port
EXPOSE 5050

# Health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5050/health')" || exit 1

# Default: run the UI dashboard
CMD ["python", "run_ui.py", "--host", "0.0.0.0", "--port", "5050"]
