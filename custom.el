(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-sane-defaults)))
 '(exec-path-from-shell-variables
   (quote
    ("PATH" "MANPATH" "TERM" "TOOLCHAIN_ROOT" "CC" "CXX" "OSX_DEPLOYMENT_TARGET" "OSX_SDK" "OSX_CFLAGS" "OSX_LDFLAGS" "CFLAGS" "CXXFLAGS" "LDFLAGS" "VERSION")))
 '(package-selected-packages
   (quote
    (flycheck-clang-tidy flymd go-autocomplete go-mode company-edbi edbi edbi-sqlite jedi carb company-rtags yafolding json-mode which-key use-package omnisharp ivy git-timemachine projectile flycheck-rtags helm-rtags flycheck company csharp-mode ws-butler volatile-highlights rtags py-autopep8 magit load-relative iedit helm-swoop helm-projectile helm-c-yasnippet helm-ag flycheck-tip expand-region exec-path-from-shell elpy ein dtrt-indent comment-dwim-2 cmake-mode cmake-ide clang-format ag)))
 '(safe-local-variable-values
   (quote
    ((eval setq jedi:server-args
           (list "--sys-path"
                 (concat
                  (projectile-project-root)
                  "automation")
                 "--sys-path"
                 (concat
                  (projectile-project-root)
                  "automation/tools/framework_installer/automation_framework")
                 "--sys-path"
                 (concat
                  (projectile-project-root)
                  "automation/tools/framework_installer/report_util")
                 "--sys-path"
                 (concat
                  (projectile-project-root)
                  "automation/tools/framework_installer/suite_util")))
     (eval setq jedi:server-args
           (list "--sys-path"
                 (concat
                  (projectile-project-root)
                  "automation")
                 "--sys-path"
                 (concat
                  (projectile-project-root)
                  "automation/tools/framework_installer")))
     (eval setq jedi:server-args
           (list "--sys-path"
                 (concat
                  (projectile-project-root)
                  "automation/tools/framework_installer")))
     (eval setq jedi:server-args
           (list "--sys-path"
                 (concat
                  (projectile-project-root)
                  "automation")))
     (eval setq jedi:server-args
           (cons "--sys-path"
                 (concat
                  (projectile-project-root)
                  "automation")))
     (eval setq jedi:server-args
           (quote
            ("--sys-path"
             (concat
              (projectile-project-root)
              "automation"))))
     (eval setq jedi:server-args
           (("--sys-path"
             (concat
              (projectile-project-root)
              "automation"))))
     (eval setq jedi:server-args
           ("--sys-path"
            (concat
             (projectile-project-root)
             "automation")))
     (eval setq jedi:server-args
           (concat
            (projectile-project-root)
            "automation"))
     (eval setq cmake-ide-build-dir
           (concat
            (projectile-project-root)
            "build_debug"))
     (eval setq jedi:server-args
           (concat
            (projectile-project-root)
            "/automation"))
     (eval setq cmake-ide-build-dir
           (concat
            (projectile-project-root)
            "/build_debug"))
     (eval setq cmake-ide-build-dir
           (concat
            (projectile-project-root)
            "/build-make"))
     (eval setq cmake-ide-build-dir
           (projectile-project-root))
     (eval setq cmake-ide-build-dir
           (quote
            (projectile-project-root)))
     (eval cmake-ide-build-dir
           (quote
            (projectile-project-root)))
     (cmake-ide-build-dir \,@ projectile-project-root)
     (require projectile)
     (cmake-ide-build-dir . projectile-project-root)
     (cmake-ide-build-dir projectile-project-root)
     (cmake-ide-build-dir . /Users/stebro/headless-client/build-make)
     (eval setq cmake-ide-build-dir
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
(put 'downcase-region 'disabled nil)

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
