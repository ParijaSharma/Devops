



### NETWORKING
* LAN - collection of devises connected together in one physical location 
each 
each device has a unique ip address
IP - internet protocol
#Switch:
sits with the lan 
connection btw all the devices within lan 

#Router : 
sits btw lan and outside networks (WAN)
connects devices on LAN and WAN 
allows the access to internet
* Gateway - IP address of Router 

#Subnet:
how to know , whether the other device is inside or outside the LAN?
it is known because of IP address of target device
devices in the lan belong to same ip address range :
#subnet: logical subdivision of an ip address
subnetting = process of dividing a network into two or more networks

* Example of ip address range: [192.168.0.0]  [255.255.255.0]
                                1) ip address  2)subnet mask

[255.255.0.0] - means that 16 bits are fixed -if we this a s subnet mask then first two numbers are fixed and numbers after last 2 dots can be changed (0 to 255).

[255.255.255.0] - means 24 bits are fixed - if we this a s subnet mask then first three numbers are fixed and number after last dot can be changed (0 to 255).

- value 255 fixates the octet
- value 0 means free range

-> [192.168.0.0/16] - here 16 tells 16 bits are fixed
            
________________________________________
|  LAP1                                 |   when we send a req to ip address within the lan the it with go the switch
|192.168.1.11                           |     and if id is not with the same range then will go to router
|                                       |
|            SWITCH                     |
|         192.168.1.0               ROUTER 
|                                    192.168.1.11
|                                       |
| LAP2                                  |
|192.168.1.20                    LAN    |
|_______________________________________|

* any device needs 3 pieces of data for communication:
    ip address
    subnet 
    gateway

#NAT: network address Translation
your laptops private ip adress is replaced by the router 
* NAT - key functionality of the router
* benefits :
. security and protection of devices within lan 
. reuse of IP address

#FireWall:
by default, the server is not accessible from outside the lan
a system that prevents unauthorized access from entering a private network
using firewall rules you can define which requests are allowed 
which ip address in your network is accessible 
which ip address can access your server


#what is a port
ports are like doors , you can allow specific ports and specific ip address.
different applications listen on specific ports 
standar ports for application 
mysql - 3360 
web servers - 80

#DNS: Domain name service
whole networking depends on dns
translates domain name to ip address
{ . } root domains
top level domains -> {.mil}   {.edu }    {.com}     {.org}          {.gov}
                    military  education  commercial non-profitable  government
                                                     oraganisation

geography related -> {.at}   {.ca}    {.in}    {.us}    {.fr}   {.uk}

#ICANN :
ICANN (Internet Corporation for Assigned Names and Numbers) is the private, non-government, nonprofit corporation with responsibility for Internet Protocol (IP) address space allocation, protocol parameter assignment, domain name system (DNS) management and root server system management functions. The Internet Assigned Numbers Authority (IANA) previously performed these services.

eg of fully qualified domain name:
courses.techworld-with-nana.com.
dot at the end is for root domain

# how does DNS resolution work?
DNS resolution translates a human-friendly domain name, like www.example.com, into a computer-friendly IP address, enabling devices to locate and connect to web servers. This process involves a recursive DNS server acting as an intermediary to query a hierarchy of DNS servers, starting with the root servers, then top-level domain (TLD) servers (e.g., for .com), and finally the authoritative name server that holds the domain's official DNS records, returning the correct IP address to the user's browser.

- DNS entries are cached for efficiency

1. User Input:
When you type a domain name into your web browser, the process begins. 
2. Local Cache Check:
Your computer first checks its own local DNS cache and then its operating system (OS) cache to see if it has already looked up the domain's IP address recently. If it finds it, the website loads quickly, skipping the rest of the process. 
3. Resolver Query:
If the IP address isn't in the cache, your computer sends a DNS query to the configured DNS resolver (often provided by your internet service provider or a public DNS service). 
4. Root Server Inquiry:
The recursive DNS resolver then queries the root name servers, which act as the highest level of the DNS hierarchy, to find the server responsible for the top-level domain (TLD). 
5. TLD Server Inquiry:
The root server directs the resolver to the TLD server (e.g., the .com server for example.com). 
6. Authoritative Server Inquiry:
The TLD server then points the resolver to the authoritative name server for the specific domain (in this case, the one for example.com). 
7. IP Address Retrieval:
The authoritative name server holds the official DNS records and provides the correct IP address for example.com. 
8. Caching and Response:
The recursive DNS resolver caches this IP address for future requests and then sends it back to your computer. 
9. Connection to Server:
Your web browser uses this IP address to connect to the correct server and retrieve the website's content. 


#Networking commands:
ifconfig :  Used to configure network interfaces, assign IP addresses, and enable/disable interfaces.

netstat : (Network Statistics - Legacy) Displays network connections, routing tables, interface statistics, and more.

ps aux : 
The command ps aux is a Linux command-line utility used to display information about currently running processes on a system. It provides a static snapshot of the processes at the moment the command is executed.

nslookup : Another utility for querying DNS servers.

ping : Tests network connectivity to a host by sending ICMP echo requests.




#ssh - secure shell :
cryptographic network protocol designed for secure communication over usnsecured network.
- install software on new server
- remote commmand execution 
- remote file/directory copy (SCP) - secure copy protocol
copy a remote file to a remote server 
$ scp file.txt remote_username@10.10.0.2:/remote/directory

ssh works on 22 port 
ssh tunnel


What is SSH ?
SSH, or Secure Shell, constitutes a cryptographic network protocol designed to enable secure communication between two systems over networks that may not be secure
commands

 2 ways to authenticate : 
 1) username and password
    -> admin creates user on remote server 
    -> user can then connect with the username and password
 2) ssh key pair 
    -> client creates an ssh key pair
        key pair = private key + public key
    -> Private key = secret key is stored securely on the client machine 
    -> public key = public can be shared, eg. with the remote server
    client can unlock the public key with his private key 
 
#firewall and port 22 :
in firewall rule we allow access on port 22
ssh is powerful and needs to be restricted to specific ip address

#commands
ssh -i .\lab.pem ubuntu username@pip ------ .\lab.pem is path of pvt key
ssh username@password
ssh-keygen -t rsa 
ifconfig
curl

#to start with it :
Install SSH Component on Linux
Setting up SSH on Linux may be necessary, as some distributions don't come with it pre-installed. Installing OpenSSH, a widely used SSH implementation, or opting for a graphical user interface (GUI) solution like the PuTTY client for Ubuntu can address this. Here's a step-by-step guide on installing and configuring OpenSSH on both the client and server sides:

sudo apt install openssh-client openssh-server
Note : To check the status of running server after installation we can use this command "systemctl status sshd"
sudo systemctl start sshd

To have the service start automatically on boot, run:
sudo systemctl enable sshd
Enabling the sshd service starts it during the boot process.

#How to Use SSH to Connect to a Remote Server in Linux
ssh username@password
example:
ssh jayesh@10.143.90.2


#course demo :
* create remote server on cloud platform 
* generate ssh key pair on our laptop
* copy bash script file to the remote server 
* execute script file on remote server
