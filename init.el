;;; package --- Summary
;;; Commentary:
;;; Code:

;; Melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
;; END Melpa

;;;;;;;;
;; START Packages
;;;;;;;;
(defconst my-installed-packages
  '(
    ;; Basic OSX sanity
    exec-path-from-shell ;; Copies OSX exec environment into .app version of Emacs

    ;; ide-code-completion/syntax checking
    cmake-ide            ;; configures flycheck, rtag & others based on current cmake project
    company              ;; auto-complete powered by various backends

    flycheck             ;; syntax checking powered by various backends
    flycheck-tip         ;; show flycheck errors as tooltips
    rtags                ;; backend clang-based autocomplete, syntax check & navigation.  Requires installation of binary

    ;; Project-stuff
    projectile           ;; project-based navigation & searching
    helm                 ;; fancy-pants results searching - used in many contexts
    helm-projectile      ;; integration with helm & projectile
    helm-swoop           ;; interactive search result browsing
    magit                ;; git integration
    cmake-mode           ;; for CMakeLists.txt files

    ;; Languages
    ivy                  ;; for elpy
    elpy                 ;; for python - run "sudo pip3 install rope jedi importmagic autopep8 yapf flake8 jupyter"
    py-autopep8          ;; for pep8 enforcement
    ein                  ;; for Jupyter

    ;; omnisharp is disabled as we're loading from a local branch
    ;; omnisharp            ;; c# ide server 
    shut-up              ;; for omnisharp-emacs
    csharp-mode          ;; c#

    ;; Text-Editing Stuff
    anzu                 ;; Displays n/m for interactive searches in status bar
    comment-dwim-2       ;; Better options for commenting using M-;
    ws-butler            ;; smartly removes trailing whitespace
    iedit                ;; Hit C-; to highlight & edit all occurrences of symbol
    volatile-highlights  ;; highlights changes from undo/replace/etc until keystroke
    clang-format         ;; Formats code using clang-format.  Requires installation of binary
    yasnippet            ;; Snippet shortcuts. yas-describe-tables for list
    helm-c-yasnippet     ;; Use helm to navigate available snippets with helm-yas-complete
    expand-region        ;; Use M-m to increase the current selection to the next-largest lexical unit

    ;; Other improvements
    helm-ag              ;; use M-x helm-ag for more powerful searching
    load-relative        ;; load-relative is like load, only you can use relative paths
    ag                   ;; needed by other modes that use ag (silver searcher)
    use-package          ;; easier package configuration
    ;;    better-defaults
    ;;    material-theme

    ;; These are an alternative to rtags - use for non-clang platforms
    ;; helm-gtags
    ;; ggtags
    ;; irony
    ;; company-irony-c-headers
    ;; company-irony

    ))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package my-installed-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;;;;;;;;
;; END Packages
;;;;;;;;

(require 'load-relative)

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
    (csharp-mode ws-butler volatile-highlights rtags py-autopep8 magit load-relative iedit helm-swoop helm-projectile helm-c-yasnippet helm-ag flycheck-tip expand-region exec-path-from-shell elpy ein dtrt-indent comment-dwim-2 cmake-mode cmake-ide clang-format anzu ag)))
 '(safe-local-variable-values
   (quote
    ((eval condition-case nil
           (setq cmake-ide-project-dir
                 (locate-dominating-file buffer-file-name ".dir-locals.el"))
           (error nil))
     (eval condition-case nil
           (setq cmake-ide-build-dir
                 (concat
                  (locate-dominating-file buffer-file-name ".dir-locals.el")
                  "cbuild"))
           (error nil))
     (eval setq cmake-ide-project-dir
           (locate-dominating-file buffer-file-name ".dir-locals.el"))
     (eval setq cmake-ide-build-dir
           (concat
            (locate-dominating-file buffer-file-name ".dir-locals.el")
            "cbuild"))
     (eval setq cmake-ide-flags-c++
           (concat "-I" my-project-path "build/lib/Debug/include -I" my-project-path "build/Daemon/SessionClient"))
     (eval message "Project directory set to `%s'." my-project-path)
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
                (car d)))))
     (cmake-ide-dir . "/Users/stebro/carbonite/daemon"))))
 '(show-paren-mode t)
 '(sql-postgres-login-params
   (quote
    ((user :default "root")
     password
     (server :default "10.128.102.78")
     (database :default "recorddb"))))
 '(tool-bar-mode nil))


(load-relative "./config-garbage-collector")
(load-relative "./config-cmake-ide")
(load-relative "./config-exec-path-from-shell")
(load-relative "./config-flycheck")
(load-relative "./config-company")
(load-relative "./config-rtags")
(load-relative "./config-clang-format")
(load-relative "./config-yasnippet")
(load-relative "./config-projectile")
(load-relative "./config-iedit")
(load-relative "./config-anzu")
(load-relative "./config-volatile-highlights")
(load-relative "./config-ws-butler")
(load-relative "./config-helm")
(load-relative "./config-magit")
(load-relative "./config-helm-swoop")
(load-relative "./config-python")
(load-relative "./config-expand-region")
(load-relative "./config-csharp")

;; (load "config-autocomplete")
;; (load "config-irony")

(load-relative "./gud")
(load-relative "./smb-options")

;;; init.el ends here

(put 'narrow-to-region 'disabled nil)

(if (eq system-type 'windows-nt)
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(default ((t (:family "Lucida Console" :foundry "outline" :slant normal :weight normal :height 100 :width normal)))))
  )
