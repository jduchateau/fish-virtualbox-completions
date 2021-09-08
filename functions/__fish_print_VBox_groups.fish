function __fish_print_VBox_groups
    VBoxManage list groups | string sub -s 2 -e -1
end