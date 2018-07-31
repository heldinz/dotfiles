alias giti='git'
alias ve='source venv/bin/activate'
alias vpip='python venv/bin/pip'
alias fucking=sudo

function protect_pip {
    # Determine whether we're in a virtualenv or not
    IS_VENV=$(env | grep VIRTUAL_ENV | wc -l)

    # If we are, proceed and exit
    if [ $IS_VENV != 0 ]; then
      # Run the protected command using the path in the virtualenv
      $VIRTUAL_ENV/bin/pip "$@"
    else
      # Use grep to determine if "install" is in arguments
      echo "$*" | grep install > /dev/null

      # If "install" is not in the arguments, we just proceed as requested
      if [ $? != 0 ]; then
          # Run the protected command using its full path (so as not to trigger alias)
          /usr/local/bin/pip "$@"
      else
          # We tried to run "pip install" outside of a virtualenv, get user confirmation
          echo -n You\'re not in a virtualenv — are you sure \(y/n\)?' '
          read CONFIRM
          if [ "$CONFIRM" = y ]; then
            # Run the protected command using the global path
            /usr/local/bin/pip "$@"
          fi
      fi
    fi
}
alias pip=protect_pip
