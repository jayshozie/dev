;;; init.el --- init config -*- lexical-binding: t; -*-
;; Copyright (C)  2026  Emir Baha YILDIRIM
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 8 1024 1024))))

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil
      blink-cursor -1
      show-paren-mode 1
      electric-pair-mode 1
      global-display-line-numbers-mode 1)

(unless (display-graphic-p) (xterm-mouse-mode 1))

(when (file-exists-p custom-file)
  (load custom-file))
