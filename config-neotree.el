;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'neotree)

(setq-default neo-autorefresh nil)
(setq-default projectile-switch-project-action 'neotree-projectile-action)

 (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

(global-set-key [f8] 'neotree-project-dir)
(setq-default neo-window-fixed-size nil)

;;; config-neotree ends here
