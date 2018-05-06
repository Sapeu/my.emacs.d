(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "https://elpa.emacs-china.org/melpa/") t)
  )

(require 'cl)

(defvar paul/packages '(
			company
			cherry-blossom-theme
			hungry-delete
			;; smex
			swiper
			counsel
			smartparens
			js2-mode
			nodejs-repl
			exec-path-from-shell
			popwin
			highlight-parentheses
			) "Default packages")


;; 设置选中的packages
(setq package-selected-packages paul/packages)

(defun paul/packages-installed-p ()
  (loop for pkg in paul/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))


(unless (paul/packages-installed-p)
  (message "%s" "Refreshing package database ...")
  (package-refresh-contents)
  (dolist (pkg paul/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; 设置自动补全
(global-company-mode t)

;; 设置主题
(load-theme 'cherry-blossom t)

;; 设置一次性删除多个空格
;; (require 'hungry-delete)
(global-hungry-delete-mode)


;; 配置swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; 设置smartparens，括号匹配
;; (require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; 配置exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;; 设置js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; 使用nodejs-repl
;; (require 'nodejs-repl)

;; 配置popwin
(require 'popwin)
(popwin-mode t)

(require 'org)

(require 'highlight-parentheses)

(provide 'init-packages)

