<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion side" id="accordionSidebar">
    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
        <div class="sidebar-brand-icon logo">
            <img src="/img/logo.png" alt="">
        </div>
        <div class="sidebar-brand-text mx-3">Adyawid Shop</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider">
    <li class="nav-item">
        <a class="nav-link" href="/">
            <i class="fas fa-home"></i>
            <span>Home</span></a>
    </li>
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-cog"></i>
            <span>Components</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="/pages/about">About Us</a>
                <a class="collapse-item" href="/pages/contact">Contact Us</a>
            </div>
        </div>
    </li>
    <!-- Nav Item - Pages Collapse Menu -->
    <?php if (in_groups('admin')) : ?>
        <li class="nav-item">
            <a class="nav-link" href="/sepatu">
                <i class="fas fa-shoe-prints"></i>
                <span>Daftar Sepatu</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/penjualan">
                <i class="fas fa-database"></i>
                <span>Data Penjualan</span></a>
        </li>
    <?php endif; ?>
    <?php if (in_groups('manajer')) : ?>
        <li class="nav-item">
            <a class="nav-link" href="/sepatu">
                <i class="fas fa-shoe-prints"></i>
                <span>Daftar Sepatu</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/penjualan">
                <i class="fas fa-database"></i>
                <span>Data Penjualan</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/laporan/index">
                <i class="fas fa-list-alt"></i>
                <span>Daftar Laporan</span></a>
        </li>
    <?php endif; ?>
    <?php if (in_groups('user')) : ?>
        <li class="nav-item">
            <a class="nav-link" href="/sepatu">
                <i class="fab fa-shopify"></i>
                <span>Belanja</span></a>
        </li>
        <?php if (in_groups('user')) : ?>
            <?php $keranjang = $cart->contents();
            $jumlah_keranjang = 0;
            foreach ($keranjang as $k) {
                $jumlah_keranjang = $jumlah_keranjang + $k['qty'];
            }
            ?>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-shopping-cart"><sup class="badge badge-danger"><?= $jumlah_keranjang ?></sup></i>
                    <span>Keranjang Belanja</span>
                </a>
                <?php if (empty($keranjang)) { ?>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <p class="collapse-item">Keranjang Belanja Kosong</p>
                        </div>
                    </div>
                <?php } else { ?>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white collapse-inner rounded">
                            <?php foreach ($keranjang as $k) { ?>
                                <a class="collapse-item" href="/sepatu/beliKeranjang/<?= $k['id']; ?>">
                                    <p><?= $k['name']; ?><sup class="badge badge-primary"><?= $k['qty']; ?></sup></p>
                                </a>
                                <hr>
                            <?php } ?>

                        </div>
                    </div>
                <?php } ?>
            </li>
        <?php endif; ?>
    <?php endif; ?>
    <?php if (!logged_in()) : ?>
        <li class="nav-item">
            <a class="nav-link" href="/sepatu">
                <i class="fab fa-shopify"></i>
                <span>Belanja</span></a>
        </li>
    <?php endif; ?>
    <!-- Divider -->
    <hr class="sidebar-divider">

    <?php if (!logged_in()) : ?>
        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="/login">
                <i class="fas fa-sign-in-alt"></i>
                <span>Login</span></a>
        </li>
        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">
    <?php endif; ?>
    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>
</ul>