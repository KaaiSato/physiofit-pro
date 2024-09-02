#!/usr/bin/env bash
# exit on error
set -o errexit

# 正しいRubyバージョンを使用する
# (デプロイ環境でRubyが正しく設定されている場合はこの行は不要)
# rbenv install -s 3.2.0

# Bundlerを最新バージョンに更新
gem install bundler

# 依存関係のインストール
bundle install --deployment --without development test

# アセットのプリコンパイルとクリーンアップ
bundle exec rake assets:precompile
bundle exec rake assets:clean

# データベースのマイグレーション
bundle exec rake db:migrate