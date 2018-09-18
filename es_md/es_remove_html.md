curl -X PUT "localhost:8000/my_index" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "analysis": {
      "analyzer": {
        "my_analyzer": {
          "tokenizer": "keyword",
          "char_filter": ["my_char_filter"]
        }
      },
      "char_filter": {
        "my_char_filter": {
          "type": "html_strip",
          "escaped_tags": ["b"]
        }
      }
    }
  }
}
'


curl -X POST "localhost:8000/my_index/_analyze" -H 'Content-Type: application/json' -d'
{
  "analyzer": "my_analyzer",
  "text": "<p>I&apos;m so <b>happy</b>!</p>"
}
'
