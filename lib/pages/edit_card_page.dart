import 'package:flutter/material.dart';

class EditCardPage extends StatefulWidget {
  const EditCardPage({super.key});

  @override
  State<EditCardPage> createState() => _EditCardPageState();
}

class _EditCardPageState extends State<EditCardPage> {
  String selectedCard = "iş"; // iş veya kişisel

  final TextEditingController nameController = TextEditingController(
    text: "Serhat Şimşek",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "+90 541 855 4843",
  );
  final TextEditingController emailController = TextEditingController(
    text: "serhatsimsek@gmail.com",
  );
  final TextEditingController positionController = TextEditingController(
    text: "Software Developer",
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1976D2), Color(0xFF64B5F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Başlık ve geri
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Kartlarım",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Sekme Butonları
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButton(
                      title: "İş Kartım",
                      selected: selectedCard == "iş",
                      onTap: () => setState(() => selectedCard = "iş"),
                    ),
                    const SizedBox(width: 16),
                    ToggleButton(
                      title: "Kişisel Kartım",
                      selected: selectedCard == "kişisel",
                      onTap: () => setState(() => selectedCard = "kişisel"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Form Alanları
                Expanded(
                  child: ListView(
                    children: [
                      CustomTextField(
                        controller: nameController,
                        label: "Ad Soyad",
                      ),
                      CustomTextField(
                        controller: phoneController,
                        label: "Telefon",
                      ),
                      CustomTextField(
                        controller: emailController,
                        label: "E-posta",
                      ),
                      if (selectedCard == "iş")
                        CustomTextField(
                          controller: positionController,
                          label: "Pozisyon",
                        ),
                    ],
                  ),
                ),

                // Kaydet Butonu
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Kaydetme işlemi burada yapılır
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Kart bilgileri kaydedildi"),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text("Kaydet"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Sekme butonu
class ToggleButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const ToggleButton({
    required this.title,
    required this.selected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.blue : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Özel TextField
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const CustomTextField({
    required this.controller,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white38),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
