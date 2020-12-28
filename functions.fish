alias duck="w3m duckduckgo.com"
alias wthr="curl wttr.in/Galway"

function update-repos
    set originaldir $PWD
    # make repos directory
    if not test -d ~/repos/
        mkdir ~/repos/
    end

    for i in (cat ~/dotfiles/repos)
        set repo $HOME/repos/(basename $i)
        echo
        echo $repo

        if test -d "$repo"
            cd "$repo" && git pull
        else
            git clone $i $repo
        end
    end
    cd $originaldir
end

function mkdir-cd
    mkdir $argv && cd $argv
end

function clean-unzip --argument zipfile
    if not test (echo $zipfile | string sub --start=-4) = .zip
        echo (status function): argument must be a zipfile
        return 1
    end

    if is-clean-zip $zipfile
        unzip $zipfile
    else
        set zipname (echo $zipfile | trim-right '.zip')
        mkdir $zipname || return 1
        unzip $zipfile -d $zipname
    end
end

function unzip-cd --argument zipfile
    clean-unzip $zipfile && cd (echo $zipfile | trim-right .zip)
end

function clone-cd --argument repo _destination
    set destination (default $_destination (basename $repo | trim-right .git))
    if file-exists $destination
        cd $destination && git pull
        return
    end

    git clone --depth=1 $repo $destination && cd $destination
end

function youtubet-dl-batch --argument listfile
    youtube-dl -f best --output "%(uploader)s/%(title)s.%(ext)s" -a $listfile
end
