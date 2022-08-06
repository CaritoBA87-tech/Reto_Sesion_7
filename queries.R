library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest"
)

dbListTables(MyDataBase)

install.packages("dplyr")
library(dplyr)
DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
names(DataDB)
filtered <- DataDB %>% filter(Language=="Spanish") 

install.packages("ggplot2")
library(ggplot2)

ggplot(filtered, aes(x=Percentage, y = CountryCode, fill=IsOfficial )) + 
  geom_bar(stat="identity")  +
  coord_flip()
