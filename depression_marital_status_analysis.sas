/* SAS Code for Data Preparation and Analysis: Depression and Marital Status (BRFSS 2014) */

/* Step 1: Import Dataset and Initial Setup */
libname mylib xport '/home/u63557237/my_courses/ANA625/data/LLCP2014.XPT';

data sasdataset;
    set mylib.LLCP2014;
run;

data one; 
    set sasdataset; 
run;

proc contents data=one; 
run;

/* Frequency Distribution for Key Variables */
proc freq data=one; 
    tables ADDEPEV2 MARITAL SEX _STATE _AGEG5YR; 
run;

/* Step 2: Data Cleaning and Preparation */
data two; 
    set one; 
run;

proc sql;
    delete from two where ADDEPEV2 in (7, 9); 
quit;

data two; 
    set two;
    if not missing(ADDEPEV2) and not missing(MARITAL); 
run;

data three; 
    set two; 
run;

proc sql;
    delete from three where MARITAL = 9; 
quit;

data four; 
    set three;
run;

proc sql;
    delete from four where _STATE in (66, 72); 
quit;

/* Step 3: Recoding Variables */
proc freq data=four; 
    tables ADDEPEV2 MARITAL SEX _STATE _AGEG5YR; 
run;

data five; 
    set four;
    if ADDEPEV2 = 1 then DEPRESS = 1; 
    else if ADDEPEV2 = 2 THEN DEPRESS = 0; 
run;

data six; 
    set five;
    if MARITAL = 1 then marital1 = 1;
    else marital1 = 0;
run;

data seven; 
    set six;
    if SEX = 1 then SEX1 = 0;
    else if SEX = 2 then SEX1 = 1; 
run;

data eight; 
    set seven; 
    if _STATE in (9, 23, 25, 33, 44, 50, 34, 36, 42) then Region = 0;
    else if _STATE in (17, 18, 26, 39, 55, 19, 20, 27, 29, 31, 38, 46) then Region = 1;
    else if _STATE in (10, 12, 13, 24, 37, 45, 51, 54, 1, 21, 28, 47, 5, 22, 40, 48, 11) then Region = 2;
    else if _STATE in (4, 8, 16, 30, 32, 35, 49, 56, 2, 6, 15, 41, 53) then Region = 3;
run;

proc contents data=eight; 
run;

proc freq data=eight; 
    tables _AGEG5YR; 
run;

proc sql;
    delete from eight where _AGEG5YR = 14; 
quit;

proc freq data=eight; 
    tables EXERANY2; 
run;

proc sql;
    delete from eight where EXERANY2 in (7, 9); 
quit;

proc sql;
    create table ten as 
    select * from eight where not missing(EXERANY2);
quit;

proc freq data=ten; 
    tables EXERANY2; 
run;

data eleven; 
    set ten;
    if EXERANY2 = 2 then EXERCISE = 0;
    else if EXERANY2 = 1 then EXERCISE = 1;
run;

proc freq data=eleven; 
    tables EXERCISE; 
run;

/* Step 4: Age Recoding */
data final; 
    set eleven;
    if _AGEG5YR in (1, 2, 3, 4, 5) then AGE1 = 0;
    else if _AGEG5YR in (6, 7, 8, 9, 10) then AGE1 = 1; 
    else if _AGEG5YR in (11, 12, 13) then AGE1 = 2; 
run;

proc freq data=final; 
    tables marital1; 
run;

proc contents data=final; 
run;

/* Step 5: Frequency of Variables */
proc freq data=final; 
    tables DEPRESS marital1 SEX1 Region AGE1 EXERCISE; 
run;

/* You may add logistic regression steps here if desired */
