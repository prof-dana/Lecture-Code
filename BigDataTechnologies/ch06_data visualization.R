library(treemap) 			# treemap 패키지 불러오기
data(GNI2014) 			# 데이터 불러오기
head(GNI2014) 			# 데이터 내용보기


treemap(GNI2014,
        index=c("continent","iso3"), 	# 계층구조 설정(대륙-국가)
        vSize="population", 	# 타일의 크기
        vColor="GNI", 		# 타일의 컬러
        type="value", 		# 타일 컬러링 방법
        title="World's GNI") 	# 트리맵 제목 



library(treemap) 			# treemap 패키지 불러오기
st <- data.frame(state.x77) 	# 매트릭스를 데이터프레임으로 변환
st <- data.frame(st, stname=rownames(st)) # 주 이름 열 stname을 추가

treemap(st,
        index=c("stname"), 		# 타일에 주 이름 표기
        vSize="Area", 			# 타일의 크기
        vColor="Income", 			# 타일의 컬러
        type="value", 			# 타일 컬러링 방법
        title="USA states area and income" ) 	# 트리맵의 제목



st <- data.frame(state.x77) 	# 매트릭스를 데이터프레임으로 변환
symbols(st$Illiteracy, st$Murder, 	# 원의 x, y 좌표의 열
        circles=st$Population, 	# 원의 반지름의 열
        inches=0.3, 		# 원의 크기 조절값
        fg="white", 		# 원의 테두리 색
        bg="lightgray", 		# 원의 바탕색
        lwd=1.5, 			# 원의 테두리선 두께
        xlab="rate of Illiteracy",
        ylab="crime(murder) rate",
        main="Illiteracy and Crime")
text(st$Illiteracy, st$Murder, 		# 텍스트가 출력될 x, y 좌표
     rownames(st), 		# 출력할 텍스트
     cex=0.6, 			# 폰트 크기
     col="brown") 		# 폰트 컬러









head(mtcars)
mosaicplot(~gear+vs, data = mtcars, color=TRUE,
           main ="Gear and Vs")







library(ggplot2)
month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain) 		# 그래프를 작성할 대상 데이터
df

ggplot(df, aes(x=month,y=rain)) + 	# 그래프를 그릴 데이터 지정
  geom_bar(stat="identity", 	# 막대의 높이는 y축에 해당하는 열의 값
           width=0.7, 			# 막대의 폭 지정
           fill="steelblue") 			# 막대의 색 지정





ggplot(df, aes(x=month,y=rain)) + 	# 그래프를 그릴 데이터 지정
  geom_bar(stat="identity", 	            # 막대 높이는 y축에 해당하는 열의 값
           width=0.7, 			# 막대의 폭 지정
           fill="steelblue") + 			# 막대의 색 지정
  ggtitle("월별 강수량") + 		# 그래프의 제목 지정
  theme(plot.title = element_text(size=25, face="bold", colour="steelblue")) +
  labs(x="월",y="강수량") + 		# 그래프의 x, y축 레이블 지정
  coord_flip( ) 			# 그래프를 가로 방향으로 출력








library(ggplot2)

ggplot(iris, aes(x=Petal.Length)) + 	# 그래프를 그릴 데이터 지정
  geom_histogram(binwidth=0.5) 	# 히스토그램 작성 







ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species)) +
  geom_histogram(binwidth = 0.5, position="dodge") +
  theme(legend.position="top")



ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width)) +
  geom_point( )





ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width,
                      color=Species)) +
  geom_point(size=3) +
  ggtitle("꽃잎의 길이와 폭") + 	# 그래프의 제목 지정
  theme(plot.title = element_text(size=25, face="bold", colour="steelblue")) 










ggplot(data=iris, aes(y=Petal.Length)) +
  geom_boxplot(fill="yellow") 








ggplot(data=iris, aes(y=Petal.Length, fill=Species)) +
  geom_boxplot( ) 




year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year,cnt) 			# 데이터 준비
head(df)

ggplot(data=df, aes(x=year,y=cnt)) + 		# 선그래프 작성
  geom_line(col="red")







library(Rtsne)
library(ggplot2)
ds <- iris[,-5] 		# 품종 정보 제외

## 중복 데이터 제거
dup <- which(duplicated(ds))
dup 			# 143번째 행 중복
ds <- ds[-dup,]
ds.y <- iris$Species[-dup] 	# 중복을 제외한 품종 정보

## t-SNE 실행
tsne <- Rtsne(ds,dims=2, perplexity=10)

## 축소결과 시각화
df.tsne <- data.frame(tsne$Y)
head(df.tsne)
ggplot(df.tsne, aes(x=X1, y=X2, color=ds.y)) +
  geom_point(size=2) 


