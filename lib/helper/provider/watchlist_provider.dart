import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cinema_craze/data/apis/models/watchlist_model/watchlist_model.dart';

class WatchlistProvider with ChangeNotifier {
  final CollectionReference<WatchListModel> _watchlistCollection =
      FirebaseFirestore.instance
          .collection('WatchList')
          .withConverter<WatchListModel>(
            fromFirestore: (snapshot, _) =>
                WatchListModel.fromJson(snapshot.data()!),
            toFirestore: (watchList, _) => watchList.toJson(),
          );

  List<WatchListModel> watchlistFilms = [];

  WatchlistProvider() {
    _watchlistCollection.snapshots().listen((snapshot) {
      watchlistFilms = snapshot.docs.map((doc) => doc.data()).toList();
      notifyListeners();
    });
  }

  bool isFilmInWatchlist(String filmId) {
    return watchlistFilms.any((item) => item.id == filmId);
  }

  Future<void> toggleWatchlistItem(WatchListModel watchListModel) async {
    if (isFilmInWatchlist(watchListModel.id)) {
      await _watchlistCollection.doc(watchListModel.id).delete();
    } else {
      await _watchlistCollection.doc(watchListModel.id).set(watchListModel);
    }
    // No need to call notifyListeners() here, as the snapshot listener does this automatically
  }
  // Future<bool> toggleWatchlistItem(WatchListModel watchListModel) async {
  //   try {
  //     if (isFilmInWatchlist(watchListModel.id)) {
  //       await _watchlistCollection.doc(watchListModel.id).delete();
  //     } else {
  //       await _watchlistCollection.doc(watchListModel.id).set(watchListModel);
  //     }
  //     notifyListeners();
  //     return true;
  //   } catch (e) {
  //     print('Error toggling watchlist item: $e');
  //     return false;
  //   }
  // }

  List<WatchListModel> get watchlist => watchlistFilms;
}
