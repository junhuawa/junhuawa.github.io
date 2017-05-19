---
layout: post
title: "Why ssh's password prompt too so long to appear"
date: 2017-04-25
category: "linux" 
tags: [linux]
---

Public key authentication provides SSH users with the convenience of logging
in to their Linodes without entering their passwords. 

It need a Private key and Public key, it's like a key and a lock. The public
part is the lock, which can be copied to multiple locations as long as the
private component, or key, is not compromised. 

Since the private key is password-protected when encrypted, it is analogous to
keeping a physical key in a lockbox. With this example in mind, using an SSH
key works as follows. First, the lockbox/passphrase is opened to obtain the
key/private key, which is then used to open the lock/public key and grant
access to your Linode.

When use ssh-keygen cmd to create the keys, it will create id_rsa(private key)
and id_rsa.pub(public key). 

The public key is meant to be handed out freely, and added to servers you wish
to connect to in the ~/.ssh/authorized_keys file. The private key should be
secured on your local machine with strict access rules.

### The difference between authorized_keys and known_hosts file for SSH

~/.ssh/authorized_keys: 

Holds a list of authorized public keys for servers. When the client connects
to a server, the server authenticates the client by checking its signed public
key stored within this file.

This file is maintained on the server. 

~/.ssh/known_hosts:
Contains DSA host keys of SSH servers accessed by the user. This file is very
important for ensuring that the SSH client is connecting the correct SSH
server.

This file is maintained on the client. 



https://security.stackexchange.com/questions/20706/what-is-the-difference-between-authorized-keys-and-known-hosts-file-for-ssh


You should never save the file with its contents starting with -----BEGIN RSA PRIVATE KEY----- on the server, that is your private key. Instead, you must put the public key into the ~/.ssh/authorized_keys file.

This public key has the .pub extension when generated using ssh-keygen and its contents begin with ssh-rsa AAAAB3. 

The permissions of ~/.ssh on the server should be 700. The file ~/.ssh/authorized_keys (on the server) is supposed to have a mode of 600. The permissions of the (private) key on the client-side should be 600.

If the private key was not protected with a password, and you put it on the server, I recommend you to generate a new one:

ssh-keygen -t rsa

You can skip this if you're fully sure that nobody can recover the deleted private key from the server.

If this does not help, run ssh with options for more verbosity:

ssh -vvv user@example.com

On the server side, you can review /var/log/auth.log for details.


### Example ssh to Tesla without password

Copy the public key to server, and append it to the ~/.ssh/authorized_keys.

ssh-copy-id appends the keys to the remote-host’s .ssh/authorized_key.
ssh-copy-id also assigns proper permission to the remote-host’s home, ~/.ssh,
and ~/.ssh/authorized_keys.

```sh
    [junhuawa@Tesla .ssh]$ ssh-copy-id -i ~/.ssh/id_rsa.pub Tesla.china.nsn-net.net
    /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
    /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
    junhuawa@Tesla.china.nsn-net.net's password: 

    Number of key(s) added: 1

    Now try logging into the machine, with:   "ssh 'Tesla.china.nsn-net.net'"
    and check to make sure that only the key(s) you wanted were added.

    [junhuawa@Tesla .ssh]$ ssh Tesla.china.nsn-net.net
    Last login: Tue Apr 25 15:39:36 2017 from 10.140.30.70
    [junhuawa@Tesla ~]$ 
```


```sh
    [junhuawa@Tesla .ssh]$ ssh-copy-id -i id_rsa.pub root@10.69.6.133
    /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
    /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
    root@10.69.6.133's password: 

    Number of key(s) added: 1

    Now try logging into the machine, with:   "ssh 'root@10.69.6.133'"
    and check to make sure that only the key(s) you wanted were added.

    [junhuawa@Tesla .ssh]$ ssh root@10.69.6.133
    Last login: Tue Apr 25 14:02:30 2017 from 10.140.30.70
    [root@localhost ~]# exit
    logout
    Connection to 10.69.6.133 closed.
```

### Which private key will be used when sshing

The ssh client allows you to selects a file from which the identity (private key) for RSA or DSA authentication is read. The default is ~/.ssh/identity for protocol version 1, and ~/.ssh/id_rsa and ~/.ssh/id_dsa for protocol version 2. Identity files may also be specified on a per-host basis in the configuration file. It is possible to have multiple -i options (and multiple identities specified in configuration files). The syntax is as follows:


```sh
    [junhuawa@Tesla .ssh]$ ssh -i id_rsa_junhuawa_Tesla 10.140.30.70
    Last login: Tue Apr 25 10:51:49 2017 from 127.0.0.1
    [junhuawa@Tesla ~]$ exit
    logout
    Connection to 10.140.30.70 closed.
    [junhuawa@Tesla .ssh]$ ssh 10.140.30.70
    junhuawa@10.140.30.70's password: 

    [junhuawa@Tesla .ssh]$
```

