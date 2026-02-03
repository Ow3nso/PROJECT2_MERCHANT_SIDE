import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/user_account_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show ReadContext;

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({
    super.key,
  });
  static const routeName = 'progress';

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<SignUpFlowController>().context = context;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset(
                    'assets/images/shoes.png',
                    package: AuthConstants.pluginName,
                  )),
              Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    'assets/images/dress.png',
                    package: AuthConstants.pluginName,
                  )),
              Positioned(
                  left: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/jeans.png',
                    package: AuthConstants.pluginName,
                  )),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/jacket.png',
                    package: AuthConstants.pluginName,
                  )),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StepTitle(
                      title:
                          'Hang on, ${context.read<SignUpFlowController>().name}',
                    ),
                    const StepSubTitle(
                        subTitle: 'We are getting everything ready for you!'),
                    AnimatedBuilder(
                        animation: context.read<SignUpFlowController>(),
                        builder: (_, c) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: LinearProgressIndicator(
                                        minHeight: 8,
                                        backgroundColor:
                                            AuthConstants.progressBackground,
                                        color: AuthConstants.progressBlues,
                                        value: context
                                                .read<SignUpFlowController>()
                                                .progress /
                                            100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${context.read<SignUpFlowController>().progress.ceil()}%',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AuthConstants.gray90),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
