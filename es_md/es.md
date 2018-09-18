# ES
```
curl http://127.0.0.1:9200/_cat/indices

curl http://127.0.0.1:9200/xueersi_rec1/_mappings/?pretty

curl -XDELETE 'http://127.0.0.1:9200/xueersi_rec1?pretty'

curl http://127.0.0.1:9200/xueersi_rec/_search

curl 'http://127.0.0.1:9200/_cat/aliases'

curl -XPOST http://127.0.0.1:9200/_aliases?pretty -H 'Content-Type: application/json' -d'
{
    "actions" : [
        { "add" : { "index" : "qs_index_003", "alias" : "product" } }
    ]
}
'

curl -XPOST http://127.0.0.1:9200/_aliases?pretty -H 'Content-Type: application/json' -d'
{
    "actions" : [
        { "remove" : { "index" : "qs_index_001", "alias" : "product" } }
    ]
}
'
```

# 查看当前各个进程的统计值
# https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-thread-pool.html
curl localhost:9200/_cat/thread_pool?h=h,name,active,rejected,completed,ma,l,qs

# 查看集群健康状态
curl 'localhost:9200/_cluster/health?pretty'

# 进行一次真对题干的查询
curl -X GET 'localhost:8000/qs_index_002/_search?pretty' -H 'Content-Type: application/json' -d' { "size":1, "query" : { "match" : { "question" : "三角" } } } '
curl -X GET 'localhost:9200/question_video001/_search?pretty' -H 'Content-Type: application/json' -d' { "size":1, "query" : { "match" : { "id" : "1" } } } '
