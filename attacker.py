import socket

ip = input("enter the ip address :\t")
port = int(input("enter the port you want to listen on :\t"))

try:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((ip, port))

    while True:
        commands = input("$")
        if commands == "exit":
            s.close()
            exit()
        else:
            s.send(commands.encode())
            result = s.recv(2048).decode()
            print(result)
except:
    print('''Something unusal has happened!!
            session closed!!!''')


