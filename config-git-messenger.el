;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'git-messenger) ;; You need not to load if you install with package.el
(global-set-key (kbd "C-x v p") 'git-messenger:popup-message)

(define-key git-messenger-map (kbd "m") 'git-messenger:copy-message)

;; Use magit-show-commit for showing status/diff commands
(custom-set-variables
 '(git-messenger:show-detail t)
 '(git-messenger:use-magit-popup t))

(provide 'config-git-messenger)
(setq git-messenger:show-detail t)
(setq git-messenger:use-magit-popup t)

;;; config-git-messenger.el ends here
