library(caret)
library(rpart)
library(rpart.plot)

dset <- read.csv("C:\\Users\\user\\Downloads\\GroupProject H(Stat)\\Dataset\\Maternal Health Risk Data Set.csv")
dset
str(dset)
summary(dset)

set.seed(200)
splitt <- createDataPartition(y = dset$RiskLevel, p = 0.7 , list = FALSE)
train_data <- dset[splitt, ]
test_data <- dset[-splitt, ]

model <- rpart(RiskLevel ~ ., data = train_data)

rpart.plot(model, yesno = 2 ,clip.right.labs = FALSE , type = 3, extra = 100, under = TRUE, cex = 0.9, tweak = .6, ycompress = FALSE)
rpart.rules(model, extra = 4, cover = TRUE)


predictions <- predict(model, newdata = test_data, type = "class")
accuracy <- sum(predictions == test_data$RiskLevel) / nrow(test_data)
print(paste("Accuracy:", accuracy))






#risk with Age
model_01 <- rpart(RiskLevel ~ Age , 
                  data = train_data,
                  method = "class")
rpart.plot(model_01, yesno = 2 ,clip.right.labs = FALSE , type = 3, extra = 100, under = TRUE, cex = 0.9, tweak = .6, ycompress = FALSE)
rpart.rules(model_01, extra = 4, cover = TRUE)

#Accuracy of the model
predictions <- predict(model_01, newdata = test_data, type = "class")
accuracy <- sum(predictions == test_data$RiskLevel) / nrow(test_data)
print(paste("Accuracy:", accuracy))


#risk with Upper value of BP
model_02 <- rpart(RiskLevel ~ SystolicBP , 
                  data = train_data,
                  method = "class")
rpart.plot(model_02, yesno = 2 ,clip.right.labs = FALSE , type = 3, extra = 100, under = TRUE, cex = 0.9, tweak = .6, ycompress = FALSE)
rpart.rules(model_02, extra = 4, cover = TRUE)

#Accuracy of the model
predictions <- predict(model_02, newdata = test_data, type = "class")
accuracy <- sum(predictions == test_data$RiskLevel) / nrow(test_data)
print(paste("Accuracy:", accuracy))


#risk with Lower value of BP
model_03 <- rpart(RiskLevel ~ DiastolicBP , 
                  data = train_data, 
                  method = "class")
rpart.plot(model_03, yesno = 2 ,clip.right.labs = FALSE , type = 3, extra = 100, under = TRUE, cex = 0.9, tweak = .6, ycompress = FALSE)
rpart.rules(model_03, extra = 4, cover = TRUE)

#Accuracy of the model
predictions <- predict(model_03, newdata = test_data, type = "class")
accuracy <- sum(predictions == test_data$RiskLevel) / nrow(test_data)
print(paste("Accuracy:", accuracy))


#Risk with blood sugar
model_04 <- rpart(RiskLevel ~ BS , 
                  data = train_data,
                  method = "class")
rpart.plot(model_04, yesno = 2 ,clip.right.labs = FALSE , type = 3, extra = 100, under = TRUE, cex = 0.9, tweak = .6, ycompress = FALSE)
rpart.rules(model_04, extra = 4, cover = TRUE)

#Accuracy of the model
predictions <- predict(model_04, newdata = test_data, type = "class")
accuracy <- sum(predictions == test_data$RiskLevel) / nrow(test_data)
print(paste("Accuracy:", accuracy))



#risk with body temp
model_05 <- rpart(RiskLevel ~ BodyTemp , 
                  data = train_data,
                  method = "class")
rpart.plot(model_05, yesno = 2 ,clip.right.labs = FALSE , type = 3, extra = 100, under = TRUE, cex = 0.9, tweak = .6, ycompress = FALSE)
rpart.rules(model_05, extra = 4, cover = TRUE)

#Accuracy of the model
predictions <- predict(model_04, newdata = test_data, type = "class")
accuracy <- sum(predictions == test_data$RiskLevel) / nrow(test_data)
print(paste("Accuracy:", accuracy))


#risk with Heart rate
model_06 <- rpart(RiskLevel ~ HeartRate , 
                  data = train_data,
                  method = "class")
rpart.plot(model_06, yesno = 2 ,clip.right.labs = FALSE , type = 3, extra = 100, under = TRUE, cex = 0.9, tweak = .6, ycompress = FALSE)
rpart.rules(model_06, extra = 4, cover = TRUE)

#Accuracy of the model
predictions <- predict(model_01, newdata = test_data, type = "class")
accuracy <- sum(predictions == test_data$RiskLevel) / nrow(test_data)
print(paste("Accuracy:", accuracy))




