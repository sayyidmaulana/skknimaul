<?php 

?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<table>
	<form action="prosestambah.php" method="POST">
		
		<tr>
			<td>ID Pinjam</td>
			<td><input type="text" name="idp"> </td>
		</tr>
		<tr>
			<td>ID Buku</td>
			<td><input type="text" name="idb"> </td>
		</tr>
		<tr>
			<td>Tanggal</td>
			<td><input type="date" name="tgl"> </td>
		</tr>
		<tr>
			<td>Jumlah</td>
			<td><input type="text" name="jmlh"> </td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" name="tambah" value="Mbah"> </td>
		</tr>
	</form>

</table>
</body>
</html>