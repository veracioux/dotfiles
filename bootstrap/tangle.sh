#!/usr/bin/env -S emacs --script

(load-file (format "%s/tangle.el" (file-name-directory load-file-name)))

(haris/tangle--file-non-interactively (file-truename (elt argv 0)))

; NOTE: Although this file is kept under version control, it is tangled from
; ~/.haris/scripts.org, so don't modify it directly
