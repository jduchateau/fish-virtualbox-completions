function __fish_seen_subcommands

    # __fish_seen_subcommands test if the arguments in the commandline 
    # are contained in the list of the same position, 
    # ignoring -options, and with a possible jocker*
    #
    # Example:
    #   __fish_seen_subcommands control * "create modify remove"
    #   
    #  executable create  name      remove => False, create is not control
    #  vmctrl     control MyMachine modify => True
    #  vmctrl     control MyMachine modify xxxx => False, xxxx is in excess
    # 

    set -l cmd (commandline -poc)
    # set -l cmd VBoxManage encryptmedium 4efbd310-4cec-4eae-aec1-107b8cceb9a4 --
    # set -l cmd vboxmanage checkmediumpwd 4efbd310-4cec-4eae-aec1-107b8cceb9a4
    set -e cmd[1]

    set -l j 1
    set -l cj (count $cmd)

    # echo 'cmd  ' $cmd
    # echo 'argv ' $argv

    for i in (seq (count $argv))

        # Ignore options
        __fish_consume_options

        # $cmd consumed
        if test $j -gt $cj
            return 1
        end

        echo $cmd[$j] "$j in $i" $argv[$i]

        # match or ignore
        if not test "$argv[$i]" = "*"; and not contains $cmd[$j] $argv[$i]
            return 1
        end

        set j (math $j+1)
    end

    __fish_consume_options
    # echo $j ">" $cj
    return (test $j -gt $cj)
end


function __fish_consume_options -S
    while test $j -le $cj; and string match -q "^-" $cmd[$j]
        set j (math $j+1)
    end
end
