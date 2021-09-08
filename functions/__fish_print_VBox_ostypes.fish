function __fish_print_VBox_ostypes
    set -l ostypes (vboxmanage list ostypes | string collect)
    string replace -ra \
        'ID:\s*(\w+)\nDescription:\s*(.+)\nFamily ID:.*\nFamily Desc:.*\n64 bit:.*\n?' \
        '$1\t$2' $ostypes
end
