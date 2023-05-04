-- Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtugas7]> CREATE PROCEDURE addPelanggan(kode varchar(10), nama varchar(45), jk char(1), tmp_lahir varchar(30), tgl_lahir date, email varchar(45), kartu_id int)
    -> BEGIN
    -> INSERT INTO pelanggan (kode, nama, jk, tmp_lahir, tgl_lahir, email, kartu_id) VALUES (kode, nama, jk, tmp_lahir, tgl_lahir, email, kartu_id);
    -> END$$
Query OK, 0 rows affected (0.017 sec)

MariaDB [dbtugas7]> CALL addPelanggan('C011','Fadia','P','Jember','2000-05-12','fadia@gmail.com',2);
Query OK, 1 row affected (0.007 sec)

-- Buat fungsi showPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtugas7]> CREATE PROCEDURE showPelanggan()
    -> BEGIN
    -> SELECT nama,jk,tmp_lahir,tgl_lahir,email FROM pelanggan;
    -> END$$
Query OK, 0 rows affected (0.004 sec)

MariaDB [dbtugas7]> CALL showPelanggan;
+---------------+------+------------+------------+----------------------+
| nama          | jk   | tmp_lahir  | tgl_lahir  | email                |
+---------------+------+------------+------------+----------------------+
| Agung Sedayu  | L    | Solo       | 2010-01-01 | sedayu@gmail.com     |
| Pandan Wangi  | P    | Yogyakarta | 1950-01-01 | wangi@gmail.com      |
| Sekar Mirah   | P    | Kediri     | 1983-02-20 | mirah@yahoo.com      |
| Swandaru Geni | L    | Kediri     | 1981-01-04 | swandaru@yahoo.com   |
| Pradabashu    | L    | Pati       | 1985-04-02 | prada85@gmail.com    |
| Gayatri Dwi   | P    | Jakarta    | 1987-11-28 | gaya87@gmail.com     |
| Dewi Gyat     | P    | Jakarta    | 1988-12-01 | giyat@gmail.com      |
| Andre Haru    | L    | Surabaya   | 1990-07-15 | andre.haru@gmail.com |
| Ahmad Hasan   | L    | Surabaya   | 1992-10-15 | ahasan@gmail.com     |
| Cassanndra    | P    | Belfast    | 1990-11-20 | casa90@gmail.com     |
| Fadia         | P    | Jember     | 2000-05-12 | fadia@gmail.com      |
+---------------+------+------------+------------+----------------------+
11 rows in set (0.001 sec)

Query OK, 0 rows affected (0.053 sec)

--Buat fungsi inputProduk(), setelah itu panggil fungsinya
MariaDB [dbtugas7]> CREATE PROCEDURE addProduk(kode varchar(10), nama varchar(45), harga_beli double, harga_jual double, stok int, min_stok int, jenis_produk_id int)
    -> BEGIN
    -> INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id);
    -> end$$
Query OK, 0 rows affected (0.004 sec)

MariaDB [dbtugas7]> CALL addProduk('TV03', 'LG 22 inch', 2000000, 3000000, 5, 2, 1);
Query OK, 1 row affected (0.002 sec)

-- Buat fungsi showProduk(), setelah itu panggil fungsinya
MariaDB [dbtugas7]> CREATE PROCEDURE showProduk()
    -> BEGIN
    -> SELECT nama, harga_beli, harga_jual FROM produk;
    -> end$$

MariaDB [dbtugas7]> call showProduk;
+------------------+------------+------------+
| nama             | harga_beli | harga_jual |
+------------------+------------+------------+
| Televisi 21 inch |    3500000 |    5040000 |
| Televisi 40 inch |    5500000 |    7440000 |
| Kulkas 2 pintu   |    3500000 |    4680000 |
| Meja Makan       |     500000 |     600000 |
| Teh Kotak        |       3000 |       3500 |
| PC Desktop HP    |    7000000 |    9600000 |
| Teh Botol        |       2000 |       2500 |
| Notebook Acer    |    8000000 |   10800000 |
| Notebook Lenovo  |    9000000 |   12000000 |
| Laptop HP        |   12000000 |   13000000 |
| LG 22 inch       |    2000000 |    3000000 |
+------------------+------------+------------+
11 rows in set (0.001 sec)

Query OK, 0 rows affected (0.045 sec)

-- Buat fungsi totalPesanan(), setelah itu panggil fungsinya
MariaDB [dbtugas7]> CREATE PROCEDURE totalPesanan()
    -> BEGIN
    -> SELECT SUM(total) as total_pesanan FROM pesanan;
    -> end$$
Query OK, 0 rows affected (0.005 sec)

MariaDB [dbtugas7]> call totalPesanan;
+---------------+
| total_pesanan |
+---------------+
|       9737500 |
+---------------+
1 row in set (0.004 sec)

Query OK, 0 rows affected (0.011 sec)
