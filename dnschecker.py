# DNS Checker
#   @author Stephen Ellias
#
#   Queries the DNS records for a given list of sites and records available names in a file

# to do:
#   -check for valid internet connection
#   -check for entire already present and replace with current timestamp

import socket, datetime, os
from tkinter import messagebox

# test internet connection first
response = os.system("ping -c 1 google.com &> /dev/null")
if response != 0:
    print("Ooops!, it looks like you don't have an internet connection...")
    exit()

# get addresses to check from files/tocheck
with open('files/tocheck') as f:
    addresses = f.readlines()

# strip excess spaces and newline characters from addresses
addresses = [x.strip() for x in addresses]

# check each address
for address in addresses:
    # check if address has an available host IP
    try:
        hostip = socket.gethostbyname(address)
    # if there is no host ip found record the address
    except:
        # write the name to 'files/potentiallyavailable'
        output = open("files/potentiallyavailable", "a")
        output.write(address + ' ' + str(datetime.datetime.now()) + '\n')
        output.close()
        messagebox.showwarning("DNS Checker Alert", "The domain {} is available!".format(address))
