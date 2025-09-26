# ✅ MySQL 命名規則チェックリスト

### 📌 基本ルール

* [ ] **英小文字のみ**を使う
* [ ] **単語区切りはアンダースコア（snake_case）**
* [ ] **予約語は避ける**（例: `user`, `order`, `group` → `users`, `orders`, `user_groups`）

---

### 📌 テーブル名

* [ ] **複数形**を使う（例: `books`, `authors`, `orders`）
* [ ] 集合を表す名前にする（1レコード = 1つの要素）

---

### 📌 カラム名

* [ ] **単数形**を使う（例: `title`, `price`, `name`）
* [ ] 主キーは **`id`** に統一
* [ ] 外部キーは **`参照先テーブル名_singular_id`**（例: `author_id`, `book_id`）
* [ ] 日付・時刻は **`*_at`**（例: `created_at`, `updated_at`, `published_at`）
* [ ] 真偽値は **`is_*`**（例: `is_active`, `is_deleted`）

---

### 📌 例

```sql
CREATE TABLE books (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author_id INT NOT NULL,
  published_at DATE,
  is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE authors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  birth_date DATE
);
```

---

このチェックリストを守れば、
👉 バッククォート不要
👉 SQLがシンプルで読みやすい
👉 プロジェクト全体で統一感が出る

<!-- 修正時刻: Sat 2025/09/27 07:06:42 -->
