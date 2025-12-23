import 'package:adkaar/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Adkaar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // title
            if (counter >= 120)
              Text(
                'Adkaar',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            if (counter == 100)
              Image.asset(
                'assets/100.png',
                // width: 300,
                // height: 300,
                fit: BoxFit.contain,
              ),
            Stack(
              children: [
                Image.asset('assets/image1.png', width: 460, height: 460),
                // reset button
                Positioned(
                  right: 110,
                  top: 175,

                  // make this transparent button
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      ref.read(counterProvider.notifier).reset();
                    },
                    child: Text(""),
                  ),
                ),
                // counter button
                Positioned(
                  right: 131,
                  top: 115,
                  // make this transparent button
                  child: Center(
                    child: Text(
                      counter.toString(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // increment button
                Positioned(
                  right: 150,
                  top: 240,

                  // make this transparent button
                  child: GestureDetector(
                    onTap: () {
                      ref.read(counterProvider.notifier).increment();
                      HapticFeedback.lightImpact();
                    },
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 36),
                    ),
                  ),

                  // CircleAvatar(
                  //   radius: 50,
                  //   backgroundColor: Colors.green,
                  //   child: FloatingActionButton(
                  //     elevation: 0,
                  //     backgroundColor: Colors.red,
                  //     onPressed: () {
                  //       ref.read(counterProvider.notifier).increment();
                  //     },
                  //     child: Icon(Icons.add),
                  //   ),
                  // ),
                ),
              ],
            ),
            // Container(
            //   padding: const EdgeInsets.all(8.0),
            //   color: Colors.red,
            //   width: 100,
            //   height: 100,
            //   child: CircleAvatar(
            //     radius: 12,
            //     backgroundColor: Colors.white,
            //     child: FloatingActionButton(
            //       onPressed: () {
            //         ref.read(counterProvider.notifier).increment();
            //       },
            //       child: Icon(Icons.add),
            //     ),
            //   ),
            // ),
            // Text(counter.toString(), style: TextStyle(fontSize: 24)),

            // Container(
            //   padding: const EdgeInsets.all(8.0),
            //   color: Colors.red,
            //   width: 100,
            //   height: 100,
            //   child: CircleAvatar(
            //     radius: 12,
            //     backgroundColor: Colors.white,
            //     child: FloatingActionButton(
            //       onPressed: () {
            //         ref.read(counterProvider.notifier).reset();
            //       },
            //       child: Icon(Icons.remove),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 20),
            // Stack(
            //   children: [
            //     Container(
            //       padding: const EdgeInsets.all(8.0),
            //       color: Colors.red,
            //       width: 100,
            //       height: 100,
            //     ),

            //     Positioned(
            //       right: 12,
            //       top: 12,
            //       child: CircleAvatar(
            //         radius: 12,
            //         backgroundColor: Colors.white,
            //         child: FloatingActionButton(
            //           onPressed: () {
            //             ref.read(counterProvider.notifier).reset();
            //           },
            //           child: Icon(Icons.lock_reset),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
