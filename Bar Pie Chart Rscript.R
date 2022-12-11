library("ggplot2")

df_used_cars <- read.csv("C:/Users/CASA/365/R/data_base/bar_chart_data.csv",
                       header=TRUE,
                       sep=",")

bar_chart <- ggplot(df_used_cars,
                    aes(x=Brand,
                        y=Cars.Listings))+
                geom_bar(stat="identity",
                         width=0.8,
                         color="navy",
                         fill="navy")+
              ggtitle("Cars Listings by Brand")+
              theme_classic()+
              theme(axis.text.x = element_text(angle=360,
                                               hjust=1))+
              labs(x=NULL,
                   y="NUmber of Listings")+
              coord_flip()
bar_chart

df_fuel_engine_type <-read.csv("C:/Users/CASA/365/R/data_base/pie_chart_excel.csv",
                               header=TRUE,
                               sep=";")
pie_chart <- ggplot(df_fuel_engine_type,
                    aes(x="",
                        y=Number.of.Cars,
                        fill=Engine.Fuel.Type))+
            geom_bar(stat="identity",
                     width=1)+
            coord_polar("y")
pie_chart
percentages<-paste0(round(df_fuel_engine_type$Number.of.Cars/sum(df_fuel_engine_type$Number.of.Cars)*100,1),"%")
pie_chart<-pie_chart+
            geom_text(aes(label=percentages),
                             position=position_stack(vjust=0.5))
pie_chart
pie_chart<-pie_chart +
            labs(x=NULL,
                 y=NULL,
                 fill=NULL,
                 title="Cars by Engine Fuel Type")
pie_chart
cbPalette<-c("#999999","#E69F00","#56B4E9","#009E73","#F0E442","#0072B2","#D55E00","#CC79A7")
pie_chart<-pie_chart+
            scale_fill_manual(values=cbPalette)
pie_chart<-pie_chart+
            theme_classic()+
            theme(axis.line=element_blank(),
                  axis.text=element_blank(),
                  plot.title = element_text(hjust=0.5))
pie_chart
