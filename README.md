# ヤ●ハルータからの挑戦！ルーティングの背後に隠された悪意

## ストーリー
2024年、あるネットワークエンジニア（あなた）は、突如として会社の危機に直面する。同僚のネットワークエンジニアが不可解な形で、黄泉へ旅立ってしまったのだ。

ある日、同僚が残した「Yam●ha Router RTX1210」に「プログラム(=遺言)」を発見したあなたは、「ダイイング・メッセージが示す謎」を紐解くために、RTX1210にRJ45の青いコンソールケーブル（通称: きしめんケーブル）を繋ぐのであった。

![スクリーンショット](https://ggjv4.s3.us-west-1.amazonaws.com/files/styles/flexslider_full/s3/games/2024/195887/screenshot/スクリーンショット%202024-01-28%2015.56.47.png?VersionId=2x7y9WwL5ljRMH.p.Xsut_Ss8I_8Wk_f&itok=PUiRxe85 )

## ゲームについて
このゲームはヤ●ハルータを触ったことがある、初心者🔰ネットワークエンジニア/インフラエンジニア向けの「謎解き風ゲーム」です。
USBメモリをルータに指して、指定のコマンドを押してください。

- 本番環境のルータで遊ばないでください。（コマンドを実行しますので、責任を取れません。仕事を辞めたいのであれば、別の方法をおすすめします）
- ヤマ●VPNルータ（RTX1210やRTX830など）であれば動作すると思います。もし動かなければGitHubでトラブルチケット（イシュー）の起票をお願いします。
- USBメモリは空っぽのものを利用してください。
- このゲームは「実在の製品を出している企業」とは「一切、なんら関係のない」第三者が作成しています。

## 使用している製品と技術について
- ヤマハVPNルータ - RTX 1210
- Lua

## 遊ぶには、以下のコマンドを実行してください

1) ZIPで圧縮されたファイルを全てUSBメモリに展開してください
2) RTX1210のUSBポートに「USBメモリ」を接続してください
3) 管理者モード(administrator)に入ってください
4) 以下のコマンドを実行してください
   > lua usb1:/01_init_game.lua

### スペシャルサンクス
[グローバルゲームジャム 瀬戸内会場 in 広島](https://globalgamejam.org/jam-sites/2024/laihuneihuichang-guangdao) の皆さん


#### ライセンス: [ Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)][license-link]
#### [GGJの法的とポリシー情報][ggj-legal-link]

   [license-link]: <https://creativecommons.org/licenses/by-nc-sa/4.0/>
   [ggj-legal-link]: <https://globalgamejam.org/legal-policies>