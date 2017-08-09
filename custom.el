(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-sane-defaults)))
 '(package-selected-packages
   (quote
    (yafolding json-mode which-key use-package omnisharp ivy git-timemachine projectile flycheck-rtags helm-rtags flycheck company csharp-mode ws-butler volatile-highlights rtags py-autopep8 magit load-relative iedit helm-swoop helm-projectile helm-c-yasnippet helm-ag flycheck-tip expand-region exec-path-from-shell elpy ein dtrt-indent comment-dwim-2 cmake-mode cmake-ide clang-format ag)))
 '(safe-local-variable-values
   (quote
    ((eval setq cmake-ide-build-dir
           (concat my-project-path "build-make"))
     (cmake-ide-project-dir . my-project-path)
     (eval set
           (make-local-variable
            (quote my-project-path))
           (file-name-directory
            (let
                ((d
                  (dir-locals-find-file ".")))
              (if
                  (stringp d)
                  d
                (car d))))))))
 '(show-paren-mode t)
 '(sql-postgres-login-params
   (quote
    ((user :default "root")
     password
     (server :default "10.128.102.78")
     (database :default "recorddb"))))
 '(tool-bar-mode nil))

(put 'narrow-to-region 'disabled nil)

(if (eq system-type 'windows-nt)
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(default ((t (:family "Lucida Console" :foundry "outline" :slant normal :weight normal :height 100 :width normal)))))
  )
;;; garbage
;;; garbage
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
