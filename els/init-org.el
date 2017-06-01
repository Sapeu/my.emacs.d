(with-eval-after-load 'org
  ;; 在org文件中代码高亮
  (setq org-src-fontify-natively t)
  ;; ~/org 目录下 org-agenda
  (setq org-agenda-files '("~/org" "~/.emacs.d"))

  (global-set-key (kbd "C-c a") 'org-agenda)

  ;; 按 C-c r 或者 按 Ｍ-x 输入 org-capture 选择 t 会生成　~/.emacs.d/gtd.org
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	   "* TODO [#B] %?\n %i\n"
	   :empty-lines 1)))
  (global-set-key (kbd "C-c r") 'org-capture)
  )

(provide 'init-org)
