import socket
import random
import time

server_mac = "10:B5:88:59:4D:6B"
port = 4

client = socket.socket(socket.AF_BLUETOOTH, socket.SOCK_STREAM, socket.BTPROTO_RFCOMM)

client.connect((server_mac, port))

print("Connected to Bluetooth server")

try:
    while True:
        temperature = round(random.uniform(20.0, 30.0), 1)
        message = f"Temperature: {temperature} C"

        client.send(message.encode("utf-8"))
        print("Sent:", message)

        time.sleep(5)

except OSError:
    pass

client.close()