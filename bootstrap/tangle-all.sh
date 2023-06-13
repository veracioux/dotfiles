#!/usr/bin/env -S emacs --script

;; Tangle all my dotfiles. If --dest is used, then the files are tangled to
;; their final destinations under $HOME, instead of the directory returned by
;; (haris/tangle-home). Dependency installation scripts will be saved to the
;; destination returned by (haris/tangle-deps) regardless.

(setq command-switch-alist '(("--dest" . ignore)))
(setq dest (member "--dest" command-line-args))

(load-file (format "%s/tangle.el" (file-name-directory load-file-name)))
(haris/tangle-all dest)

;; vim: filetype=lisp
;; -*- mode: emacs-lisp -*-
;; NOTE: Although this file is kept under version control, it is tangled from
;; ~/.haris/scripts.org, so don't modify it directly
