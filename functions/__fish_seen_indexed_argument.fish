function __fish_seen_indexed_argument
    argparse 'l/long=+' -- $argv

    set -l cmd (commandline -co)
    set -e cmd[1]

    for t in $cmd
        for l in $_flag_l
            if string match -qr -- "^--$l[0-9]+" $t
                return 0
            end
        end
    end

    return 1

end
