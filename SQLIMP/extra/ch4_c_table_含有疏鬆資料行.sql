--疏鬆資料行為已最佳化儲存位置來保存 Null 值的一般資料行。疏鬆資料行會減少 Null 值的空間需求，
--但要付出擷取非 Null 值的更多成本負擔。當空間至少節省了百分之 20 到 40 時，請考慮使用疏鬆資料行。
--疏鬆資料行和資料行集是使用 CREATE TABLE 或 ALTER TABLE 陳述式所定義。

--若欄位有大量 NULL時 可以設為疏鬆 ,可節省空間, 但相對的, 或儲存非NULL時 會花更多時間擷取非 Null 值

--建立具有疏鬆資料行和資料行集的資料表
--下列範例會示範如何建立一份含有疏鬆資料行的資料表，以及一份含有兩個疏鬆資料行與資料行集的資料表。
此範例會使用基本語法。如需更複雜的範例，請參閱＜使用疏鬆資料行＞和＜使用資料行集＞。

--若要建立一份含有疏鬆資料行的資料表，請執行下列程式碼。



CREATE TABLE T1
(c1 int         PRIMARY KEY,
 C2 varchar(50) SPARSE NULL 
) ;



--若要建立一份含有兩個疏鬆資料行與名為 CSet 之資料行集的資料表，請執行下列程式碼

CREATE TABLE T1
(c1 int         PRIMARY KEY,
 C2 varchar(50) SPARSE NULL,
 C3 int         SPARSE NULL,
 CSet           XML COLUMN_SET FOR ALL_SPARSE_COLUMNS ) ;