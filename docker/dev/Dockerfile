# Node.jsダウンロード用ビルドステージ
FROM ruby:3.0.0
WORKDIR /tmp
# Node.jsのダウンロード
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -

# packageのインストール
RUN apt-get update && apt-get install -y nodejs
RUN npm install -g yarn
