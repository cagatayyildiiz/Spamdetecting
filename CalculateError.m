function [outputArg1] = CalculateError(inputArg1,inputArg2)
    %CALCULATEERROR Summary of this function goes here
    %   Detailed explanation goes here
    %% inputs are arraylist's of spam mails belonging a spam class or vice versa. Calculate error and success .
    success=0;
    error=0;
    i=0;
    while i<inputArg1.size()
        if inputArg1.get(i)>inputArg2.get(i)
        success=success+1;
        else
        error=error+1;
        end
        i=i+1;
    end
    A=[success,error];
    
    outputArg1=[success/(success+error) A];
    
end

