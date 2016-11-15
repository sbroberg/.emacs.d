(require 'company)
(require 'csharp-mode)
(load-relative "omnisharp-emacs/omnisharp.el")
(add-hook 'csharp-mode-hook 'omnisharp-mode)

(use-package company :ensure t :defer t
  :config
  (progn
   (add-to-list 'company-backends 'company-omnisharp)))

(defconst my-location (file-name-directory load-file-name))
(setq omnisharp-server-executable-path
      (expand-file-name "omnisharp-roslyn/artifacts/publish/OmniSharp/default/netcoreapp1.0/OmniSharp.exe"
                        my-location))

;; (setq omnisharp-debug t)
