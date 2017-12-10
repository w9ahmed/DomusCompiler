#!/bin/bash


LEXFILE="analyzer.lex"
CUPFILE="domusParser.cup"

TESTDIR="test"
TESTFILE="exo-simple.txt"

SEPERATOR="\n\n\n"
DELETE="\t\e[31mDeleting\e[39m"

clean_directory() {
	echo -e '\e[97m\e[41mCleaning directory...\e[39m\e[49m'
	if [ -f parser.java ]
	then
		echo -e $DELETE parser.**
		rm -r parser.**
	fi


	if [ -f sym.java ]
	then
			echo -e $DELETE sym.**
		rm -r sym.**
	fi


	if [ -f Yylex.java ]
	then
			echo -e $DELETE Yylex.**
		rm -r Yylex.**
	fi

	if [ -f CUP$parser$actions.class ]
	then
			echo -e $DELETE 'CUP$parser$actions.class...'
		rm -r CUP$parser$actions.class
	fi

	if [ -f CMaisonUser.java ]
	then
			echo -e $DELETE 'CMaisonUser.java...'
		rm -r CMaisonUser.java
	fi
}

compile_lex() {
	echo -e '\e[34mCompiling lex file:\e[39m' $LEXFILE
	java JFlex.Main $LEXFILE
}

compile_cup() {
	echo -e '\e[34mCompiling cup file:\e[39m' $CUPFILE
	java java_cup.Main $CUPFILE
}

compile_javafiles() {
	echo -e '\e[34mCompiling\e[39m' *.java
	javac parser.java sym.java Yylex.java
	echo -e '\e[34mGenerated\e[39m' *.class
}

run_parser() {
	echo -e '\e[34mRunning parser on file:\e[39m' $TESTFILE
	echo -e $SEPERATOR
	java parser < "$TESTDIR/$TESTFILE"
}

open_files() {
	if [ -f CMaisonUser.java ]
	then
			code CMaisonUser.java
	fi
}

compile() {
	clean_directory
	echo -e $SEPERATOR
	compile_lex
	echo -e $SEPERATOR
	compile_cup
	echo -e $SEPERATOR
	compile_javafiles
}

run_all() {
	compile
	echo -e $SEPERATOR
	run_parser
}

case "$1" in
"")
	echo 'Compiling...'
	compile
;;
all|a)
	echo 'Compiling...'
	run_all
;;
lex|l)
	compile_lex
;;
cup|p)
	compile_cup
;;
clean|c)
	clean_directory
;;
test|t)
	run_parser
;;
which|w)
	echo -e "* \e[100mLex file:\e[49m"
	tree . | grep $LEXFILE
	echo

	echo -e "* \e[100mCup file:\e[49m"
	tree . | grep $CUPFILE
	echo

	echo -e "* \e[100mTest file:\e[49m"
	tree $TESTDIR | grep $TESTFILE
;;
open|o)
	open_files
;;
help)
	echo 'Usage: ./compile.sh [] [all|a] [lex|l] [cup|p] [clean|c] [test|t]'
	echo
	echo 'Default command ./compile.sh will just compile.'
	echo
	echo -e '\e[2m./compile.sh all\e[0m or \e[2m./compile.sh a\e[0m will compile and then open up the result in vs code.'
	echo
	echo -e '\e[2m./compile.sh lex\e[0m or \e[2m./compile.sh l\e[0m will only compile the lex file.'
	echo
	echo -e '\e[2m./compile.sh cup\e[0m or \e[2m./compile.sh p\e[0m will only compile the cup file.'
	echo
	echo -e '\e[2m./compile.sh clean\e[0m or \e[2m./compile.sh c\e[0m will clean the directory from all compiled files.'
	echo
	echo -e '\e[2m./compile.sh test\e[0m or \e[2m./compile.sh t\e[0m will run the parser on the test file.'
	echo
	echo -e '\e[2m./compile.sh which\e[0m or \e[2m./compile.sh w\e[0m will show the files that are being used.'
;;
*)
	echo 'domus: command not found'
esac