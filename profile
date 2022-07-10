export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export GPG_TTY=$(tty)

function idssh() {
   gpg --list-keys --with-keygrip $1 | awk '/\[A\]/ { f = 1; next } f && /Keygrip/ { print $3 } { f = 0 }' > $GNUPGHOME/sshcontrol
}

# vim ft=bash
