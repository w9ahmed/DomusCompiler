#!/bin/bash
echo 'Compiling...'

LEXFILE="analyzer.lex"
CUPFILE="domusParser.cup"
TESTFILE="test.domus"

SEPERATOR="\n\n\n"
DELETE="\t\e[31mDeleting\e[39m"

echo -e $SEPERATOR
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

echo -e $SEPERATOR
echo -e '\e[34mCompiling lex file:\e[39m' $LEXFILE
java JFlex.Main $LEXFILE

echo -e $SEPERATOR
echo -e '\e[34mCompiling cup file:\e[39m' $CUPFILE
java java_cup.Main $CUPFILE

# echo -e $SEPERATOR
echo -e '\e[34mCompiling\e[39m' *.java
javac parser.java sym.java Yylex.java
echo -e '\e[34mGenerated\e[39m' *.class

echo -e $SEPERATOR
echo -e '\e[34mRunning parser on file:\e[39m' $TESTFILE
echo -e $SEPERATOR
java parser < $TESTFILE

# if [ -f CMaisonUser.java ]
# then
# 		# code CMaisonUser.java
# fi
