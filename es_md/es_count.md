curl -X GET "localhost:9200/product/_count?pretty" -H 'Content-Type: application/json' -d'
{
    "query" : {
        "term" : { "type" : "question_detail_zuoyebang" }
    }
}
'