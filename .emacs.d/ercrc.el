(require 'erc)
(setq erc-server "irc.libera.chat"
      erc-nick "veracioux"
      erc-user-full-name "Haris Gušić"
      erc-track-shorten-start 8
      erc-autojoin-channels-alist '((".*" "#archlinux" "#octave"))
      erc-kill-buffer-on-part t
      erc-auto-query 'bury)

;; For some reason erc-modules is undefined
(add-to-list 'erc-modules 'notifications)
(delete 'readonly erc-modules)
(erc-services-mode 1)
(erc-update-modules)
