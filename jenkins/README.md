# **Provisioning Jenkins**

## **Prerequisites**

* VirtualBox 5.2+
* Vagrant 2.1+

## **Warning**

**If you set more than one Virtual Machine instance using the same `Vagrantfile`, it's necessary to change the values of the properties that will be used to create the Virtual Machine, which ones will be described later.**

## **Getting Started**

### **Configuration**

* Configure the Virtual Machine setting the values of the [`settings.yml`](./settings.yml)

| Property                         | Description           | Example       |
| -------------------- | --------------------------------- | ------------- |
| ip_address           | IP Address of the Virtual Machine | 192.168.33.11 |
| virtual_machine_name | Name of the Virtual Machine       | jenkins       |

### **Running**

* Go to the main directory where is located the `Vagrantfile` file

```sh
vagrant up
```

### **Testing**

* Add to `/etc/hosts` file

```sh
192.168.33.11 jenkins.demo.com
```

* Jenkins initial setup is required. A security token is required to proceed. Please use the following security token printed in the console when all the virtual machine be configured. For instance:

```ssh
==> default: Running provisioner: shell...
    default: Running: inline script
    default: Jenkins Default User/Password = [ root / e9841c55f220492ba5a57814dc0732d2 ]
```

* Login into Jenkins UI

```browser
http://jenkins.demo.com:8080
```

* Pick the password printed in the console and paste it in the `Unlock Jenkins` page.

* Choose `Install suggested plugins` in the `Customize Jenkins` page.

* If you want yo can create a new adminin user, if not, choose `Continue as admin` in the `Create First Admin User` page.

* `Save and Finish` in `Instance Configuration` page, and, `Start using Jenkins`.

### **Default Credentials**

| Application | User    | Password                             |
| ----------- | ------- | ------------------------------------ |
| SSH         | vagrant | vagrant                              |
| Jenkins     | admin   | password printed in the command-line |
