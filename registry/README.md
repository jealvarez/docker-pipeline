# **Provisioning Docker Registry**

## **Prerequisites**

* VirtualBox 5.2+
* Vagrant 2.1+

## **Warning**

**If you set more than one Virtual Machine instance using the same `Vagrantfile`, it's necessary to change the values of the properties that will be used to create the Virtual Machine, which ones will be described later.**

## **Getting Started**

### **Configuration**

* Configure the Virtual Machine setting the values of the [`settings.yml`](./settings.yml)

| Property             | Description                                          | Example                    |
| -------------------- | ---------------------------------------------------- | -------------------------- |
| ip_address           | IP Address of the Virtual Machine                    | 192.168.33.10              |
| virtual_machine_name | Name of the Virtual Machine                          | docker-registry            |
| domain_name          | Domain name related with the let's encrypt generated | docker-registry.demo.com   |

### **Required Steps**

#### **SSL Certificates**

The certificates were generated with [Let's Encrypt](https://letsencrypt.org/), so, you need to find a way to generate your own certificates. Once you have your own certificates, you need to generate a `tar` file called `letsencrypt.tar` and put it into `letsencrypt` directory. The `tar` file should contain the following files:

```ssh
├── archive
│   └── docker-registry.demo.com
│       ├── cert1.pem
│       ├── chain1.pem
│       ├── fullchain1.pem
│       └── privkey1.pem
├── cli.ini
├── live
│   └── docker-registry.demo.com
│       ├── README
│       ├── cert.pem -> ../../archive/docker-registry.demo.com/cert1.pem
│       ├── chain.pem -> ../../archive/docker-registry.demo.com/chain1.pem
│       ├── fullchain.pem -> ../../archive/docker-registry.demo.com/fullchain1.pem
│       └── privkey.pem -> ../../archive/docker-registry.demo.com/privkey1.pem
└── options-ssl-apache.conf
```

### **Running**

* Go to the main directory where is located the `Vagrantfile` file

```sh
vagrant up
```

### **Testing**

* Add to `/etc/hosts` file

```sh
192.168.33.10 docker-registry.demo.com
```

* Login into the Docker Registry

```ssh
docker login docker-registry.demo.com
```

```browser
https://docker-registry.demo.com/v2
```

* Listing Repositories

```browser
https://docker-registry.demo.com/v2/_catalog
```

**Note. Change `docker-registry.demo.com` by your own domain name specified before in `settings.yml` file.**

### **Default Credentials**

| Application     | User    | Password |
| --------------- | ------- | -------- |
| SSH             | vagrant | vagrant  |
| Docker Registry | demo    | demo     |
