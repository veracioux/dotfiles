(require 'ob-tangle)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell      . t)
   (python     . t)))

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
    (dolist (file (cl-delete-if (lambda (x) (string-match-p "^\\.#" x))
                                (append (directory-files-recursively org-dotfiles-root "\\.org$"))))
      (message "Tangling file: %s" file)
      (haris/tangle--file-non-interactively file)))
  (when to-destination
    (shell-command (concat "rsync -rvu " (haris/tangle-home) " ~/"))))

(defun org-babel-noweb-wrap (&optional regexp)
  (rx-to-string
   `(and (or "<<" "«")
         (group
          (not (or " " "\t" "\n"))
          (? (*? any) (not (or " " "\t" "\n"))))
         (or ">>" "»"))))
