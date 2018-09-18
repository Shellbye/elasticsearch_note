curl -X POST "localhost:9200/product/_delete_by_query?pretty" -H 'Content-Type: application/json' -d'
{
    "query" : {
        "term" : { "type" : "question_detail_zuoyebang" }
    }
}
'