;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (add-to-list 'package-archives
;; 	       '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
;;   )
;; 
;; (require 'cl)
;; 
;; (defvar s/packages '(
;; 		     company
;; 		     monokai-theme
;; 		     hungry-delete
;; 		     swiper
;; 		     counsel
;; 		     smartparens
;; 		     js2-mode
;; 		     nodejs-repl
;; 		     exec-path-from-shell
;; 		     popwin
;; 		     web-mode
;; 		     js2-refactor
;; 		     expand-region
;; 		     iedit
;; 		     org-pomodoro
;; 		     helm-ag
;; 		     flycheck
;; 		     auto-yasnippet
;; 		     evil
;; 		     evil-leader
;; 		     window-numbering
;; 		     evil-surround
;; 		     evil-nerd-commenter
;; 		     which-key
;; 		     mwe-log-commands
;; 		     ) "Default packages")
;; 
;; (setq package-selected-packages s/packages)
;; (defun s/packages-installed-p ()
;;   (loop for pkg in s/packages
;; 	when (not (package-installed-p pkg)) do (return nil)
;; 	finally (return t)))
;; 
;; (unless (s/packages-installed-p)
;;   (message "%s" "Refreshing package database ...")
;;   (package-refresh-contents)
;;   (dolist (pkg s/packages)
;;     (when (not (package-installed-p pkg))
;;       (package-install pkg))))

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
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
(sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)

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

;; 初始化js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)

;; 配置 imenu 快捷键
(defun js2-imenu-make-index ()
  (interactive)
  (save-excursion
    ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
    (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			       ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
			       ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq imenu-create-index-function 'js2-imenu-make-index)))

;; 引入 org-pomodoro
(require 'org-pomodoro)

;; 初始化yasnippet
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; 使用 vim 模式 evil-mode
(evil-mode 1)

;; 使用 evil-leader
(global-evil-leader-mode)

;; 使用 window-numbering
(window-numbering-mode 1)

;; 使用 evil-surround
(global-evil-surround-mode 1)

;; 使用 evil-nerd-commenter
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(evilnc-default-hotkeys)

;; 在特有模式下使用 evil-mode
(dolist (mode '(
		ag-mode
		flycheck-error-list-mode
		occur-mode
		git-rebase-mode
		))
  (add-to-list 'evil-emacs-state-modes mode))
(add-hook 'occur-mode-hook
	  (lambda ()
	    (evil-add-hjkl-bindings occur-mode-map 'emacs
	      (kbd "/") 'evil-search-forward
	      (kbd "n") 'evil-search-next
	      (kbd "N") 'evil-search-previous
	      (kbd "C-d") 'evil-scroll-down
	      (kbd "C-u" 'evil-scroll-up))))

;; 使用 which-key
(which-key-mode)

;; 使用 markdown-mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))

(provide 'init-packages)
