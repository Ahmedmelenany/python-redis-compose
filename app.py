from flask import Flask
import redis

app = Flask(__name__)

redis_client = redis.StrictRedis(host='redis', port=6379, decode_responses=True)

@app.route('/')
def visit_count():
    try:
        
        visits = redis_client.incr('counter')
    except redis.ConnectionError:
        visits = "cannot connect to Redis"
    return f"Number of visits: {visits}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000)
