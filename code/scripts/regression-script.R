#setwd("/Users/Steven/stat159-hw03")

#Read in data
advertising = read.csv("data/Advertising.csv", header = T)

#Fit model for TV and Sales
model_tv = lm(Sales ~ TV, data=advertising)
png("images/scatterplot-tv-sales.png")
plot(Sales~TV, data=advertising, main="Regression of TV and Sales")
abline(model_tv,col='red')
dev.off()

#Fit model for Radio and Sales
model_radio = lm(Sales ~ Radio, data=advertising)
png("images/scatterplot-radio-sales.png")
plot(Sales~Radio, data=advertising, main="Regression of Radio and Sales")
abline(model_radio,col='red')
dev.off()

#Fit model for Newspaper and Sales
model_news = lm(Sales ~ Newspaper, data=advertising)
png("images/scatterplot-newspaper-sales.png")
plot(Sales~Newspaper, data=advertising, main="Regression of Newspaper and Sales")
abline(model_news,col='red')
dev.off()

#Fit model for TV, Radio, and Newspaper against Sales
model_multi = lm(Sales ~ TV+Radio+Newspaper, data=advertising)
save(model_tv, model_radio, model_news, model_multi, file = 'data/regression.RData')

png('images/residual-plot.png')
plot(model_multi, which = 1)
dev.off()

png('images/normal-qq-plot.png')
plot(model_multi, which = 2)
dev.off()

png('images/scale-location-plot.png')
plot(model_multi, which = 3)
dev.off()