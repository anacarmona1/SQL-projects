-- Renaming table to make it easier to analyze
RENAME TABLE `hospital_admission`.`hdhi admission data` TO hospital_data;
-- Exploratory data analysis --
SELECT * FROM hospital_data LIMIT 10;
-- checking total patients 
SELECT COUNT(*) AS total_patients FROM hospital_data;
-- we have a total of 14,620 patients 
-- total number of female patients
SELECT gender, COUNT(*) AS count
FROM hospital_data
GROUP BY gender;
-- 5,366 female patients 
SELECT AVG(age) AS avg_age, MIN(age) as youngest, MAX(age) AS oldest 
FROM hospital_data;
-- youngest patient was 4 and oldest patient 110 avg age was 61
SELECT `TYPE OF ADMISSION-EMERGENCY/OPD`, COUNT(*) AS count 
FROM hospital_data
GROUP BY `TYPE OF ADMISSION-EMERGENCY/OPD`
ORDER BY count DESC;
-- E = Emergency department, had more admissions with 9,997 O = OPD planned care had 4,623 which means admissions rates are higher for emergency events 
-- than it is for planned internventions. 
SELECT AVG (`DURATION OF STAY`) AS avg_stay, MIN(`DURATION OF STAY`) AS shortest, MAX(`DURATION OF STAY`) AS longest 
FROM hospital_data;
-- The average duration of stay was 6.5 days, with 1 day being the shortest stay and 98 days being the longest 
SELECT COUNT(*) AS icu_patients
FROM hospital_data
WHERE `duration of intensive unit stay` >0;
-- 12,112 patients stayed in the ICU 
SELECT outcome, COUNT(*) AS count
FROM hospital_data
GROUP BY outcome;
-- Most patients where regularly discharge (13,224) 764 patients died, and 632 patients where discharged against medical advice. 
 SELECT 
 SUM(DM) AS diabetes, 
 SUM(HTN) AS hypertension, 
 SUM(CAD) AS cad, 
 SUM(CKD) AS ckd
 FROM hospital_data; 
 -- 7180 patients where hospitalized because of hypertension, 9,997 because of Coronary Artery Disease, 4,750 Diabetes, and 1,374 CKD 
SELECT AVG(HB) AS avg_hb, AVG(TLC) AS avg_tlc, AVG(PLATELETS) AS avg_platelets 
FROM hospital_data; 
-- avg hb was 12.2, avg total leukocyte count 11.3, and the average platelets count was 239. showing regular averages for these lab counts.
SELECT `month year`, COUNT(*) AS count
FROM hospital_data 
GROUP BY `month year` 
ORDER BY `month year`; 
-- The year and month with highest admission rate was Jan 2019 with 801 admissions. 
 