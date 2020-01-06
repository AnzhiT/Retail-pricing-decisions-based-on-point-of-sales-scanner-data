/* q1 */
data BasicInfo;
infile '/folders/myfolders/Assignment2/BasicInfo.csv'
firstobs=2 delimiter=',' dsd;
input ID Female Region :$9.;
run;
/* q2 */
proc import out=HistData1
datafile= '/folders/myfolders/Assignment2/HistData1.xlsx'
dbms=xlsx replace 
out =HistData1;
getnames=yes;
run;
proc import out=HistData2
datafile= '/folders/myfolders/Assignment2/HistData2.xlsx'
dbms=xlsx replace 
out =HistData2;
getnames=yes;
run;
DATA HistData; 
SET HistData1 HistData2; 
RUN;
/* q3 */
PROC SORT DATA=BasicInfo ; BY ID ;run;
PROC SORT DATA=HistData ; BY ID ;run;
data Combined;
merge BasicInfo(in=FileA) HistData(in=FileB);by ID;
if FileA=1 & FileB=1;
run;
/* q4 */
data Combined;
set Combined;
IF Region='Northeast'or Region='Midwest' then RegionGroup=1;
IF Region='South'or Region='West' then RegionGroup=2;
run;

PROC FREQ DATA=Combined; 
TABLE RegionGroup;
run;

/*q5  */
data Combined;
set Combined;
if Referral=999 then Referral=.;
if DirectMarketing=999 then DirectMarketing=.;
if Brochure=999 then Brochure=.;
if Other=999 then Other=.;
run; 

data Combined;
set Combined;
if Referral=1 then Acquisition=1;
else if DirectMarketing=1 then Acquisition=2;
else if Brochure=1 then Acquisition=3;
else if Other=1 then Acquisition=4;
else if Acquisition=.;
run;

PROC freq DATA=Combined; 
TABLE Acquisition*Female;  
RUN;

PROC SGPLOT DATA= Combined;
VBAR Acquisition / GROUP=female GROUPDISPLAY=cluster;
run;
/* q6 */
data combined;
set combined;
if YearSince<1000 then YearSince=YearSince+1900;
AcquireTime=mdy(MonthSince, 15, YearSince);
format AcquireTime mmddyy10.;
AcquireTime2=mdy(09,10,2016);
format AcquireTime2 mmddyy10.;
TenureYears=(AcquireTime-AcquireTime2)/365;
TenureYears=round(TenureYears,0.1);
run;
PROC UNIVARIATE DATA=combined;
VAR TenureYears;
RUN;
/* q7 */
data combined;
set combined;
if PastPurchase=-99 then PastPurchase=.;
PROC UNIVARIATE DATA=combined PLOT;
VAR PastPurchase;
RUN;

data combined;
set combined;
LogPurchase=Log(PastPurchase);
PROC UNIVARIATE DATA=combined PLOT;
VAR LogPurchase;
RUN;

PROC CORR DATA=combined;
VAR PastPurchase TenureYears ;
PROC CORR DATA=combined;
VAR LogPurchase TenureYears ;
RUN;

PROC SGPLOT DATA= Combined;
SCATTER X = TenureYears  Y = PastPurchase;
PROC SGPLOT DATA= Combined;
SCATTER X = TenureYears  Y = LogPurchase;
run;
proc reg ;
model LogPurchase=TenureYears;
model PastPurchase=TenureYears;
run;

/*q8  */
data combined;
set combined;
PROC UNIVARIATE DATA=combined;
VAR PastPurchase;
run;

data combined;
set combined;
If PastPurchase<=89.125 then PurchaseLevel=1;
else if 89.125<PastPurchase<=271.13 then PurchaseLevel=2;
else if 271.13<PastPurchase<=1635.98 then PurchaseLevel=3;
else if 1635.98<PastPurchase then PurchaseLevel=4;
RUN;
/* q9 */

DATA newvar2;
SET combined;
if RegionGroup=1 then RegionGroup=1;
if RegionGroup=2 then RegionGroup=0;
RUN;
PROC MEANS DATA=newvar2 ;
CLASS PurchaseLevel;
OUTPUT OUT=newvar
Mean(Female TenureYears Renewal RegionGroup)=
PctFemale MeanYear PctRenewal RegionGroup1
STD(TenureYears)=SDYear
p80(TenureYears)=P80Year;
PROC PRINT DATA=newvar;
RUN;

data combined;
set combined;
PROC SORT DATA=newvar ; BY PurchaseLevel ;run;
PROC SORT DATA=combined ; BY PurchaseLevel ;run;
data Combined;
merge newvar(in=FileA) combined(in=FileB);by PurchaseLevel;
if FileA=1 & FileB=1;
run;





