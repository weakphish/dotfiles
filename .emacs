(package-initialize)

(scroll-bar-mode -1)

;; C-c <left> and C-c <right> to undo and redo window layout changes
(winner-mode 1)

;; Auto-pair things like quotes, braces, parens, etc.
(electric-pair-mode 1)
(show-paren-mode 1)

(global-display-line-numbers-mode)

(setq inhibit-startup-message t)

(setq ring-bell-function 'ignore)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; org-mode logs when a task is moved to done.
(setq org-log-done t)

;; org keybinds
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(setf org-agenda-files '("~/org"))

;; Put all backup files in ~/.saves
(setq backup-directory-alist '(("." . "~/.saves/")))

;; Always copy when backing up, instead of moving.
(setq backup-by-copying t)

;; Put auto-save files in ~/.saves
(setq auto-save-file-name-transforms '((".*" "~/.saves/" t)))
(setq tab-width 4) ; or any other preferred value

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(use-package gruvbox-theme)
(load-theme 'gruvbox t)

(set-frame-font "Fira Code 12" nil t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

(use-package company
  :ensure t
  :hook ((after-init) . global-company-mode)
  :config
  (setq company-idle-delay 0))
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t))

(use-package counsel
  :after ivy
  :ensure t
  :config
  (counsel-mode))

(use-package swiper
  :after ivy
  :ensure t
  :bind ("C-s" . swiper))

(use-package ace-jump-mode
  :ensure t
  :bind ("C-c C-SPC" . ace-jump-mode))

(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs
	       '(java-mode . (eglot-eclipse-jdt "jdtls"))) ;; need a special handler for jdtls
  (add-hook 'java-mode-hook #'eglot-ensure)
  (add-hook 'js-mode-hook #'eglot-ensure)
  (add-hook 'python-mode-hook #'eglot-ensure)
  (add-hook 'rust-mode-hook #'eglot-ensure)
  (add-hook 'go-mode-hook #'eglot-ensure))

(use-package projectile
  :after ivy
  :ensure t
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy)
  :bind-keymap ("C-c p" . projectile-command-map))

;; (use-package pdf-tools
;;  :ensure t
;;  :config
;;  (pdf-tools-install)
;;  (add-hook 'pdf-view-mode-hook (lambda ()
(use-package rust-mode
  :ensure t
  :config
  (add-hook 'rust-mode-hook
	    (lambda () (setq indent-tabs-mode nil))))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package yaml-mode
  :ensure t)

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(custom-enabled-themes (quote (vscode-dark-plus)))
 '(custom-safe-themes
   (quote
    ("7a242b3b88c299501f92aa94da0c242911d1c1cec851072f100daf7fc4aeca2d" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "b984070a83b5b354c7619579bfc55ff7a8a6b9ab368658b3221343ac26132f69" default)))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (nord-theme nordless-theme parinfer-rust-mode vscode-dark-plus-theme rjsx-mode rust-mode yaml-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pdf-tools pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text magit macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag gruvbox-theme google-translate golden-ratio go-guru go-eldoc flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav eglot dumb-jump diminish define-word counsel company column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-mode ace-jump-helm-line)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#1d2021")))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "CTDB" :slant normal :weight normal :height 119 :width normal)))))
