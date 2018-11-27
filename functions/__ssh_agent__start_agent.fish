function __ssh_agent__start_agent
    set -l agent_command "/usr/bin/env ssh-agent"
    if set -q __ssh_agent__agent_command
        set agent_command $__ssh_agent__agent_command
    end
    set -l lifetime
    if set -q __ssh_agent__lifetime
        set lifetime "-t $__ssh_agent__lifetime"
    end
    # Start ssh-agent and setup environment
    set_color -d blue
    echo $__ssh_agent__nf_icon_agent "Starting ssh-agent…"
    eval $agent_command -s $lifetime | sed -e 's/\([^=]*\)=\([^;]*\);.*/set -xU \1 \2/' -e '/^echo/d' | source
    set_color normal
end
