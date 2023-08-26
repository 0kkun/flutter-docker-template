import 'package:flutter/material.dart';
import 'package:workspace/screens/root.dart';
import 'package:workspace/widjets/banana_counter.dart';
import 'package:logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workspace/models/tweet.dart';
import 'package:workspace/screens/sample_screen.dart';
import 'package:workspace/widjets/side_menu.dart';
import 'package:workspace/widjets/tweet_widjet.dart';
import 'package:workspace/app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:workspace/screens/toggle_screen.dart';
import 'package:workspace/screens/checkbox_screen.dart';
import 'package:workspace/screens/progress_screen.dart';
import 'package:workspace/screens/freezed_screen.dart';
import 'package:workspace/screens/carousel_screen.dart';
import 'package:flutter/services.dart'; // これを書くとStubが使える
import 'package:flutter/foundation.dart';
import 'package:workspace/screens/google_font_screen.dart';
import 'package:workspace/screens/accordion_screen.dart';
import 'package:workspace/services/json_service.dart';
import 'package:device_preview_minus/device_preview_minus.dart';


final logger = Logger();

void main() {
  // NOTE: flutterでは全てがwidgetと呼ぶ (Text, Scaffroldなど)
  // NOTE: 変数：基本はconstを使った方がアプリが軽くなる。新しいwidgetを使用する時はconstが使えない時があるので、finalを使う必要がある

  // ******************************************
  // ** Hello world! **
  const app1 = MaterialApp(
    // Scaffold : 画面を作りたい時に使う
    home: Scaffold(
      body: Center(
        child: Text('Hello world!')
      ),
    ),
  );

  // ******************************************
  // ** 要素を並べる **
  // 縦に並べる
  const col = Column(
    // 上下方向の設定
    mainAxisAlignment: MainAxisAlignment.center,
    // 横方向の設定
    crossAxisAlignment: CrossAxisAlignment.center,
    // 余白の設定
    mainAxisSize: MainAxisSize.min,
    // 並べる要素
    children: [
      Text('りんご'),
      Text('レモン'),
      Text('ぶどう'),
    ]
  );

  const app2 = MaterialApp(
    // Scaffold : 画面を作りたい時に使う
    home: Scaffold(
      body: Center(
        child: col
      ),
    ),
  );

  // ******************************************
  // ** 画像の表示 **
  // 2パターンやり方ある
  const chopperImage = AssetImage('images/chopper.jpeg');
  final chopperImage2 = Image.asset('images/chopper.jpeg');

  const col2 = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image(image: chopperImage),
    ],
  );

  final col3 = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      chopperImage2,
    ],
  );

  final app3 = MaterialApp(
    home: Scaffold(
      body: Center(
        child: col3
      ),
    ),
  );

  // ******************************************
  // ** コンテナ **
  final testContainer = Container(
    color: Colors.deepOrange,
    width: 500,
    height: 600,
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.all(20),
    child: const Image(image: chopperImage),
  );

  final app4 = MaterialApp(
    home: Scaffold(
      body: Center(
        child: testContainer
      ),
    ),
  );

  // ******************************************
  // ** ステートレスウィジェット **
  const bananaCounter = BananaCounter(number: 12);

  const app5 = MaterialApp(
    home: Scaffold(
      body: Center(
        child: bananaCounter
      ),
    ),
  );

  // ******************************************
  // ** ボタン **
  // Flat、Raised、Outlineボタンは古いやつなので使わないように！
  // Text、Elevated、Outlinedがある
  test() {
    // print('関数が実行されました');
    // log('関数が実行されました');
    logger.v('関数が実行されました。');
    // logger.d(1000);
    // logger.i(true);
    // logger.w([1, 2, 3]);
    // logger.e({'key': 'key', 'value': 'value'});
    // logger.wtf(Exception('例外もいけます'));
    // logger.i(() => '関数もいけます');
  }

  final button1 = ElevatedButton(
    onPressed: test, // nullにすると押せないボタンになる
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
    ),
      child: const Text('ボタンテスト'),
  );

  final button2 = OutlinedButton(
    onPressed: test,
    child: const Text('ボタンテスト')
  );

  final button3 = TextButton(
    onPressed: test,
    child: const Text('ボタンテスト')
  );


  final app6 = MaterialApp(
    home: Scaffold(
      body: Center(
        child: button1
      ),
    ),
  );

  // ******************************************
  // ** controller **
  final controller = TextEditingController();

  // ** input **
  final textField = TextField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'カタカナで入力してください',
      labelText: 'あなたの名前',
      errorText: '長すぎます',
    ),
  );

  test2 () {
    logger.v(controller.text);
  }

  final button4 = ElevatedButton(
    onPressed: test2,
    child: const Text('submit'),
  );

  final app7 = MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 300,
              child: textField,
            ),
            button4,
          ],
        )
      ),
    ),
  );

  // ******************************************
  // ** riberpod **
  // 最新のデータをずれなく表示することができる。状態管理のライブラリ。
  const app8 = MaterialApp(home: Sample());

  // プロバイダースコープで囲む
  const scopedApp = ProviderScope(child: app8);

  // スコープで囲まれたアプリを動かす
  // runApp(scopedApp);

  // ******************************************
  // ** 無限スクロールと仮想スクロール (ListView) **

  // モデルを作成
  final tweetModels = [
    Tweet('ルフィ', 'banana.jpeg', '頑張る', '2023/08/21'),
    Tweet('チョッパー', 'chopper.jpeg', 'こんにちは', '2023/08/21'),
    Tweet('ナミ', 'banana.jpeg', 'がんばれ', '2023/08/21'),
    Tweet('ナミ', 'banana.jpeg', 'がんばれ', '2023/08/21'),
    Tweet('ルフィ', 'banana.jpeg', '頑張る', '2023/08/21'),
    Tweet('チョッパー', 'chopper.jpeg', 'こんにちは', '2023/08/21'),
    Tweet('ナミ', 'banana.jpeg', 'がんばれ', '2023/08/21'),
    Tweet('ナミ', 'banana.jpeg', 'がんばれ', '2023/08/21'),
    Tweet('ルフィ', 'banana.jpeg', '頑張る', '2023/08/21'),
    Tweet('チョッパー', 'chopper.jpeg', 'こんにちは', '2023/08/21'),
    Tweet('ナミ', 'banana.jpeg', 'がんばれ', '2023/08/21'),
    Tweet('ナミ', 'banana.jpeg', 'がんばれ', '2023/08/21'),
    Tweet('ルフィ', 'banana.jpeg', '頑張る', '2023/08/21'),
    Tweet('チョッパー', 'chopper.jpeg', 'こんにちは', '2023/08/21'),
    Tweet('ナミ', 'banana.jpeg', 'がんばれ', '2023/08/21'),
    Tweet('ナミ', 'banana.jpeg', 'がんばれ', '2023/08/21'),
  ];

  // ツイートウィジェットのリストを生成する
  final list = ListView.builder(
    itemCount: tweetModels.length,
    itemBuilder: (context, index) => tweetWidget(tweetModels[index])
  );

  // 画面
  final screen1 = Scaffold(body: list);

  // アプリ
  final app9 = MaterialApp(home: screen1);

  // 起動
  // runApp(app9);

  // ******************************************
  // ** ページ遷移 **
  // go_routerを使用した例
  // const app10 = App();
  // usePathUrlStrategy();
  // runApp(app10);

  // ******************************************
  // ** ドロワー **
  final appBar = AppBar(
    title: const Text('appBar'),
  );

  const drawer = Drawer(
    child: SideMenu(),
  );

  const endDrawer = Drawer(
    child: SideMenu(),
  );

  const body = Center(
    child: Text('body'),
  );

  // フローティングアクションボタン (FAB)
  final fab = FloatingActionButton(
    onPressed: () {
      debugPrint('FAB が押されました');
    },
    child: const Text('FAB'),
  );

  final scaffold = Scaffold(
    appBar: appBar, // アップバー
    drawer: drawer, // ドロワー 左側に置く
    // endDrawer: endDrawer, // エンドドロワー。右側に置きたい時はこれ
    floatingActionButton: fab, // フローティングアクションボタン (FAB)
    body: body, // ボディ
  );

  final app11 = MaterialApp(
    // 右上の「DEBUG」という文字が消せる
    debugShowCheckedModeBanner: false,
    home: scaffold,
  );

  // runApp(app11);

  // ******************************************
  // ** ボトムナビゲーションバー **
  const app12 = MaterialApp(home: Root());

  // プロバイダースコープでアプリを囲む
  const scope = ProviderScope(child: app12);
  // runApp(scope);

  // ******************************************
  // ** スイッチウィジェット **
  const app13 = MaterialApp(home: ToggleScreen());
  const scope2 = ProviderScope(child: app13);
  // runApp(scope2);

  // ******************************************
  // ** ラジオボタン **
  const app14 = MaterialApp(home: CheckboxScreen());
  const scope3 = ProviderScope(child: app14);
  // runApp(scope3);

  // ******************************************
  // ** プログレスサークル **
  const app15 = MaterialApp(home: ProgressScreen());
  const scope4 = ProviderScope(child: app15);
  // runApp(scope4);

  // ******************************************
  // ** freezed **
  const app16 = MaterialApp(home: FreezedScreen());
  const scope5 = ProviderScope(child: app16);
  // runApp(scope5);

  // ******************************************
  // ** カルーセル (横方向の移動ができる。メリーゴーランド) **
  const app17 = MaterialApp(home: CarouselScreen());
  // runApp(app17);

  // ******************************************
  // ** jsonの扱い **
  // test5();
  // runApp(app17);

  // ******************************************
  // ** google font **
  // OFL を守るために このコードが必要
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString(
      'google_fonts/OFL.txt',
    );
    yield LicenseEntryWithLineBreaks(
      ['google_fonts'],
      license,
    );
  });

  const app18 = MaterialApp(home: GoogleFontPage());
  // runApp(app18);

  // ******************************************
  // ** アコーディオン **

  // アプリ
  const app19 = MaterialApp(home: AccordionScreen());
  // runApp(app19);

  // ******************************************
  // ** デバイスプレビュー **

  const devicePreviewBody = Center(
    child: Text('body'),
  );

  final devicePreviewSc = Scaffold(
    appBar: appBar, // アップバー
    drawer: drawer, // ドロワー 左側に置く
    floatingActionButton: fab, // フローティングアクションボタン (FAB)
    body: devicePreviewBody, // ボディ
  );

  final app20 = MaterialApp(
    home: devicePreviewSc,
  );

  final scope20 = ProviderScope(child: app20);

  // android studioとかで起動すると画面が見にくくなってしまうのでwebビューの時だけ起動する
  if (kIsWeb) {
    final devicePreview = DevicePreview(builder: (_) => scope20);
      runApp(devicePreview);
  } else {
    runApp(scope20);
  }
}