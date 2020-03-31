# R 3.4.4

# Instalar los paquetes que se van a necesitar

#install.packages("wordcloud2")
#install.packages("webshot")
#install.packages("htmlwidgets")
#install.packages("devtools")
#install.packages("viridis")
#install.packages("dplyr")
#devtools::install_github("lchiffon/wordcloud2")

webshot::install_phantomjs()
library(wordcloud2)
library(htmlwidgets)
library(devtools)
library(viridis)
library(dplyr)

amlo <- "~/Documents/personal/data/20200331_AMLO.txt"

# diputados <- "diputados.txt"

texto <- tolower(readLines(amlo, encoding="UTF-8"))


filtro <- c("el","los","la","las","lo","un","unos","una","unas","del","de", "al","a","yo","mi","mí","en","me",
    "conmigo","nosotros","nosotras","nos","tu","tú","usted","ti","contigo","ustedes","él","ella","ello","sí","se","consigo","lo",
    "que", "ahí", "ha", "aquí", "les","está", "este","esto", "hay", "le", "como", "su","pero","esta", "o", "al",
    "ricardo", "así", "haya", "presidente", "andres", "andrés", "manuel","lopez", "obrador","‘cono","‘la", "‘ni", "‘se", "‘y", "‘ya", "‘yo", "‘el", "sa",
    "cv", "tal","ram","interlocutora","pregunta", "alberto", "morales","interlocutor","bautista",
    "cristián", "cómo", "días", "ese" ,"desde")


# filtro <- c("el","los","la","las","lo","un","unos","una","unas","del","de", "al","a","yo","mi","mí","en","me",
#     "conmigo","nosotros","nosotras","nos","tu","tú","usted","ti","contigo","ustedes","él","ella","ello","sí","se","consigo","lo",
#     "que", "ahí", "ha", "aquí", "les","está", "este","esto", "hay", "le", "como", "su","pero","esta", "o", "al",
#     "presidenta", "secretaria", "diputada","diputado", "abelina", "hernández","angélica", "laura", "rojas", "alejandra",
#     "estoy", "cuales","sabe", "gonzález","señora", "gerardo", "-", "agradecemos","alejandro","alonso","alfredo","ana","adriana",  "allá", "almazán",
#     "armando", "aún", "bautista", "carmen", "bienvenidos", "arturo", "beatriz")

texto <- gsub("[[:punct:][:digit:]]" , "", texto) # Eliminar puntuaciones y numeros.


textoSplit <- unlist(strsplit(texto, " ")) # Separar palabra por palabra
textoFreq <- table(textoSplit) # generar una tabla, hace el conteo

textoFreqDF <- as.data.frame(textoFreq) # trasnformar tabla en DF

fewWordsDF <- subset(textoFreqDF, Freq < 20) # elimina todas las palabras menos de 20 repeticiones, revisar, quitar.

row.names(fewWordsDF) <- fewWordsDF$textoSplit


fewWordsDF<- fewWordsDF[!(row.names(fewWordsDF) %in% filtro), ]


#mutate(fewWordsDF, color = cut(Freq, breaks = c(0, 5, 10, 15, 20, Inf),
 #            labels = c("#FDE725FF", "#73D055FF", "#1F968BFF",
  #                      "#ba0808", "#481567FF"),
   #          include.lowest = TRUE)) -> fewWordsDF




fewWordsDF[order(fewWordsDF$Freq, decreasing=F),]

# wordcloud2(data=fewWordsDF, size=0.7,figPath="../imgs/goose.jpg")





# wordcloud2(data=fewWordsDF, size=0.5,figPath="../imgs/SIN.jpg", backgroundColor="black", color= "white", gridSize =  1)
hw <- wordcloud2(data=fewWordsDF, size=0.5,figPath="../imgs/MEX.jpg", backgroundColor = "black", gridSize =  0, color = fewWordsDF$color)
 # wordcloud2(data=fewWordsDF, size=0.5)



saveWidget(hw,"1.html",selfcontained = F)
webshot::webshot("1.html","1.png",vwidth = 1992, vheight = 1744, delay =10)


txtWC <- function(){


}
