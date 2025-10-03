#!/usr/bin/env -S emacs --script

;; Tangle all my dotfiles.

(setq this-script-dir (file-name-directory load-file-name))

(load-file (format "%s/tangle.el" this-script-dir))
(haris/tangle-all :dotfiles-dir (expand-file-name
                                 (format "%s/.." this-script-dir)))

;; vim: filetype=lisp
;; -*- mode: emacs-lisp -*-
;; NOTE: Although this file is kept under version control, it is tangled from
;; ~/.haris/scripts.org, so don't modify it directly
