head(cars)
plot(dist~speed, data=cars) 		# 산점도를 통해 선형 관계 확인

model <- lm(dist~speed, cars) 	# 회귀모델 구하기
model

abline(model) 			# 회귀선을 산점도 위에 표시
coef(model)[1] 			# b 값 출력
coef(model)[2] 			# W 값 출력




b <- coef(model)[1]
W <- coef(model)[2]

speed <- 30 			# 주행속도
dist <- W*speed + b
dist 				# 제동거리

speed <- 35 			# 주행속도
dist <- W*speed + b
dist 				# 제동거리

speed <- 40 			# 주행속도
dist <- W*speed + b
dist 				# 제동거리




speed <- cars[,1] 			# 주행속도
pred <- W * speed + b
pred 				# 예상 제동거리

compare <- data.frame(pred, cars[,2], pred-cars[,2])
colnames(compare) <- c('예상','실제','오차')
head(compare)









library(car)
head(Prestige)
newdata <- Prestige[,c(1:4)] 		# 회귀식 작성을 위한 데이터 준비
plot(newdata, pch=16, col="blue", 	# 산점도를 통해 변수 간 관계 확인
     main="Matrix Scatterplot")

mod1 <- lm(income ~ education + prestige + # 회귀식 도출
             women, data=newdata)
summary(mod1)





library(MASS) 		# stepAIC( ) 함수 제공
newdata2 <- Prestige[,c(1:5)] # 모델 구축에 사용할 데이터셋 생성
head(newdata2)
mod2 <- lm(income ~ education + prestige +
             women + census, data= newdata2) # 변수 순서 중요
mod3 <- stepAIC(mod2) 	# 변수 선택 진행
mod3 			# 변수 선택 후 결과 확인
summary(mod3) 		# 회귀모델 상세 내용 확인







iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species) # 범주형 자료를 정수로 변환
head(iris.new)
mod.iris <- glm(Species ~., data= iris.new) 	# 로지스틱 회귀모델 도출
summary(mod.iris) 			# 회귀모델의 상세 내용 확인










iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species) # 범주형 자료를 정수로 변환
head(iris.new)
mod.iris <- glm(Species ~., data= iris.new) 	# 로지스틱 회귀모델 도출
summary(mod.iris) 			# 회귀모델의 상세 내용 확인










# 예측 대상 데이터 생성(데이터프레임)
unknown <- data.frame(rbind(c(5.1, 3.5, 1.4, 0.2))) #배열의 형태
names(unknown) <- names(iris)[1:4]
unknown 				# 예측 대상 데이터

pred <- predict(mod.iris, unknown) 		# 품종 예측
pred 					# 예측 결과 출력
round(pred) 		# 예측 결과 출력(소수 첫째 자리에서 반올림)

# 실제 품종명 알아보기
levels(iris$Species)
levels(iris$Species)[pred] 









test <- iris[,1:4] 			# 예측 대상 데이터 준비
pred <- predict(mod.iris, test) 	# 모델을 이용한 예측
pred <- round(pred)
pred 				# 예측 결과 출력
answer <- as.integer(iris$Species) 	# 실제 품종 정보
pred == answer 		# 예측 품종과 실제 품종이 같은지 비교
acc <- mean(pred == answer) 	# 예측 정확도 계산
acc 				# 예측 정확도 출력
