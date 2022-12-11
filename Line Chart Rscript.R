library(ggplot2)
library(reshape2)
library(plyr)

spx_ftse_00_10 <- read.csv("C:/Users/CASA/365/Visualization/Line chart/line_chart_data.csv",
                           header=TRUE,
                           sep=",")
spx_ftse_00_10$Date <- as.Date(spx_ftse_00_10$Date,
                               format="%m/%d/%Y")
spx_ftse_00_10_melt <- melt(spx_ftse_00_10,
                            id="Date")
spx_ftse_00_10_melt <- rename(spx_ftse_00_10_melt,
                              c("value"="Returns",
                                "variable"="Index"))
#Data is the first mandatory layer in a ggplot
line_chart <- ggplot(spx_ftse_00_10_melt,
                     #aesthetics is the second mandatory layer in a ggplot
                     aes(x=Date,
                         y=Returns,
                         colour= Index,
                         group = Index)) +
              #geometry is the third mandatory layer in a ggplot
              geom_line(aes(color=Index),
                        size=1)+
              scale_color_manual(values=c("navyblue","red4")) +
              #theme_minimal removes the grey background but keeps the grid on the plot
              theme_minimal() +
              ggtitle("S&P vs FTSE Returns (2000-2010)")

line_chart

#narrow time period to Q3 and Q4 of 2008
min <- as.Date("2008-7-1")
max <- as.Date("2008-12-1")

line_chart_H2_08 <- ggplot(spx_ftse_00_10_melt,
                     #aesthetics is the second mandatory layer in a ggplot
                     aes(x=Date,
                         y=Returns,
                         colour= Index,
                         group = Index)) +
  #geometry is the third mandatory layer in a ggplot
  geom_line(aes(color=Index),
            size=1)+
  scale_color_manual(values=c("navyblue","red4")) +
  #theme_minimal removes the grey background but keeps the grid on the plot
  theme_minimal() +
  ggtitle("S&P vs FTSE Returns (H2 2008)")+
  scale_x_date(limits=c(min,max)) +
  theme(legend.justification=c(0.01,1),
        legend.position = c(0.01,1))
  

line_chart_H2_08
