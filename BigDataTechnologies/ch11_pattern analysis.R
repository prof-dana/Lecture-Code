#JDK설치 다른 버전
install.packages("multilinguer")
library(multilinguer)
multilinguer::install_jdk()


install.packages("rJava")
library(rJava)
.jinit()  # 오류 안 나야 정상

#이전 버전에서 요구했던 부분
install.packages(c("hash", "tau", "Sejong", "RSQLite", "devtools", 
                   "bit", "rex", "lazyeval", "htmlwidgets", "crosstalk", 
                   "promises", "later", "sessioninfo", "xopen", "bit64", 
                   "blob", "DBI", "memoise", "plogr", "covr", "DT", 
                   "rcmdcheck", "rversions"), type = "binary")




install.packages("C:/r_workspace/KoNLP_0.80.2.tar.gz", repos = NULL, type = "sorce")
.libPaths()

library(KoNLP)
useNIADic() #선택하는게 출력되면 “yes” 선택

SimplePos09("KoNLP 설치 정말 어렵네요!")
extractNoun("KoNLP 설치 정말 어렵네요!")


library(RCurl)
library(XML)
library(wordcloud2) 
library(tm)

t = readLines('https://ko.wikipedia.org/wiki/%EB%B9%85_%EB%8D%B0%EC%9D%B4%ED%84%B0')
d = htmlParse(t, asText = TRUE)
clean_doc = xpathSApply(d,"//p", xmlValue)


doc <- Corpus(VectorSource(clean_doc))
doc <- tm_map(doc, removeNumbers) # 숫자 제거
doc <- tm_map(doc, removePunctuation) # 구두점 제거
doc <- tm_map(doc, stripWhitespace) # 불필요한 공백 제거

inspect(doc)


buildDictionary(ext_dic = "woorimalsam")
noun <- sapply(doc, extractNoun, USE.NAMES = FALSE)
noun <- unlist(noun) 		# 리스트->벡터
noun <- noun[nchar(noun) > 1]#한 글자 이상인 단어만 남김
noun[1:50]

wordcount <- table(noun) 		# 단어 빈도수 계산
wordcount <- sort(wordcount, decreasing=T)#내림차순으로 정렬
temp<-wordcount[1:10] # 빈도수 높은 단어 10개 추출
barplot(temp, 			# 빈도수 높은 단어 10개 추출
        names.arg = names(temp), 	# 막대 이름을 단어로 표시
        col ="lightblue", 		# 막대의 색상 지정
        main ="빈도수 높은 단어", ylab = "단어 빈도수")


wordcloud2(wordcount[1:100])







library(arules)          # 아프리오리 알고리즘
library(arulesViz)      # 연관규칙 시각화 도구

# 데이터 불러오기와 관찰
ds <- read.csv("C:/r_workspace/BreadBasket_DMS.csv") # 거래 데이터 읽기
str(ds)
head(ds)
unique(ds$Item)

# 'NONE' item 삭제
ds.new <- subset(ds, Item != 'NONE')
write.csv(ds.new, "C:/r_workspace/BreadBasket_DMS_upd.csv", row.names =F )





library(arules)          # 아프리오리 알고리즘
library(arulesViz)      # 연관규칙 시각화 도구

# 데이터 불러오기와 관찰
ds <- read.csv("https://raw.githubusercontent.com/prof-dana/Lecture-Code/refs/heads/main/BigDataTechnologies/data/BreadBasket_DMS.csv") # 거래 데이터 읽기
str(ds)
head(ds)
unique(ds$Item)

# 'NONE' item 삭제
ds.new <- subset(ds, Item != 'NONE')
write.csv(ds.new, "C:/r_workspace/BreadBasket_DMS_upd.csv", row.names =F )


# 트랜잭션 포맷으로 데이터 읽기
trans <- read.transactions("C:/r_workspace/BreadBasket_DMS_upd.csv",             
                           format="single", header=T, 
                           cols=c(3,4), sep=",", rm.duplicates=T)

trans                           # 트랜잭션 데이터 요약정보
dimnames(trans)[[2]]       # 상품 목록 확인
toLongFormat(trans)       # 거래별 상품 목록
inspect(head(trans, 10))   # 앞부분 10개 트랜잭션 출력





# 상품 판매 빈도: 절대적인 판매 수량
itemFrequencyPlot(trans, topN=10, type="absolute", xlab="상품명", 
                  ylab="절대 판매빈도", main="판매량 많은 상품", col="green")

# 상품 판매 빈도: 지지도가 높은 상품
itemFrequencyPlot(trans, topN=10, type="relative", xlab="상품명", 
                  ylab="상대 판매빈도", main="판매량 많은 상품", col="blue")

# 연관규칙 찾기
rules <- apriori(trans, parameter = list(supp = 0.001, conf = 0.7))
rules

# 앞쪽 10개의 규칙 출력 
options(digits=2) # 평가 척도 값의 자릿수 지정 
inspect(rules[1:10])





# 신뢰도 상위 10개 규칙 출력 
rules.sort <- sort(rules, by='confidence', decreasing = T)
inspect(rules.sort[1:10])

# 산점도 (지지도-향상도) 
plot(rules.sort, measure=c("support", "lift"), shading="confidence")

# Graph plot
plot(rules.sort, method="graph")

# Grouped Matrix Plot
plot(rules.sort, method="grouped")

