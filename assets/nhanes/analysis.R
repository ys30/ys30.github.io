# NHANES 2017–March 2020: physical activity, waist circumference, and hypertension
# Reproducible analysis workflow

library(tidyverse)
library(haven)
library(DiagrammeR)
library(broom)
library(lmtest)
library(car)
library(pROC)
library(ResourceSelection)

urls <- c(
  demo="https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_DEMO.XPT",
  bmx ="https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_BMX.XPT",
  bpx ="https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_BPXO.XPT",
  paq ="https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_PAQ.XPT",
  bpq ="https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_BPQ.XPT",
  smq ="https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_SMQ.XPT",
  alq ="https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_ALQ.XPT"
)
read_nhanes <- function(url){tf<-tempfile(fileext=".xpt");download.file(url,tf,mode="wb",quiet=TRUE);read_xpt(tf)}
d <- lapply(urls, read_nhanes); demo<-d$demo;bmx<-d$bmx;bpx<-d$bpx;paq<-d$paq;bpq<-d$bpq;smq<-d$smq;alq<-d$alq

paq_mvpa <- paq %>% transmute(
  SEQN,
  work_vig_days=if_else(PAQ605==1,as.numeric(PAQ610),0), work_vig_min=if_else(PAQ605==1,as.numeric(PAD615),0),
  work_mod_days=if_else(PAQ620==1,as.numeric(PAQ625),0), work_mod_min=if_else(PAQ620==1,as.numeric(PAD630),0),
  trans_days=if_else(PAQ635==1,as.numeric(PAQ640),0), trans_min=if_else(PAQ635==1,as.numeric(PAD645),0),
  rec_vig_days=if_else(PAQ650==1,as.numeric(PAQ655),0), rec_vig_min=if_else(PAQ650==1,as.numeric(PAD660),0),
  rec_mod_days=if_else(PAQ665==1,as.numeric(PAQ670),0), rec_mod_min=if_else(PAQ665==1,as.numeric(PAD675),0),
  sedentary_min_day=as.numeric(PAD680)
) %>% mutate(
  vig_min_week=work_vig_days*work_vig_min+rec_vig_days*rec_vig_min,
  mod_min_week=work_mod_days*work_mod_min+rec_mod_days*rec_mod_min+trans_days*trans_min,
  MVPA_me=mod_min_week+2*vig_min_week
) %>% select(SEQN,MVPA_me,sedentary_min_day)

bp <- bpx %>% transmute(SEQN,
  SBP=rowMeans(select(.,BPXOSY1,BPXOSY2,BPXOSY3),na.rm=TRUE),
  DBP=rowMeans(select(.,BPXODI1,BPXODI2,BPXODI3),na.rm=TRUE)
) %>% mutate(HTN=if_else(!is.na(SBP)&!is.na(DBP),if_else(SBP>=130|DBP>=80,1,0),NA_real_))

waist <- bmx %>% transmute(SEQN,waist=as.numeric(BMXWAIST))
smoking <- smq %>% transmute(SEQN,smoker=case_when(SMQ020==1~1,SMQ020==2~0,TRUE~NA_real_))
alcohol <- alq %>% transmute(SEQN,alcohol=case_when(ALQ111==1~1,ALQ111==2~0,TRUE~NA_real_))
meds <- bpq %>% transmute(SEQN,bp_meds=case_when(BPQ050A==1~1,BPQ050A==2~0,TRUE~NA_real_))
demog <- demo %>% filter(between(RIDAGEYR,18,62)) %>% transmute(
  SEQN,age=as.numeric(RIDAGEYR),sex=factor(RIAGENDR,levels=c(1,2),labels=c("Male","Female")),
  race=factor(RIDRETH3),pir=as.numeric(INDFMPIR))

df <- demog %>% left_join(paq_mvpa,by="SEQN") %>% left_join(waist,by="SEQN") %>%
  left_join(bp,by="SEQN") %>% left_join(smoking,by="SEQN") %>% left_join(alcohol,by="SEQN") %>%
  left_join(meds,by="SEQN") %>% drop_na(MVPA_me,waist,SBP,DBP,HTN,sedentary_min_day,smoker,alcohol,age,sex,race,pir,bp_meds) %>%
  filter(bp_meds==0)

model_M <- lm(waist ~ MVPA_me + sedentary_min_day + smoker + alcohol + age + sex + race + pir,data=df)
model_H1 <- glm(HTN ~ MVPA_me + sedentary_min_day + smoker + alcohol + age + sex + race + pir,data=df,family=binomial())
model_H2 <- glm(HTN ~ MVPA_me + waist + sedentary_min_day + smoker + alcohol + age + sex + race + pir,data=df,family=binomial())

summary(model_M); summary(model_H1); summary(model_H2)
AIC(model_H1,model_H2)
anova(model_H1,model_H2,test="Chisq")

sample_summary <- df %>% summarise(
  n=n(), age_mean=mean(age), age_sd=sd(age), MVPA_mean=mean(MVPA_me), MVPA_sd=sd(MVPA_me),
  waist_mean=mean(waist), waist_sd=sd(waist), SBP_mean=mean(SBP), SBP_sd=sd(SBP), HTN_prevalence=mean(HTN))
print(sample_summary)
