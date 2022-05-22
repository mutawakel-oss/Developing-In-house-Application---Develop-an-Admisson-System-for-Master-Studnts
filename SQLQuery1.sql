use registration

DROP TABLE newresult
DROP TABLE newresult1

SELECT [LOCAL ID],[LOCAL ID] student_id,firstname,fathername,grandfathername,familyname,
phone1,phone2,prop_accumulative,AptitudeMarks,knowledge_exam,highsecgpa INTO newresult 
from new_aptitude_exam,st_student  where
new_aptitude_exam.[LOCAL ID] =st_student.student_id AND  examp_year='14271426'


SELECT [LOCAL ID],[LOCAL ID] student_id,firstname,fathername,grandfathername,familyname,
phone1,phone2,'' prop_accumulative,AptitudeMarks,knowledge_exam,highsecgpa INTO newresult1
from new_aptitude_exam  where
new_aptitude_exam.[LOCAL ID] not in (select STUDENT_ID from st_student where  examp_year='14271426')

SELECT * FROM newresult
SELECT * FROM newresult1
SELECT * FROM ST_EXAMINATION,newresult where SEC_ID in('10','11','12','19') and ST_EXAMINATION.examp_year='14271426'
AND newresult.STUDENT_ID=ST_EXAMINATION.STUDENT_ID




SELECT [LOCAL ID],[LOCAL ID] student_id,firstname,fathername,grandfathername,familyname,
phone1,phone2,prop_accumulative,AptitudeMarks,knowledge_exam,highsecgpa 
from new_aptitude_exam,st_student,st_school,st_years,st_center_code,
st_nationality_code,
st_examination,st_section_code,st_mawaddata
where

st_school.center_id=st_center_code.code_id
AND
st_school.examp_year=st_years.examp_year
AND st_years.examp_year='14271426'
AND
st_student.center_id=st_center_code.code_id AND
st_student.examp_year=st_years.examp_year AND
st_student.examp_year=st_school.examp_year AND
st_student.schoolnumd=st_school.schoolnumd

AND st_student.nation=st_nationality_code.code_id
AND st_examination.center_id=st_center_code.code_id
AND st_examination.schoolnumd=st_school.schoolnumd
AND st_student.student_id=st_examination.student_id
AND st_examination.examp_year=st_years.examp_year
AND st_section_code.sec_id=st_examination.sec_id
AND st_section_code.examp_year=st_examination.examp_year
AND st_mawaddata.examp_year=st_years.examp_year
AND st_mawaddata.sec_id=st_examination.sec_id
AND st_mawaddata.sec_id=st_section_code.sec_id
AND st_examination.maddano=st_mawaddata.maddano
AND
new_aptitude_exam.[LOCAL ID] =st_student.student_id AND  st_student.examp_year='14271426'
