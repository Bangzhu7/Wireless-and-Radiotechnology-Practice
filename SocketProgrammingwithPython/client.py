import socket
import time
import random

# Configuration
# Change '127.0.0.1' to your Server's IP address for cross-device testing
SERVER_IP = '212.90.78.152' 
PORT = 65432

def start_client():
    # Create a TCP/IP socket
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        print(f"Attempting to connect to {SERVER_IP}...")
        try:
            s.connect((SERVER_IP, PORT))
            print("Connected to the server!")
            
            while True:
                # Generate random sensor-like data
                temp = round(random.uniform(20.0, 30.0), 1)
                message = f"Temperature: {temp} C"
                
                # Send data
                s.sendall(message.encode('utf-8'))
                print(f"Sent: {message}")
                
                # Wait for 5 seconds as per requirements
                time.sleep(5)
                
        except KeyboardInterrupt:
            print("\nClient stopped by user.")
        except ConnectionRefusedError:
            print("Connection failed. Is the server running?")

if __name__ == "__main__":
    start_client()