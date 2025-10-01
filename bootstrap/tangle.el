(require 'use-package)
(require 'ob-tangle)
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(use-package yaml :ensure t :defer nil)
(use-package password-store :ensure t :defer nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell      . t)
   (python     . t)))

(condition-case err
    (progn
      (setq openai-key
            (password-store-get "openai/api-key"))
      (setq anthropic-key
            (password-store-get "anthropic/api-key")))
  (error (message "WARNING: %s" err)))

(defun haris/prevent-annoying-messages ()
  (require 'cl-lib)
  (advice-add 'sh-set-shell :around
              (lambda (orig-fun &rest args)
                (cl-letf (((symbol-function 'message) #'ignore))
                  (apply orig-fun args))))
  (setq python-indent-guess-indent-offset nil))

(haris/prevent-annoying-messages)

(defun haris/tangle-deps (subpath)
  "Prefix 'subpath' with the directory where dependency install scripts are tangled"
  (concat "/tmp/dependencies-" (user-login-name) "/" subpath))

(defun haris/tangle-home (&optional subpath)
  "Prefix 'subpath' with the directory that is used as staging for /home/haris when tangling"
  (concat "/tmp/tangle-" (user-login-name) "/" subpath))

(defun haris/tangle--file-non-interactively (file)
  "Tangle a file non-interactively, disabling all evaluation prompts including
buffer-local variables."
  (save-excursion
    (let* ((org-confirm-babel-evaluate nil)
           (enable-local-variables     :all)
           (enable-local-eval          t)
           (buffer                     (find-file file)))
      (org-babel-tangle)
      (kill-buffer buffer))))

(defun haris/tangle-all (&optional to-destination &key dotfiles-dir)
  "Tangle all my dotfiles.

By default the files are tangled into a temporary location that can be obtained
using (haris/tangle-home).

Optional argument TO-DESTINATION can be used to tangle the files directly to the
home directory. Keyword argument DOTFILES-DIR can be used to specify an
alternative dotfiles directory to '~/.haris'."
  (interactive)
  (when to-destination (delete-directory (haris/tangle-home) t))
  (let ((org-dotfiles-root (or dotfiles-dir "~/.haris")))
    (dolist (file (cl-delete-if
                   (lambda (x) (string-match-p "^\\.#" x))
                   (append (directory-files-recursively
                            org-dotfiles-root
                            "\\.org$"
                            nil
                            ;; Exclude hidden directories and different worktrees
                            (lambda (dir-name)
                              (and
                               (string-match
                                "^[^\\.]"
                                (file-name-nondirectory dir-name))
                               (not
                                (string-match "^wt-" (file-name-nondirectory dir-name)))))))))
      (message "Tangling file: %s" file)
      (haris/tangle--file-non-interactively file)))
  (when to-destination
    (shell-command (concat "rsync -rvu --keep-dirlinks " (haris/tangle-home) " ~/"))))

(defun haris/org-babel-expand-noweb-references (block-name)
  "Expand noweb references in the org-babel code block named BLOCK-NAME
in the current buffer."
  (interactive "sBlock name: ")
  (save-excursion
    (let ((marker (org-babel-find-named-block block-name)))
      (unless marker
        (error "No block named %s found" block-name))
      (goto-char marker)
      (let* ((info (org-babel-get-src-block-info 'light)))
        (org-babel-expand-noweb-references info)))))

(defun org-babel-noweb-wrap (&optional regexp)
  (rx-to-string
   `(and (or "<<" "«")
         (group
          (not (or " " "\t" "\n"))
          (? (*? any) (not (or " " "\t" "\n"))))
         (or ">>" "»"))))
