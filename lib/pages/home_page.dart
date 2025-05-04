import 'package:flutter/material.dart';
import 'package:keep_in_touch_pilot/pages/qr_create_page.dart';
import 'package:keep_in_touch_pilot/pages/nfc_page.dart';
import 'package:keep_in_touch_pilot/pages/contacts_page.dart';
import 'package:keep_in_touch_pilot/pages/edit_card_page.dart';
import 'package:keep_in_touch_pilot/pages/create_card_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ÜST BÖLÜM
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.005),
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: screenWidth * 0.08,
                            height: screenWidth * 0.08,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        const Text(
                          "Keep\nin Touch",
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        CircleAvatar(
                          radius: screenWidth * 0.04,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            "assets/images/profile.png",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.02),

                // KARTVİZİT BİLGİ KUTUSU
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/qr.png",
                        width: screenWidth * 0.1,
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Serhat Şimşek",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Software Developer",
                            style: TextStyle(color: Colors.white70),
                          ),
                          Text(
                            "+90 541 855 4843",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "serhatsimsek@gmail.com",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // 3 ANA BUTON
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActionButton(
                      iconPath: "assets/images/edit.png",
                      label: "Kartınızı Düzenleyin",
                      iconSize: screenWidth * 0.08,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditCardPage(),
                          ),
                        );
                      },
                    ),

                    ActionButton(
                      iconPath: "assets/images/qr.png",
                      label: "QR Oluştur",
                      iconSize: screenWidth * 0.08,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QRCreatePage(),
                          ),
                        );
                      },
                    ),

                    ActionButton(
                      iconPath: "assets/images/idcard.png",
                      label: "Yeni Kart Oluştur",
                      iconSize: screenWidth * 0.08,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateCardPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.02),

                // SEKME
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    TabText(text: "Favoriler", selected: true),
                    TabText(text: "Kartvizitler", selected: false),
                    TabText(text: "Gruplar", selected: false),
                  ],
                ),

                SizedBox(height: screenHeight * 0.02),

                // FAVORİLER
                const FavoriteCard(
                  imagePath: "assets/images/erdogan.jpg",
                  name: "Recep Tayyip Erdoğan",
                ),
                const FavoriteCard(
                  imagePath: "assets/images/elon.jpg",
                  name: "Elon Musk",
                ),
                const FavoriteCard(
                  imagePath: "assets/images/mark.jpg",
                  name: "Mark Zuckerberg",
                ),
              ],
            ),
          ),
        ),
      ),

      // ALT MENÜ
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QRCreatePage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NFCPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactsPage()),
            );
          }
          // Diğer sayfalar için index == 2, 3, 4 şeklinde ilerleyebilirsin
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Kartlarım',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'QR Oku',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.nfc), label: 'NFC ile Tara'),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Yakınımdakiler',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ayarlar'),
        ],
      ),
    );
  }
}

class ActionButton extends StatefulWidget {
  final String iconPath;
  final String label;
  final double iconSize;
  final VoidCallback? onTap;

  const ActionButton({
    required this.iconPath,
    required this.label,
    required this.iconSize,
    this.onTap,
    super.key,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            boxShadow:
                isHovered
                    ? [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                    : [],
          ),
          child: Column(
            children: [
              Image.asset(widget.iconPath, width: widget.iconSize),
              const SizedBox(height: 4),
              Text(
                widget.label,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String imagePath;
  final String name;
  const FavoriteCard({required this.imagePath, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white.withOpacity(0.3),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(imagePath)),
        title: Text(name, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      ),
    );
  }
}

class TabText extends StatelessWidget {
  final String text;
  final bool selected;
  const TabText({required this.text, required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: selected ? Colors.white.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
