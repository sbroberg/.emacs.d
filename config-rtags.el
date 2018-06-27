;;; package --- Summary
;;; Commentary:
;;; Code:


(if (or (eq system-type 'gnu/linux) (eq system-type 'darwin))
    (progn (defvar rtags-autostart-diagnostics)
           (defvar rtags-completions-enabled)
           (defvar company-backends)
           (defvar c-mode-base-map)
           (defvar rtags-use-helm)
           (defvar rtags-display-result-backend)
           (defvar rtags-enable-unsaved-reparsing)
           (defvar flycheck-highlighting-mode)
           (defvar rtags-periodic-reparse-timeout)
           (defvar flycheck-check-syntax-automatically)
           
           (require 'helm-rtags)
           (rtags-enable-standard-keybindings)

           (setq rtags-autostart-diagnostics t)
           (rtags-diagnostics)
           (setq rtags-completions-enabled t)

           ;; company integration
           (require 'company)
           (global-company-mode)
           (push 'company-rtags company-backends)
           (delete 'company-clang company-backends)

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
           (define-key c-mode-base-map (kbd "s-.")
             (function rtags-location-stack-back))

           (when (require 'helm nil :noerror)
             (setq rtags-use-helm t)
             )

           ;; flycheck integration
           (require 'flycheck)

           ;; helm integration
           (setq rtags-display-result-backend 'helm)

           (require 'flycheck-rtags)
           (defun my-flycheck-rtags-setup ()
             "Flycheck integration."
             (interactive)
             (flycheck-select-checker 'rtags)
             ;; RTags creates more accurate overlays.
             (setq-local flycheck-highlighting-mode nil)
             (setq-local flycheck-check-syntax-automatically nil)
             
             (setq-local rtags-periodic-reparse-timeout 10)
             (setq rtags-enable-unsaved-reparsing t)

             )
           ;; c-mode-common-hook is also called by c++-mode
           (add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)

           ;; Register the rdm server as a LaunchAgent to be used on-demand
           (with-temp-file
               "~/Library/LaunchAgents/com.andersbakken.rtags.agent.plist"
             (progn
               (insert "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
               (insert "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n")
               (insert "<plist version=\"1.0\">\n")
               (insert "  <dict>\n")
               (insert "    <key>Label</key>\n")
               (insert "    <string>com.andersbakken.rtags.agent</string>\n")
               (insert "    <key>ProgramArguments</key>\n")
               (insert "    <array>\n")
               (insert "      <string>sh</string>\n")
               (insert "      <string>-c</string>\n")
               (insert (concat "      <string>" (rtags-executable-find "rdm") " -v --launchd --inactivity-timeout 300 --log-file ~/Library/Logs/rtags.launchd.log</string>\n"))
               (insert "    </array>\n")
               (insert "    <key>Sockets</key>\n")
               (insert "    <dict>\n")
               (insert "      <key>Listener</key>\n")
               (insert "      <dict>\n")
               (insert "    <key>SockPathName</key>\n")
               (insert (concat "    <string>" (concat (car (directory-files "~" 1 "\.")) "rdm") "</string>\n"))
               (insert "      </dict>\n")
               (insert "    </dict>\n")
               (insert "  </dict>\n")
               (insert "</plist>\n")
               (insert "\n")
               (insert "\n")
               ))

           (shell-command "launchctl load ~/Library/LaunchAgents/com.andersbakken.rtags.agent.plist" (get-buffer "*Messages") (get-buffer "*Messages"))
           ))
;;; config-rtags ends here
