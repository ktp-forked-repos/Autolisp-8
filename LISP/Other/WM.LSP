 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Wm - Move word to next line.                                          �
 ; �  Copyright 1990, 1998 by Rocket Software                               �
 ; �  Software for those who want to make the big bucks                     �
 ; �                                      and get the good looking women.   �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Errx - error handler.                                                 �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN ERRX (shk)
  (setvar "snapmode" snapp)
  (write-line (strcat "\n" shk))
  (setq *error* prev)
 (princ))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Errx end.                                                             �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  1stwrd - divide the argument (a text string) at a space into the      �
 ; �  first word and the remainder of the string.                           �
 ; �  Returns a list thereof.                                               �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN 1STWRD (txa / lena last first len)
  (setq lena 1)
  (while (and (> (strlen txa) lena) (= (substr txa lena 1) " "))
         (setq lena (1+ lena)))
  (while (and (> (strlen txa) lena) (/= (substr txa lena 1) " "))
         (setq lena (1+ lena)))
  (if (/= (strlen txa) lena)                      ; if a > 1 word
      (progn
           (setq last (substr txa (1+ lena)))     ; text after space
           (setq first (substr txa 1 (1- lena)))) ; word up to space
      (progn                                      ; if a = only 1 word
           (if (= (substr txa (setq len (strlen txa))) " ")
               (setq txa (substr txa 1 (1- len))))
           (setq first txa)
           (setq last "")))
 (list first last))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  1stwrd end.                                                           �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Endwrd - divide the argument (a text string) at a space into the      �
 ; �  first part and the last word.                                         �
 ; �  Returns a list thereof.                                               �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN ENDWRD (txa / lena last first)
  (setq lena (strlen txa))      ; length of line a
  (while (and (< 0 lena) (= (substr txa lena 1) " "))
         (setq lena (1- lena)))
  (while (and (< 0 lena) (/= (substr txa lena 1) " "))
         (setq lena (1- lena)))
  (if (/= 0 lena)
      (progn
           (setq last (substr txa (1+ lena)))      ; word after space
           (setq first (substr txa 1 (1- lena))))  ; text up to space
      (progn
           (setq last txa)                         ; whole word
           (setq first "")))                       ; empty string
 (list first last))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Endwrd end.                                                           �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Justo - returns a string describing the justification of the text     �
 ; �  entity whose data was passed as its sole argument.  "none" is         �
 ; �  returned for standard left justification.                             �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN JUSTO (entt / xjust yjust xjst yjst justrg)
  (setq xjust (cdr (assoc 72 entt)))
  (setq yjust (cdr (assoc 73 entt)))
  (cond ((= yjust 0) (setq yjst ""))       ; base = normal
        ((= yjust 1) (setq yjst "b"))      ; bottom
        ((= yjust 2) (setq yjst "m"))      ; middle
        ((= yjust 3) (setq yjst "t")))     ; top
  (cond ((= xjust 0) (setq xjst "l"))      ; left
        ((= xjust 1) (setq xjst "c"))      ; centre
        ((= xjust 2) (setq xjst "r"))      ; right
        ((= xjust 3) (setq xjst "a"))      ; aligned
        ((= xjust 4) (setq xjst "m"))      ; middle
        ((= xjust 5) (setq xjst "f")))     ; fit
  (setq justrg (strcat yjst xjst))
 (if (= justrg "l") "none" justrg))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Justo end.                                                            �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Ad - create new text beneath an existing line.                        �
 ; �  Takes two arguments: enam, the existing line entity name              �
 ; �                       str, the string for the new text entity          �
 ; �  Returns a list of the enames of the new text entities.                �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN AD (enam str / entt nl cs czs cc cl clt justrg ecolor)
  (setq entt (entget enam))
  (setq nl (cdr (assoc 8 entt)))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Save system variables.                                                �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq cs (getvar "textstyle"))
  (setq czs (getvar "textsize"))
  (setq cc (getvar "cecolor"))
  (setq cl (getvar "clayer"))
  (setq clt (getvar "celtype"))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Find the justification of the original entity.                        �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq justrg (justo entt))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Set the entity creation colour to that of the text, set the linetype  �
 ; �  to bylayer, make the entity layer current, turn it on and thaw it,    �
 ; �  erase the original entity.                                            �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (if (setq ecolor (cdr (assoc 62 entt)))
      (progn
           (if (= (type ecolor) 'INT)
               (setq ecolor (itoa ecolor)))
               (setvar "cecolor" ecolor))
      (setvar "cecolor" "bylayer"))
  (setvar "celtype" "bylayer")
  (command "layer" "on" nl "t" nl "s" nl "")
  (entdel enam)
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Now create a new text entity which is identical to the selected one.  �
 ; �  This will allow the dtext command to pick up immediately below it.    �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (command "text" "s" (cdr (assoc 7 entt))   ; text style
           justrg)                           ; justification
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Find the insertion point.  If the text is left justified this will    �
 ; �  be the 10 point, otherwise 11, unless the justification is fit or     �
 ; �  aligned in which case both the ten and eleven points will be          �
 ; �  required.                                                             �
 ; �  Note that aligned text requires two end points, fitted text needs     �
 ; �  two points and a height, and other justifications need an insertion,  �
 ; �  a height, and a rotation.                                             �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (cond ((= justrg "f")
         (command (cdr (assoc 10 entt))
                  (cdr (assoc 11 entt))
                  (cdr (assoc 40 entt))))    ; height
        ((= justrg "a")
         (command (cdr (assoc 10 entt))
                  (cdr (assoc 11 entt))))
        (t
          (command (spit entt)                ; insertion
                   (cdr (assoc 40 entt))      ; height
                   (* 180 (/ (cdr (assoc 50 entt)) pi))))) ; rotation
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Enter the original text string.                                       �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (command (cdr (assoc 1 entt)))
  (setq enam1 (entlast))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Now add a new text entity after that one with the text command.       �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (command "text" "" str)
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  The user has apparently finished with Dtext and we are back in lisp.  �
 ; �  Reset the sysvars.                                                    �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setvar "textsize" czs)
  (setvar "textstyle" cs)
  (setvar "cecolor" cc)
  (setvar "clayer" cl)
  (setvar "celtype" clt)
 (list enam1 (entlast)))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Ad end.                                                               �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Ab - create new text above an existing line.                          �
 ; �  Arguments: enam, the ename of the existing text                       �
 ; �             str, the new text string                                   �
 ; �  Returns a list of the enames of the new text entities.                �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN AB (enam str / cs czs cc cl clt entt pa nl justrg ecolor enam1 enam2
                                                                          pb)
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Save system variables.                                                �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq cs (getvar "textstyle"))
  (setq czs (getvar "textsize"))
  (setq cc (getvar "cecolor"))
  (setq cl (getvar "clayer"))
  (setq clt (getvar "celtype"))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Get the text entity data.                                             �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq entt (entget enam))
  (setq pa (spit entt))                  ; original insertion point
  (setq nl (cdr (assoc 8 entt)))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Find the justification of the original entity.                        �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq justrg (justo entt))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Set the entity creation colour to that of the text, set the linetype  �
 ; �  to bylayer, make the entity layer current, turn it on and thaw it,    �
 ; �  erase the original entity.                                            �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (if (setq ecolor (cdr (assoc 62 entt)))
      (progn
           (if (= (type ecolor) 'INT)
               (setq ecolor (itoa ecolor)))
           (setvar "cecolor" ecolor))
      (setvar "cecolor" "bylayer"))
  (setvar "celtype" "bylayer")
  (command "layer" "on" nl "t" nl "s" nl "")
  (entdel enam)
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Now create a new text entity which is identical to the selected one.  �
 ; �  This will allow the dtext command to pick up immediately below it.    �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (command "text" "s" (cdr (assoc 7 entt))   ; text style
           justrg)                           ; justification
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Find the insertion point.  If the text is left justified this will    �
 ; �  be the 10 point, otherwise 11, unless the justification is fit or     �
 ; �  aligned in which case both the ten and eleven points will be          �
 ; �  required.                                                             �
 ; �  Note that aligned text requires two end points, fitted text needs     �
 ; �  two points and a height, and other justifications need an insertion,  �
 ; �  a height, and a rotation.                                             �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (cond ((= justrg "f")
         (command (cdr (assoc 10 entt))
                  (cdr (assoc 11 entt))
                  (cdr (assoc 40 entt))))                 ; height
        ((= justrg "a")
         (command (cdr (assoc 10 entt))
                  (cdr (assoc 11 entt))))
        (t
         (command (spit entt)                             ; insertion
                  (cdr (assoc 40 entt))                   ; height
                  (* 180 (/ (cdr (assoc 50 entt)) pi))))) ; rotation
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Enter the new text string.  (This is the text entity that replaces    �
 ; �  the original one.)                                                    �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (command str)
  (setq enam1 (entlast))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Now pick up after that one by repeating the text command.             �
 ; �  This entity will have the original string.                            �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (command "text" "" (cdr (assoc 1 entt)))
  (setq enam2 (entlast))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  The user has apparently finished with Dtext and we are back in lisp.  �
 ; �  Reset the sysvars.                                                    �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setvar "textsize" czs)
  (setvar "textstyle" cs)
  (setvar "cecolor" cc)
  (setvar "clayer" cl)
  (setvar "celtype" clt)
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Move both text entities so as to place the new (lower) text entity    �
 ; �  where the original one was.  This puts the one containing the new     �
 ; �  string one line above the original text.                              �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq pb (spit (entget enam2)))        ; new text insertion point
  (command "move" enam1 enam2 "" pb pa)  ; move text entities
 (list enam1 enam2))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Ab end.                                                               �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Griz - a replacement for the entsel function - returns a list in the  �
 ; �  (ename point) format unless there was no entity at that point, in     �
 ; �  which case (nil point) is returned.                                   �
 ; �  Takes one argument, a prompt string.                                  �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN GRIZ (prom / pa ss)
  (princ prom)
  (while (and (setq pa (grread t 5 2))
              (/= (car pa) 6)
              (/= (car pa) 3)))
  (if (setq ss (ssget (setq pa (cadr pa))))
      (list (ssname ss 0) pa)
      (list () pa)))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Griz end.                                                             �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Spit - returns the insertion point of the text entity whose data was  �
 ; �  passed as its sole argument.  Note that this is not necessarily the   �
 ; �  same as the 10 association code.                                      �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN SPIT (entt / xjust yjust)
  (setq xjust (cdr (assoc 72 entt)))
  (setq yjust (cdr (assoc 73 entt)))
  (if (or (/= xjust 0) (/= yjust 0))
      (cdr (assoc 11 entt))
      (cdr (assoc 10 entt))))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Spit end.                                                             �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Isab - see if a point or the insertion of a text entity is above or   �
 ; �  below a text entity relative to the orientation of the latter.        �
 ; �  Arguments: Entt1 - the base text entity data list.                    �
 ; �             Entt2 - either the entity data list of the entity whose    �
 ; �                     relative position we want, or a point.             �
 ; �  Returns the position of the destination entity or point relative to   �
 ; �  the source.                                                           �
 ; �  Calls spit.                                                           �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN ISAB (entt1 entt2 / rota1a rota1b ten1 ten2 rota2)
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Get the rotation angle of the text, and the opposite angle.           �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq rota1a (cdr (assoc 50 entt1)))
  (if (< rota1a pi)
      (setq rota1b (+ rota1a pi))
      (setq rota1b (- rota1a pi)))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Get the angle from the insertion point of the source text to the      �
 ; �  insertion point of the destination text.  Am using insertions         �
 ; �  rather than ten points just because it seems more likely to be        �
 ; �  what the user wants.                                                  �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq ten1 (spit entt1))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  If the second argument is a data list, extract the insertion.         �
 ; �  Otherwise use it as a point.                                          �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (if (> (length entt2) 3)
      (setq ten2 (spit entt2))
      (setq ten2 entt2))
  (setq rota2 (angle ten1 ten2))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Will cover all conditions here, just for the sake of completeness.    �
 ; �  Also the code can do its own error checking.  Realistically should    �
 ; �  be able to only check for Above and call everything else Below.       �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (cond ((and (> rota1a rota1b) (> rota1a rota2) (> rota1b rota2))
         "above")
        ((and (> rota1a rota1b) (> rota1a rota2) (< rota1b rota2))
         "below")
        ((and (> rota1a rota1b) (< rota1a rota2) (< rota1b rota2))
         "above")
        ((and (< rota1a rota1b) (> rota1a rota2) (> rota1b rota2))
         "below")
        ((and (< rota1a rota1b) (< rota1a rota2) (> rota1b rota2))
         "above")
        ((and (< rota1a rota1b) (< rota1a rota2) (< rota1b rota2))
         "below")
        (T (write-line "*error* - unrecognized alignment."))))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Isab end.                                                             �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Wm.                                                                   �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN C:WM (/ prev *error* aa lina bb linb pb rela newreq txa txb txlst
                                                                   ntxb ntxa)
  (setvar "cmdecho" 0)
  (command "undo" "mark")
  (setq prev *error*)
  (setq *error* errx) 
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Get the source text entity.                                           �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (while (or (null (setq aa (griz "\nSource text: ")))
             (/= (cdr (assoc 0 (entget (car aa)))) "TEXT")))
  (setq lina (entget (setq aa (car aa))))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Get the destination entity or a point.                                �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq bb (griz "\nDestination text or pick new text line position: "))
  (if (and (car bb) (= (cdr (assoc 0 (entget (car bb)))) "TEXT"))
      (setq linb (entget (setq bb (car bb))))
      (setq pb (cadr bb)))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  See if a new line is required, and if the destination is above or     �
 ; �  below the source.                                                     �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (if (and lina linb)
      (setq rela (isab lina linb))
      (progn
           (setq rela (isab lina pb))
           (setq newreq t)))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Condition 1: The second line (the destination) was above the first    �
 ; �               (the source).                                            �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (cond ((and (null newreq) (= rela "above"))
         (setq txa (cdr (assoc 1 lina)))
         (setq txb (cdr (assoc 1 linb)))
         (setq txlst (1stwrd txa))
         (setq ntxb (strcat txb " " (car txlst)))
         (setq ntxa (cadr txlst))
         (if (or (= ntxa "") (= ntxa " "))
             (entdel aa)
             (entmod (subst (cons 1 ntxa) (cons 1 txa) lina)))
         (entmod (subst (cons 1 ntxb) (cons 1 txb) linb)))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Condition 2: The destination was below the source.                    �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
        ((and (null newreq) (= rela "below"))
         (setq txa (cdr (assoc 1 lina)))  ; text of line a 
         (setq txb (cdr (assoc 1 linb)))  ; text of line b 
         (setq txlst (endwrd txa))
         (setq ntxb (strcat (cadr txlst) " " txb))
         (setq ntxa (car txlst))
         (if (or (= ntxa "") (= ntxa " "))
             (entdel aa)
             (entmod (subst (cons 1 ntxa) (cons 1 txa) lina)))
         (entmod (subst (cons 1 ntxb) (cons 1 txb) linb)))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Condition 3: A new line is required above the existing one.           �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
        ((= rela "above")
         (setq txa (cdr (assoc 1 lina)))  ; text of line a 
         (setq txlst (1stwrd txa))
         (setq ntxb (car txlst))
         (setq ntxa (cadr txlst))
         (setq aa (cadr (ab aa ntxb)))
         (setq lina (entget aa))
         (if (or (= ntxa "") (= ntxa " "))
             (entdel aa)
             (entmod (subst (cons 1 ntxa) (cons 1 txa) lina))))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Condition 4: A new line is required below the existing one.           �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
        ((= rela "below")
         (setq txa (cdr (assoc 1 lina)))  ; text of line a 
         (setq txlst (endwrd txa))
         (setq ntxb (cadr txlst))
         (setq ntxa (car txlst))
         (setq aa (car (ad aa ntxb)))
         (setq lina (entget aa))
         (if (or (= ntxa "") (= ntxa " "))
             (entdel aa)
             (entmod (subst (cons 1 ntxa) (cons 1 txa) lina)))))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Reset the error handler and end.                                      �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq *error* prev)
 (princ))