#!/usr/bin/env -S emacs --script

(load-file "~/.haris/bootstrap/tangle.el")
(setq org-confirm-babel-evaluate nil)

(org-babel-tangle-file (file-truename (elt argv 0)))
