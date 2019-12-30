%% Preparing the data's for classification and calculating tf-idf's and word counts
MatrixTrainLegitimate=PrepareClassification("train_legitimate.txt","Features_train_legitimate.txt" ...
    ,"CorrectedTrainLegitimate.txt");
MatrixTrainSpam=PrepareClassification("train_spam.txt","Features_train_spam.txt" ...
    ,"CorrectedTrainSpam.txt");
MatrixTestLegitimate=PrepareClassification("test_legitimate.txt", ...
    "Features_test_legitimate.txt","CorrectedTestLegitimate.txt");
MatrixTestSpam=PrepareClassification("test_spam.txt","Features_test_spam.txt", ...
    "CorrectedTestSpam.txt");
%% Prepare Train Data 



TfIdfLeg1=CalculateTfIdf("CorrectedTrainLegitimate.txt"); %Calculate tfidf's
Calc1=TfIdfLeg1; 
TfIdfLeg1=max(TfIdfLeg1)';
TfIdfLeg1(size(TfIdfLeg1,1),:)=[];
TftIDsandCountsforTrainLegitimate=[MatrixTrainLegitimate TfIdfLeg1];    %% a matrix for both word counts and tf-idf's


%%
TfIDLeg2=CalculateTfIdf("CorrectedTrainSpam.txt");%Calculate tfidf's
Calc2=TfIDLeg2;
TfIDLeg2=max(TfIDLeg2)';
TftIDsandCountsforTrainSpam=[MatrixTrainSpam TfIDLeg2]; % a matrix for both word counts and tf-idf's


%% Building Model and test 

prob=BuildModel(Calc1,TftIDsandCountsforTrainLegitimate,"CorrectedTestLegitimate.txt");
prob2=BuildModel(Calc2,TftIDsandCountsforTrainSpam,"CorrectedTestLegitimate.txt");
prob3=BuildModel(Calc1,TftIDsandCountsforTrainLegitimate,"CorrectedTestSpam.txt");
prob4=BuildModel(Calc2,TftIDsandCountsforTrainSpam,"CorrectedTestSpam.txt");

%% Find Error Rates with tested Data 
ErrorRateForLegitimate=CalculateError(prob,prob2);
ErrorRateForSpam=CalculateError(prob3,prob4);
%% Finding Confusion Matrix 
ConfusionMatrix=[ErrorRateForLegitimate(1,2),ErrorRateForLegitimate(1,3);ErrorRateForSpam(1,3),ErrorRateForSpam(1,2)];
%% For individual testing 
probablity=testindividual(Calc1,TftIDsandCountsforTrainLegitimate,"Is Bankasi Bonosu 13-14-15 Nisan 2011 tarihlerinde halka arz ediliyor. Ayrintili bilgi:isbank.com.tr");
probablity2=testindividual(Calc2,TftIDsandCountsforTrainSpam,"Is Bankasi Bonosu 13-14-15 Nisan 2011 tarihlerinde halka arz ediliyor. Ayrintili bilgi:isbank.com.tr");
if probablity2<probablity
    disp("sms");
else
    disp("spam");
end