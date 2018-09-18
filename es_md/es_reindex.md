curl -X POST "localhost:9200/_reindex?pretty" -H 'Content-Type: application/json' -d'
{
  "source": {
    "index": "qs_index_002"
  },
  "dest": {
    "index": "qs_index_001"
  }
}
'