function [outputArg1] = BuildModel(inputArg1,inputArg2,inputArg3)
    %BUILDMODEL Summary of this function goes here
    %   Detailed explanation goes here
    %% Declaring initial data structers and for building model get variables in order to build model 
    % P(word|class)=(word_count_in_class + 1)/(total_words_in_class+total_unique_words_in_all_classes(basically vocabulary of words in the entire training set))
    % ord_count_in_class : sum of(tf-idf_weights of the word for all the documents belonging to that class)
    % //basically replacing the counts with the tfidf weights of the same word calculated for every document within that class.
    % total_words_in_class : sum of (tf-idf weights of all the words belonging to that class)
    %total_unique_words_in_all_classes : as is.
    Stack=java.util.Stack();
    ArrayList=java.util.ArrayList();
    str=[];
    str1=[];
    inputArg2=str2double(inputArg2(:,:));
    total_words_in_class=sum(inputArg1,'all');
    fid = fopen(inputArg3);
    total_unique_words_in_all_classes=size(inputArg2,1);
    tline = fgetl(fid);
    xxx=strsplit(tline,' ');
    %% while reading every line in txt get that sentence and provide probablity of belonging that class
    while ischar(tline)
        %in order to get sentences correctly , first line should not be
        %added in matrix, so we ignored first line in here and all others
        %is added.
        if xxx(1,1) ~= "bu" || xxx(1,1)~="yar?n" || xxx(1,1)~= "cep" || xxx(1,1)~="kigilidan"
            str1=[str1 xxx];
        end

        str=strsplit(tline,' ');
        tline = fgetl(fid);
        i=1;
        %% Find every given txt (spam or sms) probablity and save it into a stack. 
        while i<=size(str,2)
                a=i+size(str1,2);
                word_count_in_class=sum(inputArg1(:,i));
                Probablity=(word_count_in_class + 1)/(total_words_in_class+total_unique_words_in_all_classes);
                Stack.push(Probablity);
                i=i+1;
        end
        % pop the probablities of each word and calculate given txt (spam or sms) probablity
        divide=Stack.size;
        tempprob=1;
        while Stack.size>=1
            tempprob=Stack.pop+tempprob;
        end
        %save it into an arraylist and return it .
        tempprob=tempprob/divide;
        ArrayList.add(tempprob);
        
    end
    fclose(fid);
    outputArg1=ArrayList;
end

