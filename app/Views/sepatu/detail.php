<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>
<div class="container">
    <div class="row">
        <h2 class="my-3">Detail Sepatu</h2>
        <div class="col-6 dt">
            <?php if (session()->getFlashdata('pesan')) : ?>
                <div class="alert alert-success alert" role="alert">
                    <?= session()->getFlashdata('pesan'); ?>
                </div>
            <?php endif; ?>
            <?php
            echo form_open('sepatu/add');
            echo form_hidden('id', $sepatu['id']);
            echo form_hidden('price', $sepatu['harga_sepatu']);
            echo form_hidden('name', $sepatu['nama_sepatu']);
            echo form_hidden('jenis_sepatu', $sepatu['jenis_sepatu']);
            echo form_hidden('slug', $sepatu['slug']);
            echo form_hidden('sampul', $sepatu['sampul']);
            ?>
            <form>
                <div class="row mb-3 sd">
                    <img src="/img/<?= $sepatu['sampul']; ?>" class="img-fluid">
                </div>
                <div class="row mb-3">
                    <label for="nama_sepatu" class="col-sm-3 col-form-label">Nama Sepatu</label>
                    <div class="col-sm-8">
                        <h5 class="card-text">: <?= $sepatu['nama_sepatu']; ?></h5>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="jenis_sepatu" class="col-sm-3 col-form-label">Jenis Sepatu</label>
                    <div class="col-sm-8">
                        <h5 class="card-text">: <?= $sepatu['jenis_sepatu']; ?></h5>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="harga_sepatu" class="col-sm-3 col-form-label">Harga Sepatu</label>
                    <div class="col-sm-8">
                        <h5 class="card-text">: <?= number_to_currency($sepatu['harga_sepatu'], 'IDR');  ?></h5>
                    </div>
                </div>
                <div class="tombolD">
                    <?php if (in_groups('admin')) : ?>
                        <a href="/sepatu/edit/<?= $sepatu['slug']; ?>" class="btn btn-warning">Edit</a>
                    <?php endif; ?>
                    <?php if (in_groups('user')) : ?>
                        <a href="/sepatu/beli/<?= $sepatu['slug']; ?>" class="btn btn-primary"><i class="fab fa-shopify"></i> Beli</a>
                        <button type="submit" class="btn btn-warning"><i class="fas fa-shopping-cart"></i></button>
                    <?php endif; ?>
                </div>
                <div class="back">
                    <a href="/sepatu">
                        <h1 class="fas fa-backspace"></h1>
                    </a>
                </div>
            </form>
            <?php echo form_close(); ?>
        </div>
    </div>
</div>
<?= $this->endSection(); ?>