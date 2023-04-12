clear all
n = 2; % The number of drug combinations

%Overall measure for single fault network
A = zeros(29,32);

% "i" iterates over faults, and d1, d2, d3, d4, d5 iterate over drugs
for i = 0:28
    for d1 = 0:1
        for d2 = 0:1
            for d3 = 0:1
                for d4 = 0:1
                    for d5 = 0:1
                        m = 16*d1 + 8*d2 + 4*d3 + 2*d4 + d5 + 1;
                        if (d1+d2+d3+d4+d5 <= n) 
                           A(i+1,m) = pancreatic_one_fault(i,d1,d2,d3,d4,d5);
                        end
                    end
                end
            end
        end
    end
end

A = sum(A,1);  % Summing the measures across all faults
A = A(:,any(A,1)); % Removing the zero columns
A = A/max(abs(A(:))); % Normalising the measure 
A = A';



% % Overall measure for two fault network
B = zeros(25,25,32);

% "i" and "j" iterate over faults, and d1, d2, d3, d4, d5 iterate over drugs
for i = 0:24
    for j = 0:24
        for d1 = 0:1
            for d2 = 0:1
                for d3 = 0:1
                    for d4 = 0:1
                        for d5 = 0:1
                            m = 16*d1 + 8*d2 + 4*d3 + 2*d4 + d5 + 1;
                            if (d1+d2+d3+d4+d5 <= n) 
                               B(i+1,j+1,m) = pancreatic_two_faults(i,j,d1,d2,d3,d4,d5);
                            end
                        end
                    end
                end
            end
        end
    end
end

B = sum(sum(B)); % Summing the measures across all faults
B = B(:,any(B,2)); % Removing the zero columns
B = B/max(abs(B(:))); % Normalising the measure 
B = B';



%Overall measure for three fault network
C = zeros(25,25,25,32);

% "i", "j", "k" iterate over faults, and d1, d2, d3, d4, d5 iterate over drugs
for i = 0:24
    for j = 0:24
        for k = 0:24
            for d1 = 0:1
                for d2 = 0:1
                    for d3 = 0:1
                        for d4 = 0:1
                            for d5 = 0:1
                                m = 16*d1 + 8*d2 + 4*d3 + 2*d4 + d5 + 1;
                                if (d1+d2+d3+d4+d5 <= n) 
                                    C(i+1,j+1,k+1,m) = pancreatic_three_faults(i,j,k,d1,d2,d3,d4,d5);
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

C = sum(sum(sum(C))); % Summing the measures across different faults
C = C(:,any(C,2)); % Removing the zero columns
C = C/max(abs(C(:))); % Normalising the measure 
C = C';
% 

% List of no combination of drugs
D1 = {'Untreated';
    'EGCG';
    'Aspirin';
    'Melatonin';
    'Curcumin';
    'Baicelein'};

% List of two drug combinations
D2 = {'Untreated';
    'EGCG';
    'Aspirin';
    'Aspirin + EGCG';
    'Melatonin';
    'Melatonin + EGCG';
    'Melatonin + Aspirin';
    'Curcumin';
    'Curcumin + EGCG';
    'Curcumin + Aspirin';
    'Curcumin + Melatonin';
    'Baicelein';
    'Baicelein + EGCG';
    'Baicelein + Aspirin';
    'Baicelein + Melatonin';
    'Baicelein+ Curcumin'};

% List of three drug combinations
D3 = {'Untreated';
    'EGCG';
    'Aspirin';
    'Aspirin + EGCG';
    'Melatonin';
    'Melatonin + EGCG';
    'Melatonin + Aspirin';
    'Melatonin + Aspirin + EGCG';
    'Curcumin';
    'Curcumin + EGCG';
    'Curcumin+ Aspirin';
    'Curcumin + Aspirin+ EGCG';
    'Curcumin + Melatonin';
    'Curcumin + Melatonin + EGCG';
    'Curcumin + Melatonin + Aspirin';
    'Baicelein';
    'Baicelein + EGCG';
    'Baicelein + Aspirin';
    'Baicelein + Aspirin + EGCG';
    'Baicelein + Melatonin';
    'Baicelein + Melatonin + EGCG';
    'Baicelein + Melatonin + Aspirin';
    'Baicelein + Curcumin';
    'Baicelein + Curcumin + EGCG';
    'Baicelein + Curcumin + Aspirin';
    'Baicelein + Curcumin + Melatonin'};

