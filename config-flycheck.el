;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'rtags)
(global-flycheck-mode)

;; Show errors as tooltips, but also show full multiline error
;; in status area/minibuffer
(require 'flycheck-tip)
(setq error-tip-notify-keep-messages t)

;;; config-flycheck ends here
