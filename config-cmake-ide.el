;;; package --- Summary
;;; Commentary:
;;; Code:

(if (not (eq system-type 'windows-nt))
(require 'rtags) ;; optional, must have rtags installed
)
(require 'cmake-ide)
(cmake-ide-setup)

;; Opening headers can be slow - this turns off the searching that occurs when they open
(setq cmake-ide-header-search-other-file nil)
(setq cmake-ide-header-search-first-including nil)

;;; config-cmake-ide ends here
