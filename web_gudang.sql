-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2021 at 03:36 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_gudang`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_keluar`
--

CREATE TABLE `tb_barang_keluar` (
  `id` int(10) NOT NULL,
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal_masuk` varchar(20) NOT NULL,
  `tanggal_keluar` varchar(20) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang_keluar`
--

INSERT INTO `tb_barang_keluar` (`id`, `id_transaksi`, `tanggal_masuk`, `tanggal_keluar`, `lokasi`, `kode_barang`, `nama_barang`, `satuan`, `jumlah`) VALUES
(1, 'WG-202113067948', '02/07/2021', '08/08/2021', 'NTB', '8888166995215', 'Sari Roti', 'Dus', '50'),
(2, 'WG-202113067948', '02/07/2021', '08/08/2021', 'NTB', '8888166995215', 'Minyak Goreng Bimoli', 'Dus', '6'),
(3, 'WG-202113549728', '04/07/2021', '09/09/2021', 'Banten', '1923081008002', 'Air Mineral', 'Dus', '3'),
(4, 'WG-202174896520', '04/07/2021', '09/09/2021', 'Yogyakarta', '60201311121008264', 'Mie Sedaap Goreng', 'Dus', '3'),
(5, 'WG-202127134650', '05/07/2021', '10/10/2021', 'Jakarta', '29312390203', 'Air Mineral', 'Dus', '17'),
(6, 'WG-202110974628', '15/08/2021', '10/10/2021', 'Lampung', '1923081008002', 'Susu Indomilk', 'Dus', '50'),
(7, 'WG-202181267543', '20/08/2021', '10/10/2021', 'Yogyakarta', '97897952889', 'Minyak Goreng Bimoli', 'Dus', '1'),
(8, 'WG-202132570869', '24/08/2021', '15/10/2021', 'Bali', '1923081008002', 'Sari Roti', 'Dus', '10'),
(9, 'WG-202193850472', '24/08/2021', '18/10/2021', 'Bali', '1923081008002', 'Teh Sariwangi', 'Pcs', '11'),
(10, 'WG-202181267543', '25/08/2021', '25/10/2021', 'Yogyakarta', '97897952889', 'Mie Sedaap Goreng', 'Dus', '10'),
(11, 'WG-202127134650', '15/09/2021', '28/10/2021', 'Jakarta', '29312390203', 'Susu Kedelai', 'Dus', '3'),
(12, 'WG-202174896520', '20/09/2021', '02/11/2021', 'Yogyakarta', '60201311121008264', 'Wafer Nabati Keju', 'Dus', '3'),
(13, 'WG-202127134650', '04/10/2021', '02/11/2021', 'Jakarta', '29312390203', 'Susu Indomilk', 'Dus', '1'),
(14, 'WG-202127134650', '06/10/20121', '02/11/2021', 'Jakarta', '29312390203', 'Susu Dancow', 'Dus', '1'),
(15, 'WG-202185472106', '08/10/2021', '05/11/2021', 'Riau', '8996001600146', 'Teh Pucuk', 'Dus', '50'),
(16, 'WG-202171602934', '11/10/2021', '07/11/2021', 'Papua', '312212331222', 'Kopi Hitam', 'Dus', '10'),
(17, 'WG-202142905817', '17/10/2021', '10/11/2021', 'Jawa Barat', '1709650909750', 'Sari Roti', 'Dus', '50');

--
-- Triggers `tb_barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `TG_BARANG_KELUAR` AFTER INSERT ON `tb_barang_keluar` FOR EACH ROW BEGIN
 UPDATE tb_barang_masuk SET jumlah=jumlah-NEW.jumlah
 WHERE kode_barang=NEW.kode_barang;
 DELETE FROM tb_barang_masuk WHERE jumlah = 0;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_masuk`
--

CREATE TABLE `tb_barang_masuk` (
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang_masuk`
--

INSERT INTO `tb_barang_masuk` (`id_transaksi`, `tanggal`, `lokasi`, `kode_barang`, `nama_barang`, `satuan`, `jumlah`) VALUES
('WG-202142905817', '10/11/2021', 'Jawa Barat', '1709650909750', 'Wafer Nabati Coklat', 'Dus', '200'),
('WG-202171602934', '09/11/2021', 'Sumatera Utara', '312212331222', 'Top Coffe', 'Dus', '250');

-- --------------------------------------------------------

--
-- Table structure for table `tb_satuan`
--

CREATE TABLE `tb_satuan` (
  `id_satuan` int(11) NOT NULL,
  `kode_satuan` varchar(100) NOT NULL,
  `nama_satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_satuan`
--

INSERT INTO `tb_satuan` (`id_satuan`, `kode_satuan`, `nama_satuan`) VALUES
(1, 'Dus', 'Dus'),
(2, 'Pcs', 'Pcs'),
(5, 'Pack', 'Pack');

-- --------------------------------------------------------

--
-- Table structure for table `tb_upload_gambar_user`
--

CREATE TABLE `tb_upload_gambar_user` (
  `id` int(11) NOT NULL,
  `username_user` varchar(100) NOT NULL,
  `nama_file` varchar(220) NOT NULL,
  `ukuran_file` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_upload_gambar_user`
--

INSERT INTO `tb_upload_gambar_user` (`id`, `username_user`, `nama_file`, `ukuran_file`) VALUES
(1, 'zahidin', 'nopic5.png', '6.33'),
(2, 'test', 'nopic4.png', '6.33'),
(3, 'coba', 'logo_unsada1.jpg', '16.69'),
(4, 'admin', 'nopic2.png', '6.33');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(12) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '0',
  `last_login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `last_login`) VALUES
(11, 'diva', 'diva@ymail.com', '$2y$10$4L0pjaaMG/QasGsZb0Cja.gkITymA5goi7aCKNimnpxrOovue.Mqu', 1, '14-11-2021 3:36'),
(12, 'rendy', 'rendy@gmail.com', '$2y$10$4L0pjaaMG/QasGsZb0Cja.gkITymA5goi7aCKNimnpxrOovue.Mqu', 0, '02-10-2021 12:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang_keluar`
--
ALTER TABLE `tb_barang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_barang_masuk`
--
ALTER TABLE `tb_barang_masuk`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_satuan`
--
ALTER TABLE `tb_satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `tb_upload_gambar_user`
--
ALTER TABLE `tb_upload_gambar_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang_keluar`
--
ALTER TABLE `tb_barang_keluar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_satuan`
--
ALTER TABLE `tb_satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_upload_gambar_user`
--
ALTER TABLE `tb_upload_gambar_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
