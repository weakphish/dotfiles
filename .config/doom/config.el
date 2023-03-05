;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Jack Allison"
      user-mail-address "jack@weakphi.sh")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Fira Code" :size 12)
      doom-big-font (font-spec :family "Fira Code" :size 26)
      doom-variable-pitch-font (font-spec :family "SF Pro" :size 13)
      doom-serif-font (font-spec :family "New York" :size 13 :weight 'light))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Group centaur tabs by project
(after! centaur-tabs
        (centaur-tabs-group-by-projectile-project))

;; Add a fortune to our splash screen. Adapted from Tecosaur's literate config.
;; https://github.com/tecosaur/emacs-config/blob/master/config.org#org-development-profile
(defun splash-phrase-dashboard-formatted ()
  "Get a splash phrase, flow it over multiple lines as needed, and fontify it."
  (mapconcat
   (lambda (line)
     (+doom-dashboard--center
      +doom-dashboard--width
      (with-temp-buffer
        (insert-text-button
         line
         'action
         (lambda (_) (+doom-dashboard-reload t))
         'face 'doom-dashboard-menu-title
         'mouse-face 'doom-dashboard-menu-title
         'help-echo "Random phrase"
         'follow-link t)
        (buffer-string))))
   (split-string
    (with-temp-buffer
      (insert (shell-command-to-string "fortune"))
      (setq fill-column (min 70 (/ (* 2 (window-width)) 3)))
      (fill-region (point-min) (point-max))
      (buffer-string))
    "\n")
   "\n"))
(defun splash-phrase-dashboard-insert ()
  "Insert the splash phrase surrounded by newlines."
  (insert "\n" (splash-phrase-dashboard-formatted) "\n"))

;; More Tecosaur - add some stuff to the Doom dashboard
;; When using the dashboard, there are often a small number of actions I will take.
;; As the dashboard is it’s own major mode, there is no need to suffer the tyranny of
;; unnecessary keystrokes — we can simply bind common actions to a single key!
(defun +doom-dashboard-setup-modified-keymap ()
  (setq +doom-dashboard-mode-map (make-sparse-keymap))
  (map! :map +doom-dashboard-mode-map
        :desc "Find file" :ng "f" #'find-file
        :desc "Config dir" :ng "C" #'doom/open-private-config
        :desc "Open dotfiles" :ng "." (cmd! (doom-project-find-file "~/.dotfiles/"))
        :desc "IBuffer" :ng "i" #'ibuffer
        :desc "Set theme" :ng "t" #'consult-theme
        :desc "Quit" :ng "Q" #'save-buffers-kill-emacs
        :desc "Show keybindings" :ng "h" (cmd! (which-key-show-keymap '+doom-dashboard-mode-map))))

(add-transient-hook! #'+doom-dashboard-mode (+doom-dashboard-setup-modified-keymap))
(add-transient-hook! #'+doom-dashboard-mode :append (+doom-dashboard-setup-modified-keymap))
(add-hook! 'doom-init-ui-hook :append (+doom-dashboard-setup-modified-keymap))
;; Unfortunately the show keybindings help doesn’t currently work as intended, but this is still quite nice overall.
;; Now that the dashboard is so convenient, I’ll want to make it easier to get to.
(map! :leader :desc "Dashboard" "d" #'+doom-dashboard/open)
;; Put it all together
;; With the splash image and phrase generation worked out, we can almost put together the desired
;; dashboard from scratch, we just need to re-create the benchmark information by itself.
(defun +doom-dashboard-benchmark-line ()
  "Insert the load time line."
  (when doom-init-time
    (insert
     "\n\n"
     (propertize
      (+doom-dashboard--center
       +doom-dashboard--width
       (doom-display-benchmark-h 'return))
      'face 'doom-dashboard-loaded))))
;; With doom-display-benchmark-h displayed here, I don’t see the need for it to be shown in the minibuffer as well.
(remove-hook 'doom-after-init-hook #'doom-display-benchmark-h)

;; Now we can create the desired dashboard by setting +doom-dashboard-functions to just have:
;; - The “widget banner” (splash image)
;; - The benchmark line
;; - A random phrase
;; This gets rid of two segments I’m not particularly interested in seeing
;; - The shortmenu
;; - The footer (github link)
(setq +doom-dashboard-functions
      (list #'doom-dashboard-widget-banner
            #'+doom-dashboard-benchmark-line
            #'splash-phrase-dashboard-insert))
;; At this point there are just a few minor tweaks I’d still like to make to the dashboard.
(defun +doom-dashboard-tweak (&optional _)
  (with-current-buffer (get-buffer +doom-dashboard-name)
    (setq-local line-spacing 0.2
                mode-line-format nil
                evil-normal-state-cursor (list nil))))
;; Now we can just add this as a mode hook.
(add-hook '+doom-dashboard-mode-hook #'+doom-dashboard-tweak)
;; (add-hook 'doom-after-init-hook #'+doom-dashboard-tweak 1)
;; Lastly, with the buffer name being shown in the frame title thanks to some other configuration,
;; we might as well display something a bit prettier than *doom*.
(setq +doom-dashboard-name "► Doom"
      doom-fallback-buffer-name +doom-dashboard-name)
