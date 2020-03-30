# install.packages("wordcloud2")
# install.packages("webshot")
# install.packages("htmlwidgets")

webshot::install_phantomjs()
library(wordcloud2)
library(htmlwidgets)

# amlo <- "AMLO_MU_BCN_20200328.tx"

amlo <- "20200329_AMLO_SIN_Carretera.txt"

texto <- tolower(readLines(amlo, encoding="UTF-8"))



filtro <- c("el","los","la","las","lo","un","unos","una","unas","del","de", "al","a","yo","mi","mí","en","me",
    "conmigo","nosotros","nosotras","nos","tu","tú","usted","ti","contigo","ustedes","él","ella","ello","sí","se","consigo","lo", 
    "que", "ahí", "ha", "aquí", "les","está", "este","esto", "hay", "le", "como", "su","pero","esta")





texto <- gsub("[[:punct:][:digit:]]" , "", texto)


textoSplit <- unlist(strsplit(texto, " "))
textoFreq <- table(textoSplit)

textoFreqDF <- as.data.frame(textoFreq)

fewWordsDF <- subset(textoFreqDF, Freq < 20)
row.names(fewWordsDF) <- fewWordsDF$textoSplit

fewWordsDF<- fewWordsDF[!(row.names(fewWordsDF) %in% filtro), ]
 # wordcloud2(data=fewWordsDF, size=1)


hw <- wordcloud2(data=fewWordsDF, size=1)

saveWidget(hw,"1.html",selfcontained = F)
webshot::webshot("1.html","1.png",vwidth = 1992, vheight = 1744, delay =10)
