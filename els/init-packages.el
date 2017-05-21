(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(require 'cl)

(defvar s/packages '(
		     company
		     monokai-theme
		     hungry-delete
		     swiper
		     counsel
		     smartparens
		     js2-mode
		     nodejs-repl
		     exec-path-from-shell
		     popwin
		     ) "Default packages")

(setq package-selected-packages s/packages)
(defun s/packages-installed-p ()
  (loop for pkg in s/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (s/packages-installed-p)
  (message "%s" "Refreshing package database ...")
  (package-refresh-contents)
  (dolist (pkg s/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; 使用hungry-delete
(global-hungry-delete-mode)

;; 使用exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; 使用smartparens
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; 使用js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; 启用global-company-mode
(global-company-mode t)

;; 加载主题
(load-theme 'monokai t)

;; 使用popwin
(require 'popwin)
(popwin-mode t)

;; 在 emacs-lisp-mode 下按单引号不补全引号
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(provide 'init-packages)
