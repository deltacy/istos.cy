class CreateGreekBeforeLatinCollation < ActiveRecord::Migration[7.0]
  def change
    execute "CREATE COLLATION latinlast (provider = icu, locale = 'en@colReorder=grek-latn');"
  end
end
