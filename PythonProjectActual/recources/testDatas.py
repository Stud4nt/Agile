import random
import string
import time

def generate_random_login():
    length = random.randint(5, 12)
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

def generate_random_email():
    timestamp = int(time.time())
    random_part = ''.join(random.choices(string.ascii_lowercase + string.digits, k=5))
    return f"user_{random_part}_{timestamp}@example.com"

def generate_random_password():
    chars = string.ascii_letters + string.digits + "!@#$%^&*"
    return ''.join(random.choices(chars, k=10))
