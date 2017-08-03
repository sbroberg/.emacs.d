;;; package --- Summary
;;; Commentary:
;;; Code:

;;;;;;;;
;; keymapping personalization
;;;;;;;;
;; disable the window-up/window down feature of shift-arrows so that
;; shift-selection works with arrow keys.
(define-key global-map (kbd "<S-down>") nil)
(define-key global-map (kbd "<S-up>") nil)
(define-key global-map (kbd "<S-right>") nil)
(define-key global-map (kbd "<S-left>") nil)

(define-key global-map (kbd "C-x C-f") 'find-file-at-point)
(if (not (eq system-type 'windows-nt))
    (define-key global-map (kbd "<f12>") 'rtags-fix-fixit-at-point)
  )

(global-set-key [(f6)] 'next-error)

(require 'gud)

(global-set-key [(f10)] 'gud-next)
(global-set-key [(f11)] 'gud-step)
(global-set-key [(shift f11)] 'gud-finish)

;;;;;;;;
;; Whitespace
;;;;;;;;
;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))
;; use space to indent by default
(setq-default indent-tabs-mode nil)

;;;;;;;;
;; Indentation
;;;;;;;;
(c-set-offset 'substatement-open 0)
;; other customizations can go here

(setq-default c-default-style "stroustrup"
              c-basic-offset 4
              c++-tab-always-indent t
              c-indent-level 4
              tab-width 4
              standard-indent 4
              )

(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))

;;;;;;;;
;; Scrolling & Window handling
;;;;;;;;
(setq-default scroll-conservatively 5)
(setq-default truncate-lines 1)
(setq-default split-height-threshold 500) ;; Make windows always split vertically

;;;;;;;;
;; Extension mode mapping
;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.mm\\'" . c++-mode))

;;;;;;;;
;; Mode replacements
;;;;;;;;
;; Use silver searcher (ag) instead of grep for recursive searching
(if (or (eq system-type 'gnu/linux) (eq system-type 'darwin))
    (setq grep-command "ag --nogroup ")
  (setq grep-command "grep ")
  )

(setq inhibit-startup-message t) ;; hide the startup message
;; (global-linum-mode t) ;; enable line numbers globally

;; needed to suppress stupid "unsafe directory" messages when
;; using magit
(require 'server)
 (and (>= emacs-major-version 23)
     (defun server-ensure-safe-dir (dir) "Noop" t))

;;;;;;;;
;; Custom functions
;;;;;;;;

(require 'iedit)

(defun smb-make-named-parms ()
  "Convert a bindParam from ordered to using substitution variable."
  (interactive)
  (progn
    (iedit-quit)
    (search-forward-regexp "bindParam([^\"]")
    (left-char 1)
    (search-forward-regexp "[a-zA-Z]")
    (left-char 1)
    (set-mark-command nil)
    (search-forward-regexp "[^a-zA-Z]")
    (left-char 1)
    (copy-region-as-kill 1 1 1)
    (search-backward "(")
    (right-char 1)
    (insert "\"@")
    (yank)
    (insert "\", ")
    (goto-char 0)
    (search-forward "?")
    (delete-char -1)
    (insert "@")
    (yank)
    (set-mark-command nil)
    (search-backward "@")
    (iedit-mode 0)
    (right-word)
    (recenter)
    )
  )
(global-set-key [(f8)] 'smb-make-named-parms)


;;;;;;;;;
;; Major mode key binding overrides
;;;;;;;;;
(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-x v l") 'magit-log-buffer-file)
    map)
  "Keymap for my-keys-minor-mode.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  "Hook for deactivating my minibuffer-setup."
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

;;; smb-options ends here
