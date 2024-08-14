import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(bankShinhan, 30000, accountTypeName: '신한 주거래 우대통장(저축예금)');
final bankAccountShinhan2 = BankAccount(bankShinhan, 300000000, accountTypeName: '저축예금');
final bankAccountShinhan3 = BankAccount(bankShinhan, 30000000000, accountTypeName: '저축예금');
final bankAccountToss = BankAccount(bankTtoss, 500000);
final bankAccountKakao = BankAccount(bankKakao, 70000000, accountTypeName: '입출금통장');


void main() {
  // 각 은행 계좌의 타입과 포맷팅된 잔액 출력
  for (var account in bankAccounts) {
    print('${account.accountTypeName}: ${account.formattedBalance}');
  }
}

final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
];