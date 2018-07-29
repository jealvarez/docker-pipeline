# **Provisioning Docker Registry**

## **Prerequisites**

* VirtualBox 5.2+
* Vagrant 2.1+

## **Warning**

**If you set more than one Virtual Machine instance using the same `Vagrantfile`, it's necessary to change the values of the properties that will be used to create the Virtual Machine, which ones will be described later.**

## **Getting Started**

### **Configuration**

* Configure the Virtual Machine setting the values of the [`settings.yml`](./settings.yml)

| Property             | Description                                          | Example            |
| -------------------- | ---------------------------------------------------- | ------------------ |
| ip_address           | IP Address of the Virtual Machine                    | 192.168.33.12      |
| virtual_machine_name | Name of the Virtual Machine                          | gitlab             |
| domain_name          | Domain name related with the let's encrypt generated | gitlab.demo.com    |

### **Running**

* Go to the main directory where is located the `Vagrantfile` file

```sh
vagrant up
```

### **Testing**

* Add to `/etc/hosts` file

```sh
192.168.33.12 gitlab.demo.com
```

* Wait a couple of minutes (5+) while `Gitlab` is configured. Login into the `Gitlab`.

```browser
https://gitlab.demo.com/
```

* Set `admin` password with `administrator` or whichever you want.

**Note. Change `gitlab.demo.com` by your own domain name specified before in `settings.yml` file.**

### **Default Credentials**

| Application     | User    | Password                    |
| --------------- | ------- | --------------------------- |
| SSH             | vagrant | vagrant                     |
| Gitlab          | root    | password defined by you     |
