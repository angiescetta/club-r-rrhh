#install.packages(data.table)
#install.packages(tidyverse)

library(data.table)
library(tidyverse)

# A continuación realizaré la "limpieza" del dataset de Relevamiento de Usos del Suelo (RUS) publicado en BA Data.
# El objetivo es quedarnos solo con los registros de locales gastronómicos de la Ciudad.

rus2017 <- fread("http://cdn.buenosaires.gob.ar/datosabiertos/datasets/relevamiento-usos-del-suelo/relevamiento-usos-del-suelo-2017.csv",
                 encoding = 'UTF-8',
                 sep = ",",
                 header = TRUE,
                 showProgress=TRUE,
                 data.table=FALSE)

gastronomia_hoteleria <- rus2017 %>%
  filter(SUBRAMA == "GASTRONOMIA" | SUBRAMA == "HOTELERIA") %>%
  select(SMP, X, Y, RAMA, SUBRAMA) %>%
  unique()

write.csv(gastronomia_hoteleria, "data/gastronomia_hoteleria.csv", row.names = FALSE)
