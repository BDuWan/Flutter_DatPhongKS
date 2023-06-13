import 'package:booking_hotel/model/room_model.dart';
import 'package:booking_hotel/repository/room_repository.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RoomRepository', () {
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

    // Tạo các RoomModel giả lập
    final mockRoomModel1 = RoomModel(
      roomid: '101',
      floor: 1,
      capacity: 2,
      cost: 100,
    );
    final mockRoomModel2 = RoomModel(
      roomid: '102',
      floor: 1,
      capacity: 2,
      cost: 1000,
    );
    final mockRoomModel3 = RoomModel(
      roomid: '103',
      floor: 1,
      capacity: 3,
      cost: 2000,
    );

    //Thêm dữ liệu vào csdl giả
    fakeFirebaseFirestore
        .collection('rooms')
        .doc('101')
        .set(mockRoomModel1.toJson());
    fakeFirebaseFirestore
        .collection('rooms')
        .doc('102')
        .set(mockRoomModel2.toJson());
    fakeFirebaseFirestore
        .collection('rooms')
        .doc('103')
        .set(mockRoomModel3.toJson());
    final roomRepository = RoomRepository(db: fakeFirebaseFirestore);

    test('getRoomById', () async {
      final result = await roomRepository.getRoomById('101');

      // Kiểm tra kết quả
      expect(result.toJson(), equals(mockRoomModel1.toJson()));
    });

    test('getRoomWithQuery', () async {
      final result = await roomRepository.getRoomWithQuery(1, 2, 1, 9999);
      final expectedList = [mockRoomModel1.toJson(), mockRoomModel3.toJson()];
      // Kiểm tra kết quả
      expect(
        result.map((room) => room.toJson()).toList(),
        equals(expectedList),
      );
    });
  });
}
