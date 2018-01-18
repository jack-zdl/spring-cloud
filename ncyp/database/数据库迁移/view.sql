create  or replace view tsys_user_roles as 

select distinct  r.ROLE_CODE,r.ROLE_NAME,r.CREATOR,r.REMARK,r.PARENT_ID,r.ROLE_PATH, ru.right_flag, u.user_id from tsys_role_user ru ,tsys_user u,tsys_role r where ru.role_code=r.role_code and ru.user_code=u.user_id 
union 
select distinct  r.ROLE_CODE,r.ROLE_NAME,r.CREATOR,r.REMARK,r.PARENT_ID,r.ROLE_PATH, '1' right_flag ,pu.user_id from tsys_role r, tsys_position pos,tsys_pos_user pu
where r.role_code=pos.role_code and pu.position_code=pos.position_code 
union 
select distinct  r.ROLE_CODE,r.ROLE_NAME,r.CREATOR,r.REMARK,r.PARENT_ID,r.ROLE_PATH, '2' right_flag ,pu.user_id from tsys_role r, tsys_position pos,tsys_pos_user pu 
where r.role_code=pos.role_code and pu.position_code=pos.position_code ;


create or replace view tsys_user_rights as

select distinct ur.trans_code,ur.sub_trans_code,ur.right_flag ,ur.user_id
from tsys_user_right ur
union
select distinct rr.trans_code,rr.sub_trans_code,rr.right_flag,urs.user_id
from tsys_role_right rr ,tsys_user_roles urs
where rr.role_code=urs.role_code
and rr.right_flag=urs.right_flag;