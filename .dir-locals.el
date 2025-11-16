;;; Directory Local Variables            -*- no-byte-compile: t -*-
;;; For more information see (info "(emacs) Directory Variables")

((nil . ((haris/allow-copilot . t)))
 (magit-status-mode . ((eval . (with-eval-after-load 'haris/ai (setq-local magit-gptcommit-prompt haris/commit-prompt-dotfiles))))))
