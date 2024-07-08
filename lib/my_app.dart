import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter/utils/keys/navigator_keys.dart';
import 'package:mobile_flutter/utils/widget/snackbar_custom/snackbar_cutom.dart';
import 'package:mobile_flutter/view_model/artikel_viewmodel/get_article_lastest_provider.dart';
import 'package:mobile_flutter/view_model/artikel_viewmodel/get_article_liked_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_all_products_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_article_trending_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_avalilable_plants_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_fertilizing_article_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_my_plants_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_notification_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_plant_details.dart';
import 'package:mobile_flutter/view_model/service_provider/get_plant_location_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_planting_article_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_temperature_article_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_watering_article_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_weather_article_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_weather_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/post_add_myplant_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/get_profile_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_fertilizing.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_watering.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/edit_progres_mingguan_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/progres_provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/carimenu_provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/dashboard_toko_provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/deskripsi_provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/kategori_provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/search_provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/carousel_provider.dart';
import 'package:mobile_flutter/utils/themes/theme.dart';
import 'package:mobile_flutter/utils/widget/bottom_navbar/custom_navbar_provider.dart';
import 'package:mobile_flutter/view/splash/splash_screen.dart';
import 'package:mobile_flutter/view_model/artikel_viewmodel/artikel_detail_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/forgot_password_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/login_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/register_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/shared_preferences_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/validator_aunt_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/email_kami_provider.dart';
import 'package:mobile_flutter/view_model/dashboard_viewmodel/tambahkan_tanaman_provider.dart';
import 'package:mobile_flutter/view_model/home_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/masukan_saran_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/profile_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/setting_validator_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/statistik_penanaman_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_progress_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/ubah_kata_sandi_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/ubah_nama_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_panen_mati_provider.dart';
import 'package:mobile_flutter/view_model/dashboard_viewmodel/dashboard_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/overview_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/plant_gridview_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/detail_progress_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/edit_nama_tanaman_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/tanamanku_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomNavbarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UbahNamaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UbahKataSandiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => StatistikaPenanamanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EmailKamiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MasukanSaranProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ValidatorProvider(),
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TanamankuProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlantGridviewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditNamaTanamanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailProgressProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddProgressProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SharedPreferencesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgotPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarouselProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingValidatorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TambahkanTanamanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ArtikelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OverviewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddPanenMatiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditProgresMingguanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetWeatherProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetMyPlantsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetTrendingArticleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetPlantingArticleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetAvailablePlantsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetPlantDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostAddMyPlantProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetPlantLocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetAllProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetWateringArticleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetTemperatureArticleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetFertilizingArticleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddFertilizingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddWateringProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProgresProvider(),
        ),
        ChangeNotifierProvider(
            create: (context) => GetWeatherArticleProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => TokoProvider()),
        ChangeNotifierProvider(create: (context) => CurrentProductProvider()),
        ChangeNotifierProvider(create: (context) => KategoriProvider()),
        ChangeNotifierProvider(
          create: (context) => GetArticleLatestProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetArticleLikedProvider(),
        ),
        ChangeNotifierProvider(create: (context) => SnackbarCustomProvider()),
        ChangeNotifierProvider(create: (context) => GetNotificationProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Agriplan - App',
        theme: agriplantLight,
        home: const SplashScreen(),
        navigatorKey: navigatorKeys,
        // routes: {
        //   // Routes.detailTanamankuPage: (BuildContext context) =>
        //   //     const DetailTanamanScreen(),
        // },
      ),
    );
  }
}
