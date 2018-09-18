curl -X PUT "localhost:8000/demo_index004?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "doc": {
            "properties": {
                "name": {
                    "type": "keyword"
                },
                "ocr": {
                    "analyzer": "my_analyzer",
                    "type": "text"
                },
                "qus": {
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