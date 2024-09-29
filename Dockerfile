FROM python:3.9-slim As Builder

WORKDIR /app

COPY requierments.txt .

RUN pip install -r requierments.txt

# muilti-stage 

FROM alpine:latest

COPY --from=builder /app/app.py .

COPY . .

EXPOSE 3000

CMD [ "python", "app.py" ]
