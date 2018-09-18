curl -X PUT "localhost:9200/xueersi_rec_sync002?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "doc": {
            "properties": {
                "que_id": {
                    "type": "keyword"
                },
                "knowledge_1": {
                    "type": "keyword"
                },
                "knowledge_2": {
                    "type": "keyword"
                },
                "knowledge_3": {
                    "type": "keyword"
                },
                "knowledge_4": {
                    "type": "keyword"
                },
                "knowledge_5": {
                    "type": "keyword"
                },
                "grade_group_id": {
                    "type": "keyword"
                },
                "difficulty": {
                    "type": "keyword"
                },
                "subject_id": {
                    "type": "keyword"
                },
                "content": {
                    "analyzer": "my_analyzer",
                    "type": "text"
                }
            }
        }
    },
    "settings": {
        "analysis": {
            "analyzer": {
                "my_analyzer": {
                    "tokenizer": "my_tokenizer",
                    "type": "custom"
                }
            },
            "tokenizer": {
                "my_tokenizer": {
                    "min_gram": 1,
                    "max_gram": 2,
                    "token_chars": ["letter", "digit", "symbol", "punctuation"],
                    "type": "ngram"
                }
            }
        }
    }
}
'