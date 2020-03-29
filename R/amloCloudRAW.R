
# install.packages("wordcloud2")
library(wordcloud2)


# Mañanera transcrito

texto <- tolower(readLines("~/Documents/personal/amlo.txt"))

# Generacion de lista de palabras usadas
textoSplit <- unlist(strsplit(texto, " "))
# Dar frecuencia a cada palabra en la lista

textoFreq <- table(textoSplit)

textoFreqDF <- as.data.frame(textoFreq)

fewWordsDF <- subset(textoFreqDF, Freq < 20)

# wordcloud

#wordcloud2(data=fewWordsDF, size=0.5)
wordcloud2(data=textoFreq, size=1.5)
