function __ssh_agent__fix_environment
    if set -qg SSH_AUTH_SOCK
        set -l global_socket (set -xgL | grep SSH_AUTH_SOCK | cut -d' ' -f 2)
        set -l universal_socket (set -xUL | grep SSH_AUTH_SOCK | cut -d' ' -f 2)
        set -eg SSH_AUTH_SOCK
        if test "$global_socket" != "$universal_socket"
            set -xU SSH_AUTH_SOCK $global_socket
        end
    end
end