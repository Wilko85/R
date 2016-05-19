csv <- read.csv("marx.csv")

csv$type <- factor(csv$type)

csv$day <- as.Date(csv$datetime, format = "%Y-%m-%d %H:%M:%S")
csv$freq <- c(1)
hosts <- aggregate(freq ~ day + host, data = csv, FUN = sum)

library(ggplot2)

# set up a ggplot instance, pretty color for each host

gg <- ggplot(hosts, aes(x = day, y = freq, fill = host))
gg <- gg + geom_bar(stat = "identity", width = 1)
gg <- gg + facet_wrap(~host, scales = "free")
gg <- gg + theme_bw() + theme(legend.position = "none")

print(gg)