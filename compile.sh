#!/bin/bash
echo 'Compiling...'

LEXFILE="analyzer.lex"
CUPFILE="domusParser.cup"
TESTFILE="test.domus"

SEPERATOR="\n\n\n"

echo -e $SEPERATOR
echo 'Cleaning directory...'
if [ -f parser.java ]
then
		echo -e '\tDeleting' parser.**
    rm -r parser.**
fi


if [ -f sym.java ]
then
		echo -e '\tDeleting' sym.**
    rm -r sym.**
fi


if [ -f Yylex.java ]
then
		echo -e '\tDeleting' Yylex.**
    rm -r Yylex.**
fi

if [ -f CUP$parser$actions.class ]
then
		echo -e '\tDeleting CUP$parser$actions.class...'
    rm -r CUP$parser$actions.class
fi

if [ -f CMaisonUser.java ]
then
		echo -e '\tDeleting CMaisonUser.java...'
    rm -r CMaisonUser.java
fi

echo -e $SEPERATOR
echo -e 'Compiling lex file:' $LEXFILE
java JFlex.Main $LEXFILE

echo -e $SEPERATOR
echo -e 'Compiling cup file:' $CUPFILE
java java_cup.Main $CUPFILE

echo -e $SEPERATOR
echo 'Compiling' *.java
javac parser.java sym.java Yylex.java
echo 'Generated' *.class

echo -e $SEPERATOR
echo 'Running parser on file:' $TESTFILE
echo -e $SEPERATOR
java parser < $TESTFILE
