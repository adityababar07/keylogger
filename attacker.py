import socket

ip = input("enter the ip address :\t")
port = int(input("enter the port you want to listen on :\t"))

try:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((ip, port))

    commands = input("$")

    while commands != 'exit':
        s.send(commands.encode())
        result = s.recv(2048).decode()
        print(result)
        commands = input("$")
    s.close()
except:
    print("Something unusal has happened!!")


