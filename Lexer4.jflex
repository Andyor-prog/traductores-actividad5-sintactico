package act4_analisis_gestion_errores;
import java_cup.runtime.Symbol;

%%

%class LexerC4
%type java_cup.runtime.Symbol
%cup
%full
%line
%column
%public

%{
    //Este metodo ahora envia la linea y la columna exacta cup
    private Symbol token(int type, Object value) {
        return new Symbol(type, yyline + 1, yycolumn + 1, value);
    }

    private Symbol token(int type) {
        return new Symbol(type, yyline + 1, yycolumn +1, yytext());
    }
%}

//Reglas de espacios y saltos
ESPACIO = [ \t\r\n]+
IDENTIFICADOR = [a-zA-Z_][a-zA-Z0-9_]*

%%

<YYINITIAL> {
    {ESPACIO}       { /* Ignorar espacios */ }

    //palabras reservadas
    "package"       { return token(sym.PAQUETE); }
    "import"        { return token(sym.IMPORTAR); }
    "class"         { return token(sym.CLASE); }

    //Simbolos
    ";"         { return token(sym.PUNTO_COMA); }
    "."         { return token(sym.PUNTO); }
    "{"         { return token(sym.LLAVE_A); }
    "}"         { return token(sym.LLAVE_C); }

    //identificador
    {IDENTIFICADOR} { return token(sym.IDENTIFICADOR, yytext()); }

    //Manejo de errores lexicos (caracteres no validos)
    .           { System.out.println("Error lexico: " + yytext() + " en linea " + (yyline+1)); }
}