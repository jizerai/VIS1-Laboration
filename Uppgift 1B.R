library(ggplot2) #use the specified package
library(readxl) #use the specified package
library(RColorBrewer) #use the specified package

dir <- "O:/Grundläggande Statistik/VIS1/Uppgift B/" #set working directory for the project
setwd(dir) #set working directory for the project

data <- read_excel("VIS1 Partisympatier2.xlsx") #put project data into variabel - this requires generated data file

ggplot(data, aes(x=Kön, #sets which variabel to use for x-axis
                  y=Procent/sum(Procent/2), #sets which variabel to use for y-axis
                  fill=Parti)) + #sets which variable to group the data by
  geom_bar(position="dodge", #bars are set to be next to each other
           stat="identity", #required for R to use the sum of the variable on the y-axis
           color="black") + #sets color of the border of the bars
  geom_text(aes(label=Procent), #adds a label to the bars, in this case a value
            vjust=2.5, #adjust the label verticaly
            color="white", #sets the label color
            size=4, #sets the label size
            position=position_dodge(width=0.9)) + #sets the label position
  geom_text(aes(label=Fkort), #adds a label to the bars, in this case a letter
            vjust=-0.5, #adjust the label verticaly
            size=5, #sets the label size
            position=position_dodge(width=0.9)) + #sets the label position
  scale_y_continuous(labels=scales::percent, #sets the y-axis to show %
                     expand=c(0,0), #sets where the y-axis begins
                     limits=c(0,0.32)) + #sets where the y-axis ends
  theme(axis.title.y=element_blank(), #removes the y-axis title
        axis.title.x=element_text(size=13), #sets x-title font size
        axis.text.x=element_text(size=12), #sets x-text font size
        panel.grid.major.x = element_blank(), #hides x-axis major grid lines
        panel.grid.minor.x = element_blank(), #hides x-axis minor grid lines
        panel.grid.major.y = element_line(color = "gray70"), #sets y-axis major grid line color
        panel.grid.minor.y = element_line(color = "gray80")) + #sets y-axis minor grid line color
  scale_fill_manual(name="Partier", #adds a legend
                    values=c("#016A3A", "#006AB3", "#000077", "#83CF39", "#52BDEC", "#E8112d", "#DDDD00", "#DA291C", "#CD1B68"), #sets legend colors
                    labels=c("Centerpartiet - C", "Folkpartiet - FP", "Kristdemokraterna - KD", "Miljöpartiet - MP",
                             "Moderaterna - M", "Socialdemokraterna - S", "Sverigedemokraterna - SD", "Vänsterpartiet - V", "Övriga - Ö")) + #sets legend names
  ggtitle("Partisympatier 2018") + #adds a diagram title
  labs(x="Partifördelning grupperat mellan kön", #adds a x-axis name
       caption="Källa: Statistiska Centralbyrån (SCB), 2018") #adds a source/caption
