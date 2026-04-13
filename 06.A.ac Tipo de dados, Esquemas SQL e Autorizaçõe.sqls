-- 1 questão

CREATE USER User_A with PASSWORD = 'SenhaSegura1';
CREATE USER User_B with PASSWORD = 'SenhaSegura2';
CREATE USER User_C with PASSWORD = 'SenhaSegura3';
CREATE USER User_D with PASSWORD = 'SenhaSegura4';


-- 2 questão

GRANT SELECT, INSERT, UPDATE, DELETE 
ON ALL TABLES IN SCHEMA university 
TO User_A WITH GRANT OPTION;

REVOKE SELECT, INSERT, UPDATE, DELETE 
ON university.CLASSROOM 
FROM User_A;


-- 3 questão

SELECT 
    princ.name,
    princ.type_desc,
    perm.permission_name,
    perm.state_desc,
    perm.class_desc,
    object_name(perm.major_id) AS object_name
FROM 
    sys.database_principals princ
LEFT JOIN 
    sys.database_permissions perm 
    ON perm.grantee_principal_id = princ.principal_id
WHERE 
    princ.name = 'User_A';
