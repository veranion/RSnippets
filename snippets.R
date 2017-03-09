#Einlesen von George-File
#read.csv2 - Europaeische Zahlen
#George-Daten sind in UTF-16LE kodiert
d <- read.csv2('2016_2017.csv',header=T,fileEncoding = 'UTF-16LE',sep='\t')

#Axen-Text in gewissem Winkel anzeigen
theme(axis.text.x = element_text(angle = 30, hjust = 1))
      
#Zeitintervalle auf Axen anpassen, Format anpassen
library("scales")
scale_x_date(breaks=date_breaks("14 days"), format = date_format("%Y-%m-%d"))

#Ausreisser hervorheben
#IQR Mulitplikator kann nach Anwendungsfall angepasst werden
library("dplyr")
outliers <- function(x) {
    return(x < quantile(x, 0.25) - 3 * IQR(x) | x > quantile(x, 0.75) + 3 * IQR(x))
}

df <- mutate(df,outlier = ifelse(outliers(wert),wert,as.numeric(NA)))

geom_text(aes(label = outlier),na.rm=T,hjust=0.4,vjust=-0.5)

#Schriftgroesse anpassen
theme(axis.text.y = element_text(size=11))

#Axen Name
scale_x_continuous(name="Name")

#Titel
+labs(title="Titel")