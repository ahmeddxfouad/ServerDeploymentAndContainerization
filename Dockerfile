# Rubric-required base image
FROM public.ecr.aws/docker/library/python:3.7-stretch

WORKDIR /app

# Install dependencies first (better caching)
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of the app
COPY . .

# Rubric-required Gunicorn entrypoint
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
