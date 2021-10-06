import 'package:diabetes/modal/reader_type.dart';

List<List<Map>> getFake() {
  return List.generate(
      30,
      (outer) {
        final date = DateTime.now();
        return List.generate(
          ReaderType.values.length,
          (index) => {
                'readId': date,
                'date': DateTime.now(),
                'read': (index+1)*100,
                'type': ReaderType.values[index]
              });
      });
}
