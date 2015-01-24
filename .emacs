;; Author     : Antonio Carlos, Victor Hugo

;; Improve Emacs start-up. Starting in server mode and running
;; emacsclient always.  
;;
;; não estou usando pq estou startando pelo bash um emacs --daemon
;;(load "server")
;;(unless (server-running-p) (server-start))

;; ADICIONAR AO .bashrc:
;; # macete para iniciar emacs --daemon de uma vez
;; export ALTERNATE_EDITOR=""
;; alias e='emacsclient -t'

;;======================================================================
;;                              Victor Hugo                            |
;;======================================================================
(set-default-font "Consolas 12")

;; para evitar aquela confirmação que o emacs fica esperando ao
;; carregar arquivos abertos anteriormente
;; Didn't work
(defadvice desktop-restore-file-buffer
  (around my-desktop-restore-file-buffer-advice)
  "Be non-interactive while starting a daemon."
  (if (and (daemonp)
           (not server-process))
      (let ((noninteractive t))
        ad-do-it)
    ad-do-it))
(ad-activate 'desktop-restore-file-buffer)


;; para autocompilar e melhorar o startup ainda mais
;; (defun autocompile nil ;;   "compile itself if ~/.emacs"
;;   (interactive)
;;   (require 'bytecomp)
;;   (let ((dotemacs (expand-file-name "~/.emacs")))
;;     (if (string= (buffer-file-name) (file-chase-links dotemacs))
;;       (byte-compile-file dotemacs))))
;; 
;; (add-hook 'after-save-hook 'autocompile)

;;======================================================================
;; LaTex                                                               |
;;======================================================================
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t t)
 '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d") ("^dvi$" "^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d") ("^dvi$" ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d") ("^dvi$" "^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)xdvi %dS %d") ("^pdf$" "." "start acrord32 %o") ("^html?$" "." "netscape %o"))))
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list (quote (("Adobe Reader" "start acrord32 %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "acrord32") (output-html "xdg-open"))))
 '(doc-view-continuous t)
 '(ecb-options-version "2.40"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;****************************************************************
;;
;; LOAD PATH
;;
;;****************************************************************

;; We don't need to auto-load these packages. Slower to start emacs
;;        (require 'matlab-load) 

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs/lisp/predictive")
(add-to-list 'load-path "~/.emacs/lisp/ess-12.09")
(add-to-list 'load-path "~/.emacs.d/darkroom-mode")
    (require 'darkroom-mode)
;; (add-to-list 'load-path "~/.emacs.d/matlab-emacs")
;;    (require 'matlab-load)

;;****************************************************************
;;
;; APPEARANCE
;;
;;****************************************************************

;; FULL-SCREEN MODE
;; (defun toggle-fullscreen (&optional f)
;;   (interactive)
;;   (let ((current-value (frame-parameter nil 'fullscreen)))
;;     (set-frame-parameter nil 'fullscreen
;;           (if (equal 'fullboth current-value)
;;               (if (boundp 'old-fullscreen) old-fullscreen nil)
;;             (progn (setq old-fullscreen current-value)
;;                'fullboth)))))
;; (global-set-key [f8] 'toggle-fullscreen)
;; (run-with-idle-timer 0.1 nil 'toggle-fullscreen)


;; Hide startup message
(setq inhibit-startup-message t)


;; Disable messag buffer
(setq message-log-max nil)

;; Hide toolbar
;; (tool-bar-mode nil)


;; Hide scrool bar or set scrool bar at right
;;(scroll-bar-mode nil)
(set-scroll-bar-mode 'right)


;; Display line number (May conflict with pdf-view)
;;(require 'line-num)
;;(require 'linum+)
;;(global-linum-mode 1)


;; Display column number.
(column-number-mode t)

;; Display time in the mode-line.
;;(display-time)

;; Configure dark color theme
;; (add-to-list 'load-path "~/.emacs.d/color-theme-5.6.0")
;; (add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/themes")
;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-dark-laptop)


;;****************************************************************
;;
;; UTIL
;;
;;****************************************************************

;; Enable ido-mode
(ido-mode t)
(setq ido-enable-flex-matching t)


;; Enable i-complete
;;(icomplete-mode t)

;; Enable recent files list
;;(recentf-mode t)

;; Enable truncate lines
(setq truncate-lines t)

;; Save a list of open files in ~/.emacs.desktop
;; Save the desktop file automatically if it already exists
(setq desktop-save 'if-exists)
(desktop-save-mode 1)

;;
;; Save a bunch of variables to the desktop file
;;
(setq desktop-globals-to-save
      (append '((extended-command-history . 30)
                (file-name-history        . 100)
                (grep-history             . 30)
                (compile-history          . 30)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 50)
                tags-file-name
                register-alist)))


;; Use F11 to invoke ibuffer
;;
(setq ibuffer-shrink-to-minimum-size t)
(setq ibuffer-always-show-last-buffer nil)
(setq ibuffer-sorting-mode 'recency)
(setq ibuffer-use-header-line t)
(global-set-key [(f11)] 'ibuffer)


;; Save backup files in a specific directory called bkup
;;(defun make-backup-file-name (filename)
;;(defvar backups-dir "~/.bkup/")
;;(make-directory backups-dir t)
;;(expand-file-name
;;(concat backups-dir "." (file-name-nondirectory filename) "~")
;;(file-name-directory filename)))

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)


;;
;; Open unidentified files in text mode
;;
(setq default-major-mode 'text-mode)

;;
;;
;;
;;(abbrev-mode t)


;;Display a list of recent files (shortcut (M-F12) )
(recentf-mode t)
(global-set-key [(meta f12)] 'recentf-open-files)


;; Display current selection
(setq transient-mark-mode t)

;; Type over selection
;; FIXME nao to conseguindo fazer funcionar de novo
(require 'delsel)
(autoload 'delsel "delsel" "Write over selected text" t)
(delete-selection-mode 1)

;;****************************************************************
;;
;; AUCTEX
;;
;;****************************************************************

;;PDFLatex as default
(setq TeX-PDF-mode t)

;;Auto revert mode default for pdf-view
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

;;More options for Latex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(global-set-key [(f5)] 'flyspell-mode)
(global-set-key [(f6)] 'flyspell-buffer)
(setq-default ispell-program-name "aspell")

;;****************************************************************
;;
;; PROGRAMING
;;
;;****************************************************************

;;Compile with smart-compile
;; FIXME deu pau aqui tambem
(require 'smart-compile)
(autoload 'smart-compile "smart-compile" "Smart Compile" t)
(global-set-key [(f9)] 'smart-compile)

;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph    
(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))
;; Handy key definition
(define-key global-map "\M-Q" 'unfill-paragraph)

;; uniquify changes conflicting buffer names from file<2> etc
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Use C++ mode for .h files (instead of plain-old C mode)
(setq auto-mode-alist (cons '("\\.h$" . c++-mode) auto-mode-alist))


;; Load Emacs Stat
;;auto-mode-alist (append (list '("\\.S$" . S-mode)
;;                '("\\.s$" . S-mode)
;;                '("\\.R$" . R-mode)
;;                '("\\.r$" . R-mode)
;;                )
;;          auto-mode-alist)
;;(load "/home/victorhugo/.emacs.d/ess-12.09")
;;(setq-default inferior-S+6-program-name "Splus")
;;(setq-default inferior-R-program-name "R")

;; Define keys global map
;;(define-key global-map [f1] 'Control-X-prefix)
;;(define-key global-map [f3] 'find-file)
;;(define-key global-map [f2] 'save-buffer)
;;(define-key global-map [f8] 'kill-buffer)
;;(define-key global-map [f5] 'switch-to-buffer)
;;(define-key global-map [f6] 'other-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              CEDET PACKAGE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu

;; ;; Emacs Code Navigator - ECB
;; (add-to-list 'load-path "~/.emacs.d/emacs-code-browser/")
;; (require 'ecb)

