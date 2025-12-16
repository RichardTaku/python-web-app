ARG PYTHON_VERSION=3.10-slim
FROM python:${PYTHON_VERSION} AS base 

# Prevents Python from writing pyc files. 
ENV PYTHONDONTWRITEBYTECODE=1 
ENV PYTHONUNBUFFERED=1 
WORKDIR /app 
ARG UID=10001 
RUN adduser \ 
 --disabled-password \ 
 --gecos "" \ 
 --home "/nonexistent" \ 
 --shell "/sbin/nologin" \ 
 --no-create-home \ 
 --uid "${UID}" \ 
 appuser

RUN --mount=type=cache,target=/root/.cache/pip \ 
 --mount=type=bind,source=requirements.txt,target=requirements.txt \ 
 python -m pip install -r requirements.txt 

# Switch to the non-privileged user to run the application. 
USER appuser

# Copy the source code into the container. 
COPY . .

# Expose the port that the application listens on.
EXPOSE 5000

# Run the application. 
CMD ["python", "main.py"]
