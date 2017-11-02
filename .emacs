;;; package --- .emacs

;;; Code:
;;; Commentary:

;; (defvar
;;   jpk-package-list
;;   '(auto-complete
;;     paredit
;;     paredit-everywhere
;;     sbt-mode
;;     scala-mode
;;     kotlin-mode
;;     rust-mode
;;     go-mode
;;     markdown-mode
;;     markdown-mode+
;;     smartparens
;;     dash
;;     lua-mode
;;     haskell-mode
;;     idris-mode
;;     csharp-mode
;;     d-mode
;;     groovy-mode
;;     llvm-mode
;;     jekyll-modes
;;     flycheck-haskell
;;     bing-dict))

;; ;; package-install-auto
;; (defun jpk-package-list-install ()
;;   "Install uninstalled packages which is in jpk-package-list."
;;   (interactive)
;;   (package-initialize)
;;   (when (not package-archive-contents)
;;     (package-refresh-contents))
;;   (dolist (pkg jpk-package-list)
;;     (when (and (not (package-installed-p pkg))
;;             (assoc pkg package-archive-contents))
;;       (package-install pkg))))

;; ;; list the unaccounted packages
;; (defun package-list-unaccounted-packages ()
;;   "Like `package-list-packages`, but show only the packages that are installed and are not in jpk-package-list."
;;   (interactive)
;;   (package-show-package-list
;;    (remove-if-not
;;     (lambda (x) (and (not (memq x jpk-package-list))
;;                   (not (package-built-in-p x))
;;                   (package-installed-p x)))
;;     (mapcar 'car package-archive-contents))))
 
(setq tab-width 2)
(setq kotlin-tab-width 2)
(setq java-tab-width 2)

(setq user-full-name "ice1000")
(setq user-mail-address "ice1000kotlin#foxmail.com")

(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

(setq-default make-backup-files nil)
(setq default-buffer-file-coding-system 'utf-8)
(setq inhibit-startup-message t)
(put 'LaTeX-hide-environment 'disabled nil)
(auto-image-file-mode t)

(require 'package)
(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.1)
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode nim-mode c-mode cc-mode c++-mode objc-mode swift-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js-jsx-mode js2-mode js2-jsx-mode coffee-mode php-mode css-mode scss-mode less-css-mode elixir-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode web-mode ts-mode sclang-mode verilog-mode qml-mode apples-mode markdown-mode dart-mode shell-mode kotlin-mode haskell-mode fundamental-mode rust-mode yaml-mode csharp-mode latex-mode llvm-mode nxml-mode idris-mode makefile-mode)))
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(display-time-mode t)
 '(flyspell-abbrev-p t)
 '(flyspell-after-incorrect-word-string nil)
 '(font-use-system-font t)
 '(global-auto-complete-mode t)
 '(global-linum-mode t)
 '(idris-interpreter-path "/home/ice1000/.cabal/bin/idris")
 '(ispell-program-name "aspell")
 '(package-selected-packages
   (quote
    (paredit-everywhere paredit flycheck-kotlin flycheck-julia flycheck-haskell flycheck-color-mode-line flycheck-clang-tidy flycheck-clang-analyzer flycheck-ocaml flycheck-rust zone-sl latex-extra auctex yaml-mode zone-rainbow zone-nyan scala-mode sbt-mode rust-mode ruby-test-mode mode-icons markdown-preview-mode markdown-mode+ llvm-mode kotlin-mode jekyll-modes j-mode indent-guide idris-mode ibuffer-git haskell-mode groovy-mode go-mode gited elm-mode dart-mode d-mode csharp-mode bing-dict ace-flyspell ac-c-headers)))
 '(paredit-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t))

;;; Fira code
(add-hook
 'after-make-frame-functions
 (lambda (frame)
   (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))

(set-fontset-font
 t
 '(#Xe100 . #Xe16f) "Fira Code Symbol")

(defconst fira-code-font-lock-keywords-alist
  (mapcar
   (lambda (regex-char-pair)
     `(,(car regex-char-pair)
       (0 (prog1 ()
            (compose-region
             (match-beginning 1)
             (match-end 1)
             ;; The first argument to concat is a
             ;; string containing a literal tab
             ,(concat
               "        "
               (list
                (decode-char
                 'ucs
                 (cadr regex-char-pair)))))))))
   '(("\\(www\\)"                   #Xe100)
     ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
     ("\\(\\*\\*\\*\\)"             #Xe102)
     ("\\(\\*\\*/\\)"               #Xe103)
     ("\\(\\*>\\)"                  #Xe104)
     ("[^*]\\(\\*/\\)"              #Xe105)
     ("\\(\\\\\\\\\\)"              #Xe106)
     ("\\(\\\\\\\\\\\\\\)"          #Xe107)
     ("\\({-\\)"                    #Xe108)
     ("\\(\\[\\]\\)"                #Xe109)
     ("\\(::\\)"                    #Xe10a)
     ("\\(:::\\)"                   #Xe10b)
     ("[^=]\\(:=\\)"                #Xe10c)
     ("\\(!!\\)"                    #Xe10d)
     ("\\(!=\\)"                    #Xe10e)
     ("\\(!==\\)"                   #Xe10f)
     ("\\(-}\\)"                    #Xe110)
     ("\\(--\\)"                    #Xe111)
     ("\\(---\\)"                   #Xe112)
     ("\\(-->\\)"                   #Xe113)
     ("[^-]\\(->\\)"                #Xe114)
     ("\\(->>\\)"                   #Xe115)
     ("\\(-<\\)"                    #Xe116)
     ("\\(-<<\\)"                   #Xe117)
     ("\\(-~\\)"                    #Xe118)
     ("\\(#{\\)"                    #Xe119)
     ("\\(#\\[\\)"                  #Xe11a)
     ("\\(##\\)"                    #Xe11b)
     ("\\(###\\)"                   #Xe11c)
     ("\\(####\\)"                  #Xe11d)
     ("\\(#(\\)"                    #Xe11e)
     ("\\(#\\?\\)"                  #Xe11f)
     ("\\(#_\\)"                    #Xe120)
     ("\\(#_(\\)"                   #Xe121)
     ("\\(\\.-\\)"                  #Xe122)
     ("\\(\\.=\\)"                  #Xe123)
     ("\\(\\.\\.\\)"                #Xe124)
     ("\\(\\.\\.<\\)"               #Xe125)
     ("\\(\\.\\.\\.\\)"             #Xe126)
     ("\\(\\?=\\)"                  #Xe127)
     ("\\(\\?\\?\\)"                #Xe128)
     ("\\(;;\\)"                    #Xe129)
     ("\\(/\\*\\)"                  #Xe12a)
     ("\\(/\\*\\*\\)"               #Xe12b)
     ("\\(/=\\)"                    #Xe12c)
     ("\\(/==\\)"                   #Xe12d)
     ("\\(/>\\)"                    #Xe12e)
     ("\\(//\\)"                    #Xe12f)
     ("\\(///\\)"                   #Xe130)
     ("\\(&&\\)"                    #Xe131)
     ("\\(||\\)"                    #Xe132)
     ("\\(||=\\)"                   #Xe133)
     ("[^|]\\(|=\\)"                #Xe134)
     ("\\(|>\\)"                    #Xe135)
     ("\\(\\^=\\)"                  #Xe136)
     ("\\(\\$>\\)"                  #Xe137)
     ("\\(\\+\\+\\)"                #Xe138)
     ("\\(\\+\\+\\+\\)"             #Xe139)
     ("\\(\\+>\\)"                  #Xe13a)
     ("\\(=:=\\)"                   #Xe13b)
     ("[^!/]\\(==\\)[^>]"           #Xe13c)
     ("\\(===\\)"                   #Xe13d)
     ("\\(==>\\)"                   #Xe13e)
     ("[^=]\\(=>\\)"                #Xe13f)
     ("\\(=>>\\)"                   #Xe140)
     ("\\(<=\\)"                    #Xe141)
     ("\\(=<<\\)"                   #Xe142)
     ("\\(=/=\\)"                   #Xe143)
     ("\\(>-\\)"                    #Xe144)
     ("\\(>=\\)"                    #Xe145)
     ("\\(>=>\\)"                   #Xe146)
     ("[^-=]\\(>>\\)"               #Xe147)
     ("\\(>>-\\)"                   #Xe148)
     ("\\(>>=\\)"                   #Xe149)
     ("\\(>>>\\)"                   #Xe14a)
     ("\\(<\\*\\)"                  #Xe14b)
     ("\\(<\\*>\\)"                 #Xe14c)
     ("\\(<|\\)"                    #Xe14d)
     ("\\(<|>\\)"                   #Xe14e)
     ("\\(<\\$\\)"                  #Xe14f)
     ("\\(<\\$>\\)"                 #Xe150)
     ("\\(<!--\\)"                  #Xe151)
     ("\\(<-\\)"                    #Xe152)
     ("\\(<--\\)"                   #Xe153)
     ("\\(<->\\)"                   #Xe154)
     ("\\(<\\+\\)"                  #Xe155)
     ("\\(<\\+>\\)"                 #Xe156)
     ("\\(<=\\)"                    #Xe157)
     ("\\(<==\\)"                   #Xe158)
     ("\\(<=>\\)"                   #Xe159)
     ("\\(<=<\\)"                   #Xe15a)
     ("\\(<>\\)"                    #Xe15b)
     ("[^-=]\\(<<\\)"               #Xe15c)
     ("\\(<<-\\)"                   #Xe15d)
     ("\\(<<=\\)"                   #Xe15e)
     ("\\(<<<\\)"                   #Xe15f)
     ("\\(<~\\)"                    #Xe160)
     ("\\(<~~\\)"                   #Xe161)
     ("\\(</\\)"                    #Xe162)
     ("\\(</>\\)"                   #Xe163)
     ("\\(~@\\)"                    #Xe164)
     ("\\(~-\\)"                    #Xe165)
     ("\\(~=\\)"                    #Xe166)
     ("\\(~>\\)"                    #Xe167)
     ("[^<]\\(~~\\)"                #Xe168)
     ("\\(~~>\\)"                   #Xe169)
     ("\\(%%\\)"                    #Xe16a)
     ("[^:=]\\(:\\)[^:=]"           #Xe16c)
     ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
     ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f))))

;; (when (window-system)
;;   (set-frame-font "Fira Code")
;;   (set-language-environment "UTF-8")
;;   (set-default-coding-systems 'utf-8))

(when (window-system)
  (defun add-fira-code-symbol-keywords ()
    "Add Fira Code Symbols."
    (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))

  (add-hook 'prog-mode-hook
            #'add-fira-code-symbol-keywords))

;; (load-path "/home/ice1000/.emacs.d/")

(global-set-key (kbd "C-c d") 'bing-dict-brief)
(setq bing-dict-save-search-result t)
(setq gitter-token "")

(require 'zone)
(zone-when-idle 120)
(defun zone-choose (pgm)
  "Choose a PGM to run for `zone'."
  (interactive
   (list
    (completing-read
     "Program: "
     (mapcar 'symbol-name zone-programs))))
  (let ((zone-programs (list (intern pgm))))
    (zone)))

(add-hook 'after-init-hook #'global-flycheck-mode)

;; (eval-after-load 'flycheck
;;   (progn
;;     (require 'flycheck-kotlin)
;;     (flycheck-kotlin-setup)))

(load-file
 (let ((coding-system-for-read 'utf-8))
   (shell-command-to-string "agda-mode locate")))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inziu Iosevka Slab SC" :foundry "CYEL" :slant normal :weight normal :height 158 :width normal)))))
