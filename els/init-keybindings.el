

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
(global-set-key (kbd "C-c p f") 'counsel-git)

(provide 'init-keybindings)
