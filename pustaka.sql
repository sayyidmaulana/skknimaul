-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 27, 2019 at 03:50 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pustaka`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tambahdata` (`idp` INT(3), `nama_buku` VARCHAR(25))  BEGIN
    INSERT INTO penerbit VALUES (idp, nama_buku);
    
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilbuku` ()  BEGIN
		SELECT nama_buku, stok, penerbit
        FROM penerbit, buku
        WHERE buku.id_penerbit=penerbit.id_penerbit
        AND penerbit='Locomelia';
       END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `totalbuku` (`idp` INT(3)) RETURNS INT(11) RETURN (SELECT SUM(stok)
        FROM buku
        WHERE id_penerbit=idp)$$

CREATE DEFINER=`root`@`localhost` FUNCTION `totalbukudua` (`idepe` INT(3)) RETURNS INT(11) NO SQL
BEGIN
DECLARE total INT;
SELECT SUM(stok)
        FROM buku
        WHERE id_penerbit=idepe INTO total;
        RETURN total;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(3) NOT NULL,
  `id_penerbit` int(3) NOT NULL,
  `nama_buku` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_penerbit`, `nama_buku`, `stok`) VALUES
(1, 1, 'menyongsong cahaya', 20),
(2, 2, 'dan bila nanti', -107),
(3, 4, 'lalalayeyeye', -139),
(4, 2, 'dan biarkan', 27),
(5, 1, 'Localhost for dummies', 34);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` int(3) NOT NULL,
  `id_buku` int(3) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_pinjam`, `id_buku`, `tgl_pinjam`, `jumlah`) VALUES
(1, 3, '2019-06-26', 15),
(2, 2, '2019-06-26', 5),
(3, 2, '2019-06-26', 1),
(5, 2, '0000-00-00', 70),
(6, 3, '0000-00-00', 68),
(7, 3, '0000-00-00', 77),
(8, 2, '0000-00-00', 66);

--
-- Triggers `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `kurangstok` AFTER INSERT ON `peminjaman` FOR EACH ROW BEGIN
        	UPDATE buku
            SET stok=stok-new.jumlah
            WHERE id_buku=new.id_buku;
        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(3) NOT NULL,
  `penerbit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `penerbit`) VALUES
(1, 'Locomelia'),
(2, 'Andi Offset'),
(4, 'menarilah'),
(10, 'Lalablablabla');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD UNIQUE KEY `id_buku` (`id_buku`,`id_penerbit`),
  ADD KEY `id_penerbit` (`id_penerbit`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit` (`id_penerbit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
