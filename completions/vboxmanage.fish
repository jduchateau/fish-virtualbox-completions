# VirtualBox CLI fish completion
# VBoxManage version 6.1.26
# Author: Jakub Duchateau

complete -c vboxmanage -d "VirtualBox Command Line Management Interface"
complete -c VBoxManage -w vboxmanage

set -l commands list showvminfo registervm unregistervm createvm modifyvm movevm import export startvm controlvm discardstate adoptstate closemedium storageattach storagectl bandwidthctl showmediuminfo createmedium modifymedium clonemedium mediumproperty encryptmedium checkmediumpwd convertfromraw getextradata setextradata setproperty usbfilter guestproperty guestcontrol metrics natnetwork hostonlyif usbdevsource snapshot mediumio sharedfolder dhcpserver debugvm extpack unattended cloud cloudprofile

# by default no files

complete -c vboxmanage --no-files

# options before all sub-commands
complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -s h -l help -d "print help message"
complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -s v -l version -d "print version number and exit"
complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -s q -l nologo -d "suppress the logo"
complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -l settingspw --require-parameter -d "provide the settings password"
complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -l settingspwfile -F -d "provide a file containing the settings password"
complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a @ -F -d "load arguments from file"

# completion lists

set -l toggle on off
set -l directions disabled hosttoguest guesttohost bidirectional
set -l mediums disk dvd floppy
set -l addremove add remove

## Commands

### list

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a list
complete -c vboxmanage -n "__fish_seen_subcommand_from list" -s l -l long -d "list with detailes"
complete -c vboxmanage -n "__fish_seen_subcommand_from list" -s s -l sorted -d "sorted list"

set -l listable vms runningvms ostypes hostdvds hostfloppies intnets bridgedifs hostonlyifs natnets dhcpservers hostinfo hostcpuids hddbackends hdds dvds floppies usbhost usbfilters systemproperties extpacks groups webcams screenshotformats cloudproviders cloudprofiles cloudnets

complete -c vboxmanage -n "__fish_seen_subcommand_from list" -a "$listable"

### showvminfo

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a showvminfo
complete -c vboxmanage -n "__fish_seen_subcommand_from showvminfo" -l details
complete -c vboxmanage -n "__fish_seen_subcommand_from showvminfo" -l machinereadable
complete -c vboxmanage -n "__fish_seen_subcommand_from showvminfo" -l log --require-parameter -a "(__vbox_compl_idx)"

complete -c vboxmanage -n "__fish_seen_subcommand_from showvminfo" -a "(__fish_print_VBox_vms)"

## registervm

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a registervm
complete -c vboxmanage -n "__fish_seen_subcommand_from registervm" -F

## unregistervm

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a unregistervm
complete -c vboxmanage -n "__fish_seen_subcommand_from unregistervm" -a "(__fish_print_VBox_vms)"
complete -c vboxmanage -n "__fish_seen_subcommand_from unregistervm" -l delete

## createvm

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a createvm
complete -c vboxmanage -n "__fish_seen_subcommand_from createvm" -l name --require-parameter
complete -c vboxmanage -n "__fish_seen_subcommand_from createvm" -l groups -a "(__fish_complete_list , __fish_print_VBox_groups)"
complete -c vboxmanage -n "__fish_seen_subcommand_from createvm" -l ostype -a "(__fish_print_VBox_ostypes)"
complete -c vboxmanage -n "__fish_seen_subcommand_from createvm" -l register -d "Register the VM in addition to creating the vbox file"
complete -c vboxmanage -n "__fish_seen_subcommand_from createvm" -l basefolder -F
complete -c vboxmanage -n "__fish_seen_subcommand_from createvm" -l uuid -a "(__fish_print_VBox_vms)"
complete -c vboxmanage -n "__fish_seen_subcommand_from createvm" -l default

## modifyvm

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a modifyvm
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -a "(__fish_print_VBox_vms)"

complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -rl name
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l groups -a "(__fish_complete_list , __fish_print_VBox_groups)"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -rl description
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l ostype -a "(__fish_print_VBox_ostypes)"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l iconfile -F

complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l memory -d "memorysize in MB"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l pagefusion -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vram -d "vramsize in MB"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l acpi -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l ioapic -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l hpet -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l triplefaultreset -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l apic -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l x2apic -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l paravirtprovider -a "none default legacy minimal hyperv kvm"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l paravirtdebug -r
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l hwvirtex -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nestedpaging -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l largepages -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vtxvpid -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vtxux -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l pae -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l longmode -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l ibpb-on-vm-exit -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l ibpb-on-vm-entry -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l spec-ctrl -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l l1d-flush-on-sched -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l l1d-flush-on-vm-entry -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l mds-clear-on-sched -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l mds-clear-on-vm-entry -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nested-hw-virt -a "$toggle"

set -l cpuprofiles host "Intel 8086" "Intel 80286" "Intel 80386"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l cpu-profile -a cpuprofiles
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l cpuid-portability-level -a "0 1 2 3"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l cpuid-set -d "<leaf[:subleaf]> <eax> <ebx> <ecx> <edx>"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l cpuid-remove -d"<leaf[:subleaf>"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l cpuidremoveall
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l hardwareuuid -d uuid
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l cpus -d number
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l cpuhotplug -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l plugcpu -d id
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l unplugcpu -d id
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l cpuexecutioncap -d "<1-100>"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l rtcuseutc -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l graphicscontroller -a "none vboxvga vmsvga vboxsvga"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l monitorcount -d number
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l accelerate3d -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l accelerate2dvideo -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l firmware -a"bios efi efi32 efi64"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l chipset -a"ich9 piix3"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l bioslogofadein -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l bioslogofadeout -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l bioslogodisplaytime -d msec
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l bioslogoimagepath -d imagepath
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l biosbootmenu -a "disabled menuonly messageandmenu"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l biosapic -a "disabled apic x2apic"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l biossystemtimeoffset -d "$1"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l biospxedebug -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l system-uuid-le -a "$toggle"

set -l boottype none floppy dvd disk net
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l boot1 -a "$boottype"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l boot2 -a "$boottype"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l boot3 -a "$boottype"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l boot4 -a "$boottype"


# FIXME indexed completion option<1-N>

set -l nic_args none null nat bridged intnet hostonly generic natnetwork
set -l nictype_args Am79C970A Am79C973 Am79C960 82540EM 82543GC 82545EM virtio
set -l nicpromisc_args deny allow-vms allow-all

complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nic -a "$nic_args"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nictype -a "$nictype_args"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l cableconnected -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nictrace -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nictracefile -F
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nicproperty
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nicspeed -d 'NIC speed in kbps'
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nicbootprio
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nicpromisc -a "$nicpromisc_args"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nicbandwidthgroup -a none #or <name>

complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l bridgeadapter -anone #or <devicename>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l hostonlyadapter -anone #or <devicename>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l intnet -d "$1"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nat-network -d "$1"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nicgenericdrv # <driver>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l natnet -a default #or <network>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l natsettings -d "[<mtu>],[<socksnd>],[<sockrcv>],[<tcpsnd>],[<tcprcv>]]"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l natpf -d "[<rulename>],tcp|udp,[<hostip>],<hostport>,[<guestip>],<guestport>]"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l natpf -a delete # <rulename>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nattftpprefix #  <prefix>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nattftpfile #  <file>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nattftpserver # <ip>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l natbindip # <ip>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l natdnspassdomain #$toggle
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l natdnsproxy #$toggle
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l natdnshostresolver #$toggle
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l nataliasmode #-d "default|[log],[proxyonly],[sameports]]"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l macaddress #auto |<mac>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l mouse -a"ps2 usb usbtablet usbmultitouch"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l keyboard -a"ps2 usb"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l uart #-a"off"#or |<I/O base> <IRQ>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l uartmode #-r
# FIXME completion for uartmode :
#  disconnected
#  server <pipe>
#  client <pipe>
#  tcpserver <port>
#  tcpclient <hostname:port>
#  file <file>
#  <devicename>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l uarttype #-a"16450 16550A 16750"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l lpt #-a "off"# <I/O base> <IRQ>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l lptmode #-d"<devicename>"

## End indexed

complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l guestmemoryballoon -d "balloonsize in MB"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vm-process-priority -a "default flat low normal high"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l audio -a"none null oss alsa pulse"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l audioin -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l audioout -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l audiocontroller -a "ac97 hda sb16"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l audiocodec -a "stac9700 ad1980 stac9221 sb16"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l clipboard-mode -a "$directions"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l draganddrop -a "$directions"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vrde -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vrdeextpack -a default # or <name>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vrdeproperty -d"<name=[value]>"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vrdeport -d hostport
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vrdeaddress -d hostip
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vrdeauthtype -a "null external guest"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vrdeauthlibrary -a default # or <name>
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vrdemulticon -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vrdereusecon -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vrdevideochannel -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l vrdevideochannelquality -d percent
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l usbohci -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l usbehci -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l usbxhci -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l usbrename -d "<oldname> <newname>"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l snapshotfolder -a default -F
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l teleporter -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l teleporterport
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l teleporteraddress
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l teleporterpassword
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l teleporterpasswordfile -F -a stdin
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l tracing-enabled -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l tracing-config -d "String defining which group of trace points are enabled."
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l tracing-allow-vm-access -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l usbcardreader -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l autostart-enabled -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l autostart-delay -d "in seconds"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l recording -a "$toggle"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l recordingscreens -a all # or <screen ID>[ <screen ID>...]
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l recordingfile -F
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l recordingvideores --require-parameter -d "<width> <height>"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l recordingvideorate --require-parameter
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l recordingvideofps --require-parameter
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l recordingmaxtime --require-parameter
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l recordingmaxsize --require-parameter -d "<MB>"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l recordingopts -d"<key=value> [,<key=value> ...]"
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l defaultfrontend -a default # or <name>

## movevm

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a movevm
complete -c vboxmanage -n "__fish_seen_subcommand_from movevm" -a "(__fish_print_VBox_vms)"
complete -c vboxmanage -n "__fish_seen_subcommand_from movevm" -l type -a basic
complete -c vboxmanage -n "__fish_seen_subcommand_from modifyvm" -l folder -F

## import

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a import
#TODO

## export

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a export
#TODO

## startvm

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a startvm
complete -c vboxmanage -n "__fish_seen_subcommand_from startvm" -a "(__fish_print_VBox_vms)"
complete -c vboxmanage -n "__fish_seen_subcommand_from startvm" -l type -a "gui sdl headless separate"
complete -c vboxmanage -n "__fish_seen_subcommand_from startvm" -s E -l putenv -d "Environment variable in <NAME>[=<VALUE>] format"

## controlvm

set -l controlvm_actions pause resume reset poweroff savestate acpipowerbutton acpisleepbutton keyboardputscancode keyboardputstring keyboardputfile setlinkstate nic nictrace nictracefile nicproperty nicpromisc natpf guestmemoryballoon usbattach usbdetach audioin audioout clipboard draganddrop vrde vrdeport vrdeproperty vrdevideochannelquality setvideomodehint setscreenlayout screenshotpng recording setcredentials teleport plugcpu unplugcpu cpuexecutioncap webcam addencpassword removeencpassword removeallencpasswords changeuartmode vm-process-priority

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a controlvm
complete -c vboxmanage -n "__fish_seen_subcommand_from controlvm" -a "(__fish_print_VBox_vms)"
complete -c vboxmanage -n "__fish_seen_subcommands controlvm *" -a "$controlvm_actions"

## discardstate

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a discardstate
complete -c vboxmanage -n "__fish_seen_subcommand_from discardstate" -a "(__fish_print_VBox_vms)"

## adoptstate

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a adoptstate
complete -c vboxmanage -n "__fish_seen_subcommand_from adoptstate" -a "(__fish_print_VBox_vms)"

## closemedium

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a closemedium
complete -c vboxmanage -n "__fish_seen_subcommand_from closemedium" -a "$mediums"

## storageattach

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a storageattach
complete -c vboxmanage -n "__fish_seen_subcommand_from storageattach" -a "(__fish_print_VBox_vms)"

## storagectl

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a storagectl
complete -c vboxmanage -n "__fish_seen_subcommand_from storagectl" -a "(__fish_print_VBox_vms)"

## bandwidthctl

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a bandwidthctl
complete -c vboxmanage -n "__fish_seen_subcommand_from bandwidthctl" -a "(__fish_print_VBox_vms)"

## showmediuminfo

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a showmediuminfo
complete -c vboxmanage -n "__fish_seen_subcommand_from showmediuminfo" -a "$mediums"

## createmedium

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a createmedium
complete -c vboxmanage -n "__fish_seen_subcommand_from createmedium" -a "$mediums"

