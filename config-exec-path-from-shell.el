;;; package --- Summary
;;; Commentary:
;;; Code:

(when (memq window-system '(mac ns x))
  (progn  (defvar exec-path-from-shell-check-startup-files)
          (defvar exec-path-from-shell-variables)
          (setq exec-path-from-shell-check-startup-files nil)
          (setq exec-path-from-shell-variables
                (quote ("TENSORFLOW_VERSION" "AFFECTIVA_VISION_DATA_DIR" "AFFECTIVA_LOG_MODULES" "AFFECTIVA_LOG_LEVEL" "AFFECTIVA_LOG_TO"
                        "AFFDEX_DATA_DIR" "AFFDEX_TESTDATA_DIR" "WORKSPACE" "CMAKE_ATTRIBS_ARGS"
                        "PATH" "MANPATH" "LD_LIBRARY_PATH" "LIBRARY_PATH")))
          (exec-path-from-shell-initialize))
  )

;;; config-exec-path-from-shell ends here
