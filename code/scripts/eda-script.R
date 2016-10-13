#setwd("/Users/Steven/stat159-hw03")

advertising = read.csv("data/Advertising.csv", header = T)

#Generate Histograms
png("images/histogram-sales.png", width=250, height=250)
hist(advertising$Sales, xlab="Sales", main="Histogram of Sales")
dev.off()

png("images/histogram-radio.png", width=250, height=250)
hist(advertising$Radio, xlab="Radio", main="Histogram of Radio")
dev.off()

png("images/histogram-newspaper.png", width=250, height=250)
hist(advertising$Newspaper, xlab="Newspaper", main="Histogram of Newspaper")
dev.off()

png("images/histogram-tv.png", width=250, height=250)
hist(advertising$TV, xlab="TV", main="Histogram of TV")
dev.off()


png('images/scatterplot-matrix.png', width=400, height=400)
pairs(~TV+Radio+Newspaper+Sales, data=advertising, main='Scatterplot Matrix')
dev.off()

correlations = cor(advertising)
save(correlations, file = 'data/correlation-matrix.RData')

sink("data/eda-output.txt")
cat("Sales Summary Statistics\n")
summary(advertising$Sales)
cat(c("Variance (Sales):", var(advertising$Sales), "\n"))
cat("TV Summary Statistics\n")
summary(advertising$TV)
cat(c("Variance (TV):", var(advertising$TV), "\n"))
cat("Newspaper Summary Statistics\n")
summary(advertising$Newspaper)
cat(c("Variance (Newspaper):", var(advertising$Newspaper), "\n"))
cat("Radio Summary Statistics\n")
summary(advertising$Radio)
cat(c("Variance (Radio):", var(advertising$Radio), "\n"))
correlations
sink()
