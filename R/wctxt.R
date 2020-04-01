

# Funcion que genera una nube de palabras
#install.packages("wordcloud2")
library(wordcloud2)

# wctxt version 1.0.0

# txt       = el archivo en formato txt
# size      = el tamanio de las letras de la nube de palabras
# maskPath  = Direccion del jpg o mascara o figura que quieras que tenga
# filtro    = listado de palabras que quieres excluir c()
# backColor = color del fondo
# subSet    = ... no recuerdo.

wctxt <- function(txt, size = 1, maskPath= NULL, filtro = NULL, backColor = "black", subSet = NULL, wordColor = "white"){

        # leer el txt y darle el UTF-8 y todo en minusculas.
     texto <- tolower(readLines(txt, encoding="UTF-8"))

        # el texto se le eliminan los simbolos de puntuacion y numeros, ademas de separar palabras. Genera una tabla y luego un DF.
        # Buscar optimizar esta linea. lapply ?
     textoProcesado <- as.data.frame(table(unlist(strsplit(gsub("[[:punct:][:digit:]]" , "", texto), split= " "))))

     row.names(textoProcesado) <- textoProcesado$Var1

     textoProcesado<- textoProcesado[!(row.names(textoProcesado) %in% filtro), ]



     wordcloud2(data=textoProcesado, size=size, figPath=maskPath, backgroundColor = backColor, color = wordColor)


}
