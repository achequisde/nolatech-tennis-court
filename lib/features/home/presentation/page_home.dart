import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nolatech_tennis_court/features/home/presentation/home_courts.dart';
import 'package:nolatech_tennis_court/features/home/presentation/home_reservations.dart';
import 'package:nolatech_tennis_court/features/home/presentation/home_reservations_card.dart';

class PageHome extends HookWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);

    final appBarActions = [
      const CircleAvatar(),
      Container(
        margin: const EdgeInsets.only(left: 8),
        child: IconButton(
          padding: const EdgeInsets.all(4),
          constraints:
              const BoxConstraints(), // override default min size of 48px
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // the '2023' part
          ),
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      Container(
        margin: const EdgeInsets.only(right: 20),
        child: IconButton(
          padding: const EdgeInsets.all(4),
          constraints:
              const BoxConstraints(), // override default min size of 48px
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // the '2023' part
          ),
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    ];

    final stack = IndexedStack(
      index: selectedIndex.value,
      children: const [
        TabHome(),
        TabReservations(),
        TabFavorites(),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset("assets/home/LOGO HEADER.svg"),
        actions: appBarActions,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF032148),
                Color(0xFF4C7B2D),
                Color(0xFF82BC00),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: stack,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFF82BC00),
        shadowColor: Colors.amber,
        onDestinationSelected: (value) => selectedIndex.value = value,
        selectedIndex: selectedIndex.value,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Inicio",
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.event),
            label: "Reservas",
            selectedIcon: Icon(
              Icons.event,
              color: Colors.white,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: "Favoritos",
            selectedIcon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class TabHome extends StatelessWidget {
  const TabHome({super.key});

  @override
  Widget build(BuildContext context) {
    const title = SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          top: 20,
          bottom: 8,
          left: 23,
          right: 23,
        ),
        child: Text(
          "Hola Andrea!",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
    const courtsTitle = SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 23),
        child: Text(
          "Canchas",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
    const reservationsTitle = SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 23),
        child: Text(
          "Reservas programadas",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

    const body = CustomScrollView(
      slivers: [
        title,
        SliverToBoxAdapter(
          child: Divider(),
        ),
        courtsTitle,
        HomeCourts(),
        SliverToBoxAdapter(
          child: Divider(),
        ),
        reservationsTitle,
        HomeReservations(),
        SliverToBoxAdapter(
          child: Gap(10),
        )
      ],
    );

    return body;
  }
}

class TabReservations extends StatelessWidget {
  const TabReservations({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingBtn = FilledButton.tonal(
      onPressed: () {},
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        backgroundColor: const Color(0xFF82BC00),
        foregroundColor: const Color(0xFFFCFCFC),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today),
          Gap(10),
          Text(
            "Programar reserva",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );

    const title = Text(
      "Mis reservas",
      style: TextStyle(
        fontSize: 18.0,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 23),
      child: ListView(
        children: [
          bookingBtn,
          const Gap(30),
          title,
          const Gap(10),
          const HomeReservationsCard(),
          const HomeReservationsCard(),
          const HomeReservationsCard(),
        ],
      ),
    );
  }
}

class TabFavorites extends StatelessWidget {
  const TabFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