##modifymedium

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a modifymedium
complete -c vboxmanage -n "__fish_seen_subcommand_from modifymedium" -a "$mediums"

## closemedium

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a closemedium
complete -c vboxmanage -n "__fish_seen_subcommand_from closemedium" -a "$mediums"

## mediumproperty

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a mediumproperty
complete -c vboxmanage -n "__fish_seen_subcommand_from mediumproperty" -a "$mediums"

## encryptmedium

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a encryptmedium
complete -c vboxmanage -n "__fish_seen_subcommand_from encryptmedium" -F

## checkmediumpwd

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a checkmediumpwd
complete -c vboxmanage -n "__fish_seen_subcommand_from checkmediumpwd" -F

## convertfromraw

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a convertfromraw
complete -c vboxmanage -n "__fish_seen_subcommand_from convertfromraw" -F

## getextradata

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a getextradata
complete -c vboxmanage -n "__fish_seen_subcommand_from getextradata" -a "(__fish_print_VBox_vms)" -a global

## setextradata

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a setextradata
complete -c vboxmanage -n "__fish_seen_subcommand_from setextradata" -a "(__fish_print_VBox_vms)" -a global

## setproperty

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a setproperty

## usbfilter 

set -l usbfilter_actions add modify remove

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a usbfilter
complete -c vboxmanage -n "__fish_seen_subcommand_from usbfilter" -a "$usbfilter_actions"

## guestproperty

set -l guestproperty_actions get set delete unset enumerate wait

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a guestproperty
complete -c vboxmanage -n "__fish_seen_subcommand_from guestproperty" -a "$guestproperty_actions"

## guestcontrol

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a guestcontrol
complete -c vboxmanage -n "__fish_seen_subcommand_from guestcontrol" -a "(__fish_print_VBox_vms)"

## metrics

set -l metrics_actions list setup query enable disbale collect

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a metrics
complete -c vboxmanage -n "__fish_seen_subcommand_from metrics" -a "$metrics_actions"

## natnetwork

set -l natnetwork_actions add remove modify start stop list

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a natnetwork
complete -c vboxmanage -n "__fish_seen_subcommand_from natnetwork" -a "$natnetwork_actions"

## hostonlyif

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a hostonlyif

## usbdevsource

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a usbdevsource
complete -c vboxmanage -n "__fish_seen_subcommand_from usbdevsource" -a "$addremove"

## snapshot

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a snapshot
complete -c vboxmanage -n "__fish_seen_subcommand_from snapshot" -a "(__fish_print_VBox_vms)"

## clonevm

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a clonevm
complete -c vboxmanage -n "__fish_seen_subcommand_from clonevm" -a "(__fish_print_VBox_vms)"

## mediumio

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a mediumio
complete -c vboxmanage -n "__fish_seen_subcommand_from mediumio" -F

## sharedfolder

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a sharedfolder
complete -c vboxmanage -n "__fish_seen_subcommand_from sharedfolder" -a "$addremove"

complete -c vboxmanage -n "__fish_seen_subcommands sharedfolder 'add remove'" -a "(__fish_print_VBox_vms)"

complete -c vboxmanage -n "__fish_seen_subcommands 'sharedfolder' 'add remove' '*'" -l name -r
complete -c vboxmanage -n "__fish_seen_subcommands 'sharedfolder' 'add' '*'" -l hostpath -F
complete -c vboxmanage -n "__fish_seen_subcommands 'sharedfolder' 'add' '*'" -l readonly
complete -c vboxmanage -n "__fish_seen_subcommands 'sharedfolder' 'add remove' '*'" -l transient
complete -c vboxmanage -n "__fish_seen_subcommands 'sharedfolder' 'add' '*'" -l automount
complete -c vboxmanage -n "__fish_seen_subcommands 'sharedfolder' 'add' '*'" -l auto-mount-point -F

## dhcpserver

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a dhcpserver

## debugvm

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a debugvm
complete -c vboxmanage -n "__fish_seen_subcommand_from debugvm" -a "(__fish_print_VBox_vms)"

## extpack

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a extpack
complete -c vboxmanage -n "__fish_seen_subcommand_from debugvm" -a "install uninstall cleanup"

## unattended

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a unattended

## cloud

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a cloud

## cloudprofile

complete -c vboxmanage -n "not __fish_seen_subcommand_from $commands" -a cloudprofile
