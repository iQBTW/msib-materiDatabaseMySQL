CREATE TRIGGER set_status_pembayaran BEFORE INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    ->     DECLARE total DOUBLE;
    ->     SELECT SUM(qty * harga) INTO total FROM pesanan_items WHERE pesanan_id = NEW.pesanan_id;
    ->     IF NEW.jumlah >= total THEN
    ->         SET NEW.status_pembayaran = 'lunas';
    ->     END IF;
    -> END$$
Query OK, 0 rows affected (0.005 sec)

INSERT INTO pembayaran (nokuitansi,tanggal,jumlah,ke,pesanan_id,status_pembayaran) VALUES
    -> ('KI001','2023-03-10',11000,1,11,'belum lunas');
    -> $$
Query OK, 1 row affected (0.004 sec)

MariaDB [dbpos]> select * from pembayaran;
+----+------------+------------+--------+------+------------+-------------------+
| id | nokuitansi | tanggal    | jumlah | ke   | pesanan_id | status_pembayaran |
+----+------------+------------+--------+------+------------+-------------------+
|  1 | KI001      | 2023-03-10 |  11000 |    1 |         11 | lunas             |
+----+------------+------------+--------+------+------------+-------------------+
1 row in set (0.000 sec)