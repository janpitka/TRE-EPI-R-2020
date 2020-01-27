# This is a comment
x<-2

library(haven)
breastca <- read_sav("breastca.sav")

str(breastca)
names(breastca)

mean(breastca$AGE,na.rm = TRUE)

library(data.table)

brcadt<-data.table(breastca)

summary(brcadt)

# Ex 4

breastca$age.gr <- cut(breastca$AGE, br=c(20, 50, 65, 90), right=F)
head(breastca[1:5,c(2,12)])


brcadt[,age.gr:=cut(brcadt$AGE, br=c(20, 50, 65, 90), right=F)]
head(brcadt[1:5,c(2,12)])

levels(breastca$age.gr) <-  c('20-49', '50-64', '65-89')
head(breastca[1:5,c(2,12)])


table(breastca$age.gr)

table(breastca$HISTGRAD)

brcadt[order(HISTGRAD),.N,by=HISTGRAD]

library(Epi)

stat.table( HISTGRAD, 
            list( count(), percent(HISTGRAD) ),
            margins=T,
            data=breastca)

res<-brcadt[order(HISTGRAD) & !is.na(HISTGRAD),.N,
            by=HISTGRAD][, prop := 100*(N/sum(N)), ]
print(res)
res

stat.table( HISTGRAD, 
            list( count(), 'Per Cent'=percent(HISTGRAD) ),
            margins=T,
            data=breastca)



library(knitr)
help(kable)

mage.gr <- stat.table( HISTGRAD, 
                       list(Number = count(), 
                            'Mean age' = mean(AGE), min(AGE), max(AGE)), 
                       margins=T,data=breastca);

print(mage.gr,  digits=c(mean=1, min=0, max=0))


grbyage<-table(breastca$age.gr,breastca$HISTGRAD)
print(grbyage)


stat.table( index = list(age.gr, HISTGRAD),
            contents = list( percent(HISTGRAD) ), 
            margins = T,
            data=breastca );

chisq.test(breastca$age.gr,breastca$HISTGRAD)

