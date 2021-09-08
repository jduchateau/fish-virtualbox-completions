function __fish_seen_subcommands
    set -l $cmd (commandline -poc)
    set -e cmd[1]

    set -l j 1
    set -l cj (count $cmd)

    for i in (seq (count $argv))

        # Ignore options
        while test $j -le $cj; and string match -q "^-" $cmd[$j]
            set j (math $j+1)
        end

        # $cmd consumed
        if test $j -gt $cj
            return 1
        end

        # match or ignore
        if not test "$argv[$i]" = "*"; and contains $cmd[$j] $argv[$i]
            return 1
        end
    end
    
    return 0 
end
