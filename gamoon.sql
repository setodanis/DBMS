-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:4306
-- Generation Time: Jun 13, 2022 at 07:44 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamoon`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori_produk`
--

CREATE TABLE IF NOT EXISTS `kategori_produk` (
  `id_kategori` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembeliinfo`
--

CREATE TABLE IF NOT EXISTS `pembeliinfo` (
  `id_pembeli` int(11) NOT NULL,
  `Nama_pembeli` varchar(30) DEFAULT NULL,
  `tanggal_lahir` varchar(8) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembeliinfo`
--

INSERT INTO `pembeliinfo` (`id_pembeli`, `Nama_pembeli`, `tanggal_lahir`) VALUES
(1, 'bambbang', '2000-12-');

-- --------------------------------------------------------

--
-- Table structure for table `pembelilogin`
--

CREATE TABLE IF NOT EXISTS `pembelilogin` (
  `id_pembeli_2` int(11) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `NO_HP` varchar(12) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelilogin`
--

INSERT INTO `pembelilogin` (`id_pembeli_2`, `Email`, `NO_HP`, `Username`, `password`) VALUES
(1, 'test@mail.com', '088888888888', 'test1', 'pass1');

-- --------------------------------------------------------

--
-- Table structure for table `penjualinfo`
--

CREATE TABLE IF NOT EXISTS `penjualinfo` (
  `id_penjual` int(11) NOT NULL,
  `nama_seller` varchar(30) DEFAULT NULL,
  `Tanggal_lahir_seller` varchar(8) NOT NULL,
  `alamat_seller` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjuallogin`
--

CREATE TABLE IF NOT EXISTS `penjuallogin` (
  `id_penjual_2` int(11) NOT NULL,
  `Username_seller` varchar(30) NOT NULL,
  `Password_seller` varchar(20) NOT NULL,
  `NO_hp_seller` varchar(12) DEFAULT NULL,
  `email_seller` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE IF NOT EXISTS `pesanan` (
  `pembeli_id` int(11) NOT NULL,
  `produk id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `waktu_transaksi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product desc`
--

CREATE TABLE IF NOT EXISTS `product desc` (
  `ID_produk` int(11) NOT NULL DEFAULT '0',
  `Kategori_produk` int(11) NOT NULL,
  `Nama_produk` varchar(30) NOT NULL,
  `Deskripsi_produk` int(200) NOT NULL,
  `review_produk` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_id`
--

CREATE TABLE IF NOT EXISTS `product_id` (
  `ID_produk` int(11) NOT NULL DEFAULT '0',
  `ID_seller` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pembeliinfo`
--
ALTER TABLE `pembeliinfo`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indexes for table `pembelilogin`
--
ALTER TABLE `pembelilogin`
  ADD PRIMARY KEY (`id_pembeli_2`);

--
-- Indexes for table `penjualinfo`
--
ALTER TABLE `penjualinfo`
  ADD PRIMARY KEY (`id_penjual`);

--
-- Indexes for table `penjuallogin`
--
ALTER TABLE `penjuallogin`
  ADD PRIMARY KEY (`id_penjual_2`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `product desc`
--
ALTER TABLE `product desc`
  ADD PRIMARY KEY (`ID_produk`);

--
-- Indexes for table `product_id`
--
ALTER TABLE `product_id`
  ADD PRIMARY KEY (`ID_produk`,`ID_seller`),
  ADD KEY `ID_seller` (`ID_seller`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembeliinfo`
--
ALTER TABLE `pembeliinfo`
  MODIFY `id_pembeli` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `penjualinfo`
--
ALTER TABLE `penjualinfo`
  MODIFY `id_penjual` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembeliinfo`
--
ALTER TABLE `pembeliinfo`
  ADD CONSTRAINT `test` FOREIGN KEY (`id_pembeli`) REFERENCES `pembelilogin` (`id_pembeli_2`);

--
-- Constraints for table `penjualinfo`
--
ALTER TABLE `penjualinfo`
  ADD CONSTRAINT `id penjuals` FOREIGN KEY (`id_penjual`) REFERENCES `penjuallogin` (`id_penjual_2`);

--
-- Constraints for table `product desc`
--
ALTER TABLE `product desc`
  ADD CONSTRAINT `product desc_ibfk_1` FOREIGN KEY (`ID_produk`) REFERENCES `product_id` (`ID_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_id`
--
ALTER TABLE `product_id`
  ADD CONSTRAINT `product_id_ibfk_1` FOREIGN KEY (`ID_seller`) REFERENCES `penjualinfo` (`id_penjual`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
