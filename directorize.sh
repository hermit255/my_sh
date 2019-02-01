EXTENSION=".php"
for file in `\find . -maxdepth 1 -type f`; do
  # 拡張子を抜いた同名フォルダを作成する
  echo $file | sed 's/'$EXTENSION'//g' | sed 's/^/mkdir /g' | sh -x
  # 同名フォルダにファイルを移動して default.php にリネームする
  echo $file | sed 's/'$EXTENSION'//g' | sed 's:^:mv '$file' :g' | sed 's:$:\/default.php:g'| sh -x
done
