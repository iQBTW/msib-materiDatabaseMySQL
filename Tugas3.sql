--Soal 3.1
--1.Tampilkan produk yang asset nya diatas 20jt
MariaDB [dbpos]> SELECT * FROM produk WHERE harga_produk > 2000000;
Empty set (0.005 sec)

--2.Tampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbpos]> SELECT SUM(stok-min_stok) as selisih from produk;
+---------+
| selisih |
+---------+
|     158 |
+---------+
1 row in set (0.003 sec)

--3.Tampilkan total asset produk secara keseluruhan
MariaDB [dbpos]> SELECT sum(stok) as total_asset from produk;
+-------------+
| total_asset |
+-------------+
|         165 |
+-------------+
1 row in set (0.001 sec)

--4.Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbpos]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 and 2004;
+----+------+----------------+------+-------------+-----------+------------+---------------------+----------+
| id | kode | nama_pelanggan | jk   | alamat      | tmp_lahir | tgl_lahir  | email               | kartu_id |
+----+------+----------------+------+-------------+-----------+------------+---------------------+----------+
|  1 | 5055 | Rizqy          | L    | Jl.inijalan | Tabanan   | 2000-12-21 | estrizqy@gmail.com  |        1 |
|  2 | 5056 | Sandi          | L    | Jl.inijalan | Tabanan   | 1999-02-08 | iniemail1@gmail.com |        2 |
|  3 | 5057 | Budi           | L    | Jl.inijalan | Malang    | 2003-08-12 | iniemail2@gmail.com |        3 |
+----+------+----------------+------+-------------+-----------+------------+---------------------+----------+
3 rows in set (0.006 sec)

--5.Tampilkan data pelanggan yang lahirnya tahun 1998
MariaDB [dbpos]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
Empty set (0.001 sec)

--6.Tampilkan data pelanggan yang berulang tahun bulan agustus
MariaDB [dbpos]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
+----+------+----------------+------+-------------+-----------+------------+---------------------+----------+
| id | kode | nama_pelanggan | jk   | alamat      | tmp_lahir | tgl_lahir  | email               | kartu_id |
+----+------+----------------+------+-------------+-----------+------------+---------------------+----------+
|  3 | 5057 | Budi           | L    | Jl.inijalan | Malang    | 2003-08-12 | iniemail2@gmail.com |        3 |
+----+------+----------------+------+-------------+-----------+------------+---------------------+----------+
1 row in set (0.002 sec)

--7.Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
MariaDB [dbpos]> SELECT nama_pelanggan,tmp_lahir,tgl_lahir,(YEAR(NOW())-YEAR(tgl_lahir)) AS umur from pelanggan;
+----------------+-----------+------------+------+
| nama_pelanggan | tmp_lahir | tgl_lahir  | umur |
+----------------+-----------+------------+------+
| Rizqy          | Tabanan   | 2000-12-21 |   23 |
| Sandi          | Tabanan   | 1999-02-08 |   24 |
| Budi           | Malang    | 2003-08-12 |   20 |
+----------------+-----------+------------+------+
3 rows in set (0.002 sec)

--Soal 3.2
--1.	Berapa jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbpos]> SELECT COUNT(*) AS jumlah FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
+--------+
| jumlah |
+--------+
|      0 |
+--------+
1 row in set (0.001 sec)

--2.    Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbpos]> SELECT COUNT(*) AS jumlah FROM pelanggan WHERE tmp_lahir LIKE '%Jakarta%';
+--------+
| jumlah |
+--------+
|      0 |
+--------+
1 row in set (0.002 sec)

--3.	Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [dbpos]> SELECT COUNT(stok) AS jumlah FROM produk where harga_produk < 10000;
+--------+
| jumlah |
+--------+
|      2 |
+--------+
1 row in set (0.001 sec)

--4.	Ada berapa produk yang mempunyai kode awal K
MariaDB [dbpos]> SELECT COUNT(*) as jumlah_kode_K FROM produk WHERE kode_produk LIKE '%K%';
+---------------+
| jumlah_kode_K |
+---------------+
|             0 |
+---------------+
1 row in set (0.001 sec)

--5.	Berapa harga jual rata-rata produk yang diatas 1jt
MariaDB [dbpos]> SELECT AVG(harga_produk) as harga_rata_diatas_1jt FROM produk WHERE harga_produk < 1000000;
+-----------------------+
| harga_rata_diatas_1jt |
+-----------------------+
|     70333.33333333333 |
+-----------------------+
1 row in set (0.004 sec)

--6.	Tampilkan jumlah stok yang paling besar
MariaDB [dbpos]> SELECT MAX(stok) as stok_paling_banyak FROM produk;
+--------------------+
| stok_paling_banyak |
+--------------------+
|                 50 |
+--------------------+
1 row in set (0.001 sec)

--7.	Ada berapa produk yang stoknya kurang dari minimal stok
MariaDB [dbpos]> SELECT COUNT(*) as jumlah_stok_kurang_dari_minstok FROM produk WHERE stok < min_stok;
+---------------------------------+
| jumlah_stok_kurang_dari_minstok |
+---------------------------------+
|                               0 |
+---------------------------------+
1 row in set (0.001 sec)

--8.	Berapa total asset dari keseluruhan produk