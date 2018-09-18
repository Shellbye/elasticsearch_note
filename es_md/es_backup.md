# https://www.elastic.co/guide/en/elasticsearch/reference/6.2/modules-snapshots.html




curl -X PUT "localhost:9200/_snapshot/my_backup?pretty" -H 'Content-Type: application/json' -d'
{
  "type": "fs",
  "settings": {
    "location": "/data/es_backup"
  }
}
'





curl -X GET "localhost:9200/_snapshot/my_backup?pretty"





curl -X PUT "localhost:9200/_snapshot/my_backup/snapshot_1?wait_for_completion=true&pretty"





curl -X PUT "localhost:9200/_snapshot/my_backup/snapshot_2?wait_for_completion=true&pretty" -H 'Content-Type: application/json' -d'
{
  "indices": "index_1,index_2",
  "ignore_unavailable": true,
  "include_global_state": false
}
'




curl -X GET "localhost:9200/_snapshot/my_backup/snapshot_1?pretty"




curl -X POST "localhost:9200/_snapshot/my_backup/snapshot_1/_restore?pretty"




curl -X POST "localhost:9200/_snapshot/my_backup/snapshot_1/_restore?pretty" -H 'Content-Type: application/json' -d'
{
  "indices": "index_1,index_2",
  "ignore_unavailable": true,
  "include_global_state": true,
  "rename_pattern": "index_(.+)",
  "rename_replacement": "restored_index_$1"
}
'
