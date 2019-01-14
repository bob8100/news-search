<?php

    class HeadlinesController extends MainController
    {
        /**
         * getNewsHeadlinesBySource
         *
         * @param mixed $source
         * @param mixed $limit
         * @return void
         */
        public function getNewsHeadlinesBySource($source, $limit = 5)
        {
            // list of news sources: https://newsapi.org/sources

            $queryString 	= JSON_FEED_URL.'top-headlines?sources='.$source.'&apiKey='.API_KEY;
            $newsHeadlines 	= $this->sendHeadlinesAPICall($queryString, $limit);

            return $newsHeadlines;
        }

        /**
         * getNewsHeadlinesByCategory
         *
         * @param mixed $category
         * @param mixed $limit
         * @return void
         */
        public function getNewsHeadlinesByCategory($category, $limit = 5)
        {
            $queryString    = JSON_FEED_URL.'top-headlines?country=ie&category='.$category.'&apiKey='.API_KEY;
            $newsHeadlines 	= $this->sendHeadlinesAPICall($queryString, $limit);

            return $newsHeadlines;
        }

        /**
         * sendHeadlinesAPICall
         *
         * @param mixed $queryString
         * @param mixed $limit
         * @return void
         */
        private function sendHeadlinesAPICall($queryString, $limit)
        {
            $headlines 	= false;
            $feed 		= @file_get_contents($queryString);
            $count      = 0;

            if ($feed) {
                $json = json_decode($feed);

                if ($json !== null) {

                    //loop through each news article and retrieve the source, title and url
                    foreach ($json->articles as $article) {
                        $headlines[$count]['source']        = $article->source->name;
                        $headlines[$count]['title']        	= $article->title;
                        $headlines[$count]['url'] 			= $article->url;
                        $headlines[$count]['urlToImage'] 	= $article->urlToImage;
                        $headlines[$count]['description'] 	= $article->description;

                        ++$count;

                        if ($count == $limit) {
                            break;
                        }
                    }
                }
            }

            return $headlines;
        }
    }