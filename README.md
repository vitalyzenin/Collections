# Project info

* This is the course project within the educational course of Itransition company.

* It is the standard Ruby on Rails project. You can get it up and running just as for any other Rails project (excluding search option)

* [Elasticsearch](https://www.elastic.co/) is used as search engine. [Searchkick](https://github.com/ankane/searchkick) (v. 4.3.0) gem has been used to implement functionality for Ruby on Rails. It is necessary to have separate server where elasticsearch will be running, performing searches and updating indexes. Locally I used version 7.6.2 (elasticsearch can be installed accordingly to [this link](https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html)). I used addon [bonsai elasticsearch](https://devcenter.heroku.com/articles/bonsai) for the demo version of project deployed on heroku. Note, that you also need to index Item model before the very first start of application or after changing search_data and searchkick methods (`Item.reindex`).

* Rails version 6.0.2.1

* Ruby version 2.6.5
