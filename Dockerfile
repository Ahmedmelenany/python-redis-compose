FROM python:3.9-slim

WORKDIR /app

COPY requierments.txt .

RUN pip install -r requierments.txt

COPY . .

EXPOSE 3000

CMD [ "python", "app.py" ]