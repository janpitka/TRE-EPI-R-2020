library(smcure)
library(survival)

data("e1684")
attach(e1684)

fit <- survfit(Surv(FAILTIME,FAILCENS)~TRT,data = e1684)
plot(fit,fun="event")


pd <- smcure(Surv(FAILTIME,FAILCENS)~TRT,cureform=~TRT,
             data=e1684,model="ph",Var = TRUE)
res<-printsmcure(pd,Var = TRUE)

lp<-coef(res$logistfit)[1]
abline(h=exp(lp)/(1+exp(lp)),lty=2)
lp<-sum(coef(res$logistfit))
abline(h=exp(lp)/(1+exp(lp)),lty=2)


# plot predicted survival curves for male with median centered age by treatment groups
predm=predictsmcure(pd,newX=cbind(c(1,0),c(0,0),c(0.579,0.579)),
                    newZ=cbind(c(1,0),c(0,0),c(0.579,0.579)),model="ph")
plotpredictsmcure(predm,model="ph")

library(nltm)

fit1 <- nltm(formula1=Surv(FAILTIME,FAILCENS)~TRT,
             formula2=Surv(FAILTIME,FAILCENS)~TRT, 
             data=e1684, nlt.model="PHPHC")
summary(fit1)
anova(fit1)
anova(fit1,test=TRUE)
