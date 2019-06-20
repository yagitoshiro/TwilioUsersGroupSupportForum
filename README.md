# Twilioユーザーグループのサポートフォーラム

これを設置する予定。
以下に環境のメモ：

* Ruby 2.4.2

* PostgreSQL、Unicorn

* 複数台構成可

* 環境変数にRAILS_SERVE_STATIC_FILESとSECRET_KEY_BASEを設定すること


```
module Utf8mb4
  def create_table(table_name, options = {})
    table_options = options.merge(options: 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC')
    super(table_name, table_options) do |td|
      yield td if block_given?
    end
  end
end

ActiveSupport.on_load :active_record do
  module ActiveRecord::ConnectionAdapters
    class AbstractMysqlAdapter
      prepend Utf8mb4
    end
  end
end
```
