# R script to convert result to a graphic.
# Having done this I realise R was the wrong choice but it's too late now. We're commited.

# Run R manually and type this line as root if ggplot2 is not installed
# install.packages("ggplot2")

library(reshape)
library(ggplot2)

d = read.csv("ppppt_results.csv", comment.char="#")
#plot(ggplot(subset(d, select=c('Test 2')), aes(x=threads, y=tps)) + labs(title = "Graph of pl/pgsql TPS varying with thread count") + geom_bar(stat="identity", fill="#FF9999", colour="black") + facet_wrap (~ testcase))
#plot(ggplot(subset(d, testcase %in% c('Test 1','Test 2')), aes(threads,tps,linetype=testcase)) + labs(title = "Graph of pl/pgsql TPS varying with thread count") + geom_line() + geom_point())


png(filename='result0.png')
plot(ggplot(subset(d, testcase=='Test 0'), aes(threads,tps,linetype=testcase)) + labs(title = "TPS scaling, trivial function") + geom_line() + geom_point())
dev.off()

png(filename='result1.png')
plot(ggplot(subset(d, testcase=='Test 1'), aes(threads,tps,linetype=testcase)) + labs(title = "TPS scaling, trivial function + local variable") + geom_line() + geom_point())
dev.off()

png(filename='result2.png')
plot(ggplot(subset(d, testcase=='Test 2'), aes(threads,tps,linetype=testcase)) + labs(title = "TPS scaling, trivial function + fixed parameter") + geom_line() + geom_point())
dev.off()

png(filename='result3.png')
plot(ggplot(subset(d, testcase=='Test 3'), aes(threads,tps,linetype=testcase)) + labs(title = "TPS scaling, trivial function + table column input") + geom_line() + geom_point())
dev.off()

png(filename='result4.png')
plot(ggplot(subset(d, testcase=='Test 4'), aes(threads,tps,linetype=testcase)) + labs(title = "TPS scaling, for-loop function") + geom_line() + geom_point())
dev.off()

png(filename='result5.png')
plot(ggplot(subset(d, testcase=='Test 5'), aes(threads,tps,linetype=testcase)) + labs(title = "TPS scaling, for-loop with table column input") + geom_line() + geom_point())
dev.off()

png(filename='result6.png')
plot(ggplot(subset(d, testcase=='Test 6'), aes(threads,tps,linetype=testcase)) + labs(title = "TPS scaling, postgres MD5 built-in function") + geom_line() + geom_point())
dev.off()

png(filename='resultB.png')
plot(ggplot(subset(d, testcase %in% c('Test 0','Test 1','Test 2')), aes(threads,tps,linetype=testcase)) + labs(title = "Just for fun. Effect of adding a local variable or parameter.") + geom_line() + geom_point())
dev.off()
