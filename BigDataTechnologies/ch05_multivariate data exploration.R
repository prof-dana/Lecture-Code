wt <-mtcars$wt 			# 중량 자료
mpg <- mtcars$mpg 		# 연비 자료
plot(wt, mpg, 			# 2개 변수(x축, y축)
     main="중량-연비 그래프", 	# 제목
     xlab="중량", 		# x축 레이블
     ylab="연비(MPG)", 		# y축 레이블
     col="red", 		# point의 color
     pch=19) 			# point의 종류 

vars <- c("mpg","disp","drat","wt") 	# 대상 변수
target <- mtcars[,vars]
head(target)
pairs(target, 			# 대상 데이터
      main="Multi Plots")


iris.2 <- iris[,3:4] 			# 데이터 준비
point <- as.numeric(iris$Species) 	# 점의 모양
point 				# point 내용 출력
color <- c("red","green","blue") 	# 점의 컬러
plot(iris.2,
     main="Iris plot",
     pch=c(point),
     col=color[point])



beers <- c(5,2,9,8,3,7,3,5,3,5) 			# 자료 입력 
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07, 	# 자료 입력
         0.06,0.02,0.05)
cor(beers,bal) 				# 상관계수 계산
cor(iris[,1:4]) 		# 4개 변수 간 상관성 분석



month <- 1:12 # 자료 입력
late <- c(5,8,7,9,4,6,12,13,8,6,6,4) 	# 자료 입력
plot(month, 			# x data
     late, 			# y data
     main="지각생 통계", 	# 제목
     type= "l", 		# 그래프의 종류 선택(알파벳)
     lty=1, 			# 선의 종류(line type) 선택
     lwd=1, 			# 선의 굵기 선택
     xlab="Month", 		# x축 레이블
     ylab="Late cnt" 		# y축 레이블
)



month <- 1:12
late1 <- c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 <- c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month, 			# x data
     late1, 			# y data
     main="Late Students",
     type= "b", 		# 그래프의 종류 선택(알파벳)
     lty=1, 			# 선의 종류(line type) 선택
     col="red", 		# 선의 색 선택 
     xlab="Month ", 		# x축 레이블
     ylab="Late cnt", 		# y축 레이블
     ylim=c(1, 15) 		# y축 값의 (하한, 상한)
)



lines(month, 			# x data
      late2, 			# y data
      type = "b", 		# 선의 종류(line type) 선택
      col = "blue") 		# 선의 색 선택





## (1) Prepare Data ----------------------
library(mlbench)
data("BostonHousing")
myds <- BostonHousing[,c("crim","rm","dis","tax","medv")]
head(myds)

## (2) Add new column ----------------------
grp <- cut(myds$medv,
           breaks = c(-Inf, 17, 25, Inf),
           labels = c("L", "M", "H"))
grp <- factor(grp) 			 # 문자벡터를 팩터 타입으로 변경
grp <- factor(grp, levels=c("H","M","L")) # 레벨의 순서를 H,L,M -> H,M,L

myds <- data.frame(myds, grp)# myds 에 grp 컬럼추가
head(myds)


## (3) 데이터셋 파악 ----------------------
str(myds)
head(myds)
table(myds$grp) 			 # 주택 가격 그룹별 분포



## (4) histogram ----------------------
par(mfrow=c(2,3)) 			# 2x3 가상화면 분할
for(i in 1:5) {
  hist(myds[,i], main=colnames(myds)[i], col="yellow")
}



## (5) boxplot ----------------------
par(mfrow=c(2,3)) 			# 2x3 가상화면 분할
for(i in 1:5) {
  boxplot(myds[,i], main=colnames(myds)[i])
}


## (6) boxplot by group ------------------
par(mfrow=c(2,2)) 			# 2x2 가상화면 분할
boxplot(myds$crim~myds$grp, main="1인당 범죄율")
boxplot(myds$rm~myds$grp, main="방의 수")
boxplot(myds$dis~myds$grp, main="직업센터까지의 거리")
boxplot(myds$tax~myds$grp, main="재산세")



## (7) scatter plot ------------------
pairs(myds[,-6])


## (8) scatter plot with group ------------------
point <- as.integer(myds$grp) 		# 점의 모양 지정
color <- c("red","green","blue") 		# 점의 색 지정
pairs(myds[,-6], pch=point, col=color[point])


## (9) correlation coefficient ------------------
cor(myds[,-6])




