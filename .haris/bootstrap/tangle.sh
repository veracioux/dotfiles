#!/usr/bin/env -S emacs --script

(load-file (concat (file-name-directory load-file-name) "/tangle.el"))
(setq org-confirm-babel-evaluate nil)

(org-babel-tangle-file (file-truename (elt argv 0)))
; NOTE: Although this file is kept under version control, it is tangled from
; ~/.haris/scripts.org, so don't modify it directly
