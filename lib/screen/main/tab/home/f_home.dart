import 'package:fast_app_base/class/ch04_advanced_dart1/stream_test.dart';
import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/round_button_theme.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/home/s_number.dart';
import 'package:fast_app_base/screen/main/tab/home/w_bank_account.dart';
import 'package:fast_app_base/screen/main/tab/home/w_rive_like_button.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttoss_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:live_background/live_background.dart';
import 'package:live_background/widget/live_background_widget.dart';

import '../../../../common/widget/w_big_button.dart';
import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';
import 'bank_account_dummy.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  late final stream = countStream(5).asBroadcastStream();
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          const LiveBackgroundWidget(
            palette: Palette(colors: [Colors.red, Colors.green]),
            velocityX: 1,
            particleMaxSize: 20,
          ),
          RefreshIndicator(
            edgeOffset: TtossAppBar.appBarHeight,
            onRefresh: () async {
              await sleepAsync(500.ms);
            },
            child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                    top: TtossAppBar.appBarHeight,
                    bottom: MainScreenState.bottomNavigatorHeight),
                child: Column(
                  children: [
                    // SizedBox(height: 250, width: 250, child: RiveLikeButton(isLike, onTapLike: (isLike){
                    //   setState(() {
                    //     this.isLike = isLike;
                    //   });
                    // }),),
                    StreamBuilder(
                      builder: (context, snapshot) {
                        final count = snapshot.data;

                        switch (snapshot.connectionState) {
                          case ConnectionState.active:
                            if (count == null) {
                              return const CircularProgressIndicator();
                            } else {
                              return count.text.size(30).bold.make();
                            }

                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return const CircularProgressIndicator();
                          case ConnectionState.done:
                            return '완료'.text.size(30).white.bold.make();
                        }
                      },
                      stream: stream,
                    ),
                    StreamBuilder(
                      builder: (context, snapshot) {
                        final count = snapshot.data;

                        switch (snapshot.connectionState) {
                          case ConnectionState.active:
                            if (count == null) {
                              return const CircularProgressIndicator();
                            } else {
                              return count.text.size(30).bold.make();
                            }

                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return const CircularProgressIndicator();
                          case ConnectionState.done:
                            return '완료'.text.size(30).white.bold.make();
                        }
                      },
                      stream: stream,
                    ),
                    BigButton(
                      '토스뱅크',
                      onTap: () async {
                        print('start');
                        final result = await Nav.push(NumberScreen());
                        print(result);
                        print('end');
                      },
                    ),
                    height10,
                    RoundedContainer(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        '자산'.text.bold.white.make(),
                        height5,
                        ...bankAccounts
                            .map((e) => BankAccountWidget(e))
                            .toList(),
                      ],
                    )),
                  ],
                ) //.pSymmetric(h: 20).animate().slideY(duration: 3000.ms).fadeIn(),
                ),
          ),
          const TtossAppBar()
        ],
      ),
    );
  }

  void showSnackbar(BuildContext context) {
    context.showSnackbar('snackbar 입니다.',
        extraButton: Tap(
          onTap: () {
            context.showErrorSnackbar('error');
          },
          child: '에러 보여주기 버튼'
              .text
              .white
              .size(13)
              .make()
              .centered()
              .pSymmetric(h: 10, v: 5),
        ));
  }

  Future<void> showConfirmDialog(BuildContext context) async {
    final confirmDialogResult = await ConfirmDialog(
      '오늘 기분이 좋나요?',
      buttonText: "네",
      cancelButtonText: "아니오",
    ).show();
    debugPrint(confirmDialogResult?.isSuccess.toString());

    confirmDialogResult?.runIfSuccess((data) {
      ColorBottomSheet(
        '❤️',
        context: context,
        backgroundColor: Colors.yellow.shade200,
      ).show();
    });

    confirmDialogResult?.runIfFailure((data) {
      ColorBottomSheet(
        '❤️힘내여',
        backgroundColor: Colors.yellow.shade300,
        textColor: Colors.redAccent,
      ).show();
    });
  }

  Future<void> showMessageDialog() async {
    final result = await MessageDialog("안녕하세요").show();
    debugPrint(result.toString());
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
