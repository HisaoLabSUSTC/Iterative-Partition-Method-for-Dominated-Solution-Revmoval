% problems = ["NSGAIII_WFG1_M5", "NSGAIII_WFG1_M10","NSGAIII_WFG2_M5", "NSGAIII_WFG2_M10", "NSGAIII_WFG3_M5",...
%          "NSGAIII_WFG3_M10","NSGAIII_WFG4_M5", "NSGAIII_WFG4_M10", "NSGAIII_WFG5_M5", "NSGAIII_WFG5_M10", "NSGAIII_WFG6_M5", "NSGAIII_WFG6_M10",...
%          "NSGAIII_WFG7_M5","NSGAIII_WFG7_M10","NSGAIII_WFG8_M5","NSGAIII_WFG8_M10","NSGAIII_WFG9_M5","NSGAIII_WFG9_M10",...
%          "NSGAIII_WFG1_M3","NSGAIII_WFG2_M3","NSGAIII_WFG3_M3","NSGAIII_WFG4_M3","NSGAIII_WFG5_M3","NSGAIII_WFG6_M3",...
%     "NSGAIII_WFG7_M3","NSGAIII_WFG8_M3","NSGAIII_WFG9_M3", "NSGAIII_DTLZ1_M3", "NSGAIII_DTLZ2_M3", "NSGAIII_DTLZ3_M3",...
%     "NSGAIII_DTLZ4_M3","NSGAIII_DTLZ1_M10", "NSGAIII_DTLZ1_M5","NSGAIII_DTLZ2_M5","NSGAIII_DTLZ2_M10","NSGAIII_DTLZ3_M5","NSGAIII_DTLZ3_M10",...
%     "NSGAIII_DTLZ4_M5","NSGAIII_DTLZ4_M10","RE31", "RE32","RE33","RE34","RE35","RE36","RE37","RE41","RE42", "RE61","RE91"];
problems = ["RE31"];
for i=1:length(problems)
    problems(i)
    P = load(sprintf("CandidateSet/%s.mat",problems(i))).candidate;
    st = tic;
    % Use T-ENS to obtain the first nondomination front (i.e., remove dominated solutions)
    [FrontNo,~, compareCnt]=NDSort(P,1);
    index = 1:size(P,1);
    index = index(FrontNo==1);
    time = toc(st);
    save(sprintf("Results/Baseline/%s.mat",problems(i)),"index","time","compareCnt");
end