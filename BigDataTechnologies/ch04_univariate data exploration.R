iris$Species[140]
as.numeric(iris$Species[140])


favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
              'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')
favorite                          # favorite의 내용 출력
table(favorite)                   # 도수분포표 계산
table(favorite)/length(favorite)  # 비율 출력

ds <- table(favorite)
ds                
barplot(ds, main='favorite season')


ds <- table(favorite)
ds                
pie(ds, main='favorite season')



favorite.color <- c(2, 3, 2, 1, 1, 2, 2, 1, 3, 2, 1, 3, 2, 1, 2)
ds <- table(favorite.color)
ds
barplot(ds, main='favorite color')


colors <- c('green', 'red', 'blue')
names(ds) <- colors         # 자료값 1,2,3을 green, red, blue로 변경
ds
barplot(ds, main='favorite color', col=colors)  # 색 지정 막대그래프



pie(ds, main='favorite color', col=colors)      # 색 지정 원그래프



mydata <- c(60, 62, 64, 65, 68, 69, 120)
var(mydata) 			# 분산
sd(mydata) 			# 표준편차
range(mydata) 			# 값의 범위
diff(range(mydata)) 		# 최댓값, 최솟값의 차이



weight <- c(60, 62, 64, 65, 68, 69)
weight.heavy <- c(weight, 120)
weight
weight.heavy

mean(weight)                    # 평균
mean(weight.heavy)              # 평균

median(weight)                  # 중앙값
median(weight.heavy)            # 중앙값

mean(weight, trim=0.2)          # 절사평균(상하위 20% 제외)
mean(weight.heavy,trim=0.2)     # 절사평균(상하위 20% 제외)






mydata <- c(60, 62, 64, 65, 68, 69, 120)
quantile(mydata)
quantile(mydata, (0:10)/10) 	#0~10/10=>10% 단위로 구간을 나누어 계산
summary(mydata)






dist <- cars[,2]  # 자동차 제동거리(단위: 피트) / 기본 데이터 cars
boxplot(dist, main="자동차 제동거리")




boxplot.stats(dist)




boxplot(Petal.Length~Species, data=iris, main="품종별 꽃잎의 길이")




par(mfrow = c(1, 3))  # 1x3 가상화면 분할

barplot(table(mtcars$carb),
        main = "Barplot of Carburetors",
        xlab = "# of carburetors",
        ylab = "frequency",
        col = "blue")

barplot(table(mtcars$cyl),
        main = "Barplot of Cylinders",
        xlab = "# of cylinders",
        ylab = "frequency",
        col = "red")

barplot(table(mtcars$gear),
        main = "Barplot of Gears",
        xlab = "# of gears",
        ylab = "frequency",
        col = "green")

par(mfrow = c(1, 1))  # 가상화면 분할 해제


dist <- cars[,2] 				# 자동차 제동거리
hist(dist, 					# 자료(data)
     main="Histogram for 제동거리", 	# 제목
     xlab ="제동거리", 			# x축 레이블
     ylab="빈도수", 			# y축 레이블
     border="blue", 			# 막대 테두리색
     col="green", 			# 막대 색
     las=2, 				# x축 글씨 방향(0~3)
     breaks=5) 			# 막대 개수 조절



score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
which(score==69) 		# 성적이 69인 학생은 몇 번째에 있나
which(score>=85) 		# 성적이 85 이상인 학생은 몇 번째에 있나
max(score) 		# 최고 점수는 몇 점인가
which.max(score) 		# 최고 점수는 몇 번째에 있나
min(score) 		# 최저 점수는 몇 점인가
which.min(score) 		# 최저 점수는 몇 번째에 있나




score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
idx <- which(score<=60) 	# 성적이 60 이하인 값들의 인덱스
score[idx] <- 61 	       # 성적이 60 이하인 값들은 61점으로 성적 상향 조정
score 			# 상향 조정된 성적 확인

idx <- which(score>=80) 	# 성적이 80 이상인 값들의 인덱스
score.high <- score[idx] 	# 성적이 80 이상인 값들만 추출하여 저장
score.high 		# score.high의 내용 확인



idx <- which(iris$Petal.Length>5.0) # 꽃잎의 길이가 5.0 이상인 값들의 인덱스
idx
iris.big <- iris[idx,] 		       # 인덱스에 해당하는 값만 추출하여 저장
iris.big 




# 1~4열의 값 중 5보다 큰 값의 행과 열의 위치
idx <- which(iris[,1:4]>5.0, arr.ind =TRUE)
idx



m <- matrix(1:12, 3, 4) 

which(m %% 3 == 0)
which(m %% 3 == 0, arr.ind = TRUE)




















