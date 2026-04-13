import socket
import random
import time

SERVER_IP = "192.168.116.98"
PORT = 5007

def run_sensor():
    # Create a TCP/IP socket
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    try:
        # Connect the socket to the port where the server is listening
        print(f"Connecting to {SERVER_IP}:{PORT}...")
        client.connect((SERVER_IP, PORT))
        print("Connected successfully!")

        while True:
            # 1. Generate random sensor data
            temperature = round(random.uniform(20, 35), 2)
            humidity = round(random.uniform(40, 80), 2)
            light = round(random.uniform(100, 1000), 2)

            # 2. Format the message as a CSV string
            message = f"{temperature},{humidity},{light}"

            # 3. Send the data to the Edge Device
            client.send(message.encode())

            # 4. Print detailed logs so you know exactly what is being sent
            print(f"Sent -> Temp: {temperature}°C, Hum: {humidity}%, Light: {light} lux")

            # Wait for 5 seconds before the next reading
            time.sleep(5)

    except ConnectionRefusedError:
        print("Error: Could not connect to the Edge Device. Is edge_device.py running?")
    except KeyboardInterrupt:
        print("\nSensor simulation stopped by user.")
    finally:
        client.close()

if __name__ == "__main__":
    run_sensor()