% % List of four drug combinations
% D4 = {'Untreated';
%     'EGCG';
%     'Aspirin';
%     'Aspirin + EGCG';
%     'Melatonin';
%     'Melatonin + EGCG';
%     'Melatonin  + Aspirin';
%    'Melatonin  + Aspirin + EGCG';
%     'Curcumin';
%     'Curcumin+ EGCG';
%     'Curcumin + Aspirin';
%     'Curcumin+ Aspirin + EGCG';
%     'Curcumin + Melatonin ';
%     'Curcumin+ Melatonin + EGCG';
%     'Curcumin+ Melatonin + Aspirin';
%     'Curcumin+ Melatonin + Aspirin + EGCG';
%     'Baicelein';
%     'Baicelein+ EGCG';
%     'Baicelein + Aspirin';
%     'Baicelein + Aspirin + EGCG';
%     'Baicelein + Melatonin';
%     'Baicelein + Melatonin + EGCG';
%     'Baicelein + Melatonin + Aspirin';
%     'Baicelein+ Melatonin + Aspirin + EGCG';
%     'Baicelein + Curcumin';
%     'Baicelein + Curcumin+ EGCG';
%     'Baicelein+ Curcumin + Aspirin';
%     'Baicelein + Curcumin + Aspirin + EGCG';
%     'Baicelein + Curcumin+ Melatonin';
%     'Baicelein +Curcumin+ Melatonin+ EGCG';
%     'Baicelein + Curcumin + Melatonin + Aspirin'};
% 
% % List of five drug combinations
% D5 = {'Untreated';
%     'EGCG';
%     'Aspirin';
%     'Aspirin + EGCG';
%     'Melatonin';
%     'Melatonin + EGCG';
%     'Melatonin + Aspirin';
%     'Melatonins + Aspirin + EGCG';
%     'Curcumin';
%     'Curcumin + EGCG';
%     'Curcumin + Aspirin';
%     'Curcumin + Aspirin + EGCG';
%     'Curcumin + Melatonin';
%     'Curcumin + Melatonin + EGCG';
%     'Curcumin + Melatonin + Aspirin';
%     'Curcumin + Melatonin + Aspirin + EGCG';
%     'Baicelein';
%     'Baicelein + EGCG';
%     'Baicelein + Aspirin';
%     'Baicelein + Aspirin +EGCG';
%     'Baicelein + Melatonin';
%     'Baicelein + Melatonin + EGCG';
%     'Baicelein + Melatonin + Aspirin';
%     'Baicelein + Melatonin + Aspirin + EGCG';
%     'Baicelein + Curcumin';
%     'Baicelein + Curcumin + EGCG';
%     'Baicelein + Curcumin + Aspirin';
%     'Baicelein + Curcumin + Aspirin + EGCG';
%     'Baicelein + Curcumin + Melatonin';
%     'Baicelein + Curcumin + Melatonin + EGCG';
%     'Baicelein + Curcumin + Melatonin + Aspirin';
%     'Baicelein + Curcumin + Melatonin + Aspirin + EGCG'};


if n==1
   % output_one_fault = [D1,num2cell(A)];
    %output_two_faults = [D1,num2cell(B)];
    %output_three_faults = [D1,num2cell(C)];
elseif n==2
    output_one_fault = [D2,num2cell(A)];
    output_two_faults = [D2,num2cell(B)];
    output_three_faults = [D2,num2cell(C)];
elseif n==3
    %output_one_fault = [D3,num2cell(A)];
    %output_two_faults = [D3,num2cell(B)];
    %output_three_faults = [D3,num2cell(C)];
elseif n==4
    %output_one_fault = [D4,num2cell(A)];
%     output_two_faults = [D4,num2cell(B)];
%   output_three_faults = [D4,num2cell(C)];
elseif n==5
     output_one_fault = [D5,num2cell(A)];
%     output_two_faults = [D5,num2cell(B)];
%    output_three_faults = [D5,num2cell(C)];
end

%display(output_one_fault);
%display(output_two_faults);
%display(output_three_faults);