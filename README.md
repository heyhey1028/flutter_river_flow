# flutter_river_flow

This is a sandbox for package freezed and riverpod.

- Riverpod https://riverpod.dev/docs/getting_started/
- Freezed https://pub.dev/packages/freezed

## TODO
- [ ] Using each Providers
  - [ ] FutureProvider
    - [ ] combine other FutureProvider
    - [ ] 
  - [ ] StreamProvider
  - [ ] Provider
  - [ ] StateProvider
  - [ ] StateNotifierProvider
  - [ ] ChangeNotifierProvider
- [ ] Testing each providers
- [ ] Obtaining Providers
  - [ ] extends ConsumerWidget [link](https://riverpod.dev/docs/concepts/reading/#extending-consumerwidget-instead-of-statelesswidget)
  - [ ] extends ConsumerStatefuleWidget [link](https://riverpod.dev/docs/concepts/reading/#extending-consumerstatefulwidgetconsumerstate-instead-of-statefulwidgetstate)
  - [ ] extends HookConsumerWidget [link](https://riverpod.dev/docs/concepts/reading/#extending-consumerstatefulwidgetconsumerstate-instead-of-statefulwidgetstate)
  - [ ] extends StatefulHookConsumerWidget [link](https://riverpod.dev/docs/concepts/reading/#extending-statefulhookconsumerwidget-instead-of-hookwidget)
  - [ ] Consumer widget/ HookConsumer widget [link](https://riverpod.dev/docs/concepts/reading/#consumer-and-hookconsumer-widgets)
- [ ] Techniques
  - [ ] Using select [link](https://riverpod.dev/docs/concepts/reading/#using-select-to-filter-rebuilds)
  - [ ] changing StreamProvider into Future, FutureProvider into Stream
  - [ ] using .family
  - [ ] passing multiple parameters
  - [ ] ref.keepAlive
  - [ ] ref.onDispose
  - [ ] ProviderObserver
- [ ] Usecases
  - [ ] Keeping Auth State with Riverpod
  - [ ] Keep watching Firestore document
  - [ ] Keep watching Firestore Collection
  - [ ] Using Providers in widget's lifecycle
  - [ ] Access ProviderFamily without arguments in nested widgets
  - [ ] Implement class method for Freezed classes
  - [ ] Making StateNotifierProvider with Future [link](https://github.com/rrousselGit/riverpod/issues/57)