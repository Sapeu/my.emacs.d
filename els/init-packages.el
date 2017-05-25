(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  )

;; (setq package-archives
;; '(("gnu" . "http://elpa.gnu.org/packages/")
;; ("melpa" . "https://melpa.org/packages/")
;; ))

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
		     web-mode
		     js2-refactor
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
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
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

;; 配置 web-mode
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  (interactive)
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js-basic-offset 2) 4 2))))
  
  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  
  (if (eq major-mode 'css-mode)    
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  
  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; 初始化js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

(provide 'init-packages)
