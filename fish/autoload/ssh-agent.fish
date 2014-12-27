function __ssh_agent__start_agent
    set -l lifetime
    if set -q __ssh_agent__lifetime
        set lifetime "-t $__ssh_agent__lifetime"
    end
    # Start ssh-agent and setup environment
    echo "Starting ssh-agent..."
    source (/usr/bin/env ssh-agent -s $lifetime | sed 's/\([^=]*\)=\([^;]*\);.*/set -xU \1 \2/' | psub)
end

function __ssh_agent__load_identities
    if not ssh-add -l >/dev/null
        # Only add keys if the agent has no identities
        if set -q __ssh_agent__identities
            set identities $__ssh_agent__identities
        end
        # Load identities
        echo "Loading identities..."
        if not set -q identities
            /usr/bin/ssh-add
        else
            for identity in $identities
                echo "    $identity"
                /usr/bin/ssh-add -AK $HOME/.ssh/$identity
            end
        end
    end
end

if set -q SSH_AGENT_PID
    if not ps x | grep $SSH_AGENT_PID | grep ssh-agent >/dev/null
        __ssh_agent__start_agent
    end
else
    __ssh_agent__start_agent
end
__ssh_agent__load_identities
