<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">
        <div class="topbar-divider d-none d-sm-block"></div>
        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                    <?php if (logged_in()) : ?>
                        <?= user()->username; ?>
                    <?php endif; ?>
                    <?php if (!logged_in()) : ?>
                        Guest
                    <?php endif; ?>
                </span>
                <img class="img-profile rounded-circle" src="<?= base_url(); ?>/img/undraw_profile.svg">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <p class="dropdown-item">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    <?php if (in_groups('admin')) : ?>
                        <b>Admin </b>
                    <?php endif; ?>
                    <?php if (in_groups('manajer')) : ?>
                        <b>Owner </b>
                    <?php endif; ?>
                    <?php if (logged_in()) : ?>
                        <?= user()->username; ?>
                    <?php endif; ?>
                    <?php if (!logged_in()) : ?>
                        Guest
                    <?php endif; ?>
                </p>
                <p class="dropdown-item">
                    <i class="fas fa-envelope fa-sm fa-fw mr-2 text-gray-400"></i>
                    <?php if (logged_in()) : ?>
                        <?= user()->email; ?>
                    <?php endif; ?>
                    <?php if (!logged_in()) : ?>
                        Guest
                    <?php endif; ?>
                </p>
                <?php if (logged_in()) : ?>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Logout
                    </a>
                <?php endif; ?>
            </div>
        </li>
    </ul>
</nav>