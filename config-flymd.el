;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'flymd)

(if
    (eq system-type 'darwin)
    ;;
    (progn
      (defun my-flymd-browser-function (url)
        "Open URL with firefox for flymd."
        (let ((process-environment (browse-url-process-environment)))
          (apply 'start-process
                 (concat "firefox " url)
                 nil
                 "/usr/bin/open"
                 (list "-a" "firefox" url))))
      (setq flymd-browser-open-function 'my-flymd-browser-function)
      )
  ;; windows & unix
  (progn
    (defun my-flymd-browser-function (url)
      (let ((browse-url-browser-function 'browse-url-firefox))
        (browse-url url)))
    (setq flymd-browser-open-function 'my-flymd-browser-function)
    )
  )
;;; config-flymd.el ends here
