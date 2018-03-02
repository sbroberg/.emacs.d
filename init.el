;;; package --- Summary
;;; Commentary:
;;; Code:
;; (setq debug-on-quit t)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Do not activate initialized packages until all the loading is done below,
;; in order to allow missing packages to be loaded before activating dependents
(package-initialize t)

;; END Melpa

;;;;;;;;
;; START Packages
;;;;;;;;

;; External requirements:

;; Python:
;; sudo pip2.7 install flake8
;; sudo pip2.7 install jedi
;; sudo pip2.7 install epc

;; rtags:
;; brew install rtags
;; or
;; apt-get install rtags

;; go
;; # go-mode
;; go get github.com/rogpeppe/godef
;; # go-autocomplete
;; go get -u github.com/nsf/gocode
;; # go-imports
;; go get golang.org/x/tools/cmd/goimports
;; # go-guru
;; go get golang.org/x/tools/cmd/guru
;;
;; Add to .bashrc:
;; export GOROOT=/usr/local/go
;; export GOPATH=~/gocode
;; export PATH=$PATH:$GOROOT/bin
;; export PATH=$PATH:$GOPATH/bin

;; ebdi:
;;     cpan RPC::EPC::Service DBI DBD::SQLite DBD::Pg DBD::mysql
;; Add to .bashrc:
;;    source ~/perl5/perlbrew/etc/bashrc
;;    export PERL5LIB=/Users/stebro/perl5/lib/perl5

(defconst my-installed-packages
  '(
    ;; Basic OSX sanity
    exec-path-from-shell ;; Copies OSX exec environment into .app version of Emacs

    ;; ide-code-completion/syntax checking
    company              ;; auto-complete powered by various backends

    flycheck             ;; syntax checking powered by various backends
    flycheck-tip         ;; show flycheck errors as tooltips
    rtags                ;; backend clang-based autocomplete, syntax check & navigation.  Requires installation of binary
    helm-rtags
    flycheck-rtags
    dumb-jump            ;; "good enough" code navigation (based on projectile, ag, no config)

    ;; Project-stuff
    projectile           ;; project-based navigation & searching
    helm                 ;; fancy-pants results searching - used in many contexts
    helm-projectile      ;; integration with helm & projectile
    helm-swoop           ;; interactive search result browsing
    magit                ;; git integration
    cmake-mode           ;; for CMakeLists.txt files
    git-timemachine      ;; browse git history

    ;; Python
    jedi                 ;; python environment
    py-autopep8          ;; for pep8 enforcement
    ein                  ;; for Jupyter

    ;; Go
    go-mode
    go-autocomplete

    ;; Db
    edbi-sqlite
    company-edbi
    edbi                 ;; more graphical version of db explorer

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

    ;; file-type modes
    flymd

    ;; Other improvements
    helm-ag              ;; use M-x helm-ag for more powerful searching
    load-relative        ;; load-relative is like load, only you can use relative paths
    ag                   ;; needed by other modes that use ag (silver searcher)
    use-package          ;; easier package configuration
    which-key            ;; adds help completion for compound
    json-mode            ;; for Json files
    yafolding            ;; code-folding for a variety of formats
    el-get               ;; Get historical versions of elpa packages

    ;; These are an alternative to rtags - use for non-clang platforms
    ;; cmake-ide disabled because of extreme slowness; rtags now self-configures,
    ;; as long as we generate a compile_commands.json file and run "rc -J ." in
    ;; the build dir
    ;; cmake-ide            ;; configures flycheck, rtags & others based on current cmake project
    ;;
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

;; Now it is okay to activate the packages
(package-initialize)

;;;;;;;;
;; END Packages
;;;;;;;;

(require 'load-relative)

(load-relative "./config-garbage-collector")
;;(load-relative "./config-cmake-ide")
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
(load-relative "./config-perl")
(load-relative "./config-sql")
(load-relative "./config-go")
(load-relative "./config-org")
(load-relative "./config-dumb-jump")

;; (load "config-autocomplete")
;; (load-relative "config-irony")

(load-relative "./gud")
(load-relative "./smb-options")

;;; init.el ends here
