import java_cup.runtime.Symbol;

%%
%unicode
%cup
%line
%column
%{
    public int getLine() {
        return yyline + 1;
    }

    public int getColumn() {
        return yycolumn + 1;
    }
    
    public String getText() {
        return yytext();
    }
%}

%%
"<PROGRAMME_DOMUS>" { return new Symbol(sym.PROGRAMME_DOMUS_OPEN_TAG); }
"</PROGRAMME_DOMUS>" { return new Symbol(sym.PROGRAMME_DOMUS_CLOSE_TAG); }

"<DECLARATION_APPAREILS>" { return new Symbol(sym.DECLARATION_APPAREILS_OPEN_TAG); }
"</DECLARATION_APPAREILS>" { return new Symbol(sym.DECLARATION_APPAREILS_CLOSE_TAG); }

"<DECLARATION_INTERFACES>" { return new Symbol(sym.DECLARATION_INTERFACE_OPEN_TAG); }
"</DECLARATION_INTERFACES>" { return new Symbol(sym.DECLARATION_INTERFACE_CLOSE_TAG); }

"<DECLARATION_SCENARII>" { return new Symbol(sym.DECLARATION_SCENARII_OPEN_TAG); }
"</DECLARATION_SCENARII>" { return new Symbol(sym.DECLARATION_SCENARII_CLOSE_TAG); }

("<SCENARIO "[a-z]+ ">") { return new Symbol(sym.SCENARIO_OPEN_TAG, new String(yytext())); }
("</SCENARIO "[a-z]+ ">") { return new Symbol(sym.SCENARIO_CLOSE_TAG, new String(yytext())); }

"<DECLARATION_COMMANDES>" { return new Symbol(sym.DECLARATION_COMMANDES_OPEN_TAG); }
"</DECLARATION_COMMANDES>" { return new Symbol(sym.DECLARATION_COMMANDES_CLOSE_TAG); }

"definir" { return new Symbol(sym.DEFINIR); }
"executer_scenario" { return new Symbol(sym.EXECUTOR_SCENARIO); }
"associer" { return new Symbol(sym.ASSOCIER); }
"programmer" { return new Symbol(sym.PROGRAMMER); }
"message" { return new Symbol(sym.MESSAGE); }
"pourtout" { return new Symbol(sym.POURTOUT); }
"faire" { return new Symbol(sym.FAIRE); }
"fait" { return new Symbol(sym.FAIT); }
"si" { return new Symbol(sym.SI); }
"alors" { return new Symbol(sym.ALORS); }
"sinon" { return new Symbol(sym.SINON); }
"fsi" { return new Symbol(sym.FSI); }

"ouvrir" { return new Symbol(sym.OUVRIR, new String(yytext())); }
"fermer" { return new Symbol(sym.FERMER, new String(yytext())); }
"eteindre" { return new Symbol(sym.ETEINDRE, new String(yytext())); }
"allumer" { return new Symbol(sym.ALLUMER, new String(yytext())); }
"tamiser" { return new Symbol(sym.TAMISER, new String(yytext())); }
"allumer_partiel" { return new Symbol(sym.ALLUMER_PARTIEL, new String(yytext())); }
"allumer_eco" { return new Symbol(sym.ALLUMER_ECO, new String(yytext())); }
"ouvrir_partiel" { return new Symbol(sym.OUVRIR_PARTIEL, new String(yytext())); }

"etat" { return new Symbol(sym.ETAT, new String(yytext())); }
"allume" { return new Symbol(sym.ALLUME, new String(yytext())); }
"eteint" { return new Symbol(sym.ETEINT, new String(yytext())); }
"demi" { return new Symbol(sym.DEMI, new String(yytext())); }
"eco" { return new Symbol(sym.ECO, new String(yytext())); }
"ouvert" { return new Symbol(sym.OUVERT, new String(yytext())); }
"ferme" { return new Symbol(sym.FERME, new String(yytext())); }

"eclairage" { return new Symbol(sym.ECLAIRAGE, new String(yytext())); }
"volet" { return new Symbol(sym.VOLET, new String(yytext())); }
"chauffage" { return new Symbol(sym.CHAUFFAGE, new String(yytext())); }
"alarme" { return new Symbol(sym.ALARME, new String(yytext())); }
"fenetre" { return new Symbol(sym.FENETRE, new String(yytext())); }
"autre_appareil" { return new Symbol(sym.AUTRE_APPAREIL, new String(yytext())); }

"interrupteur" { return new Symbol(sym.INTERRUPTEUR, new String(yytext())); }
"mobile" { return new Symbol(sym.MOBILE, new String(yytext())); }
"telephone" { return new Symbol(sym.TELEPHONE, new String(yytext())); }
"telecommande" { return new Symbol(sym.TELECOMMANDE, new String(yytext())); }

"tablette" { return new Symbol(sym.TABLETTE); }
"tv" { return new Symbol(sym.TV); }
"hifi" { return new Symbol(sym.HIFI); }
"cafetiere" { return new Symbol(sym.CAFETIERE); }
"video_proj" { return new Symbol(sym.VIDEO_PROJ); }
"lave_vaisselle" { return new Symbol(sym.LAVE_VAISSELLE); }
"lave_linge" { return new Symbol(sym.LAVE_LINGE); }
"seche_linge" { return new Symbol(sym.SECHE_LINGE); }
"ordinateur" { return new Symbol(sym.ORDINATEUR); }
"portail" { return new Symbol(sym.PORTAIL); }

"." { return new Symbol(sym.DOT); }
"," { return new Symbol(sym.COMMA); }
":" { return new Symbol(sym.COLON); }
"=" { return new Symbol(sym.ASSIGN); }
";" { return new Symbol(sym.SEMI_COLON); }
"{" { return new Symbol(sym.CURLY_BRACKET_OPEN); }
"}" { return new Symbol(sym.CURLY_BRACKET_CLOSE); }
"(" { return new Symbol(sym.PARANTHESES_OPEN); }
")" { return new Symbol(sym.PARANTHESES_CLOSE); }

"==" { return new Symbol(sym.EQUALS); }

("//"[^"//"\n]*) { return new Symbol(sym.LINE_COMMENT, new String(yytext())); }
("/*"[^*]*"*/") { return new Symbol(sym.BLOCK_COMMENT, new String(yytext())); }

([a-zA-Z]+[a-zA-Z_0-9]*) { return new Symbol(sym.IDENTIFIER, new String(yytext())); }


\n {}
. {}