### ~/.ssh/config SSH Client Configuration

You can set identity file in ~/.ssh/config as follows:

    vi ~/.ssh/config

Add both host names and their identity file as follows:

    Host ling42
    HostName Tesla.china.nsn-net.net
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
    IdentityFile ~/.ssh/id_rsa
    User junhuawa

    Host pc133
    HostName 10.69.6.133
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
    IdentityFile ~/.ssh/id_rsa
    User root

    Host ulm
    HostName ulegcpding.emea.nsn-net.net
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
    IdentityFile ~/.ssh/id_rsa
    User junhuawa


### Why ssh's password prompt too so long to appear

There are several things that can go wrong. Add -vvv to make ssh print a
detailed trace of what it's doing, and see where it's pausing.

The problem could be on the client or on the server.

A common problem on the server is if you're connecting from a client for which
reverse DNS lookups time out. (A “reverse DNS lookup” means getting back from
the client machine's IP address to a host name. It isn't really useful for
security, only slightly helpful to diagnose breakin attempts from log entries,
but the default configuration does it anyway.) To turn off reverse DNS
lookups, add UseDNS no to /etc/ssh/sshd_config (you need to be root on the
server; remember to restart the SSH service afterwards).

Another thing that can go wrong is GSSAPI authentication timing out. If you
don't know what that is, you're probably not relying on it; you can turn it
off by adding the line GSSAPIAuthentication no to **/etc/ssh/ssh_config** or
**~/.ssh/config** (that's on the client side).

### /etc/ssh/sshd_config

    UsePAM yes
    UseDNS no
    # GSSAPI options
    GSSAPIAuthentication no
    GSSAPICleanupCredentials no


### Questions related to public key
If I save my public key to my git server, and my private key to my lin42
server, both keys are created from my own PC, not from lin42 server. 

It will be failed if I clone data from git server. 

But if I create a new key pair in the lin42 server, and put to the public key
to git server, save private key to lin42 server. 
Clone data from git server will be successful.

Don't know why.  :(

Finally, I create a new key pair from lin42 server, and copy them to my own
pc, add public key to my ~/.ssh/authorized_key file, now, in my own pc, ssh to
localhost can be successfuly without password. 
When I ssh to lin42 server, it report **Agent admitted failure to sign using
the key.** error. 

    16:38 junhuawa@Tesla:~/.ssh $ ssh hzling42.china.nsn-net.net -v
    OpenSSH_6.6.1, OpenSSL 1.0.1e-fips 11 Feb 2013
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: /etc/ssh/ssh_config line 56: Applying options for *
    debug1: Connecting to hzling42.china.nsn-net.net [10.159.215.233] port 22.
    debug1: Connection established.
    debug1: identity file /home/junhuawa/.ssh/id_rsa type 1
    debug1: identity file /home/junhuawa/.ssh/id_rsa-cert type -1
    debug1: identity file /home/junhuawa/.ssh/id_dsa type -1
    debug1: identity file /home/junhuawa/.ssh/id_dsa-cert type -1
    debug1: identity file /home/junhuawa/.ssh/id_ecdsa type -1
    debug1: identity file /home/junhuawa/.ssh/id_ecdsa-cert type -1
    debug1: identity file /home/junhuawa/.ssh/id_ed25519 type -1
    debug1: identity file /home/junhuawa/.ssh/id_ed25519-cert type -1
    debug1: Enabling compatibility mode for protocol 2.0

    ...
    debug1: Next authentication method: publickey
    debug1: Offering RSA public key: /home/junhuawa/.ssh/id_rsa
    debug1: Server accepts key: pkalg ssh-rsa blen 277
    Agent admitted failure to sign using the key.
    debug1: Trying private key: /home/junhuawa/.ssh/id_dsa
    debug1: Trying private key: /home/junhuawa/.ssh/id_ecdsa
    debug1: Trying private key: /home/junhuawa/.ssh/id_ed25519
    debug1: Next authentication method: password
    junhuawa@hzling42.china.nsn-net.net's password:


This error can be solved by below 2 methods.

    using SSH_AUTH_SOCK=0 ssh -vvv remote@10.0.7.112 prevents the error.

    ssh-add fixes it too. 

If you set SSH_AUTH_SOCK=0 then you are not using the ssh-agent any longer. The ssh-key you created is passphraseless I assume, as you will then use just this plain key.

The purpose of the agent is to allow a one time sign in with the passphrase of the ssh-key, and authorize all further application of the ssh-key during your session.

When you get this failure always, maybe we can look into the used keys in the ssh-agent. What is:
Code:

    $ ssh-add -l

running ssh-add after ssh-copy-id seems to be preventing "agent admitted to failure to sign using the key" from showing up now. 


**From this testing, get the conslusion that: same key pair can be used at
different servers with same user account.**
