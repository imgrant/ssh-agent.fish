function __ssh_agent__start_agent
    set -l command "/usr/bin/env ssh-agent"
    if set -q __ssh_agent__command
        set command __ssh_agent__command
    set -l lifetime
    if set -q __ssh_agent__lifetime
        set lifetime "-t $__ssh_agent__lifetime"
    end
    # Start ssh-agent and setup environment
    echo-info "Starting ssh-agent..."
    source ($command -s $lifetime | sed -e 's/\([^=]*\)=\([^;]*\);.*/set -xU \1 \2/' -e '/^echo/d' | psub)
end