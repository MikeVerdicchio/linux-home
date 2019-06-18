# *nix commands
alias grep="grep --color=auto --exclude-dir='.git'"

# Python
alias rmpyc="find . -name '*.pyc' -delete"
alias pipthis="pip install -r requirements.txt"
alias pipupgrade="pip install --upgrade --upgrade-strategy only-if-needed"
alias pipcleanall="pip freeze | grep -v '^-e ' | xargs pip uninstall -y"

# Django
alias dbuild="python manage.py makemigrations && python manage.py migrate && python manage.py runserver"

# Git Home
alias home='git --work-tree=$HOME --git-dir=$HOME/.home'
