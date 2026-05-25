mydata <- iris[,1:4] 			# 데이터 준비

fit <- kmeans(x=mydata, centers=3)
fit
fit$cluster 			# 각 데이터에 대한 군집 번호
fit$centers 			# 각 군집의 중심점 좌표

# 차원 축소 후 군집 시각화
library(cluster)
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE,
         labels=2, lines=0)

# 데이터에서 두 번째 군집의 데이터만 추출
subset(mydata, fit$cluster==2)








library(class)

# 훈련용 데이터와 테스트용 데이터 준비
tr.idx <- c(1:25,51:75, 101:125) 	# 훈련용 데이터의 인덱스
ds.tr <- iris[tr.idx, 1:4] 		# 훈련용 데이터셋
ds.ts <- iris[-tr.idx, 1:4] 		# 테스트용 데이터셋
cl.tr <- factor(iris[tr.idx, 5]) 	# 훈련용 데이터셋의 그룹(품종) 정보
cl.ts <- factor(iris[-tr.idx, 5]) 	# 테스트용 데이터셋의 그룹(품종) 정보

pred <- knn(ds.tr, ds.ts, cl.tr, k=3, prob=TRUE)
pred

acc <- mean(pred==cl.ts) 		# 예측 정확도
acc

table(pred,cl.ts) 			# 예측값과 실제값 비교 통계








library(cvTools) 			# cvFolds() 함수 지원

k = 10 				# 10-fold
folds <- cvFolds(nrow(iris), K=k) 	# 폴드 생성

acc <- c() 			# 폴드별 예측 정확도 저장용 벡터
for (i in 1:k) {
  ts.idx <- folds$which == i 		# 테스트용 데이터의 인덱스
  ds.tr <- iris[-ts.idx, 1:4] 		# 훈련용 데이터셋
  ds.ts <- iris[ts.idx, 1:4] 		# 테스트용 데이터셋 
  cl.tr <- factor(iris[-ts.idx, 5]) 		# 훈련용 데이터셋의 그룹(품종) 정보
  cl.ts <- factor(iris[ts.idx, 5]) 	# 테스트용 데이터셋의 그룹(품종) 정보
  
  pred <- knn(ds.tr, ds.ts, cl.tr, k = 5)
  acc[i] <- mean(pred==cl.ts) 		# 예측 정확도
}
acc 				# 폴드별 예측 정확도
mean(acc) 			# 폴드평균 예측 정확도


