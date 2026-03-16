import socket

server_mac = "10:B5:88:59:4D:6B"
port = 4

server = socket.socket(socket.AF_BLUETOOTH, socket.SOCK_STREAM, socket.BTPROTO_RFCOMM)

server.bind((server_mac, port))
server.listen(1)

print("Waiting for Bluetooth client connection...")

client, addr = server.accept()
print(f"Connected to: {addr}")

try:
    while True:
        data = client.recv(1024)
        if not data:
            break

        print("Received:", data.decode("utf-8"))

except OSError:
    pass

client.close()
server.close()