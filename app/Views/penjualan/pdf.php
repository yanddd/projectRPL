<div class="container">
    <div class="row">
        <div class="col">
            <h1 class="mt-2">Data Penjualan</h1>
            <table class="table" border="1" cellpadding="10" cellspacing="0">>
                <thead>
                    <tr>
                        <th scope="col">No.</th>
                        <th scope="col">Nama Pembeli</th>
                        <th scope="col">Alamat Pembeli</th>
                        <th scope="col">Nama Sepatu</th>
                        <th scope="col">Jumlah Sepatu</th>
                        <th scope="col">Harga Sepatu</th>
                        <th scope="col">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1; ?>
                    <?php foreach ($penjualan as $p) : ?>
                        <tr>
                            <th scope="row"><?= $i++; ?></th>
                            <td><?= $p['nama_pembeli']; ?></td>
                            <td><?= $p['alamat_pembeli']; ?></td>
                            <td><?= $p['nama_sepatu']; ?></td>
                            <td><?= $p['jumlah_sepatu']; ?></td>
                            <td><?= number_to_currency($p['harga_sepatu'], 'IDR');  ?></td>
                            <td><?= number_to_currency($p['total'], 'IDR');  ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>