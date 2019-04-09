;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'eshell)
(require 'go-mode)

(load-relative "./go-guru")

(defun set-exec-path-from-shell-PATH ()
  "Set the path from the shell."
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" (expand-file-name "~/gocode"))
(add-to-list 'exec-path (expand-file-name "~/gocode/bin"))

(defun my-go-mode-hook ()
  "Enable go mode features."
  ; Use goimports instead of gofmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; uniform jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "<s-left>") 'pop-tag-mark)
  (local-set-key (kbd "M-m") 'go-guru-expand-region)
  (local-set-key (kbd "M-,") 'go-guru-callers)
)

(add-hook 'go-mode-hook 'my-go-mode-hook)

;; autocomplete
(defun auto-complete-for-go ()
  "Set up autocomplete."
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

;;; config-go.el ends here
