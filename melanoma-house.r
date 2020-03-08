mm$sex <- factor(mm$sex,labels=c("M","F"))
mm$skin <- factor(mm$skin,labels=c("dark","medium","light"))
mm$hair <- factor(mm$hair,labels=c("dark","light_brown","blonde","red"))
mm$eyes <- factor(mm$eyes,labels=c("brown","grey-green","blue"))
mm$freckles <- 4 - mm$freckles
mm$age.cat <- cut(mm$age,breaks=c(20,30,40,50,60,70,85),right=F)
mm$freckles <- factor(mm$freckles,labels=c("none","some","many"))

mm$hair2 <- Relevel(mm$hair,list("dark"=1,"other"=c(2,3,4)))
mm$nvsma4 <- cut(mm$nvsmall,breaks=c(0,1,2,5,50),right=F)
mm$nvlar3 <- cut(mm$nvlarge,breaks=c(0,1,2,15),right=F)
