import 'package:cosmetics_app/views/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    GridPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: pages[selectedIndex],
      ),

      bottomNavigationBar: CustomBottomNav(
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(Icons.home, 0),
            navItem(Icons.grid_view, 1),
            navItem(Icons.shopping_cart_outlined, 2),
            navItem(Icons.person_outline, 3),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Icon(
        icon,
        size: 28,
        color: selectedIndex == index
            ? Colors.pink
            : Colors.grey,
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:  [
        Container(
  height: 50,
  padding: const EdgeInsets.symmetric(horizontal: 16),
  decoration: BoxDecoration(
    
    borderRadius: BorderRadius.circular(30),
    border: Border.all(
      color: Colors.grey.shade400,
      width: 1,
    ),
  ),
  child: Row(
    children: [
      const Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
      ),
      Icon(
        Icons.search,
        color: Colors.grey,
      ),
    ],
  ),
)
,
        SizedBox(
          height: 350,
          child: Image.asset('assets/images/frame.png'),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '    Top rated Products',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          ProductCard(
          image: 'assets/images/card.png',
          title: 'Cosmetic Product', price: '\$29.99',
        ),
          ProductCard(
          image: 'assets/images/card.png',
          title: 'Cosmetic Product', price: '\$29.99',
        ),
        ],
        )
        
        ],
      ),
    );
  }
}
class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
            SizedBox(height: 20),
          Text(
            'Categories',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
            Container(
  height: 50,
  padding: const EdgeInsets.symmetric(horizontal: 16),
  decoration: BoxDecoration(
    
    borderRadius: BorderRadius.circular(30),
    border: Border.all(
      color: Colors.grey.shade400,
      width: 1,
    ),
  ),
  child: Row(
    children: [
      const Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
      ),
      Icon(
        Icons.search,
        color: Colors.grey,
      ),
    ],
  ),
),
       ListView.builder (
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(22),
            child: item(),
          );
        },)

        ],
      )
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
        Row(
  children: [

    const SizedBox(width: 16),
    
    const Expanded(
      child: Center(
        child: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),

    IconButton(
      icon: const Icon(Icons.shopping_cart_outlined),
      onPressed: () {
      },
    ),

    const SizedBox(width: 16), 
  ],
),
 const SizedBox(height: 16),
    ListView.builder(
      shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return const CartItem(
              image: 'assets/images/product.png',
              title: 'Note Cosmetics',
              description: 'Ultra rich mascara for lashes',
              price: '350 EGP',
            );
          },
        )

        ],
      )
    );
  }
}
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:Column(
        children: [
        Stack(
  clipBehavior: Clip.none,
  children: [
  
    Container(
      height: 160,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFD8C4FF),
            Color(0xFFFFC1D9),
          ],
        ),
      ),
    ),

  
    Positioned(
      bottom: -50,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 4,
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/curly.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ),
  ],
)
,        const SizedBox(height: 60),
        const Text(
          'Sara Samir Talat',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),
        ListView.builder(
      shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Row(
               
              children: [

              const Icon(Icons.settings),
              const SizedBox(width: 16),
              Text('Settings Option ${index + 1}'),
              Expanded(child: Container()),
              const Icon(Icons.arrow_forward_ios),

            ],);
          },
        ),
        
          const SizedBox(height: 20),
        Row(
          children: const [
            SizedBox(width: 16),
            Icon(Icons.logout, color: Colors.blueGrey),
            SizedBox(width: 16),
            Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            )])

        ],
      ),
    );
  }
}
