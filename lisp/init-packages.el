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
			reveal-in-osx-finder
			web-mode
			js2-refactor
			expand-region
			iedit
			org-pomodoro
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
;; 编写lisp时，单引号不匹配
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;; 配置exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;; 设置js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;; 使用nodejs-repl
;; (require 'nodejs-repl)

;; 配置popwin
(require 'popwin)
(popwin-mode t)

(require 'org)

(require 'highlight-parentheses)
(global-highlight-parentheses-mode t)

;; 配置Web-mode
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; 该函数可以用于在两个空格和四个空格之间进行切换
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

;; 配置js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(provide 'init-packages)

