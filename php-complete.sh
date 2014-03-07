cd /srv/help/php
ls -1 function*.html | sed -e 's/^function\.\([-a-zA-Z_0-9]*\)\.html/\1/' | tr - _  > ~/.emacs.d/php-completion-file
