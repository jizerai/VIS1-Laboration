library(ggplot2) #use the specified package
library(RColorBrewer) #use the specified package
library(readxl) #use the specified package

setwd("O:/Grundläggande Statistik/VIS1/Uppgift 2A") #set working directory for the project

data <- read_excel("VIS1 Lon.xlsx") #put project data into variabel

ggplot(data) +
  aes(x = factor(0), #create "empty" x-axis
      y = Lon) + #set y-axis to desired variable
  geom_boxplot(fill = "light blue") + #fills the boxplot with the desired color
  scale_x_discrete(breaks = NULL) + #scales the boxplot
  theme_bw() + theme(axis.title.y = element_text(angle = 0, #set angle of y-axis label
                                                 hjust = 1, #adjusting horisontal position
                                                 vjust = 0.5), #adjusting vertical position
                   plot.title = element_text(hjust = 0.5), #adjusting horisontal position of title
                   panel.grid.major.x = element_blank(), #removes x-axis major grid lines
                   panel.grid.minor.x = element_blank(), #removes x-axis minor grid lines
                   panel.grid.major.y = element_line(color = "dark gray")) + #set and colorize y-axis grid lines
  labs(y = "Lön", #adds y-axis label name
       x = NULL,
       title = "Fördelning av Lön", #adds title name
       caption = "Källa: Hietala (2019)") #adds source name