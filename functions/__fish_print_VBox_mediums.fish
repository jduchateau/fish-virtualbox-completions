function __fish_print_VBox_hdds
    set -l hdds (vboxmanage list hdds | string collect)
    string match -raq 'UUID:\s*(?<uuid>[a-zA-Z0-9\-]+)\n.*\n.*\n.*\nLocation:\s*(?<loc>.*)\n' $hdds

    __fish_print_VBox_uuid_loc
end

function __fish_print_VBox_dvds
    set -l dvds (vboxmanage list dvds | string collect)
    string match -raq 'UUID:\s*(?<uuid>[a-zA-Z0-9\-]+)\n.*\n.*\nLocation:\s*(?<loc>.*)\n' $dvds

    __fish_print_VBox_uuid_loc
end

function __fish_print_VBox_floppies
    set -l floppies (vboxmanage list floppies | string collect)
    string match -raq 'UUID:\s*(?<uuid>[a-zA-Z0-9\-]+)\n.*\n.*\nLocation:\s*(?<loc>.*)\n' $floppies

    __fish_print_VBox_uuid_loc
end

function __fish_print_VBox_uuid_loc -S
    set -l max (count $uuid)
    set locShort
    for l in $loc
        set l (string split / $l)
        set --append locShort $l[-1]
    end

    set -l i 1
    for id in $uuid
        printf "%s\t%s\n" $id $locShort[$i]
        set i (math $i+1)
    end
end


function __fish_print_VBox_mediums
    __fish_print_VBox_hdds
    __fish_print_VBox_dvds
    __fish_print_VBox_floppies
end
