;; General settings
(setq-default fill-column 80)
(setq default-tab-width 4)
(add-hook 'text-mode-hook #'auto-fill-mode)
(add-hook 'prog-mode-hook #'auto-fill-mode)
(add-hook 'org-mode-hook 'org-fragtog-mode)

;; ERC
(load (locate-user-emacs-file "ercrc.el") nil :nomessage)

;; Evil
(setq evil-undo-system 'undo-tree)

;; Evil numbers
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-visual-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)
(define-key evil-visual-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)

;; Evil-nerd-commenter
(evilnc-default-hotkeys)
(add-hook 'octave-mode-hook
  (lambda ()
    (setq comment-start "% " comment-end "")))

;; Scroll with Alt
(define-key evil-normal-state-map (kbd "M-k") 'evil-scroll-line-up)
(define-key evil-insert-state-map (kbd "M-k") 'evil-scroll-line-up)
(define-key evil-normal-state-map (kbd "M-j") 'evil-scroll-line-down)
(define-key evil-insert-state-map (kbd "M-j") 'evil-scroll-line-down)

;; Move windows
(define-key evil-insert-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-insert-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-insert-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-insert-state-map (kbd "C-l") 'evil-window-right)

;; Octave mode
(defun octave-write-and-source ()
  (interactive)
  (write-file (buffer-file-name))
  (octave-source-file (buffer-file-name)))

(define-key evil-normal-state-map (kbd ",ss") 'octave-write-and-source)

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
(setq org-preview-latex-default-process 'dvisvgm)
(setq org-latex-create-formula-image-program 'dvisvgm)
(setq org-preview-latex-image-directory "/tmp/org-mode/ltximg/")
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
(require 'ob-ipython)
(org-babel-do-load-languages 'org-babel-load-languages
  '((shell . t)
	(C . t)
	(ipython . t)
	(python . t)
	)
)

;; C support
(setq-default dotspacemacs-configuration-layers
  '((c-c++ :variables c-c++-enable-clang-support t)))
(setq c-default-style "bsd"
	  c-basic-offset 4)

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
