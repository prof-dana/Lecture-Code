z <- matrix(1:20, nrow=4, ncol=5)# 데이터의 개수와 행*열 개수가 달라도 가능
z # 매트릭스 z의 내용을 출력


z2 <- matrix(1:20, nrow=4, ncol=5, byrow=T)
z2 				# 매트릭스 z2의 내용을 출력




x <- 1:4 			      # 벡터 x 생성 
y <- 5:8 			      # 벡터 y 생성 
z <- matrix(1:20, nrow=4, ncol=5) # 매트릭스 z 생성 

m1 <- cbind(x,y)# x와 y를 열 방향으로 결합하여 매트릭스 생성 
m1# 매트릭스 m1의 내용을 출력 
m2 <- rbind(x,y)# x와 y를 행 방향으로 결합하여 매트릭스 생성 
m2# 매트릭스 m2의 내용을 출력 
m3 <- rbind(m2,x)# 매트릭스 m2와 벡터 x를 행 방향으로 결합 
m3# 매트릭스 m3의 내용을 출력 
m4 <- cbind(z,x)# 매트릭스 z와 벡터 x를 열 방향으로 결합 
m4# 매트릭스 m4의 내용을 출력


z <- matrix(1:20, nrow=4, ncol=5)  	# 매트릭스 z 생성 
z 				# 매트릭스 z의 내용 출력 

z[2,3] 				# 2행 3열에 있는 값 
z[1,4] 				# 1행 4열에 있는 값 
z[2,] 				# 2행에 있는 모든 값 
z[,4] 				# 4열에 있는 모든 값 


z <- matrix(1:20, nrow=4, ncol=5) 	# 매트릭스 z 생성 
z 				# 매트릭스 z의 내용 출력 

z[2,1:3] 				# 2행의 값 중 1~3열에 있는 값 
z[1,c(1,2,4)] 			# 1행의 값 중 1, 2, 4열에 있는 값 
z[1:2,] 				# 1, 2행에 있는 모든 값 
z[,c(1,4)] 				# 1, 4열에 있는 모든 값 


score <- matrix(c(90,85,69,78, 
                  85,96,49,95, 
                  90,80,70,60), 
                nrow=4, ncol=3) 
score 
rownames(score) <- c('John','Tom','Mark','Jane') 
colnames(score) <- c('English','Math','Science') 
score


score['John','Math'] 			# John의 수학 성적 
score['Tom',c('Math','Science')] 	# Tom의 수학, 과학 성적 
score['Mark',] 			# Mark의 모든 과목 성적 
score[,'English'] 			# 모든 학생의 영어 성적 
rownames(score) 			# score의 행의 이름 
colnames(score) 			# score의 열의 이름 
colnames(score)[2] 			# score의 열의 이름 중 두 번째 값 



city <- c("Seoul","Tokyo","Washington") 	# 문자로 이루어진 벡터 
rank <- c(1,3,2) 				# 숫자로 이루어진 벡터 
city.info <- data.frame(city, rank) 		# 데이터프레임 생성 
city.info 					# city.info의 내용 출력





iris[,c(1:2)] 			# 1, 2열의 모든 데이터 
iris[,c(1,3,5)] 			# 1, 3, 5열의 모든 데이터 
iris[,c("Sepal.Length","Species")] 	# 1, 5열의 모든 데이터 
iris[1:5,] 				# 1~5행의 모든 데이터 
iris[1:5,c(1,3)] 			# 1~5행의 데이터 중 1, 3열의 데이터

iris["Species"]
iris[5]
iris$Species






class(iris) 			# iris 데이터셋의 자료구조 확인 
class(state.x77) 		# state.x77 데이터셋의 자료구조 확인 
is.matrix(iris) 		# 데이터셋이 매트릭스인지를 확인하는 함수 
is.data.frame(iris) 		# 데이터셋이 데이터프레임인지를 확인하는 함수 is.matrix(state.x77) 
is.data.frame(state.x77)



class(iris) 			# iris 데이터셋의 자료구조 확인 
class(state.x77) 		# state.x77 데이터셋의 자료구조 확인 
is.matrix(iris) 		# 데이터셋이 매트릭스인지를 확인하는 함수 
is.data.frame(iris) 		# 데이터셋이 데이터프레임인지를 확인하는 함수 is.matrix(state.x77) 
is.data.frame(state.x77)





# 매트릭스를 데이터프레임으로 변환 
st <- data.frame(state.x77) 
head(st) 
class(st) 

# 데이터프레임을 매트릭스로 변환 
iris.m <- as.matrix(iris[,1:4]) 
head(iris.m) 
class(iris.m)




dim(iris) 		# 행과 열의 개수 출력 
nrow(iris) 		# 행의 개수 출력 
ncol(iris) 		# 열의 개수 출력 
colnames(iris) 	# 열 이름 출력, names( )와 결과 동일 
head(iris) 		# 데이터셋의 앞부분 일부 출력 
tail(iris) 		# 데이터셋의 뒷부분 일부 출력


str(iris) 				# 데이터셋 요약 정보 보기 
iris[,5] 				# 품종 데이터 보기 
unique(iris[,5]) 			# 품종의 종류 보기(중복 제거) 
table(iris[,"Species"]) 		# 품종의 종류별 행의 개수 세기 


colSums(iris[,-5]) 		# 열별 합계 
colMeans(iris[,-5]) 		# 열별 평균 
rowSums(iris[,-5]) 		# 행별 합계 
rowMeans(iris[,-5]) 		# 행별 평균



z <- matrix(1:20, nrow=4, ncol=5)
z
t(z) 			# 행과열 방향 전환



IR.1 <- subset(iris, Species=="setosa") 
IR.1 
IR.2 <- subset(iris, Sepal.Length>5.0 & 
                 Sepal.Width>4.0) 
IR.2 
IR.2[, c(2,4)] 		# 2, 4열의 값만 추출




a <- matrix(1:20,4,5) 
b <- matrix(21:40,4,5) 
a 
b 

2*a 		# 매트릭스 a에 저장된 값들에 2를 곱하기
b-5 
2*a + 3*b 

a+b 
b-a 
b/a 
a*b 

a <- a*3 
b <- b-5


path <- "C:/r_workspace/data/airquality.csv"
air <- read.csv(path, header=T)#로컬에서 파일 읽기
air <- read.csv("https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/refs/heads/master/csv/datasets/airquality.csv", header=T)#외부에서  .csv 파일 읽기 
head(air)
