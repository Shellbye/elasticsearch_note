curl -X PUT "localhost:9200/qs_index_001?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "doc": {
            "properties": {
                "id": {
                    "type": "keyword"
                },
                "origin": {
                    "type": "keyword"
                },
                "subject": {
                    "type": "keyword"
                },
                "difficulty": {
                    "type": "keyword"
                },
                "question": {
                    "analyzer": "my_analyzer",
                    "type": "text"
                },
                "type": {
                    "type": "keyword"
                }
            }
        }
    },
    "settings": {
        "analysis": {
            "analyzer": {
                "my_analyzer": {
                    "tokenizer": "my_tokenizer",
                    "char_filter": ["my_char_filter"],
                    "type": "custom"
                }
            },
            "char_filter": {
                "my_char_filter": {
                    "type": "html_strip"
                }
            },
            "tokenizer": {
                "my_tokenizer": {
                    "min_gram": 2,
                    "max_gram": 2,
                    "token_chars": ["letter", "digit", "symbol", "punctuation"],
                    "type": "ngram"
                }
            }
        }
    }
}
'