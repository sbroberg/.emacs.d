;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'helm)
(require 'helm-config)
(require 'helm-grep)

;;; Do not turn on helm-mode here - for some reason doing it as an init
;;; step causes tab-autocomplete to not work in find-file
;;; (helm-mode 1)

;;; This configuration needs to be done in the post-init for some reason
;;; I don't understand; again, doing it as part of the init.el code
;;; makes various things not work.
(add-hook
 'after-init-hook
 (lambda ()

   (helm-autoresize-mode t)

   (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
   (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
   (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

   (setq
    helm-follow-mode-persistent t
    helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
    helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
    helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
    helm-candidate-number-limit 500 ; limit the number of displayed candidates
    helm-ff-file-name-history-use-recentf t
    helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
    helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non-nil
                                        ; useful in helm-mini that lists buffers

    )

   (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

   (global-set-key (kbd "M-x") 'helm-M-x)
   (global-set-key (kbd "M-y") 'helm-show-kill-ring)
   (global-set-key (kbd "C-x b") 'helm-mini)
   (global-set-key (kbd "C-x C-f") 'helm-find-files)
   (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
   (global-set-key (kbd "C-c h o") 'helm-occur)

   (global-set-key (kbd "C-c h C-c w") 'helm-wikipedia-suggest)
   ))

;;; config-helm ends here
