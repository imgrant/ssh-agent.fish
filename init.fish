if not set -qg SSH_AUTH_SOCK
    if set -qU SSH_AGENT_PID
        if not ps x | grep $SSH_AGENT_PID | grep ssh-agent >/dev/null
            __ssh_agent__start_agent
        end
    end
end
__ssh_agent__fix_environment
__ssh_agent__load_identities