function output = pancreatic_one_fault(fault1, x1, x2, x3, x4, x5)
    % Inputs
    EGFR = 0; ECAD = 0; TNFalpha= 0; PTEN = 1; KEAP1=0; CUL3=0;RBX1=0; NOTCH=0;WNT=0;DNAdamage=0;
    % Drugs
    EGCG = x1; Aspirin= x2; Melatonin = x3; Curcumin = x4; Baicelein= x5;
    
    
    if (fault1 == 1)
        FZD=1;
    else
        FZD=WNT;
    end
    
    if (fault1 == 2)
        DVL = 1;
    else
        DVL=FZD;
    end
    
    if (fault1 == 3)
        GSK3 = 1;
    else
        GSK3=~DVL;
    end
    if (fault1 == 4)
        alpha = 1;
    else
        alpha = ECAD & ~EGCG;
    end
    
    if (fault1 == 5)
        beta = 1;
    else
        beta = (~GSK3 & (~EGCG & ~Aspirin)) | alpha;
    end
    
    
    if (fault1 == 6)
        TCF = 1;
    else
        TCF = beta;
    end
    
    
    
   
        
    if (fault1 == 7)
        IKbalph = 1;
    else
        IKbalph = TNFalpha & ~Curcumin &~EGCG;
    end
    
    if (fault1 == 8)
        NFkB = 1;
    else
        NFkB= IKbalph %&(~Baicelein & ~Curcumin & ~EGCG);
    end
    
    if (fault1 == 10)
        NrF2 = 1;
    else
        NrF2= KEAP1 | CUL3 | RBX1;
    end
    
    if (fault1 == 9)
        ARE = 1;
    else
        ARE = NrF2;
    end
    
    if (fault1 == 11)
        NICD = 1;
    else
        NICD=NOTCH & (~Baicelein);
    end  

    if (fault1==30)
        HES=1
    else
        HES=NICD & ( ~Melatonin & ~EGCG)
    end
    if (fault1 == 12)
        GrBb2= 1;
    else
        GrBb2 = EGFR & (~EGCG)
    end 
    
    if (fault1 == 13)
        Sos = 1;
    else
        Sos = GrBb2;
    end 
    if (fault1 == 14)
        KRas= 1;
    else
        KRas = Sos ;
    end 
    
    if (fault1 == 15)
        Raf = 1; 
    else
        Raf=KRas & ( (~Aspirin & ~Melatonin) )
    end 
    
    if (fault1 == 16)
        MEK = 1;
    else
        MEK=Raf
    end
    
    if (fault1 == 17)
        ERK=1
    else
        ERK=MEK 
    end
    if (fault1 == 18)
        ELK=1
    else
        ELK=ERK & ~Curcumin
    end
    
    if (fault1 == 19)
        PI3K=1
    else
        PI3K= EGFR & ~PTEN & EGCG
    end
    if (fault1 == 20)
        AKT=1
    else
        AKT=PI3K 
    end
    
    if (fault1 == 21)
        mTOR=1
    else
        mTOR=AKT & (~Melatonin & ~Baicelein)
    end
    
    if (fault1 == 22)
        HIFalpha= 1;
    else
        HIFalpha = mTOR ;
    end
    if (fault1==23)
        MDM2=0
    else
        MDM2=AKT
    end
    if (fault1 == 24)
        ATM= 1;
    else
        ATM=DNAdamage;
    end
    if (fault1 == 25)
        ATR= 1;
    else
        ATR=DNAdamage;
    end
    if (fault1 == 26)
        ch1= 1;
    else
        ch1=ATM;
    end
    if (fault1 == 27)
        ch2= 1;
    else
        ch2=ATR;
    end
    
    if (fault1 == 28)
        p53= 1;
    else
        p53=(MDM2 & ~EGCG) | ch1 | ch2;
    end
    
    if (fault1 == 29)
       p21=1; 
    else
       p21=p53
    end
    
    
    CCND1 = (TCF | ARE | (HES & ~Baicelein) | ELK | (HIFalpha & ~EGCG) | p21 | (NFkB & ~Curcumin & ~Baicelein & ~EGCG))
    BCL2 = NFkB | HIFalpha
    cMyc=(TCF | HIFalpha) 
    MMP9=NFkB | ELK
    NQO1=ARE
    cFos=ELK
    CDK=ELK | p21 | HIFalpha
    
    output1 = [CCND1, BCL2, cMyc, MMP9,NQO1,CDK,cFos];
    output2 = [0,0,0,0,0,0,0]; % Ideal Output
    
    
    % Check the difference in outputs
    a=0; b=0; c=0; d=0;
    for i = 1:7
        if output1(i) == 1 && output2(i) == 1
            a=a+1; 
        elseif output1(i) == 0 && output2(i) == 1
            b=b+1; 
        elseif output1(i) == 1 && output2(i) == 0
            c=c+1; 
        elseif output1(i) == 0 && output2(i) == 0
            d=d+1; 
        end
    end
    output = ((b+c)^2)/((a+b+c+d)^2);
end
