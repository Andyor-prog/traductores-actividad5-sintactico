# Actividad 5: Analisis sintactico

Proyecto de analisis sintactico de atributos, variables y constantes usando JFlex y JavaCUP.

## Requisitos

- Java JDK 8 o posterior.
- Bibliotecas ubicadas en `lib/`:
  - `jflex-full-1.9.1.jar`
  - `java-cup-11b.jar`
  - `java-cup-11b-runtime.jar`

## Ejecucion desde VS Code

1. Abra esta carpeta como workspace.
2. En **Run and Debug**, ejecute **Generar lexer y parser**.
3. Ejecute **Probar archivo valido**, **Probar archivo con errores** o **Probar archivo mixto**.

Los perfiles de ejecucion incluyen las bibliotecas de `lib/` y usan `bin/` como salida compilada.

## Archivos principales

- `Lexer5.jflex`: reglas del analizador lexico.
- `parser5.cup`: gramatica del analizador sintactico.
- `GeneradorAct5.java`: genera el lexer y el parser.
- `PruebaAct5.java`: lee un archivo y ejecuta el analisis.
- `prueba_valida.txt`: atributos y constantes validos.
- `prueba_errores.txt`: declaraciones invalidas.
- `prueba_mixta.txt`: errores recuperables y declaraciones posteriores validas.

## Estructuras reconocidas

- Atributos o variables individuales y multiples, con o sin inicializacion.
- Constantes `final` con inicializacion obligatoria.
- Tipos `int`, `float`, `double`, `char`, `boolean`, `String` y tipos identificados.
- Valores numericos, decimales, cadenas, caracteres y booleanos.
- Paquetes, importaciones y clases.

El analizador informa reglas reconocidas y errores con linea, columna y token encontrado. Para errores de miembros, intenta recuperar el analisis hasta el siguiente punto y coma.
