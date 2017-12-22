#!/bin/bash


LEXFILE="analyzer.lex"
CUPFILE="dParser.cup"

TESTDIR="test"

TESTFILE="test.domus"
# TESTFILE="exo-simple.txt"

SEPERATOR="\n\n\n"
DELETE="\t\e[31mDeleting\e[39m"

clean_directory() {
	echo -e '\e[97m\e[41mCleaning directory...\e[39m\e[49m'
	if [ -f parser.java ]
	then
		echo -e $DELETE parser.**
		rm parser.**
	fi


	if [ -f sym.java ]
	then
			echo -e $DELETE sym.**
		rm sym.**
	fi


	if [ -f Yylex.java ]
	then
			echo -e $DELETE Yylex.**
		rm Yylex.**
	fi

	if [ -f CUP$parser$actions.class ]
	then
			echo -e $DELETE 'CUP$parser$actions.class...'
		rm CUP$parser$actions.class
	fi

	if [ generated ]
	then
		echo -e $DELETE 'generated...'
		rm -r generated
		mkdir generated
	fi

	echo -e $DELETE *.class
	rm *.class
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
	move_files
}

test_all() {
	FILE1="test.domus"
	FILE2="exo-simple.txt"
	FILE3="ex0pb_lex"

	echo -e '\e[34mRunning parser on file:\e[39m' $FILE1
	java parser < "$TESTDIR/$FILE1"
	move_files

	echo -e $SEPERATOR
	echo -e '\e[34mRunning parser on file:\e[39m' $FILE2
	java parser < "$TESTDIR/$FILE2"
	move_files

	echo -e $SEPERATOR
	echo -e '\e[34mRunning parser on file:\e[39m' $FILE3
	java parser < "$TESTDIR/$FILE3"
	move_files
}

open_files() {
	if [ -f generated/CMaisonUser.java ]
	then
		code generated/CMaisonUser.java
	fi
}

move_files() {
	if [ -f CMaisonUser.java ]
	then
		mv CMaisonUser.java generated/
	fi

	if [ -f HabitatSpecific.java ]
	then
		mv HabitatSpecific.java generated/
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
	test_all
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
tests|ts)
	test_all
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