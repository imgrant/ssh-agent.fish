function __ssh_agent__load_identities
    # Only add keys if the agent has no identities (and it can connect!)
    /usr/bin/env ssh-add -l >/dev/null 2>&1
    if test $status -eq 1
        set -l identities ""
        if set -q __ssh_agent__identities
            set identities $__ssh_agent__identities
        end
	# Load identities
	if test $identities
	  or test -e $HOME/.ssh/id_rsa
	  or test -e $HOME/.ssh/id_dsa
	  or test -e $HOME/.ssh/id_ecdsa
	  or test -e $HOME/.ssh/id_ed25519
	  or test -e $HOME/.ssh/identity
	    set_color -d brblue
	    echo $__ssh_agent__nf_icon_identity "Loading identities…"
	    set_color -d cyan
	    for identity in $identities
	        set -l id_path
	        if test $identity
	    	    set id_path "$HOME/.ssh/$identity"
	        end
	        set -l ret (/usr/bin/env ssh-add -k $id_path 2>&1)
	        if test $status -eq 0
	    	    echo $__ssh_agent__nf_icon_key_success $ret | sed -e 's/Identity added: //'
	        else
	    	    echo $__ssh_agent__nf_icon_key_fail $ret
	        end
	    end
	    set_color normal
	end
    end
end
