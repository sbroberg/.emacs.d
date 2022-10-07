;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package python
  :config
  ;; Remove guess indent python message
  (setq python-indent-guess-indent-offset-verbose nil))

;; ;; Hide the modeline for inferior python processes.  This is not a necessary
;; ;; package but it's helpful to make better use of the screen real-estate at our
;; ;; disposal. See: https://github.com/hlissner/emacs-hide-mode-line.

;; (use-package hide-mode-line
;;   :ensure t
;;   :defer t
;;   :hook (inferior-python-mode . hide-mode-line-mode))


;;<OPTIONAL> I use poetry (https://python-poetry.org/) to manage my python environments.
;; See: https://github.com/galaunay/poetry.el.
;; There are alternatives like https://github.com/jorgenschaefer/pyvenv.
(use-package poetry
  :ensure t
  :defer t
  :config
  ;; Checks for the correct virtualenv. Better strategy IMO because the default
  ;; one is quite slow.
  (setq poetry-tracking-strategy 'switch-buffer)
  :hook (python-mode . poetry-tracking-mode))

;; <OPTIONAL> Buffer formatting on save using black.
;; See: https://github.com/pythonic-emacs/blacken.
(use-package blacken
  :ensure t
  :defer t
  :custom
  (blacken-allow-py36 t)
  (blacken-skip-string-normalization t)
  :hook (python-mode-hook . blacken-mode))

;; <OPTIONAL> Numpy style docstring for Python.  See:
;; https://github.com/douglasdavis/numpydoc.el.  There are other packages
;; available for docstrings, see: https://github.com/naiquevin/sphinx-doc.el
(use-package numpydoc
  :ensure t
  :defer t
  :custom
  (numpydoc-insert-examples-block nil)
  (numpydoc-template-long nil)
  :bind (:map python-mode-map
              ("C-c C-n" . numpydoc-generate)))

;; Provide drop-down completion.
(use-package company
  :ensure t
  :defer t
  :custom
  ;; Search other buffers with the same modes for completion instead of
  ;; searching all other buffers.
  (company-dabbrev-other-buffers t)
  (company-dabbrev-code-other-buffers t)
  ;; M-<num> to select an option according to its number.
  (company-show-numbers t)
  ;; Only 2 letters required for completion to activate.
  (company-minimum-prefix-length 3)
  ;; Do not downcase completions by default.
  (company-dabbrev-downcase nil)
  ;; Even if I write something with the wrong case,
  ;; provide the correct casing.
  (company-dabbrev-ignore-case t)
  ;; company completion wait
  (company-idle-delay 0.2)
  ;; No company-mode in shell & eshell
  (company-global-modes '(not eshell-mode shell-mode))
  ;; Use company with text and programming modes.
    :hook ((text-mode . company-mode)
           (prog-mode . company-mode)))

;;; <EGLOT> configuration, pick this or the LSP configuration but not both.
;; Using Eglot with Pyright, a language server for Python.
;; See: https://github.com/joaotavora/eglot.
(use-package eglot
  :ensure t
  :defer t
  :hook
  (python-mode . eglot-ensure)
  (cmake-mode . eglot-ensure))

;;; <LSP> configuration, pick this or the Eglot configuration, but not both.

;; (use-package lsp-mode
;;   :ensure t
;;   :defer t
;;   :defines (lsp-keymap-prefix lsp-mode-map)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   :custom
;;   ;; Read the documentation for those variable with `C-h v'.
;;   ;; This reduces the visual bloat that LSP sometimes generate.
;;   (lsp-eldoc-enable-hover nil)
;;   (lsp-signature-auto-activate nil)
;;   (lsp-completion-enable t)
;;   :hook ((lsp-mode . lsp-enable-which-key-integration))
;;   :commands (lsp lsp-deferred))

;; (use-package lsp-pyright
;;   :ensure t
;;   :defer t
;;   ;; Launches pyright when a python buffer is opened.
;;   :hook ((python-mode . (lambda ()
;; 			  (require 'lsp-pyright)
;; 			  (lsp-deferred)))))

;;; config-python.el ends here
