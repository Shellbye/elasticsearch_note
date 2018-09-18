curl -X PUT "localhost:9200/question_video004?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "doc": {
            "properties": {
                "id": {
                    "type": "keyword"
                },
                "grade_name": {
                    "type": "keyword"
                },
                "subject_name": {
                    "type": "keyword"
                },
                "pic_url": {
                    "type": "keyword"
                },
                "mtime_format": {
                    "type": "keyword"
                },
                "ocr": {
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
                    "type": "custom",
                    "char_filter": [
                        "my_char_filter"
                    ]
                }
            },
            "tokenizer": {
                "my_tokenizer": {
                    "min_gram": 1,
                    "max_gram": 2,
                    "token_chars": ["letter", "digit", "symbol", "punctuation"],
                    "type": "ngram"
                }
            },
            "char_filter": {
                "my_char_filter": {
                  "type": "mapping",
                  "mappings": [
                    "&lt; => <",
                    "&gt; => >",
                    "&amp; => &"
                  ]
                }
            }
        }
    }
}
'