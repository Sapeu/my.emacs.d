
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

(global-set-key (kbd "C-c p f") 'counsel-git)


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
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; auto-yasnippet
;; (global-set-key (kbd "H-w") #'aya-create)
;; (global-set-key (kbd "H-y") #'aya-expand)

(provide 'init-keybindings)

