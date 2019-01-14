<?php

	class SearchNewsController extends MainController {

		private $searchResultsView  = 'views/news/searchResults.tpl';
		private $currentView;
		private $currentData;

		public function __construct()
		{
			$this->currentView = $this->searchResultsView;
		}

		public function main($formData = null)
		{
			$this->currentData['SearchNewsController'] = new SearchNewsController();
			$this->currentData['searchResults'] = $this->searchAllNews($formData);

			if (!$this->currentData['searchResults']) {
				$this->currentView = parent::$homeView;
				$this->currentData['HeadlinesController'] = new HeadlinesController();
			}

			parent::renderView($this->currentView, $this->currentData);
		}

		private function searchAllNews($formData)
		{
			$results 		= false;
			$queryString 	= $this->createNewsSearchQueryString($formData);

			if ($queryString) {
				$results = $this->sendSearchEverythingAPICall($queryString);
			}

			return $results;
		}

		private function sendSearchEverythingAPICall($queryString)
		{
			$searchResults 	= false;
			$feed 			= file_get_contents($queryString);
			$count      	= 0;

			if ($feed) {
				$json = json_decode($feed);

				if ($json !== null) {

					//loop through each news article and retrieve the source, title and url
					foreach ($json->articles as $article) {
						$searchResults[$count]['totalResults'] 	= $json->totalResults;
						$searchResults[$count]['source']        = $article->source->name;
						$searchResults[$count]['title']        	= $article->title;
						$searchResults[$count]['url'] 			= $article->url;
						$searchResults[$count]['urlToImage'] 	= $article->urlToImage;
						$searchResults[$count]['description'] 	= $article->description;
						$searchResults[$count]['publishedAt'] 	= $article->publishedAt;
						$searchResults[$count]['author'] 		= $article->author;

						++$count;
					}
				}
			}

			return $searchResults;
		}

		private function createNewsSearchQueryString($formData = array()) {

			$isValidSearchQuery = false;
			$queryString 		= false;

			if ( isset($formData['query']) && $formData['query'] !='' && filter_var(trim($formData['query']), FILTER_SANITIZE_STRING) != false ) {
				$isValidSearchQuery 	= true;
				$queryString 			= JSON_FEED_URL.'everything?q='.urlencode(filter_var(trim($formData['query']), FILTER_SANITIZE_STRING)).'&apiKey='.API_KEY.'&pageSize='.PAGE_SIZE.'&language=en';

			}

			if ($isValidSearchQuery) {
				foreach ($formData as $key => $value) {
					switch ($key) {
						case 'sources':
							$queryString .= $this->getSourcesParameters($value);
							break;
						case 'domains' :
							$queryString .= $this->getDomainsParameters($value);
							break;
						case 'domainsExclude' :
							$queryString .= $this->getDomainsParameters($value, true);
							break;
						case 'dateFrom' :
							$queryString .= $this->getDateParameters('from', $value);
							break;
						case 'dateTo' :
							$queryString .= $this->getDateParameters('to', $value);
							break;
						case 'sortBy' :
							$queryString .= $this->getSortByParameters($value);
							break;
					}
				}
			}

			return $queryString;

		}

		private function getSourcesParameters($sources) {

			$parameters 			= false;
			$sourcesURLParameters 	= '';

			if ( isset($sources) && is_array($sources) && count($sources) >= 1 && count($sources) <= 20 ) {

				foreach ($sources as $key => $value) {
					$sourcesURLParameters.= ','.$value;
				}

				$parameters = '&sources='.ltrim($sourcesURLParameters,',');

			}

			return $parameters;

		}

		private function getDomainsParameters($domains, $exclude = false) {

			$parameters 			= false;
			$domainURLParameters 	= '';

			if ( isset($domains) && is_array($domains) && count($domains) >= 1 ) {

				foreach ($domains as $key => $value) {
					$domainURLParameters.= ','.$value;
				}

				$domainQueryString 	= ($exclude == true) ? '&excludeDomains=' : '&domains=';
				$parameters 		= $domainQueryString.ltrim($domainURLParameters,',');

			}
			return $parameters;

		}

		private function getDateParameters($datePeriod, $date) {

			$parameters = false;

			if ( ($datePeriod == 'from' || $datePeriod == 'to') && $date !='' && date('Y m d', strtotime($date)) ) {

				$dateQueryString 	= ($datePeriod == 'from') ? '&from=' : '&to=';
				$parameters 		= $dateQueryString.date('Y-m-d', strtotime($date));

			}

			return $parameters;

		}

		private function getSortByParameters($sortSearchResultsBy) {

			$parameters = false;

			if ( isset($sortSearchResultsBy) && $sortSearchResultsBy !='' ) {

				if ($sortSearchResultsBy != 'relevancy' && $sortSearchResultsBy != 'popularity' && $sortSearchResultsBy != 'publishedAt') {
					$sortSearchResultsBy = 'publishedAt';
				}

				$parameters = '&sortBy='.$sortSearchResultsBy;

			}

			return $parameters;

		}

	}