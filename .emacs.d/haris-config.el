;; General settings
(setq-default fill-column 80)
(setq default-tab-width 4)
(add-hook 'text-mode-hook #'auto-fill-mode)
(add-hook 'prog-mode-hook #'auto-fill-mode)
(add-hook 'org-mode-hook   'org-fragtog-mode)
;; TODO test this out
(if (not (boundp 'haris-prepended-path))
    (progn
      (setq haris-prepended-path "yes")
      (setenv "PATH" (concat (expand-file-name "~/.local/bin") ":" (getenv "PATH")))))

;; General bindings
(global-set-key
 (kbd "M-t")
 '(lambda () (interactive)
    (start-process "" nil
                   "alacritty"
                   "--working-directory"
                   (expand-file-name "."))))
(global-set-key
 (kbd "M-e")
 '(lambda () (interactive)
    (start-process "" nil
                   "emacsclient"
                   "--create-frame"
                   (buffer-file-name (window-buffer)))))
(global-set-key
 (kbd "M-v")
 '(lambda () (interactive)
    (start-process "" nil
                   "gvim"
                   (buffer-file-name (window-buffer)))))
(define-key evil-normal-state-map
 (kbd "SPC f e h")
 '(lambda () (interactive)
    (find-file "~/.emacs.d/haris-config.el")))
(define-key evil-normal-state-map
  (kbd "SPC f e r")
  '(lambda () (interactive)
     (load-file "~/.emacs.d/haris-config.el")))

;; TODO (require 'translate-shell)

;; Ivy
(setq ivy-initial-inputs-alist ())

;; ERC
(load (locate-user-emacs-file "ercrc.el") nil :nomessage)

;; Evil numbers
(define-key evil-normal-state-map (kbd "C-a")   'evil-numbers/inc-at-pt)
(define-key evil-visual-state-map (kbd "C-a")   'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x")   'evil-numbers/dec-at-pt)
(define-key evil-visual-state-map (kbd "C-x")   'evil-numbers/dec-at-pt)

;; Evil-nerd-commenter
(evilnc-default-hotkeys)
(add-hook 'octave-mode-hook
  (lambda ()
    (setq comment-start "% " comment-end "")))
(define-key evil-normal-state-map (kbd "SPC c c") 'evilnc-copy-and-comment-lines)

;; Scroll with Alt
(define-key evil-normal-state-map (kbd "M-k")   'evil-scroll-line-up)
(define-key evil-insert-state-map (kbd "M-k")   'evil-scroll-line-up)
(define-key evil-normal-state-map (kbd "M-j")   'evil-scroll-line-down)
(define-key evil-insert-state-map (kbd "M-j")   'evil-scroll-line-down)

;; Evil miscellanous
;; TODO sort this out
(define-key evil-normal-state-map (kbd "v")     'evil-visual-char)
;; TODO learn how to do this
(define-key evil-normal-state-map (kbd "TAB")   'other-window)
(define-key evil-normal-state-map (kbd "M-/")   '(lambda () (interactive)
                                                   (evil-ex-call-command "" "noh" "")))
;; Pressing TAB inserts tab-width spaces
(define-key evil-insert-state-map (kbd "M-TAB")
  '(lambda () (interactive)
     (insert "\t")
     (untabify
      (line-beginning-position)
      (line-end-position))))
;; Consistent vim navigation
(define-key evil-visual-state-map (kbd "v")     'evil-visual-line)
(define-key evil-normal-state-map (kbd "V")     (kbd "v$"))

(global-undo-tree-mode 1)
(evil-set-undo-system 'undo-tree)

;; Octave mode
(defun octave-write-and-source () (interactive)
  (write-file (buffer-file-name))
  (octave-source-file (buffer-file-name)))

(evil-define-key 'normal octave-mode-map
  (kbd ",ss") 'octave-write-and-source)
(evil-define-key 'normal inferior-octave-mode-map
  (kbd ",hh") 'octave-help)

;; Inferiors in general
(defun comint-clear-buffer-goto () (interactive)
  (comint-clear-buffer) (evil-goto-line))

(define-key comint-mode-map (kbd "C-l") 'comint-clear-buffer-goto)
(define-key erc-mode-map    (kbd "C-l") 'comint-clear-buffer)

;; Remove Info mode annoying keybindings
(define-key Info-mode-map   (kbd "l")   nil)
(define-key Info-mode-map   (kbd "h")   nil)

;; Toggle emphasis markers
(defun org-toggle-emphasis ()
  "Toggle hiding/showing of org emphasize markers."
  (interactive)
  (if org-hide-emphasis-markers
    (set-variable 'org-hide-emphasis-markers nil)
    (set-variable 'org-hide-emphasis-markers t))
  (org-mode-restart))
(global-set-key (kbd "C-c e") 'org-toggle-emphasis)
(set-variable 'org-hide-emphasis-markers t)

;; LaTeX image preview + fragtog
(setq org-preview-latex-default-process        'dvisvgm)
(setq org-latex-create-formula-image-program   'dvisvgm)
(setq org-preview-latex-image-directory        "/tmp/org-mode/ltximg/")
;(org-babel-load-file "org-ref.org")

;; Disable org-mode-indent
(set-variable 'org-indent-mode nil)
(set-variable 'org-M-RET-may-split-line nil)

;; Org inline image size
(setq org-image-actual-width 400)

;; Org-babel
(require 'ob-shell)
(require 'ob-C)
(require 'ob-python)
;; TODO
;; (require 'ob-ipython)
(org-babel-do-load-languages 'org-babel-load-languages
  '((shell    . t)
    (C        . t)
    (python   . t))
;;    (ipython  . t)
)

;; mu4e
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
;;; Set up some common mu4e variables
(setq mu4e-maildir "~/mail"
      mu4e-inbox-folder "/INBOX"
      mu4e-drafts-folder "/[Gmail].Drafts"
      mu4e-sent-folder "/[Gmail].Sent Mail"
      mu4e-refile-folder "/[Gmail].All Mail"
      mu4e-trash-folder "/[Gmail].Trash"
      mu4e-get-mail-command "mbsync -a"
      mu4e-update-interval nil
      mu4e-change-filenames-when-moving t
      mu4e-compose-signature-auto-include nil
      mu4e-view-show-images t
      mu4e-view-show-addresses t)

;;; Mail directory shortcuts
(setq mu4e-maildir-shortcuts
      '(("/INBOX" . ?i)))

;; C support
(setq-default
  dotspacemacs-configuration-layers
    '((c-c++ :variables c-c++-enable-clang-support t)))
(setq c-default-style
  "bsd" c-basic-offset 4)

;; Python TODO
;; (python :variables python-backend 'lsp python-lsp-server 'pylsp)

;; Show snippets in auto-completion popup
(setq-default dotspacemacs-configuration-layers
  '((auto-completion :variables
     auto-completion-enable-snippets-in-popup t)))

(org-agenda-files '("~/data/personal/todo.org"))

;; MAXIMA
(add-to-list 'load-path "/usr/share/emacs/site-lisp/maxima/")
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)
(add-to-list 'auto-mode-alist '("\\.ma[cx]\\'" . maxima-mode))

;; vim: shiftwidth=2
