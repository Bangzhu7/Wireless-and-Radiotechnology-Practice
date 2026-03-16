import socket

# Configuration
# '0.0.0.0' allows the server to listen on all available network interfaces
HOST = '0.0.0.0'  
PORT = 65432        # Port to listen on (non-privileged ports are > 1023)

def start_server():
    # Create a TCP/IP socket
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        # Bind the socket to the address and port
        s.bind((HOST, PORT))
        # Listen for incoming connections
        s.listen()
        print(f"Server is running... Listening on port {PORT}")
        
        # Accept a new connection
        conn, addr = s.accept()
        with conn:
            print(f"Connected successfully by {addr}")
            while True:
                # Receive the data (1024 bytes buffer)
                data = conn.recv(1024)
                if not data:
                    break
                print(f"Received from client: {data.decode('utf-8')}")

if __name__ == "__main__":
    start_server()