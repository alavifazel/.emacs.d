;; TODO generate makefiles based on the project type
(defun makefile ()
  (interactive)
  (if (file-exists-p "Makefile")
      (let ((choices '("Overwrite" "Cancel")))
	(let ((choice (ido-completing-read "Choose Action: " choices )))
	  (if (string= choice "Overwrite")
	      (write-makefile ""))
	  (if (string= choice "Cancel")
	      (progn
	        (print "Cancelled.")))))
    (progn
      (print "Makefile created.")
      (write-makefile ""))))

(defun write-makefile (fileNames)
  (with-temp-file "Makefile"
    (insert "CC = gcc\n")
    (insert "CFLAGS  = -g -Wall\n")
    (insert "TARGET = target\n\n")
    (insert "\t$(TARGET)\n\n")
    (insert "$(TARGET): $(TARGET).c\n")
    (insert "\t$(CC) $(CFLAGS) -o $(OUTPUT) $(TARGET).c")
    (insert fileNames)
    (insert "\n\nclean:\n")
    (insert "\t$(RM) $(TARGET)")))
