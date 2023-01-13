install.packages('Tmisc')
library(Tmisc)
data("quartet")
View(quartet)

# Start by getting a summary of each set with the 
# mean, standard deviation, and correlation for each of 
# these datasets. 
# 
# We'll start by indicating that we want to group our 
# data by set.

quartet %>% 
  group_by(set) %>% 
  summarize(mean(x),sd(x),mean(y),sd(y),cor(x,y))

ggplot(quartet,aes(x,y)) + geom_point() + geom_smooth(method=lm,se=FALSE) + facet_wrap(~set)

install.packages("datasauRus")
library(datasauRus)

ggplot(datasaurus_dozen, aes(x=x,y=y,color=dataset))+geom_point()+theme_void()+theme(legend.position = "none")
