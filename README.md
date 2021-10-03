# Dkronでスケジュール実行
# 本来は分散起動するんだが、面倒なのでdockerコマンドを直叩けるようにした。
[参考](https://qiita.com/ranran/items/6f5e4e7f13e03d6b6416)

# dockerクライアントを仕込んだDkronイメージ作成
docker build ./ -t ranran9g/dkron

# dockerのsockをマウントしつつ、Dkronを起動
docker run --name dkron -d -p 8080:8080 -d --restart=always -v dkron.data:/dkron.data -v /var/run/docker.sock:/var/run/docker.sock   ranran9g/dkron agent --server --bootstrap-expect=1  --data-dir=/dkron.data --node-name=node1  

# guiで確認する場合のURL
http://localhost:8080/ui/#/

# API経由でジョブ登録する
# hostからlocalhost指定する場合(nodejsのhttp.requestになる想定)
json="{\"id\":\"${unique_id}\",\"name\":\"${name}\",\"displayname\":\"${name}\",\"timezone\":\"\",\"schedule\":\"${cron_str}\",\"owner\":\"\",\"owner_email\":\"\",\"disabled\":false,\"tags\":null,\"metadata\":null,\"retries\":0,\"dependent_jobs\":null,\"parent_job\":\"\",\"processors\":{},\"concurrency\":\"forbid\",\"executor\":\"shell\",\"executor_config\":{\"command\":\"docker run helloworld\"}}"
curl localhost:8080/v1/jobs -XPOST -d "$json"
