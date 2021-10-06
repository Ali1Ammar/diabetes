class CalcAvg extends BaseWithAvg {
  double sum = 0;
  int length = 0;
  @override
  double get avg => sum / length;

  CalcAvg();
  void add(int numm) {
    sum += numm;
    length++;
  }

    void remove(int numm) {
    sum -= numm;
    length--;
  }

  void replace(int old, int _new) {
    sum = sum+ _new - old;
  }

    void replaceOrAdd(int? old, int _new) {
      if(old==null){
          add(_new);
      }else {
        replace(old,_new);
      }
  }
}

class CalcWithAvg<T> extends CalcAvg {
  final T data;
  CalcWithAvg(this.data);
}

class DirectWithAvg<T> extends BaseWithAvg {
  @override
  final double avg;
  final T data;
  DirectWithAvg(this.avg, this.data);
}

abstract class BaseWithAvg {
  double get avg;
  BaseWithAvg();
}

class ResultWithAvg<T> {
  final CalcAvg allAvg;
  final CalcAvg monthAvg;
  final CalcAvg threeMonthAvg;
  final T data;

  ResultWithAvg(this.allAvg, this.monthAvg, this.threeMonthAvg, this.data);
}

// <Map<DateTime,Map<ReaderType,ReadItemData>>>
