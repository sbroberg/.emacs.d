;;; package --- Summary
;;; Commentary:
;;; Code:


(if (eq system-type 'darwin)
    (progn (defvar rtags-autostart-diagnostics)
           (defvar rtags-completions-enabled)
           (defvar company-backends)
           (defvar c-mode-base-map)
           (defvar rtags-use-helm)

           (require 'rtags-helm)
           (rtags-enable-standard-keybindings)

           (setq rtags-autostart-diagnostics t)
           (rtags-diagnostics)
           (setq rtags-completions-enabled t)

           ;; company integration
           (require 'company)
           (push 'company-rtags company-backends)
           (global-company-mode)

           ;; nice keyboard shortcuts
           (define-key c-mode-base-map (kbd "<M-tab>")
             (function company-complete))
           (define-key c-mode-base-map (kbd "M-.")
             (function rtags-find-symbol-at-point))
           (define-key c-mode-base-map (kbd "M-,")
             (function rtags-find-references-at-point))
           (define-key c-mode-base-map (kbd "<s-right>")
             (function rtags-location-stack-forward))
           (define-key c-mode-base-map (kbd "<s-left>")
             (function rtags-location-stack-back))

           (when (require 'helm nil :noerror)
             (setq rtags-use-helm t)
             )

           ;; flycheck integration
           (require 'flycheck)

           (require 'flycheck-rtags)
           (defun my-flycheck-rtags-setup ()
             "Flycheck integration."
             (interactive)
             (flycheck-select-checker 'rtags)
             ;; RTags creates more accurate overlays.
             (setq-local flycheck-highlighting-mode nil)

             ;; (setq rtags-enable-unsaved-reparsing t)
             ;; (setq-local flycheck-check-syntax-automatically nil)
             ;; (setq-local rtags-periodic-reparse-timeout 1)
             )
           ;; c-mode-common-hook is also called by c++-mode
           (add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)
           ))
;;; config-rtags ends here
