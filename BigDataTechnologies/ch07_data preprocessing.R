z <- c(1,2,3,NA,5,NA,8) 		# 결측값이 포함된 벡터 z
sum(z) 				# 정상 계산이 안 됨
is.na(z) 				# NA 여부 확인
sum(is.na(z)) 			# NA의 개수 확인
sum(z, na.rm=TRUE) 		# NA를 제외하고 합계를 계산
mean(z, na.rm=TRUE)		# NA를 제외하고 평균을 계산


z1 <- c(1,2,3,NA,5,NA,8) 		# 결측값이 포함된 벡터 z1
z2 <- c(5,8,1,NA,3,NA,7) 		# 결측값이 포함된 벡터 z2
z1[is.na(z1)] <- 0 			# NA를 0으로 치환
z1
z3 <- as.vector(na.omit(z2)) 		# NA를 제거하고 새로운 벡터 생성
z3


# NA를 포함하는 test 데이터 생성
x <- iris
x[1,2]<- NA; x[1,3]<- NA
x[2,3]<- NA; x[3,4]<- NA
head(x)



# apply를 이용한 방법
col_na <- function(y) {
  return(sum(is.na(y)))
}

na_count <-apply(x, 2, FUN=col_na) 
na_count

#colSums 함수 이용
colSums(is.na(x))


rowSums(is.na(x)) 			# 행별 NA의 개수
sum(rowSums(is.na(x))>0) 		# NA가 포함된 행의 개수

sum(is.na(x)) 			# 데이터셋 전체에서 NA 개수





head(x)
x[!complete.cases(x),] 		# NA가 포함된 행들 출력
y <- x[complete.cases(x),] 		# NA가 포함된 행들 제거
head(y) 				# 새로운 데이터셋 y의 내용 확인





head(x)
x[!complete.cases(x),] 		# NA가 포함된 행들 출력
y <- x[complete.cases(x),] 		# NA가 포함된 행들 제거
head(y) 				# 새로운 데이터셋 y의 내용 확인




st <- data.frame(state.x77)
boxplot(st$Income)
boxplot.stats(st$Income)$out


out.val <- boxplot.stats(st$Income)$out 	# 특이값 추출
st$Income[st$Income %in% out.val] <- NA 	# 특이값을 NA로 대체
head(st)
newdata <- st[complete.cases(st),] 		# NA가 포함된 행 제거
head(newdata) 




v1 <- c(1,7,6,8,4,2,3)
order(v1)
v1 <- sort(v1) 			# 오름차순
v1
v2 <- sort(v1, decreasing=T) 		# 내림차순
v2



head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length),] 			# 오름차순으로 정렬
iris[order(iris$Sepal.Length, decreasing=T),] 	# 내림차순으로 정렬
iris.new <- iris[order(iris$Sepal.Length),] 	# 정렬된 데이터를 저장
head(iris.new)
iris[order(iris$Species, -iris$Petal.Length, decreasing=T),] # 정렬 기준이 2개



sp <- split(iris, iris$Species) 		# 품종별로 데이터 분리
sp 				# 분리 결과 확인
summary(sp) 			# 분리 결과 요약
sp$setosa 			# setosa 품종의 데이터 확인



subset(iris, Species == "setosa")
subset(iris, Sepal.Length > 7.5)
subset(iris, Sepal.Length > 5.1 &
         Sepal.Width > 3.9)
subset(iris, Sepal.Length > 7.6,
       select=c(Petal.Length,Petal.Width))



x <- 1:100
y <- sample(x, size=10, replace = FALSE) 	# 비복원추출
y



idx <- sample(1:nrow(iris), size=50,
              replace = FALSE)
iris.50 <- iris[idx,] 			# 50개의 행 추출
dim(iris.50) 			# 행과 열의 개수 확인
head(iris.50)



sample(1:20, size=5)
sample(1:20, size=5)
sample(1:20, size=5)

set.seed(100)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)




combn(1:5,3) 			# 1~5에서 3개를 뽑는 조합

x = c("red","green","blue","black","white")
com <- combn(x,2) 		# x의 원소를 2개씩 뽑는 조합
com

for(i in 1:ncol(com)) { 		# 조합을 출력
  cat(com[,i], "\n")
}





agg <- aggregate(iris[,-5], by=list(iris$Species),
                 FUN=mean)
agg





agg <- aggregate(iris[,-5], by=list(표준편차=iris$Species),
                 FUN=sd)
agg





head(mtcars)
agg <- aggregate(mtcars, by=list(cyl=mtcars$cyl,
                                 vs=mtcars$vs),FUN=max)
agg





x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(name=c("a","b","d"), korean=c(75,60,90))
x
y




z <- merge(x,y, by=c("name"))
z




merge(x,y, all.x=T) 	  # 첫 번째 데이터셋의 행들은 모두 표시되도록
merge(x,y, all.y=T) 	  # 두 번째 데이터셋의 행들은 모두 표시되도록
merge(x,y, all=T) 	  # 두 데이터셋의 모든 행들이 표시되도록






x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(sname=c("a","b","d"), korean=c(75,60,90))
x 			# 병합 기준 열의 이름이 name
y 			# 병합 기준 열의 이름이 sname
merge(x,y, by.x=c("name"), by.y=c("sname"))














