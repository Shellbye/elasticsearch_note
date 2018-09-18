curl -X POST "localhost:9200/question_index/_doc/this_id_can_be_any_thing/_update?pretty" -H 'Content-Type: application/json' -d'
{
  "doc": {
      "id": "10002",
      "subject": "math",
      "question": "calculate 1+22223333"
    }
}
'