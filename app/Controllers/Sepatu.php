<?php

namespace App\Controllers;

use App\Models\SepatuModel;
use App\Models\PenjualanModel;

class Sepatu extends BaseController
{
    protected $sepatuModel;
    public function __construct()
    {
        $this->sepatuModel = new SepatuModel();
        $this->penjualanModel = new PenjualanModel();
    }

    public function index()
    {
        $currentPage = $this->request->getVar('page_sepatu') ? $this->request->getVar('page_sepatu') : 1;

        $keyword = $this->request->getVar('keyword');
        if ($keyword) {
            $sepatu = $this->sepatuModel->search($keyword);
        } else {
            $sepatu = $this->sepatuModel;
        }
        $data = [
            'title' => 'Daftar Sepatu',
            'sepatu' => $sepatu->paginate(6, 'sepatu'),
            'pager' => $this->sepatuModel->pager,
            'currentPage' => $currentPage,
            'cart' => \Config\Services::cart()
        ];

        return view('sepatu/index', $data);
    }

    public function detail($slug)
    {

        $data = [
            'title' => 'Detail Sepatu',
            'sepatu' => $this->sepatuModel->getSepatu($slug),
            'cart' => \Config\Services::cart()
        ];

        if (empty($data['sepatu'])) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException('sepatu ' . $slug . ' tidak ditemukan.');
        }

