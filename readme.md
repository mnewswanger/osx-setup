# MacOS Setup #

## Set up Workstation ##

### Caveats ###

App Store applications will only re-install.  If you haven't purchased them (most are free) from the App Store.  This is tied to your Apple ID, so once it's purchased on your account, it'll work on any machines.

### Pre-Requisites ###

Log in with your Apple ID.  This should be completed at first boot.  This is required to access the App Store.

### Initialization ###

* Clone or download the repository and run `setup.sh`.  It will prompt for your password at a few points when elevated permissions are necessary for installs.

### Manual Steps ###

* Install go plugin & dependencies for VS Code

### Updates ###

After everything has been installed with the `setup.sh` script, updates can be run with `update.sh`.  This will update any managed packages in `homebrew` and the App Store.
