(require 'ob-tangle)

(defun haris/tangle-deps (subpath)
  "Prefix 'subpath' with the directory where dependency install scripts are
   tangled"
  (concat "/tmp/dependencies-" (user-login-name) "/" subpath))

(defun haris/tangle-home (&optional subpath)
  "Prefix 'subpath' with the directory that is used as staging for /home/haris
   when tangling"
  (concat "/tmp/tangle-" (user-login-name) "/" subpath))

(defun haris/tangle-all (&optional to-destination)
  "Tangle all my dotfiles.

By default the files are tangled into a temporary location that can be obtained
using (haris/tangle-home).

Optional argument TO-DESTINATION can be used to tangle the files directly to the
home directory."
  (interactive)
  (when to-destination (delete-directory (haris/tangle-home) t))
  (let ((org-dotfiles-root (concat (file-name-directory load-file-name) "/..")))
    (dolist (file (append (directory-files-recursively org-dotfiles-root "\\.org$")))
      (message "Tangling file: %s" file)
      (org-babel-tangle-file file)))
  (when to-destination
    (shell-command (concat "rsync -rvu " (haris/tangle-home) " ~/"))))
