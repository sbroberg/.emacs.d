;;; carb.el --- Utility functions for Carbonite servers.
;; Author: Gerald Pipes (gpipes@carbonite.com)
;; Created: 01 September 2017
;; Version: 0.1
;; Package-Version: 20170901.0001
;; Package-Requires: (request xml sgml-mode)
;;; Commentary:
;;; Code:

(require 'request)
(require 'xml)
(require 'sgml-mode)

(defconst carb-environment "Staging")
(defvar carb-homeservers '((Staging . "home.shmi.beta.carbonite.com")
                           (Dev . "jabba.carbonite.com")))

(defun carb-toggle-environment ()
  "Switch between environments used by Carbonite test utils."
  (interactive)
  (if (equal carb-environment "Staging")
      (setq carb-environment "Dev")
    (setq carb-environment "Staging")))

(defun carb-insert-homeserver ()
  "Add a homeserver to the list of legal homeservers."
  (interactive)
  (insert (cdr (assoc carb-environment carb-homeservers))))

(defun carb-environ? ()
  "Display current default environment."
  (interactive)
  (message "Environment: %S" carb-environment))

(defun carb-generate-reguid ()
  "Return a new, valid registration Guid from the current environment."
  (interactive)
  (request
   "http://account-generator.carboniteinc.com/Generator/AutomationHelper"
   :params `(("xmlPath" . "/AccountTypes/Personal/Trial/*")
	     ("bundleName" . "Personal Trial")
	     ("prefix" . "crbtest_")
	     ("subscriber_email" . ,
          (concat (getenv "USER") "-" (number-to-string (abs (random))) "@" (system-name)))
	     ("env" . ,carb-environment))
   :parser  (lambda () (xml-parse-region (point-min) (point-max)))
   :success (cl-function
	     (lambda (&key data response &allow-other-keys)
	       (let* ((root (car data))
		      (Setup (cddr root))
		      (Subscribers (car (xml-get-children Setup 'Subscribers)))
		      (Subscriber (car (xml-get-children Subscribers 'Subscriber)))
		      (Computers (car (xml-get-children Subscriber 'Computers)))
		      (Computer (car (xml-get-children Computers 'Computer)))
		      (Reguid (car (xml-get-children Computer 'ComputerRegID)))
		      (Reguid-Val (car (cddr Reguid))))
             (insert Reguid-Val))))))

(defun carb-create-account ()
  "Return a new, valid registration Guid from the current environment."
  (interactive)
  (request
   "http://account-generator.carboniteinc.com/Generator/AutomationHelper"
   :params `(("xmlPath" . "/AccountTypes/Personal/Trial/*")
             ("bundleName" . "Personal Trial")
             ("prefix" . "crbtest_")
             ("subscriber_email" . ,
              (concat (getenv "USER") "-" (number-to-string (abs (random))) "@" (system-name)))
             ("env" . ,carb-environment))
   :parser 'buffer-string
   :success   (cl-function (lambda (&key data &allow-other-keys)
                             (when data
                               (with-current-buffer (get-buffer-create "*AutomationHelper-Output*")
                                 (erase-buffer)
                                 (insert data)
                                 (sgml-mode)
                                 (sgml-pretty-print (point-min) (point-max))
                                 (goto-char (point-min))
                                 (pop-to-buffer (current-buffer))))))))

(global-set-key (kbd "C-<return> C-e") 'carb-toggle-environment)
(global-set-key (kbd "C-<return> C-h") 'carb-insert-homeserver)
(global-set-key (kbd "C-<return> C-<return>") 'carb-generate-reguid)
(global-set-key (kbd "C-<return> C-/") 'carb-environ?)

;;; carb.el ends here
