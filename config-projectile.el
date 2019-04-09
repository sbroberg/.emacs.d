;;; package --- Summary
;;; Commentary:
;;; Code:

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(require 'helm-locate)

;; Copied from helm-locate.el; on OSX we need to use glocate/gupdatedb
;; which is installed via "brew install findutils"
(if (eq system-type 'darwin)
    (progn (setq-default helm-locate-command "glocate %s -e -A --regex %s")
           (defun helm-projects-find-files (update)
             "Find files with locate in `helm-locate-project-list'.
With a prefix arg refresh the database in each project."
             (interactive "P")
             (helm-locate-set-command)
             (cl-assert (and (string-match-p "\\`glocate" helm-locate-command)
                             (executable-find "gupdatedb"))
                        nil "Unsupported locate version")
             (let ((dbs (helm-locate-find-dbs-in-projects update)))
               (if dbs
                   (helm-locate-with-db dbs)
                 (user-error "No projects found, please setup `helm-locate-project-list'"))))
           ))

;;; config-projectile ends here