        return view('sepatu/detail', $data);
    }

    public function create()
    {
        $data = [
            'title' => 'Form Tambah Data Sepatu',
            'validation' => \Config\Services::validation()
        ];

        return view('sepatu/create', $data);
    }

    public function save()
    {

        // validasi input
        if (!$this->validate([
            'nama_sepatu' => [
                'rules' => 'required|is_unique[sepatu.nama_sepatu]',
                'errors' => [
                    'required' => '{field} harus di isi',
                    'is_unique' => '{field} sudah terdaftar'
                ]
            ],
            'sampul' => [
                'rules' => 'max_size[sampul,1024]|is_image[sampul]|mime_in[sampul,image/jpg,image/jpeg,image/png]',
                'errors' => [
                    'max_size' => 'Ukuran gambar {field} terlalu besar',
                    'is_image' => 'Yang anda pilih bukan gambar',
                    'mime_in' => 'Yang anda pilih bukan gambar'
                ]
            ]
        ])) {
            return redirect()->to('/sepatu/create')->withInput();
        }

        // ambil gambar
        $fileSampul = $this->request->getFile('sampul');
        // apakah tidak ada gambar yang di upload
        if ($fileSampul->getError() == 4) {
            $namaSampul = 'default.jpg';
        } else {
            // generate nama sampul random
            $namaSampul = $fileSampul->getRandomName();
            // pindahkan file ke folder img
            $fileSampul->move('img', $namaSampul);
        }

        $slug = url_title($this->request->getVar('nama_sepatu'), '-', true);
        $this->sepatuModel->save([
            'nama_sepatu' => $this->request->getVar('nama_sepatu'),
            'slug' => $slug,
            'jenis_sepatu' => $this->request->getVar('jenis_sepatu'),
            'harga_sepatu' => $this->request->getVar('harga_sepatu'),
            'sampul' => $namaSampul
        ]);

        session()->setFlashdata('pesan', 'Data berhasil ditambahkan!.');

        return redirect()->to('/sepatu');
    }

    public function delete($id)
    {
        // cari gambar berdasarkan id
        $sepatu = $this->sepatuModel->find($id);

        // cek jika file gambarnya default
        if ($sepatu['sampul'] != 'default.jpg') {
            // hapus gambar
            unlink('img/' . $sepatu['sampul']);
        }

        $this->sepatuModel->delete($id);
        session()->setFlashdata('pesan', 'Data berhasil dihapus!');

        return redirect()->to('/sepatu');
    }

    public function edit($slug)
    {
        $data = [
            'title' => 'Form Ubah Data Sepatu',
            'validation' => \Config\Services::validation(),
            'sepatu' => $this->sepatuModel->getSepatu($slug)
        ];

        return view('sepatu/edit', $data);
    }

    public function update($id)
    {
        $sepatuLama = $this->sepatuModel->getSepatu($this->request->getVar('slug'));
        if ($sepatuLama['nama_sepatu'] == $this->request->getVar('nama_sepatu')) {
            $rule_nama_sepatu = 'required';
        } else {
            $rule_nama_sepatu = 'required|is_unique[sepatu.nama_sepatu]';
        }
        if (!$this->validate([
            'nama_sepatu' => [
                'rules' => $rule_nama_sepatu,
                'errors' => [
                    'required' => '{field} harus di isi.',
                    'is_unique' => '{field} sudah terdaftar.'
                ]
            ],
            'sampul' => [
                'rules' => 'max_size[sampul,1024]|is_image[sampul]|mime_in[sampul,image/jpg,image/jpeg,image/png]',
                'errors' => [
                    'max_size' => 'Ukuran gambar {field} terlalu besar',
                    'is_image' => 'Yang anda pilih bukan gambar',
                    'mime_in' => 'Yang anda pilih bukan gambar'
                ]
            ]
        ])) {
            return redirect()->to('/sepatu/edit/' . $this->request->getVar('slug'))->withInput();
        }

        $fileSampul = $this->request->getFile('sampul');

        // cek gambar, apakah tetap gambar lama
        if ($fileSampul->getError() == 4) {
            $namaSampul = $this->request->getVar('sampulLama');
        } else {
            // generate nama file random
            $namaSampul = $fileSampul->getRandomName();
            // pindahkan gambar
            $fileSampul->move('img', $namaSampul);
            // hapus file yang lama
            if ($this->request->getVar('sampulLama') != 'default.jpg') {
                unlink('img/' . $this->request->getVar('sampulLama'));
            }
        }

        $slug = url_title($this->request->getVar('nama_sepatu'), '-', true);
        $this->sepatuModel->save([
            'id' => $id,
            'nama_sepatu' => $this->request->getVar('nama_sepatu'),
            'slug' => $slug,
            'jenis_sepatu' => $this->request->getVar('jenis_sepatu'),
            'harga_sepatu' => $this->request->getVar('harga_sepatu'),
            'sampul' => $namaSampul
        ]);

        session()->setFlashdata('pesan', 'Data berhasil diubah!');

        return redirect()->to('/sepatu');
    }

    public function beli($slug)
    {

        $data = [
            'title' => 'Form Pembelian',
            'validation' => \Config\Services::validation(),
            'sepatu' => $this->sepatuModel->getSepatu($slug),
            'cart' => \Config\Services::cart()
        ];

        return view('sepatu/beli', $data);
    }

    public function saveBeli()
    {

        // validasi input
        if (!$this->validate([
            'nama_pembeli' => [
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus di isi',
                ]
            ],

            'alamat_pembeli' => [
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus di isi',
                ]
            ],

            'jumlah_sepatu' => [
                'rules' => 'required|is_natural_no_zero',
                'errors' => [
                    'required' => '{field} harus di isi',
                    'is_natural_no_zero' => 'harus di isi'
                ]
            ],

        ])) {
            session()->setFlashdata('pesan_gagal', 'Anda gagal membeli!');
            return redirect()->to('/sepatu');
        }

        $str = $this->request->getVar('alamat_pembeli');
        $alamatPembeli = explode(".", $str)[1];
        $this->penjualanModel->save([
            'username' => $this->request->getVar('username'),
            'nama_pembeli' => $this->request->getVar('nama_pembeli'),
            'alamat_pembeli' => $alamatPembeli,
            'jumlah_sepatu' => $this->request->getVar('jumlah_sepatu'),
            'nama_sepatu' => $this->request->getVar('nama_sepatu'),
            'harga_sepatu' => $this->request->getVar('harga_sepatu'),
            'total' => $this->request->getVar('total'),
        ]);

        session()->setFlashdata('pesan', 'Pesanan anda atas username <b>' . user()->username . '</b> sudah di konfirmasi, terimakasih telah berbelanja di toko kami');

        return redirect()->to('/sepatu');
    }

    public function cek()
    {
        $cart = \Config\Services::cart();
        $response =
            $cart->contents();
        // $data = json_encode($response);
        echo '<pre>';
        print_r($response);
        echo '</pre>';
    }

    public function add()
    {
        $cart = \Config\Services::cart();
        $cart->insert(array(
            'id'      =>
            $this->request->getPost('id'),
            'qty'     => 1,
            'price'   => $this->request->getPost('price'),
            'name'    => $this->request->getPost('name'),
            'options' => array(
                'jenis_sepatu'   => $this->request->getPost('jenis_sepatu'),
                'slug'   => $this->request->getPost('slug'),
                'sampul'   => $this->request->getPost('sampul')
            )
        ));
        session()->setFlashdata('pesan', 'Sepatu telah ditambahkan ke dalam keranjang!');

        return redirect()->to('/sepatu/' . $this->request->getVar('slug'))->withInput();
    }

    // public function clear()
    // {
    //     $cart = \Config\Services::cart();
    //     $cart->destroy();
    //     redirect()->to('/');
    // }
}
