import socket
klijent = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
klijent.connect(('localhost',8888))
dobrodoslica = klijent.recv(1024).decode('utf-8')
