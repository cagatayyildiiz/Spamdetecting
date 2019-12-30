# Spamdetecting
Spam deteting with matlab .
F Score = 0.8048 ,
Accuracy = 0.7574,
The equation is used to build model is Naïve Bayes with Laplacian smoothing.
P(w|c)=count(w,c)+1/(count(c)+|V|+1) : 
count(w,c) which Count words for all documents in given class is replaced with sum of tf-idf weights for a given word for all documents in given data .
Provided data includes two .txt files which includes 430 legitimate and 420 spam sms’s. 
No stemming is applied to data ; so if accuracy is wanted to higher , you can use some stemming steps or some preprocessing steps.
