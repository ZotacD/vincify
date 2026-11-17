import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  static const double PADDING = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paiement'),
        leading: IconButton(
          onPressed: () => context.go("/cart"),
          icon: const Icon(Icons.arrow_back),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sélection du moyen de paiement
            const Text(
              "Sélectionner le moyen de paiement",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 180,
                    child: ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text("Carte bancaire"),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text("Carte bancaire"),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text("Carte bancaire"),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text("Carte bancaire"),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text("Carte bancaire"),
                    ),
                  ),
                ],
              ),
            ),

            const Text(
              "Informations de paiement",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.credit_card),
                hintText: "Numéro de carte",
              ),
            ),

            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Nom du titulaire",
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Date d'expiration"),
                  ),
                ),

                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "CVV"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(PADDING),
        width: MediaQuery.of(context).size.width,
        child: FilledButton.icon(
          onPressed: () => {context.go("/payment")},
          label: Text("Confirmer le paiment"),
          icon: Icon(Icons.checklist),
        ),
      ),
    );
  }
}
