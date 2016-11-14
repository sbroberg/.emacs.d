(require 'company)
(require 'csharp-mode)
(load-relative "omnisharp-emacs/omnisharp.el")
(add-hook 'csharp-mode-hook 'omnisharp-mode)

(use-package company :ensure t :defer t
  :config
  (progn
   ;; (add-to-list 'company-backends 'company-anaconda)
   ;; (add-to-list 'company-backends 'company-ansible)
   (add-to-list 'company-backends 'company-omnisharp)))

(setq omnisharp-server-executable-path
      (expand-file-name ".emacs.d/omnisharp-roslyn/artifacts/publish/OmniSharp/default/netcoreapp1.0/OmniSharp.exe"))

;; (setq omnisharp-debug t)
