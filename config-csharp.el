(require 'company)
(require 'csharp-mode)
(add-to-list 'load-path (expand-file-name "~/omnisharp-emacs"))
(load "omnisharp.el")
(add-hook 'csharp-mode-hook 'omnisharp-mode)

(setq omnisharp-server-executable-path "c:\\Users\\developer\\omnisharp-roslyn\\artifacts\\publish\\OmniSharp\\default\\netcoreapp1.0\\OmniSharp.exe")

(use-package company :ensure t :defer t
  :config
  (progn
   ;; (add-to-list 'company-backends 'company-anaconda)
   ;; (add-to-list 'company-backends 'company-ansible)
   (add-to-list 'company-backends 'company-omnisharp)))

;; (setq omnisharp-debug t)
