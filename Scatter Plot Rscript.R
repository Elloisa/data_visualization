library("ggplot2")
library("wesanderson")
df_real_estate<-read.csv("C:/Users/CASA/365/Visualization/Scatter plot/scatter_data.csv",
                         header=TRUE,
                         sep=",")
scatter <- ggplot(df_real_estate,
                  aes(x= Area..ft..,
                      y=Price))+
                geom_point(aes(color=factor(Building.Type),
                               size=2),
                            alpha=0.4)+
                guides(size="none")+
                labs(color="Building Type")+
          scale_color_manual(values=wes_palette(name = "Darjeeling1",
                                               n=5))+
          theme_classic()+
          theme(legend.justification=c(0.01,1),
                legend.position=c(0.01,1))+
          ggtitle("Relationship between Area and Price of California Real Estate")+
          ylab("Price (000's of $)")+
          xlab("Area(sq. ft.)")
          
scatter
names(wes_palettes)
