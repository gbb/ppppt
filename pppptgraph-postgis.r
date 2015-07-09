# R script to convert result to a graphic.
# Having done this I realise R was the wrong choice but it's too late now. We're commited.

# Run R manually and type this line as root if ggplot2 is not installed
# install.packages("ggplot2")

library(reshape)
library(ggplot2)

d = read.csv("ppppt_results.csv", comment.char="#")
#plot(ggplot(subset(d, select=c('Test 2')), aes(x=threads, y=tps)) + labs(title = "Graph of pl/pgsql TPS varying with thread count") + geom_bar(stat="identity", fill="#FF9999", colour="black") + facet_wrap (~ testcase))
#plot(ggplot(subset(d, testcase %in% c('Test 1','Test 2')), aes(threads,tps,linetype=testcase)) + labs(title = "Graph of pl/pgsql TPS varying with thread count") + geom_line() + geom_point())


png(filename='result7.png')
plot(ggplot(subset(d, testcase=='Test 7'), aes(threads,tps,linetype=testcase)) + labs(title = "TPS scaling, postgis call (fast)") + geom_line() + geom_point())
dev.off()

png(filename='result8.png')
plot(ggplot(subset(d, testcase=='Test 8'), aes(threads,tps,linetype=testcase)) + labs(title = "TPS scaling, postgis call (slow)") + geom_line() + geom_point())
dev.off()

png(filename='result9.png')
plot(ggplot(subset(d, testcase=='Test 9'), aes(threads,tps,linetype=testcase)) + labs(title = "TPS scaling, postgis call (fast) in pl/pgsql") + geom_line() + geom_point())
dev.off()

png(filename='result10.png')
plot(ggplot(subset(d, testcase=='Test 10'), aes(threads,tps,linetype=testcase)) + labs(title = "TPS scaling, postgis call (slow) in pl/pgsql") + geom_line() + geom_point())
dev.off()

