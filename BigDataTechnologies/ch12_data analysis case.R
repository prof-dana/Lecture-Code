ds <- read.csv('https://raw.githubusercontent.com/prof-dana/Lecture-Code/refs/heads/main/BigDataTechnologies/data/housing_price_King_County_extended.csv')

str(ds)
sum(is.na(ds))                        # 결측값 존재 확인

# 집값 분포
hist(ds$price/10000, main='집값 분포',
     xlab='집값(단위:만불)', ylab='주택수')



summary(ds$price/10000)
boxplot(ds$price/10000)


# 가장 비싼주택과 가장 싼 주택
expensive <- ds[ds$price==max(ds$price),]
cheap <- ds[ds$price==min(ds$price),]
expensive
cheap


# 200만 불 이하 집값 분포
price200 <- ds$price/10000
price200 <- price200[price200<=200]
boxplot(price200)
hist(price200, main='주택 가격 분포',
     xlab='주택 가격(단위:만불)', ylab='주택수')



# 불필요한 열 'id', 'date', 'zipcode' 제거
ds.pure <- ds[,-c(1,2, 17)]

MYCOR <- function(ds.group) {                        # MYCOR 함수 정의
  corr <- cor(ds.group[,1], ds.group[,-1])           # 첫 번째 열'price'와 나머지 열들의 상관계수 계산
  odr <- order(corr[1,], decreasing = T)             # 상관계수를 내림차순 정렬하기 위한 순서 생성
  corr.sort <- corr[odr]                             # 정렬 순서대로 상관계수 재배열
  names(corr.sort) <- colnames(corr)[odr]            # 정렬된 상관계수에 변수명 부여
  return(round(corr.sort,3))                         # 소수 셋째 자리까지 반올림 후 반환
} 


# 상관 분석
MYCOR(ds.pure) 






# 건평과 집값의 산점도
plot(ds.pure$sqft_living, ds.pure$price/10000,
     main='건평과 집값', xlab='건평', ylab='집값(만불)')
model <- lm(price/10000~sqft_living, ds.pure)
abline(model, col='red')





# 주택을 가격에 따라 3개 그룹(High, Middle, Low)으로 나눔
summary(ds.pure$price)

ds.pure$group <- cut(ds$price,
                   breaks=3,
                   labels=c("Low","Middle","High"))


# High group
ds.high <- ds.pure[ds.pure$group=='High',-24]
MYCOR(ds.high)

# Middle group
ds.middle <- ds.pure[ds.pure$group=='Middle',-24]
MYCOR(ds.middle)

# Low group
ds.low <- ds.pure[ds.pure$group=='Low',-24]
MYCOR(ds.low)







# 새로운 변수의 발굴 #########################


# 지역별 주택 가격 
ds.agg <- aggregate(ds[,c('price','long','lat')], by=list(area=ds$zipcode), 
                    FUN=mean)
ds.agg[1:5,]

# 주택이 위치한 지역의 평균 집값을 새로운 변수로 생성
ds.pure$area.price <- NA
for(i in 1: nrow(ds)) {
  area <- ds[i,'zipcode']
  idx <- which(ds.agg$area==area)
  ds.pure$area.price[i] <- ds.agg[idx,'price']
}

cor(ds.pure$price, ds.pure$area.price)


ds.final<-subset(
  ds.pure,
  select=c(price,
           sqft_living,
           grade,
           sqft_above,
           sqft_living15,
           bathrooms))

#train 데이터 idx 
#전체 80%
idx <- sample(1:nrow(ds.final), 0.8*nrow(ds.final))

train <-ds.final[idx,]
test <-ds.final[-idx,]

model.base <- lm(price~., data=train)
model.base

#예측값
y.hat <- predict(model.base, test)

#MAE 평가
mean(abs(y.hat - test$price))
