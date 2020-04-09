select
       R.RQ_ID,
       RW.W_TIME,
       coalesce(R.RQ_PLAN_DATE, current_date) TIME_TO,
       RT.RT_NAME,
       coalesce(TPL.RQ_CONTENT, '') TPL_CONTENT,
       coalesce(R.RQ_CONTENT, '') R_CONTENT,
       -- Coalesce(r.Add_Info,'') Add_Info,
       coalesce(R.RQ_NOTICE, '') NOTICE,
       R.RQ_TIME_FROM,
       R.RQ_TIME_TO,
       R.ADDED_ON,
       R.REQ_RESULT ,
       s.Street_Name STREET,
       H.HOUSE_NO,
       s.Street_Name||' '||H.HOUSE_NO||' '||coalesce(R.FLAT_NO, '') ADRESS ,
       coalesce(R.FLAT_NO, '') FLAT_NO,
       coalesce(r.Rq_Customer, -1) CUSTOMER_ID,
       COALESCE('( ' || SA.SUBAREA_NAME || ' )' ,'') SUBAR,
       r.tag,
       x.account,
       x.fio,
       x.serv_name_arr,
       x.balance,
       x.tarif_month,

       x.ip,
       x.port,
       x.phone
from REQUEST R
         inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)
         inner join STREET S on (S.STREET_ID = H.STREET_ID)
         inner join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_ID)

         inner join REQUEST_EXECUTORS RQE on (RQE.RQ_ID = R.RQ_ID)
         inner join WORKER W on (RQE.EXEC_ID = W.WORKER_ID and RQE.RQ_ID = R.RQ_ID and W.IBNAME = ?)
         LEFT JOIN request_works RW on(RW.rq_id=R.rq_id)
         left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = R.RQTL_ID)
         left outer join subarea sa on (sa.Subarea_Id = h.Subarea_Id)
         LEFT JOIN get_request_the_customer(R.RQ_ID) x on (1=1)
where R.rq_plan_date<=dateadd(1 day to current_date) and (R.REQ_RESULT in (1,3)) and ((SENDED=0)or(SENDED is NULL))
