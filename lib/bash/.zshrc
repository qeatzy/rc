# x=${(%):-%x}
# echo $x
# echo ${x##*/}
# echo ${x#*/}
# echo ${x%/*}
# echo ${x%%/*}

# x=${(%):-%x}
# echo ${${(%):-%x}%/*}
# echo ${${(%):-%x}%/*}/profile

. ${${(%):-%x}%/*}/profile
# cd ${${(%):-%x}%/*}

       # %N	The	name  of  the  script,	sourced	 file,	or shell function that zsh is currently executing, whichever was
	      # started most recently.  If there is none, this is equivalent to the parameter $0.  An integer may follow  the
	      # `%'	to  specify  a number of trailing path components to show; zero means the full path.  A negative integer
	      # specifies leading components.

       # %x	The name of the file containing the source code currently being executed.  This behaves  as	%N  except	 that
	      # function and eval command names are not shown, instead the file where they were defined.


