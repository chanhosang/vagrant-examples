- [vagrant-examples](#vagrant-examples)
  - [Vagrant Up with Hyper-V Provider](#vagrant-up-with-hyper-v-provider)

# vagrant-examples

A collection of sample vagrant projects for study purposes.

## Vagrant Up with Hyper-V Provider

**Pre-requisite**
* Make sure you've got Hyper-V running on your Windows and enabled. ~ https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v

Some 3rd party applications cannot work when Hyper-V is in use, which means they will not be able to run when **WSL 2 is enabled**, such as **VMware** and **VirtualBox**. ~ https://docs.microsoft.com/en-us/windows/wsl/wsl2-faq


By default, vagrant uses **VirtualBox** as provider, and you can't run other virtualization solutions alongside Hyper-V. Therefore, you need to force the vagrant to use a specific **hyperv provider**.

In this vagrant project, the aim is to create a Hyper-V Virtual Machine (Ubuntu) with the following softwares installed:
* Ansible
* Git
* Docker
* Docker-Compose

Let’s start by launching an elevated (run as Administrator) Terminal (Cmd Prompt, PowerShell or Git Bash), and do the following:

1. Install a Box by specifying *--provider hyperv* the base image will be used by Vagrant to quickly clone a virtual machines.
   ```
   vagrant box add generic/ubuntu2004 --provider hyperv
   ```
2. Initialise 'vagrant-ubuntu' folder inside the repository directory as a project directory with a *Vagrantfile* at its root.
   ```
   cd C:\vagrant-examples\vagrant-ubuntu
   ```
3. Boot up the virtual machine by running the following command:
   ```
   vagrant up --provider hyperv
   ```
   The switch (Default Switch) will be automatically attached to the Hyper-V instance.

   For example,
   ```
    PS C:\vagrant-examples\vagrant-hyperv-ubuntu> vagrant up
    Bringing machine 'default' up with 'hyperv' provider...
    ==> default: Verifying Hyper-V is enabled...
    ==> default: Verifying Hyper-V is accessible...
    ==> default: Importing a Hyper-V instance
        default: Creating and registering the VM...
        default: Successfully imported VM
        default: Configuring the VM...
        default: Setting VM Enhanced session transport type to disabled/default (VMBus)
    ==> default: Starting the machine...
    ==> default: Waiting for the machine to report its IP address...
        default: Timeout: 120 seconds
        default: IP: 172.28.75.210
    ==> default: Waiting for machine to boot. This may take a few minutes...
        default: SSH address: 172.28.75.210:22
        default: SSH username: vagrant
        default: SSH auth method: private key
        default:
        default: Vagrant insecure key detected. Vagrant will automatically replace
        default: this with a newly generated keypair for better security.
        default:
        default: Inserting generated public key within guest...
        default: Removing insecure key from the guest if it's present...
        default: Key inserted! Disconnecting and reconnecting using new SSH key...
    ==> default: Machine booted and ready!
    ==> default: Rsyncing folder: /cygdrive/c/hosang/vagrant-examples/vagrant-hyperv-ubuntu/provision/ => /home/vagrant/.ansible
    ==> default: Running provisioner: ansible_local...
        default: Installing Ansible...
        default: Running ansible-playbook...
   ```
   *Note: The vagrant will continue to provision the virtual machine with required softwares by running the ansible playbooks.*
4. Upon completion, check the status of the vagrant virtual machine:
   ```
   vagrant status
   ```
5. The IP Address is dynamically assigned to the VM on every restart. You may check the currently assigned IP address by running the following command:
   ```
   vagrant ssh-config
   ```
   For Example,
   ```
    PS C:\vagrant-examples\vagrant-ubuntu> vagrant ssh-config
    Host default
    HostName 172.28.75.210
    User vagrant
    Port 22
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking no
    PasswordAuthentication no
    IdentityFile C:/vagrant-examples/vagrant-ubuntu/.vagrant/machines/default/hyperv/private_key
    IdentitiesOnly yes
    LogLevel FATAL
   ```
6. You can either SSH into the machine by running *vagrant ssh* on the terminal (Command Prompt, Git Bash or PowerShell) or via PuTTy.

