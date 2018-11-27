set -g __ssh_agent__nf_icon_agent
set -g __ssh_agent__nf_icon_identity
set -g __ssh_agent__nf_icon_key_success
set -g __ssh_agent__nf_icon_key_fail

if set -q __ssh_agent__use_nerd_font
    if test "$__ssh_agent__use_nerd_font" = "yes"
        set __ssh_agent__nf_icon_agent \uf80a
        set __ssh_agent__nf_icon_identity \uf50a 
        set __ssh_agent__nf_icon_key_success \uf808 
        set __ssh_agent__nf_icon_key_fail \uf809
    end
end

if not set -qg SSH_AUTH_SOCK
    if set -qU SSH_AGENT_PID
        if not ps x | grep $SSH_AGENT_PID | grep ssh-agent >/dev/null
            __ssh_agent__start_agent
        end
    end
end
__ssh_agent__fix_environment
__ssh_agent__load_identities
