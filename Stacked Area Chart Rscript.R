library("ggplot2")
#dplyr library is used for data manipulation
library("dplyr") 
install.packages("reshape2")
#reshape2 help us transform data from wide to long formats
library("reshape2")
df_engine_types <- read.csv("C:/Users/CASA/365/Visualization/stacked_area_chart_data.csv",
                            header= TRUE,
                            sep= ",")

temp <- select(df_engine_types, -matches("Other"))
#melt combines multiple columns into one
new_engine_types <- melt(temp, id.vars = "Year")
#data is the firs mandatory layer in a ggplot
area_chart <- ggplot(new_engine_types,
                     #aesthetics is the second mandatory layer in a ggplot
                     aes(x=Year,
                         y=value,
                         fill=variable)) + 
              #geometry is the third mandatory layer in a ggplot                    
              #geom_area: geometry for an area chart
                      geom_area() +
              scale_fill_manual(values = c("#ef2026",
                                         "#7e2987",
                                         "#011638")) +
              #theme_classic: clean design and a white background
              theme_classic() +
              theme(legend.justification = c(0.01,1),
                    legend.position = c(0.01,1)) +
              labs(fill="Engine Type") + 
              ylab("Number of Cars") + 
              ggtitle("Popularity of Engine Fuel Types (1982-2016)") +
              theme(axis.text.x=element_text(angle=90,
                                             vjust=0.5)) +
              scale_x_continuous(breaks=new_engine_types$Year)
area_chart
