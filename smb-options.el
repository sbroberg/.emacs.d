;;; package --- Summary
;;; Commentary:
;;; Code:

;;;;;;;;
;; START keymapping personalization
;;;;;;;;
;; disable the window-up/window down feature of shift-arrows so that
;; shift-selection works with arrow keys.
(define-key global-map (kbd "<S-down>") nil)
(define-key global-map (kbd "<S-up>") nil)
(define-key global-map (kbd "<S-right>") nil)
(define-key global-map (kbd "<S-left>") nil)

(define-key global-map (kbd "C-x C-f") 'find-file-at-point)
;;;;;;;;
;; END keymapping personalization
;;;;;;;;

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))
;; use space to indent by default
(setq-default indent-tabs-mode nil)

(defun my-c-mode-common-hook ()
  "My customizations for all c-modes."
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
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-hook 'my-c-mode-common-hook)

;;;;;;;;
;; START Extension mode mapping
;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.mm\\'" . c++-mode))
;;;;;;;;
;; END Extension mode mapping
;;;;;;;;

;; Use silver searcher (ag) instead of grep for recursive searching
(setq grep-command "/usr/local/bin/ag --nogroup ")

;;; smb-options ends here
