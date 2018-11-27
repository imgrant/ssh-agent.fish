function __ssh_agent__load_identities
    if not ssh-add -l >/dev/null
        # Only add keys if the agent has no identities
        if set -q __ssh_agent__identities
            set identities $__ssh_agent__identities
        end
        # Load identities
        echo-info "Loading identities..."
        if not set -q identities
            /usr/bin/ssh-add
        else
            for identity in $identities
                echo-info "    $identity"
                /usr/bin/ssh-add -AK $HOME/.ssh/$identity
            end
        end
    end
end