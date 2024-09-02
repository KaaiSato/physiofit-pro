#!/usr/bin/env bash
# exit on error
set -o errexit

# 正しいRubyバージョンを使用する
rbenv install -s 3.2.0  # Rubyのバージョンを指定

# Bundlerを最新バージョンに更新
gem install bundler

# 依存関係のインストール設定を変更
bundle config set --local deployment 'true'
bundle config set --local without 'development test'

# プラットフォームを追加
bundle lock --add-platform x86_64-linux

# 依存関係のインストール
bundle install

# アセットのプリコンパイルとデータベースマイグレーション
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
