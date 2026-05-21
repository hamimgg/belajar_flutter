import 'package:flutter/material.dart';

class Tugas7Flutter extends StatefulWidget {
  const Tugas7Flutter({super.key});

  @override
  State<Tugas7Flutter> createState() => _Tugas7FlutterState();
}

class _Tugas7FlutterState extends State<Tugas7Flutter> {
  bool _isAgreed = false;

  bool _isDarkMode = false;

  String? _selectedCategory;
  final List<String> _categories = [
    'Makanan',
    'Minuman,'
        'Lainnya',
  ];

  DateTime? _selectedDate;

  TimeOfDay? _selectedTime;

  String get _formattedDate {
    if (_selectedDate == null) return 'Belum dipilih';
    final d = _selectedDate!;
    return '${d.day.toString().padLeft(2, '0')}-'
        '${d.month.toString().padLeft(2, '0')}-'
        '${d.year}';
  }

  String get _formattedTime {
    if (_selectedTime == null) return 'Belum diatur';
    final h = _selectedTime!.hour.toString().padLeft(2, '0');
    final m = _selectedTime!.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  // --- Date Picker ---
  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      helpText: 'Pilih Tanggal Lahir',
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  // --- Time Picker ---
  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      helpText: 'Atur Waktu Pengingat',
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  // --- Keys untuk scroll ke section ---
  final Map<String, GlobalKey> _sectionKeys = {
    'syarat': GlobalKey(),
    'tampilan': GlobalKey(),
    'kategori': GlobalKey(),
    'tanggal': GlobalKey(),
    'pengingat': GlobalKey(),
  };

  void _scrollToSection(String key) {
    Navigator.pop(context); // tutup drawer
    final ctx = _sectionKeys[key]?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor = _isDarkMode
        ? const Color(0xFF1A1A2E)
        : const Color(0xFFF5F7FF);
    final Color cardColor = _isDarkMode
        ? const Color(0xFF16213E)
        : Colors.white;
    final Color textColor = _isDarkMode
        ? Colors.white
        : const Color(0xFF1E1E2E);
    final Color subtitleColor = _isDarkMode ? Colors.white60 : Colors.black54;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          'Input Interaktif',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 2,
      ),

      // ===================== DRAWER =====================
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.indigoAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.widgets_rounded, color: Colors.white, size: 40),
                  SizedBox(height: 8),
                  Text(
                    'Menu Navigasi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Pilih fitur yang ingin digunakan',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.check_box_outlined,
                color: Colors.indigo,
              ),
              title: const Text('Syarat & Ketentuan'),
              subtitle: const Text('Checkbox persetujuan'),
              onTap: () => _scrollToSection('syarat'),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(
                Icons.dark_mode_outlined,
                color: Colors.indigo,
              ),
              title: const Text('Mode Tampilan'),
              subtitle: const Text('Toggle gelap / terang'),
              onTap: () => _scrollToSection('tampilan'),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(
                Icons.category_outlined,
                color: Colors.indigo,
              ),
              title: const Text('Kategori Produk'),
              subtitle: const Text('Pilih kategori dropdown'),
              onTap: () => _scrollToSection('kategori'),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(
                Icons.calendar_today_outlined,
                color: Colors.indigo,
              ),
              title: const Text('Pilih Tanggal'),
              subtitle: const Text('Date picker tanggal lahir'),
              onTap: () => _scrollToSection('tanggal'),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.alarm_outlined, color: Colors.indigo),
              title: const Text('Atur Pengingat'),
              subtitle: const Text('Time picker pengingat'),
              onTap: () => _scrollToSection('pengingat'),
            ),
          ],
        ),
      ),

      // ===================== BODY =====================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ---- 1. Syarat & Ketentuan ----
            _SectionCard(
              key: _sectionKeys['syarat'],
              cardColor: cardColor,
              textColor: textColor,
              icon: Icons.check_box_outlined,
              title: '1. Syarat & Ketentuan',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isAgreed,
                        activeColor: Colors.indigo,
                        onChanged: (val) =>
                            setState(() => _isAgreed = val ?? false),
                      ),
                      Expanded(
                        child: Text(
                          'Saya menyetujui persyaratan',
                          style: TextStyle(color: textColor, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: _isAgreed
                          ? Colors.green.shade50
                          : Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _isAgreed ? Colors.green : Colors.red,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _isAgreed ? Icons.check_circle : Icons.cancel,
                          color: _isAgreed ? Colors.green : Colors.red,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _isAgreed
                              ? 'Pendaftaran diperbolehkan'
                              : 'Pendaftaran belum tersedia',
                          style: TextStyle(
                            color: _isAgreed
                                ? Colors.green.shade800
                                : Colors.red.shade800,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ---- 2. Mode Tampilan ----
            _SectionCard(
              key: _sectionKeys['tampilan'],
              cardColor: cardColor,
              textColor: textColor,
              icon: Icons.dark_mode_outlined,
              title: '2. Mode Tampilan',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Aktifkan Mode Gelap',
                    style: TextStyle(color: textColor, fontSize: 15),
                  ),
                  Switch(
                    value: _isDarkMode,
                    activeThumbColor: Colors.indigo,
                    onChanged: (val) => setState(() => _isDarkMode = val),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ---- 3. Kategori Produk ----
            _SectionCard(
              key: _sectionKeys['kategori'],
              cardColor: cardColor,
              textColor: textColor,
              icon: Icons.category_outlined,
              title: '3. Kategori Produk',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField<String>(
                    initialValue: _selectedCategory,
                    hint: Text(
                      'Pilih kategori',
                      style: TextStyle(color: subtitleColor),
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.indigo,
                          width: 1.5,
                        ),
                      ),
                    ),
                    dropdownColor: cardColor,
                    style: TextStyle(color: textColor),
                    items: _categories.map((cat) {
                      return DropdownMenuItem(value: cat, child: Text(cat));
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedCategory = val),
                  ),
                  if (_selectedCategory != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      'Anda memilih kategori: $_selectedCategory',
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ---- 4. Pilih Tanggal ----
            _SectionCard(
              key: _sectionKeys['tanggal'],
              cardColor: cardColor,
              textColor: textColor,
              icon: Icons.calendar_today_outlined,
              title: '4. Pilih Tanggal',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickDate,
                    icon: const Icon(Icons.date_range),
                    label: const Text('Pilih Tanggal Lahir'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Tanggal Lahir: $_formattedDate',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ---- 5. Atur Pengingat ----
            _SectionCard(
              key: _sectionKeys['pengingat'],
              cardColor: cardColor,
              textColor: textColor,
              icon: Icons.alarm_outlined,
              title: '5. Atur Pengingat',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickTime,
                    icon: const Icon(Icons.access_time),
                    label: const Text('Atur Waktu Pengingat'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Pengingat diatur pukul: $_formattedTime',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ===================== RESULT AREA =====================
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.indigo, Colors.indigoAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.summarize, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Ringkasan Status',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Divider(color: Colors.white30),
                  const SizedBox(height: 10),
                  _ResultRow(
                    icon: Icons.check_box,
                    label: 'Persetujuan',
                    value: _isAgreed ? 'Disetujui ✓' : 'Belum disetujui ✗',
                  ),
                  _ResultRow(
                    icon: Icons.dark_mode,
                    label: 'Mode Tampilan',
                    value: _isDarkMode ? 'Mode Gelap 🌙' : 'Mode Terang ☀️',
                  ),
                  _ResultRow(
                    icon: Icons.category,
                    label: 'Kategori',
                    value: _selectedCategory ?? 'Belum dipilih',
                  ),
                  _ResultRow(
                    icon: Icons.calendar_today,
                    label: 'Tanggal Lahir',
                    value: _formattedDate,
                  ),
                  _ResultRow(
                    icon: Icons.alarm,
                    label: 'Pengingat',
                    value: _selectedTime != null
                        ? 'Pukul $_formattedTime'
                        : 'Belum diatur',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ===================== SECTION CARD WIDGET =====================
class _SectionCard extends StatelessWidget {
  final Color cardColor;
  final Color textColor;
  final IconData icon;
  final String title;
  final Widget child;

  const _SectionCard({
    super.key,
    required this.cardColor,
    required this.textColor,
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.indigo, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }
}

// ===================== RESULT ROW WIDGET =====================
class _ResultRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ResultRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
