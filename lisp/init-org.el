
(with-eval-after-load 'org
  
  ;; 设置org-mode中src代码高亮
  (setq org-src-fontify-natively t)

  ;; 设置org-mode
  (setq org-agenda-files '("~/.emacs.d/"))
  (global-set-key (kbd "C-c a") 'org-agenda)

  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "学习安排")
	   "* TODO [#B] %?\n  %i\n"
	   :empty-lines 1)
	  ("x" "emacs学习的地址" entry (file+headline "~/.emacs.d/gtd.org" "学习安排")
	   "* TODO [#B] %?\n %(paul/retrieve-chrome-current-tab-url)\n  %i\n %U"
	   :empty-lines 1))
	)
  )

(global-set-key (kbd "C-c r") 'org-capture)

(require 'org-pomodoro)

(provide 'init-org)
