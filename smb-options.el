;;; package --- Summary
;;; Commentary:
;;; Code:

;;;;;;;;
;; keymapping personalization
;;;;;;;;

(if (or (eq system-type 'gnu/linux) (eq system-type 'darwin))
    (set-face-attribute 'default nil :height 140)
  )

;; disable the window-up/window down feature of shift-arrows so that
;; shift-selection works with arrow keys.
(define-key global-map (kbd "<S-down>") nil)
(define-key global-map (kbd "<S-up>") nil)
(define-key global-map (kbd "<S-right>") nil)
(define-key global-map (kbd "<S-left>") nil)

;; Stuff to map common Mac keystrokes to emacs operations
(setq-default mac-command-modifier 'super)
(setq-default mac-option-modifier 'meta)
(define-key global-map (kbd "s-a") 'mark-whole-buffer)
(define-key global-map (kbd "s-c") 'ns-copy-including-secondary)
;; (define-key global-map (kbd "C-s") 'helm-swoop)
(setq helm-source-names-using-follow (quote ("RTags Helm")))

(define-key global-map (kbd "C-x C-f") 'find-file-at-point)
(if (not (eq system-type 'windows-nt))
    (define-key global-map (kbd "<f12>") 'rtags-fix-fixit-at-point)
  )

(global-set-key [(f6)] 'next-error)
(global-set-key [(f5)] 'recompile)


;; Code navigation & debugging key maps
(require 'gud)
(global-set-key [(f9)] 'rtags-compile-file)
(global-set-key [(f10)] 'gud-next)
(global-set-key [(f11)] 'gud-step)
(global-set-key [(shift f11)] 'gud-finish)
(global-set-key (kbd "s-f") 'helm-projectile-find-file)
(global-set-key (kbd "<S-left>") 'xref-pop-marker-stack)
(global-set-key (kbd "s-.") 'xref-pop-marker-stack)

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
;; (setq-default split-height-threshold 0) ;; Make windows always split vertically
;; (setq-default split-width-threshold nil) ;; Make windows always split vertically

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
(setq grep-command "ag --vimgrep --group --line-number --column --smart-case --stats -- ")
(setq inhibit-startup-message t) ;; hide the startup message
;; (global-linum-mode t) ;; enable line numbers globally

;; ;; needed to suppress stupid "unsafe directory" messages when
;; ;; using magit
;; (require 'server)
;; (when (and (>= emacs-major-version 23)
;;            (equal window-system 'w32))
;;   (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
;;                                                  ; ~/.emacs.d/server is unsafe"
;;                                                  ; on windows.
;; (server-start)

;; (require 'server)
;;  (and (>= emacs-major-version 23)
;;      (defun server-ensure-safe-dir (dir) "Noop" t))


;;;;;;;;
;; Honor color generated by build tools in compilation buffers
;;;;;;;;
(setq-default compilation-environment (add-to-list 'compilation-environment "TERM=xterm-256color"))
(setq-default compilation-environment (add-to-list 'compilation-environment (concat "LIBRARY_PATH=" (getenv "LIBRARY_PATH"))))
(setq-default compilation-environment (add-to-list 'compilation-environment (concat "PATH=" (getenv "PATH"))))
(setq-default compilation-environment (add-to-list 'compilation-environment (concat "LD_LIBRARY_PATH=" (getenv "LD_LIBRARY_PATH"))))

(setq-default compilation-environment (add-to-list 'compilation-environment (concat "AFFDEX_DATA_DIR=" (getenv "AFFDEX_DATA_DIR"))))
(setq-default compilation-environment (add-to-list 'compilation-environment (concat "AFFDEX_TESTDATA_DIR=" (getenv "AFFDEX_TESTDATA_DIR"))))
(setq-default compilation-environment (add-to-list 'compilation-environment (concat "CMAKE_ATTRIBS_ARGS=" (getenv "CMAKE_ATTRIBS_ARGS"))))

(setq-default compilation-environment (add-to-list 'compilation-environment (concat "AFFECTIVA_VISION_DATA_DIR=" (getenv "AFFECTIVA_VISION_DATA_DIR"))))
(setq-default compilation-environment (add-to-list 'compilation-environment (concat "AFFECTIVA_LOG_MODULES=" (getenv "AFFECTIVA_LOG_MODULES"))))
(setq-default compilation-environment (add-to-list 'compilation-environment (concat "AFFECTIVA_LOG_LEVEL=" (getenv "AFFECTIVA_LOG_LEVEL"))))
(setq-default compilation-environment (add-to-list 'compilation-environment (concat "AFFECTIVA_LOG_TO=" (getenv "AFFECTIVA_LOG_TO"))))

(setq-default compilation-environment (add-to-list 'compilation-environment (concat "TENSORFLOW_VERSION=" (getenv "TENSORFLOW_VERSION"))))

(ignore-errors
  (require 'ansi-color)
  (defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))


;;;;;;;;
;; custom functions
;;;;;;;;

;; (require 'iedit)

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
;;(global-set-key [(f8)] 'smb-make-named-parms)


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

(load "carb")

;;;;;;;;
;; Open sqlite files with ebdi
;;;;;;;;

;; (defun smb-open-sqlite-hook ()
;;   "An open hook that will invoke ebdi when opening sqlite files."
;;   (let ((sql-database buffer-file-truename))
;;     (when (and  (stringp sql-database)
;;                 (or    (string-match "\\.sqlite$" sql-database)
;;                        (string-match "\\.db$" sql-database)))
;;       (message (concat "opening " sql-database " using ebdi-sqlite"))
;;       (kill-buffer)
;;      ;; (sql-sqlite sql-database)
;;       (edbi-sqlite sql-database)
;;       )))

;; (add-hook 'find-file-hook 'smb-open-sqlite-hook)

;; (defun sqlite-handler (operation &rest args)
;;   "An open hook that will invoke ebdi when opening sqlite files."
;;   (let ((sql-database (car args)))
;;     (kill-buffer nil)
;;     (edbi-sqlite sql-database)
;;     (sql-sqlite sql-database)
;;     )
;;   )

;; (put 'sqlite-handler 'operations '(insert-file-contents))

;; (add-to-list 'file-name-handler-alist
;;              '("\\.sqlite\\|\\.db\\|\\.DB\\'" . sqlite-handler))

(global-subword-mode)

(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;;;;;;
;; Disable display of super-annoying gdb output buffer that forces code into new frame
;;;;;;
(setq-default gdb-display-io-nopopup 1)

(defun python3 ()
    "Start python3."
  (interactive)
  (run-python "python3" 1 0)
  )

(setq-default ediff-window-setup-function 'ediff-setup-windows-plain)

(defun run-bash ()
      (interactive)
      (let ((shell-file-name "c:/Users/brobesx/AppData/Local/Programs/Git/bin/bash.exe"))
            (shell "*bash*")))

(setq visible-bell t)

(global-auto-revert-mode)
(global-ligature-mode)


(setq-default blacken-executable-list '("py" "-m" "black"))
;;; smb-options ends here
