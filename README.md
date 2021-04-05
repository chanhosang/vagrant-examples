# vagrant-examples

A collection of sample vagrant projects for study purposes.

## Vagrant Up with Hyper-V Provider

**Pre-requisite**
* Make sure you've got Hyper-V running on your Windows and enabled. ~ https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v

Some 3rd party applications cannot work when Hyper-V is in use, which means they will not be able to run when WSL 2 is enabled, such as VMware and VirtualBox. However, recently both VirtualBox and VMware have released versions that support Hyper-V and WSL2. ~ https://docs.microsoft.com/en-us/windows/wsl/wsl2-faq


By default,  vagrant uses VirtualBox as provider, and you can't run other virtualization solutions alongside Hyper-V. Therefore, you need to force the vagrant to use a specific hyperv provider.

Let’s start by launching an elevated (run as Administrator) Terminal (Cmd Prompt, PowerShell or Git Bash), and do the following:

1. Install a Box by specifying *--provider hyperv* the base image will be used by Vagrant to quickly clone a virtual machines.
   ```
   vagrant box add generic/ubuntu2004 --provider hyperv
   ```
2. Initialise 'vagrant-ubuntu' folder inside the repository directory as a project directory with a *Vagrantfile* at its root.
   ```
   cd C:\vagrant-examples\vagrant-ubuntu
   ```
3. Boot up the environment by running vagrant up:
   ```
   vagrant up --provider hyperv
   ```
   You will get propt to select the switch to be attached to the Hyper-V instance. Just type in the selection number and press ENTER to continue.

   For example,
   ```
    PS C:\vagrant-examples\vagrant-ubuntu> vagrant up
    Bringing machine 'default' up with 'hyperv' provider...
    ==> default: Verifying Hyper-V is enabled...
    ==> default: Verifying Hyper-V is accessible...
    ==> default: Importing a Hyper-V instance
        default: Creating and registering the VM...
        default: Successfully imported VM
        default: Please choose a switch to attach to your Hyper-V instance.
        default: If none of these are appropriate, please open the Hyper-V manager
        default: to create a new virtual switch.
        default:
        default: 1) Default Switch
        default: 2) WSL
        default:
        default: What switch would you like to use? 1
        default: Configuring the VM...
        default: Setting VM Enhanced session transport type to disabled/default (VMBus)
    ==> default: Starting the machine...
    ==> default: Waiting for the machine to report its IP address...
        default: Timeout: 120 seconds
        default: IP: 172.28.75.220
    ==> default: Waiting for machine to boot. This may take a few minutes...
        default: SSH address: 172.28.75.220:22
        default: SSH username: vagrant
        default: SSH auth method: private key
        default:
        default: Vagrant insecure key detected. Vagrant will automatically replace
        default: this with a newly generated keypair for better security.
        default:
        default: Inserting generated public key within guest...
   ```
4. Check the status of the vagrant machine:
   ```
   vagrant status
   ```
5. Check the SSH Config:
   ```
    PS C:\vagrant-examples\vagrant-ubuntu> vagrant ssh-config
    Host default
    HostName 172.28.75.220
    User vagrant
    Port 22
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking no
    PasswordAuthentication no
    IdentityFile C:/hosang/vagrant-examples/vagrant-ubuntu/.vagrant/machines/default/hyperv/private_key
    IdentitiesOnly yes
    LogLevel FATAL
   ```
6. SSH into the machine using *vagrant ssh* or via PuTTy.

