;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'dumb-jump)
(require 'cc-mode)
(require 'use-package)

(use-package dumb-jump
  :init
  (bind-key* "M-j" 'dumb-jump-go)
  (bind-key* "M-h" 'dumb-jump-back)
  )

(dumb-jump-mode)

;; (global-set-key (kbd "M-j") 'dumb-jump-go)

;; (define-key c-mode-base-map (kbd "M-.")
;;   (function rtags-find-symbol-at-point))

;;; config-dumb-jump.el ends here
