<?php

    class MainController
    {
        private $header    = 'views/header.tpl';
        private $footer    = 'views/footer.tpl';
        private $currentView;
        private $currentData;

        protected static $homeView  = 'views/news/home.tpl';

        public function __construct()
        {
            $this->currentView = static::$homeView;
        }

        /**
         * main
         *
         * @return void
         */
        public function main($formData = null)
        {
            $this->currentData['HeadlinesController'] = new HeadlinesController();

            $this->renderView($this->currentView, $this->currentData);
        }

        /**
         * renderView
         *
         * @param mixed $view
         * @param mixed $data
         * @return void
         */
        protected function renderView($view, $data = null)
        {
            include($this->header);
            include($view);
            include($this->footer);
        }
    }
