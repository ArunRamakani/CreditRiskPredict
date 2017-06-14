data=read.csv("/creditrating/data.csv", header = TRUE, sep = ",")
test=read.csv("test.csv", header = TRUE, sep = ",")
d = sort(sample(nrow(data), nrow(data)*.7))
#select training sample
train<-data[d,]
#Traditional Credit Scoring Using Logistic Regression in R
m<-glm(Creditability~.,data=train,family=binomial())
summary(m)

# Generate an ROC Curve for the glm model on german_credit.csv [test].

pr <- predict(m, type="response", newdata=test)
pr