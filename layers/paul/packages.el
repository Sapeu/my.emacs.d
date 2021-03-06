;;; packages.el --- paul layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Paul.Li <paul@PaulLideMacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `paul-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `paul/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `paul/pre-init-PACKAGE' and/or
;;   `paul/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst paul-packages
  '(
    youdao-dictionary
    company
    ;; (occur-mode :location built-in)
    (gulpjs :location (recipe :fetcher github :repo "zilongshanren/emacs-gulpjs"))
    )
  "The list of Lisp packages required by the paul layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


(defun paul/init-youdao-dictionary ()
  (use-package youdao-dictionary
    :defer t
    :init
    (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
    )
  )

(defun paul/post-init-company()
  (setq company-minimum-prefix-length 1))

;; spacemacs-base中已经定义init-occur-mode
;; (defun paul/init-occur-mode()
;;   ;; 将 occur 的 buffer 中的光标移动方式修改为 HJKL
;;   (evilified-state-evilify-map occur-mode-map
;;     :mode occur-mode)
;;   )


(defun paul/init-gulpjs ()
  (use-package gulpjs
    :init)
  )

(defun paul/open-file-with-projectile-or-counsel-git ()
  (interactive)
  (if (zilongshanren/vcs-project-root)
      (counsel-git)
    (if (projectile-project-p)
	      (projectile-find-file)
      (ido-find-file))))

;;; packages.el ends here
