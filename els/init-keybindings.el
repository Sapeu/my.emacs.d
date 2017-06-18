

;; 点击<f6>执行open-my-init-file
(global-set-key (kbd "<f5>") 'open-my-init-file)

;; 定义C-x C-r选择最近打开
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 使用swiper
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; find-function
(global-set-key (kbd "C-h C-f") 'find-function)

;; find-variable
(global-set-key (kbd "C-h C-v") 'find-variable)

;; find-function-on-key
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 定义counsel-git的快捷键
;; (global-set-key (kbd "C-c p f") 'counsel-git)

;; 定义选中内容格式化或者整个内容格式化快捷键
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; 设定 counsel-imenu 的快捷键
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; 自动选取范围中的字符
(global-set-key (kbd "C-=") 'er/expand-region)

;; 设定 js2-refactor 的快捷键
(js2r-add-keybindings-with-prefix "C-c C-m")

;; 设定 my-toggle-web-indent 的快捷键
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; 设定 occue-dwin 的快捷键
(global-set-key (kbd "M-s o") 'occur-dwin)

;; 定义 company 的快捷键
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; 设置 iedit 的快捷键
(global-set-key (kbd "M-s e") 'iedit-mode)

;; 设置 helm-ag 的快捷键
;; (global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; 设置 C-w 向后删除一个单词
(global-set-key (kbd "C-w") 'backward-kill-word)

;; 设置 evil-leader 的快捷键
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "ff" 'find-file
  "rf" 'recentf-open-files
  "bb" 'switch-to-buffer
  "kb" 'kill-buffer
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":" 'counsel-M-x
  "wm" 'delete-other-windows)

(provide 'init-keybindings)
