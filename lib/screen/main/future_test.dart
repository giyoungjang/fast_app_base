import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_account_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

void main() {
  //Future의 기본 개념
  ///Future == 미라
  ///시간이 걸리는 Computation 작업 또는 유저의 응답을 기다려야되는 상태

  //Future의 생성과 수행
  // print('start');
  // final account = await getBankAccounts(); //심플하고 가독성이 좋습니다.
  // // getBankAccounts().then((value){
  // //   print(value.toString());
  // // });
  // print(account.toString());
  // print('End')

  //Future Timeout
  // print('start');
  // final result = await getBankAccounts().timeout(1.seconds).onError((error, stackTrace) => []);
  // print(result);
  // print('End');

  //Future Error handling
  // print('start');
  // getBankAccounts().timeout(1.seconds).then((value) {
  //   print(value);
  // }).catchError((error, stackTrace) {
  //   print(error);
  //   print(stackTrace);
  // });
  // print('End');

  //FutureOr
}

abstract class DoWorkInterface {
  FutureOr<String> doWork();
}

class SyncWork extends DoWorkInterface{
  @override
  String doWork() {
    return 'wow';
  }
}

class AsyncWork extends DoWorkInterface{
  @override
  Future<String> doWork() async{
    return '';
  }
}


Future<List<BankAccount>?> getBankAccounts() async {
  await sleepAsync(2.seconds);
  return bankAccounts;
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}
