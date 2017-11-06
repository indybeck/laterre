aws rds create-db-instance 
    --db-instance-identifier pgdbinstance \
    --allocated-storage 20 \ 
    --db-instance-class db.t2.small \
    --engine postgres \
    --master-username masterawsuser \
    --master-user-password masteruserpassword
