import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:provider/provider.dart';

import '../../../models/notification_reponse_model.dart';
import '../../../view_model/service_provider/get_notification_provider.dart';
import '../../tanamanku/screen/detail_tanaman_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: TextButton(
            style: ButtonStyle(
                overlayColor:
                    MaterialStatePropertyAll(primary.withOpacity(0.1))),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              color: Colors.black,
              FluentIcons.ios_arrow_ltr_24_filled,
            ),
          ),
          title: AutoSizeText(
            "Notifikasi",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            Consumer<GetNotificationProvider>(builder: (context, prov, _) {
              if (prov.notifications.isNotEmpty) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: TextButton(
                      onPressed: () {
                        if (prov.unreadNotifId.isNotEmpty) {
                          prov.readAllNotification();
                        }
                      },
                      child: const Icon(
                        Icons.drafts_outlined,
                        color: Colors.black54,
                      )),
                );
              }
              return const SizedBox.shrink();
            })
          ],
        ),
        body: Consumer<GetNotificationProvider>(builder: (context, prov, _) {
          if (prov.state == MyState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (prov.state == MyState.loaded) {
            if (prov.notifications.isEmpty) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/empty_nottif.svg',
                        width: MediaQuery.of(context).size.width * 0.65,
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        'Sepertinya kamu belum memiliki notifikasi',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: neutral[50],
                            ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount: prov.notifications.length,
              itemBuilder: (context, index) =>
                  NotficationListTileWidget(data: prov.notifications[index]),
            );
          } else {
            return Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  Icon(
                    Icons.sentiment_dissatisfied_outlined,
                    size: 40,
                    color: neutral[40]!,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Something went wrong",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: neutral[50]!,
                        ),
                  ),
                  TextButton(
                      onPressed: () {
                        context
                            .read<GetNotificationProvider>()
                            .getNotificationDataWithoutParam();
                      },
                      child: Text(
                        "Try Again?",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: neutral[70]!,
                            ),
                      ))
                ],
              ),
            );
          }
        }));
  }
}

class NotficationListTileWidget extends StatelessWidget {
  const NotficationListTileWidget({
    super.key,
    required this.data,
  });

  final NotificationResponseModel data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: LinearBorder.bottom(side: const BorderSide(color: Colors.black26)),
      onTap: () {
        context
            .read<GetNotificationProvider>()
            .readNotification(notifId: data.idNotif!);

        context
            .read<GetNotificationProvider>()
            .getNotificationDataWithoutParam();

        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (context) => DetailTanamanScreen(
                idTanaman: data.myplantId!,
                idDetailTanaman: data.plantId!,
                location: data.location!,
              ),
            ),
            (route) => route.isFirst);
      },
      splashColor: neutral[20]!.withOpacity(0.15),
      tileColor: data.readStatus == false ? primary[100] : neutral[10],
      leading: CircleAvatar(
        backgroundColor: primary[200],
        child: AutoSizeText(
          data.namaTanamanku![0].toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      title: AutoSizeText(
        data.namaTanamanku!,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: AutoSizeText(
        data.description!,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: neutral[50]),
      ),
    );
  }
}
