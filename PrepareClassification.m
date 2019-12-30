function[value]=PrepareClassification(File,dictionary,dictionary1)
allwords="";

allwords= extractFileText(File);


%% remove punctuations, numbers etc
allwords=erasePunctuation(allwords);
allwords=lower(allwords);
allwords=regexprep(allwords,'\d+(?:_(?=\d))?','');
allwords=regexprep(allwords,'  ',' ');
allwords=regexprep(allwords,'   ',' ');

%% Find word counts and Write write corrected test a txt 
fid = fopen(dictionary1, 'wt');
fprintf(fid, '%s\n', allwords);
fclose(fid);

allwords=regexprep(allwords,'[\n\r]+',' ');
words = strsplit(allwords, ' ' )';
[words_u, ~, idxU] = unique(words);

counts = accumarray( idxU, 1 );

%% write word counts to a txt
counts_s=counts(idxU);
words_us=words_u(idxU);
a=[words_us,num2cell(counts_s)];
a=unique(a,'rows');
value=a;
f = fopen( dictionary, 'w' );  
fclose(f);
writematrix(a,dictionary,'Delimiter','tab');
end