# Automatically change the directory in fish after closing ranger
#
# This is a fish alias to automatically change the directory to the last visited
# one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.
#
# Note: funcsave save the alias in fish's config files, you do not need to copy
# this file anywhere, just execute it once

function ranger-cd
    set dir (mktemp -t ranger_cd.XXX)
    ranger --choosedir=$dir
    cd (cat $dir) $argv
    rm $dir
    commandline -f repaint
end

set -q RANGER_CD_FISH; or set RANGER_CD_FISH \co
bind -M insert $RANGER_CD_FISH ranger-cd
bind $RANGER_CD_FISH ranger-cd
