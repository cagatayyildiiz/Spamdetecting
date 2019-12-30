function [outputArg1] = CalculateTfIdf(inputArg1)
    filename = inputArg1;
    str = extractFileText(filename);
    textData = split(str,newline);
    documents = tokenizedDocument(textData);
    bag = bagOfWords(documents);
    M = tfidf(bag);
    a=full(M);
    outputArg1=a;
end

