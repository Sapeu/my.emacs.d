
;; 设置调用打开emacs配置文件方法快捷键
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 设置快捷键打开最近文件
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 查找方法快捷键
(global-set-key (kbd "C-h C-f") 'find-function)

;; 查找变量快捷键
(global-set-key (kbd "C-h C-v") 'find-variable)

;; 设置按照按键查找方法
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 设置swipper的快捷键
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; 设置smex
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)

;; (global-set-key (kbd "C-c p f") 'counsel-git)


(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "s-/") 'hippie-expand)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 全屏快捷键
(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)

;; org-capture的快捷键
(global-set-key (kbd "C-c r") 'org-capture)

;; 两个空格和四个空格之间进行切换的快捷键
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; 配置expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; 配置iedit
(global-set-key (kbd "M-s e") 'iedit-mode)

;; js2-mode的前缀快捷键
(js2r-add-keybindings-with-prefix "C-c C-m")

;; 配置imenu快捷键
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; 修改company的快捷键
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; ag的快捷键
;; (global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; auto-yasnippet
;; (global-set-key (kbd "H-w") #'aya-create)
;; (global-set-key (kbd "H-y") #'aya-expand)

;; C-w删除一个词
(global-set-key (kbd "C-w") 'backward-kill-word)

;; 切换evil
(global-set-key (kbd "C-z") 'evil-toggle-key)
(with-eval-after-load 'evil
  (evil-leader/set-key
    "ff" 'find-file
    "rf" 'recentf-open-files
    "bb" 'switch-to-buffer
    "bk" 'kill-buffer
    "pf" 'counsel-git
    "ps" 'helm-do-ag-project-root
    "0"  'select-window-0
    "1"  'select-window-1
    "2"  'select-window-2
    "3"  'select-window-3
    "w/" 'split-window-right
    "w-" 'split-window-below
    ":"  'counsel-M-x
    "wM" 'delete-other-windows
    "sq" 'save-buffers-kill-terminal
    )
  )


(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

(add-hook 'occur-mode-hook
	  (lambda ()
	    (evil-add-hjkl-bindings occur-mode-map 'emacs
	      (kbd "/") 'evil-search-forward
	      (kbd "n") 'evil-search-next
	      (kbd "N") 'evil-search-previous
	      (kbd "C-d") 'evil-scroll-down
	      (kbd "C-u") 'evil-scroll-up
	    )))

(provide 'init-keybindings)

