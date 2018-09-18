curl -X GET "localhost:8000/xueersi_rec/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "size": 0,
  "aggs": {
    "group_by_state": {
      "terms": {
        "field": "subject_id"
      }
    }
  }
}
'


curl -X GET "localhost:8000/qs_index_002/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "size": 0,
  "aggs": {
    "group_by_state": {
      "terms": {
        "field": "type"
      }
    }
  }
}
'
