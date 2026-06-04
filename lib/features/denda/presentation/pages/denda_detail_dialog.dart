import 'package:flutter/material.dart';

class DendaDetailDialog extends StatelessWidget {
  final dynamic item;

  const DendaDetailDialog({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildItem({
      required String title,
      required String value,
    }) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Detail Denda",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              buildItem(
                title: "ID Denda",
                value: item.idDenda,
              ),

              buildItem(
                title: "Jumlah Denda",
                value: "Rp ${item.jumlahDenda}",
              ),

              buildItem(
                title: "Tanggal Pinjam",
                value: item.tglPinjam.toString(),
              ),

              buildItem(
                title: "Tanggal Kembali",
                value: item.tglKembali.toString(),
              ),

              buildItem(
                title: "ID Peminjaman",
                value: item.idPeminjaman,
              ),

              buildItem(
                title: "ID Anggota",
                value: item.idAnggota,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Tutup"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}