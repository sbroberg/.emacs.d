;;; package --- Summary
;;; Commentary:
;;; Code:

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

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
    helm-rtags
    flycheck-rtags

    ;; Project-stuff
    projectile           ;; project-based navigation & searching
    helm                 ;; fancy-pants results searching - used in many contexts
    helm-projectile      ;; integration with helm & projectile
    helm-swoop           ;; interactive search result browsing
    magit                ;; git integration
    cmake-mode           ;; for CMakeLists.txt files
    git-timemachine      ;; browse git history

    ;; Languages
    ;; ivy                  ;; for elpy
    ;; elpy                 ;; for python - run "sudo pip3 install rope jedi importmagic autopep8 yapf flake8 jupyter"
    jedi                 ;; python environment
    py-autopep8          ;; for pep8 enforcement
    ein                  ;; for Jupyter

    ;; omnisharp is disabled as we're loading from a local branch
    omnisharp            ;; c# ide server
    shut-up              ;; for omnisharp-emacs
    csharp-mode          ;; c#

    ;; Text-Editing Stuff
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
    which-key            ;; adds help completion for compound
    json-mode            ;; for Json files
    yafolding            ;; code-folding for a variety of formats

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

(load-relative "./config-garbage-collector")
(load-relative "./config-cmake-ide")
(load-relative "./config-exec-path-from-shell")
(load-relative "./config-company")
(load-relative "./config-rtags")
(load-relative "./config-flycheck")
(load-relative "./config-clang-format")
(load-relative "./config-yasnippet")
(load-relative "./config-projectile")
(load-relative "./config-iedit")
(load-relative "./config-volatile-highlights")
(load-relative "./config-ws-butler")
(load-relative "./config-helm")
(load-relative "./config-magit")
(load-relative "./config-helm-swoop")
(load-relative "./config-python")
(load-relative "./config-expand-region")
(load-relative "./config-csharp")
(load-relative "./config-which-key")
(load-relative "./config-git-timemachine")

;; (load "config-autocomplete")
;; (load-relative "config-irony")

(load-relative "./gud")
(load-relative "./smb-options")

;;; init.el ends here
