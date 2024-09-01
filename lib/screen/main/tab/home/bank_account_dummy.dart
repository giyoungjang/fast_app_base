import 'dart:collection';

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/collection_extension.dart';
import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

final bankAccountShinhan1 = BankAccount(bankShinhan, 30000, accountTypeName: '신한 주거래 우대통장(저축예금)');
final bankAccountShinhan2 = BankAccount(bankShinhan, 300000000, accountTypeName: '저축예금');
final bankAccountShinhan3 = BankAccount(bankShinhan, 30000000000, accountTypeName: '저축예금');
final bankAccountToss = BankAccount(bankTtoss, 500000);
final bankAccountKakao = BankAccount(bankKakao, 70000000, accountTypeName: '입출금통장');
final bankAccountKakao2 = BankAccount(bankKakao, 10000, accountTypeName: '특별통장');


main() {
  //삽입
  // bankAccounts.insert(1, bankAccountShinhan2);
  //
  // //위치 이동
  // final temp = bankAccounts.removeAt(4);
  // bankAccounts.insert(0, temp);
  //
  // //교환
  // bankAccounts.swap(0,5);
  //
  // //변환
  // // final banks = bankAccounts.mapIndexed((e, index) => Row(children: [(index+1).text.make()],)).toList();
  // // for(final bank in banks){
  // //   print(bank.toString());
  // // }
  // final banks = bankAccounts.map((e) => e.bank).toList();
  //
  // final uniqueBanks = banks.toSet();
  // for (final bank in uniqueBanks) {
  //   print(bank.toString());
  // }



  // final list = [] ;
  // final set = {bankAccountShinhan1, bankAccountShinhan2};
  // final map = {'shinhan1' : bankAccountShinhan1, 'shinhan2': bankAccountShinhan2};


  // final map = HashMap<String, BankAccount>();
  // map['ttoss'] = bankAccountToss;
  // map['kakao'] = bankAccountKakao;
  // map.putIfAbsent('kakao', () => bankAccountKakao2);
  //
  // final ttossAccount = map['ttos'];

  // for (final account in bankAccounts) {
  //   print(account.toString());
  // }

  //class generic


}

final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
];