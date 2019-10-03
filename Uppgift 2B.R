library(ggplot2) #use the specified package
library(RColorBrewer) #use the specified package
library(readxl) #use the specified package

setwd("O:/Grundläggande Statistik/VIS1/Uppgift 2B") #set working directory for the project

data <- read_excel("VIS1 Lon.xlsx") #put project data into variabel

ggplot(data) +
  aes(Lon) + #tells which variabel to use
  geom_histogram(fill = "light blue", #sets bar color
               color = "black", #sets border color
               bins = 14) + #sets the number of bars - changes the interval width
  scale_y_continuous(expand = c(0,0), limits = c(0, 14)) + #scales the boxplot to desired values
  theme_bw() + theme(axis.title.y = 
                       element_text(angle = 0, #set angle of y-axis label
                                    hjust = 1, #adjusting horisontal position
                                    vjust = 0.5), #adjusting vertical position
                     plot.title = 
                       element_text(hjust = 0.5), #adjusting horisontal position of title
                     panel.grid.major.x = 
                       element_blank(), #removes x-axis major grid lines
                     panel.grid.minor.x = 
                       element_blank(), #removes x-axis minor grid lines
                     panel.grid.major.y = 
                       element_line(color = "dark gray")) + #set and colorize y-axis grid lines
  labs(y = "Antal",  #adds y-axis label name
       x = "Lön", #adds x-axis label name
       title = "Fördelning av lön",  #adds title name
       caption = "Källa: Hietala (2019)") #adds source name
