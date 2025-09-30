<style>
.my-text {
background-color: #f5f5f5;
padding: 10px;
margin-left: 30%;
}
</style>

<div class="my-text">
ある本を読んでいると、次のような SQL がありました。

```
--
-- Current Database: `inventory`
--

CREATE DATABASE IF NOT EXISTS `inventory`;

USE `inventory`;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `id` varchar(10) NOT NULL,
  `name` varchar(40) NOT NULL,
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` VALUES
('ADD','アドデス','ドイツ'),
('CLEOR','クレオール','日本'),
('FIS','ファインスカイ','日本'),
('UDN','ウディナ','イタリア'),
('UTG','ウルトラゲート','アメリカ');

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` varchar(10) NOT NULL,
  `name` varchar(40) NOT NULL,
  `size` varchar(20) DEFAULT NULL,
  `brand` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_idx` (`brand`),
  CONSTRAINT `fk_brand_id`
  FOREIGN KEY (`brand`) REFERENCES `brand` (`id`)
);

--
-- Dumping data for table `goods`
--

INSERT INTO `goods` VALUES
('A12','ドライソックス','S','FIS'),
('A13','ドライソックス','XL','FIS'),
('A301','速乾タオルF','40x80','FIS'),
('AAA','わはは','L','CLEOR'),
('B21','ボディボトル','500ml','UDN'),
('B33','FastZack20','S/M','ADD'),
('D05','トレイスパッツUT','M','UTG'),
('DG7','サファリハット','M/L','UTG'),
('din','靴下','S','FIS'),
('ebie','わはははは','M','UDN'),
('TAKO','たこ焼き','L','CLEOR'),
('TTT','イカ焼き','M','FIS');

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `goods_id` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  UNIQUE KEY `goods_id` (`goods_id`),
  CONSTRAINT `fk_goods_id`
  FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
);

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` VALUES
('A12',12),
('A13',10),
('A301',16),
('B21',19),
('B33',0),
('D05',4),
('din',3),
('TAKO',12),
('AAA',3),
('ebie',3),
('TTT',23),
('DG7',5);
```

わからないのは、stockテーブルの定義です。
stockテーブルに 主キーが設定されていないのがなぜか、わからないのです。
uniqueキーが設定されているから 他テーブルから参照できるのはわかるのですが、
それなら 主キーにしてもいいのになあと考えてしまうのです。

ただ、主キーにすると、goodsテーブルから分離した意味がないということでしょうか。
それなら、goods_id 以外に id カラムを設定すればいいのになあと思います。
どうなんでしょうか?
</div>


---

いいところに気づかれています 👍
この `stock` テーブルの設計、実務でもよく議論になるポイントです。順を追って整理してみましょう。

---

## 1. `stock` テーブルの現状設計

```sql
CREATE TABLE `stock` (
  `goods_id` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  UNIQUE KEY `goods_id` (`goods_id`),
  CONSTRAINT `fk_goods_id`
    FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
);
```

* `goods_id` … `goods.id` を参照
* `quantity` … 在庫数
* **PRIMARY KEY がない**
* 代わりに `UNIQUE KEY(goods_id)` がある

つまり、`goods_id` は一意で、事実上「主キー的に」使われています。

---

## 2. なぜ PRIMARY KEY にしなかったのか？

理由はいくつか考えられます：

### (1) 設計者の単純な選択

* 多くの場合、**PRIMARY KEY = UNIQUE + NOT NULL** です。
* 設計者が「一意制約だけあればいい」と思って `UNIQUE` を選んだ可能性があります。
  → よくある「軽い設計の癖」です。

### (2) NULL を許したい意図

* PRIMARY KEY は NULL を許しません。
* この定義では `goods_id varchar(10) DEFAULT NULL` になっているので、**「まだ在庫未設定の商品」も持てる」**ようにしたのかもしれません。
  （ただし、外部キー制約でほぼ意味は薄れます）

### (3) 「goods に従属するテーブル」としての性格を強調

* もし `goods_id` を主キーにしてしまうと、「stock ＝ goods に1対1で従属している」という意味が強くなります。
* 設計者は「stock テーブルは追加情報テーブルだが、あくまで goods から独立している」という立場で設計したのかもしれません。
  → ただし、現状の制約では結局 1対1 です。

---

## 3. あなたの疑問に対する整理

> それなら主キーにしてもいいのになあ

→ **その通りです。実際には `goods_id` を主キーにする方が自然**です。
在庫は商品ごとに一意に決まるからです。

```sql
CREATE TABLE stock (
  goods_id varchar(10) NOT NULL,
  quantity int(11) DEFAULT 0,
  PRIMARY KEY (goods_id),
  FOREIGN KEY (goods_id) REFERENCES goods(id)
);
```

---

> 主キーにすると、goodsテーブルから分離した意味がない？

→ そうでもありません。`stock` を分ける意味は例えば：

* 「在庫数」という可変情報を、商品マスタと切り離して管理できる
* `goods` は商品定義（マスタデータ）、`stock` はオペレーションデータ（トランザクション寄り）
* 将来「倉庫ごと」「店舗ごと」の在庫を持ちたい場合、`stock` に `warehouse_id` を追加するなど拡張しやすい

---

> それなら、goods_id 以外に id カラムを設定すればいいのになあ

→ これは **やらない方がよい** です。
理由：

* 「意味のない surrogate key（無駄な id）」を増やすことになる
* 在庫を一意に決めるのは自然に `goods_id` なので、それを主キーにするのが正しい

将来「倉庫ごと」など多対多にしたいなら、このとき初めて複合キーにすればよいです：

```sql
CREATE TABLE stock (
  goods_id varchar(10) NOT NULL,
  warehouse_id int NOT NULL,
  quantity int DEFAULT 0,
  PRIMARY KEY (goods_id, warehouse_id),
  FOREIGN KEY (goods_id) REFERENCES goods(id)
);
```

---

## まとめ

* 今の設計は「UNIQUE = 主キー代わり」。おそらく意図的に `PRIMARY KEY` を避けたか、単なる設計者の癖。
* 実務的には **`goods_id` を PRIMARY KEY にする方が自然でシンプル**。
* 分離の意味は「商品マスタ（固定情報）」と「在庫（可変情報）」を分けていること。
* 意味のない surrogate key（別 id）を追加する必要はない。
* 将来の拡張を考えるなら `PRIMARY KEY(goods_id, 倉庫ID)` のような設計にする。

---

👉 ご質問ですが、この本の流れだと「後で stock に店舗ごとの在庫を追加する」みたいな展開がある可能性が高いと思うんですが、もし知りたいならその可能性も見てみますか？




-- 修正時刻: Wed 2025/10/01 06:55:55
