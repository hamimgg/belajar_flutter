import 'package:flutter/material.dart';

class Tugas2Flutter extends StatelessWidget {
  const Tugas2Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            // ─── 1. AppBar ─────────────────────────────────────
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5A623),
        //foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Detail Pedagang',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
 
      body: SingleChildScrollView(
        // ─── olumn (struktur utama halaman) ─────────────────
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Banner oranye ──────────────────────────────────────
            Container(
              width: double.infinity,
              height: 100,
              color: const Color(0xFFF5A623),
              child: Stack(
                children: [
                  // Lingkaran dekorasi
                  Positioned(
                    right: -20,
                    top: -20,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.15),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    bottom: -30,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
 
            // ── Avatar + padding ───────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Transform.translate(
                offset: const Offset(0, -40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF1C1C1E),
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      // ─── Center ────────────────────────────
                      child: const Center(
                        child: Text(
                          'PK',
                          style: TextStyle(
                            color: Color(0xFFF5A623),
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
 
                    // ─── SizedBox (jarak vertikal) ─────────────
                    const SizedBox(height: 8),
 
                    // ─── 2. IDENTITAS UTAMA (Center + Nama) ───────────
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            'Pak Karto Snack & Jajanan',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C1C1E),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5A623).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xFFF5A623),
                                width: 1,
                              ),
                            ),
                            child: const Text(
                              '🛒  Pedagang Terverifikasi',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFD4861A),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
 
            // Kompensasi offset translate
            const SizedBox(height: 0),
 
            // ─── 3. DETAIL KONTAK ──────────────────────────────────
            // Container + Padding wajib membungkus info kontak
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFE8E8E8),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informasi Kontak',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF888888),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
 
                    // Email — Row + Icon + SizedBox + Text (WAJIB)
                    Row(
                      children: const [
                        Icon(
                          Icons.email_outlined,
                          size: 18,
                          color: Color(0xFFF5A623),
                        ),
                        // ─── SizedBox sebagai jarak ────────────
                        SizedBox(width: 10),
                        Text(
                          'pakkartosnack@asongan.id',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1C1C1E),
                          ),
                        ),
                      ],
                    ),
 
                    const SizedBox(height: 10),
 
                    // ID Pedagang — Row + Icon + SizedBox + Text
                    Row(
                      children: const [
                        Icon(
                          Icons.badge_outlined,
                          size: 18,
                          color: Color(0xFFF5A623),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'ID: ASGN-2024-00347',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1C1C1E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
 
            const SizedBox(height: 12),
 
            // ─── 4. INFORMASI PENDUKUNG (Row + Spacer) ────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFE8E8E8),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    // Baris 1: Telepon + Spacer + Status Online
                    Row(
                      children: const [
                        Icon(
                          Icons.phone_outlined,
                          size: 18,
                          color: Color(0xFFF5A623),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '0812-3456-7890',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1C1C1E),
                          ),
                        ),
                        // ─── Spacer mendorong elemen ke kanan ──
                        Spacer(),
                        Icon(
                          Icons.circle,
                          size: 10,
                          color: Color(0xFF27AE60),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Sedang Berjualan',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF27AE60),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
 
                    const SizedBox(height: 10),
 
                    // Baris 2: Lokasi + Spacer + Jarak
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color: Color(0xFFF5A623),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Jl. Sudirman, Jakarta Pusat',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1C1C1E),
                          ),
                        ),
                        // ─── Spacer ────────────────────────────
                        Spacer(),
                        Text(
                          '± 1.2 km',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF888888),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
 
            const SizedBox(height: 16),
 
            // ─── 5. STATISTIK HORIZONTAL (Row + Expanded) ─────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // ─── Expanded kotak 1 ──────────────────────
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5A623),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            '1.247',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C1C1E),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Total Pesanan',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4A2800),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
 
                  const SizedBox(width: 10),
 
                  // ─── Expanded kotak 2 ──────────────────────
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1C1E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.star,
                                color: Color(0xFFF5A623),
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '4.8',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Rating Pembeli',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFAAAAAA),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
 
                  const SizedBox(width: 10),
 
                  // ─── Expanded kotak 3 (bonus) ──────────────────────
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFE8E8E8),
                          width: 1,
                        ),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            '3 Thn',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C1C1E),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Bergabung',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF888888),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
 
            // ─── 6. DESKRIPSI NARATIF ──────────────────────────────
            // ─── SizedBox jarak vertikal ───────────────────
            const SizedBox(height: 16),
 
            // ─── Padding agar teks tidak menyentuh tepi ────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tentang Pedagang',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C1C1E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE8E8E8),
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      'Pak Karto telah berjualan jajanan dan snack tradisional sejak tahun 2021 di kawasan Sudirman dan sekitarnya. '
                      'Menyediakan berbagai pilihan camilan lezat seperti keripik singkong, gorengan hangat, es teh, '
                      'dan jajanan pasar dengan harga yang sangat terjangkau.\n\n'
                      'Kini hadir di aplikasi ASONGAN agar pembeli dapat menemukan lokasi dan menu dagangan secara real-time. '
                      'Pesanan juga dapat disiapkan terlebih dahulu sebelum pembeli tiba.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF444444),
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
 
            const SizedBox(height: 16),
 
            // Menu Unggulan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Menu Unggulan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C1C1E),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _MenuChip(label: '🥜 Kacang Goreng', price: 'Rp 3.000'),
                      const SizedBox(width: 8),
                      _MenuChip(label: '🧋 Es Teh Manis', price: 'Rp 5.000'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _MenuChip(
                        label: '🍟 Gorengan Mix',
                        price: 'Rp 2.000/pcs',
                      ),
                      const SizedBox(width: 8),
                      _MenuChip(
                        label: '🍪 Keripik Singkong',
                        price: 'Rp 8.000',
                      ),
                    ],
                  ),
                ],
              ),
            ),
 
            // ─── 7. VISUAL BRANDING ────────────────────────────────
            // Container dekoratif di bagian bawah sebagai branding
            const SizedBox(height: 20),
 
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF1C1C1E),
              ),
              child: Column(
                children: [
                  // ─── Row untuk layout branding ─────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo placeholder
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5A623),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'A',
                            style: TextStyle(
                              color: Color(0xFF1C1C1E),
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ASONGAN',
                            style: TextStyle(
                              color: Color(0xFFF5A623),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              letterSpacing: 2,
                            ),
                          ),
                          Text(
                            'Pedagang Dekat, Harga Murah',
                            style: TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
 
                  const SizedBox(height: 20),
 
                  // Tombol aksi utama
                  Row(
                    children: [
                      // ─── Expanded untuk tombol ─────────────
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF5A623),
                            foregroundColor: const Color(0xFF1C1C1E),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.location_on, size: 18),
                          label: const Text(
                            'Lacak Lokasi',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(
                              color: Color(0xFFF5A623),
                              width: 1.5,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.chat_outlined, size: 18),
                          label: const Text(
                            'Chat Pedagang',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
 
                  const SizedBox(height: 16),
 
                  const Text(
                    'Memberdayakan pedagang kaki lima lewat teknologi digital yang sederhana dan inklusif.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF666666),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
// ── Helper widget: Menu Chip ────────────────────────────────────────
class _MenuChip extends StatelessWidget {
  final String label;
  final String price;
 
  const _MenuChip({required this.label, required this.price});
 
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE8E8E8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C1C1E),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              price,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFFD4861A),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}