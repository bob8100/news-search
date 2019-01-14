<div class="container">
    
    <div class="row">
        <div class="col text-center">
            <h1>News Search.</h1>
        </div>
    </div>

    <?php if (isset($_GET['query']) && $_GET['query'] =='') { ?>
    <div class="row">
        <div class="col">
            <div class="alert alert-info" role="alert">
                Please enter a valid search term and try again.
            </div>
        </div>
    </div>
    <?php } ?>

    <div class="row search-container">
        <div class="col">
            <form method="get">
                <div class="form-group row">
                        
                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                        <input type="text" name="query" placeholder="Search News" id="search-news" class="form-control">
                    </div>

                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                        <div class="collapse" id="collapseExample">
                            <div class="card card-body">
                                <div class="row">
                                    <div class="form-group col-sm-12 col-md-4 col-lg-4">
                                        <label for="sources">Sources</label>
                                        <select name="sources[]" class="custom-select" id="sources" multiple>
                                            <option value="abc-news">ABC News</option>
                                            <option value="abc-news-au">ABC News (AU)</option>
                                            <option value="aftenPosten">AftenPosten</option>
                                            <option value="al-jazeera-english">Al Jazeera English</option>
                                        </select>
                                    </div>

                                    <div class="form-group col-sm-12 col-md-4 col-lg-4">
                                        <label for="domains">Domains</label>
                                        <select name="domains[]" class="custom-select" id="domains" multiple>
                                            <option value="bbc.co.uk">bbc.co.uk</option>
                                            <option value="techcrunch.com">techcrunch.com</option>
                                            <option value="engadget.com">engadget.com</option>
                                            <option value="cnn.com">cnn.com</option>
                                        </select>
                                    </div>
                                
                                    <div class="form-group col-sm-12 col-md-4 col-lg-4">
                                        <label for="exclude-domains">Exclude Domains</label>
                                        <select name="domainsExclude[]" class="custom-select" id="exclude-domains" multiple>
                                            <option value="bbc-news">bbc.co.uk</option>
                                            <option value="techcrunch">techcrunch.com</option>
                                            <option value="engadget">engadget.com</option>
                                            <option value="cnn">cnn.com</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-sm-12 col-md-4 col-lg-4">
                                        <label for="date-from">Date From</label>
                                        <input type="date" name="dateFrom" id="date-from" class="form-control">
                                    </div>

                                    <div class="form-group col-sm-12 col-md-4 col-lg-4">
                                        <label for="date-to">Date To</label>
                                        <input type="date" name="dateTo" id="date-to" class="form-control">
                                    </div>

                                    <div class="form-group col-sm-12 col-md-4 col-lg-4">
                                        <label for="sort-by">Sort By</label>
                                        <select name="sortBy" class="custom-select" id="sort-by">
                                            <option value="publishedAt">Published At</option>
                                            <option value="relevancy">Relevancy</option>
                                            <option value="popularity">Popularity</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                    <div class="form-group col-sm-4 col-md-4 col-lg-2">
                        <input type="hidden" name="action" value="search-news">
                        <button type="submit" id="submit-search" class="btn btn-primary btn-block submit-search">Search News</button>
                    </div>

                    <div class="form-group col-sm-4 col-md-4 col-lg-2">
                        <p>
                            <a class="btn btn-secondary btn-block" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                Advanced Search
                            </a>
                        </p>
                    </div>

                </div>
            </form>
        </div>
    </div>

    <div class="row world-headlines-container">
        <div class="col-12 text-center">
            <h2>World Headlines.</h2>
        </div>

        <?php 
            $headlines = $data['HeadlinesController']->getNewsHeadlinesBySource('rte', 5);
            if ($headlines) {
        ?>

        <div class="col-sm">
            <div class="card">
                <div class="card-header">
                    <?php echo $headlines[0]['source']; ?>
                </div>
                <ul class="list-group list-group-flush">
                    <?php

                        for ($i=0; $i < 5; $i++) { 
                            
                            echo '<li class="list-group-item"><a href="'.$headlines[$i]['url'].'" target="_blank">'.$headlines[$i]['title'].'</a></li>';

                        }

                    ?>
                </ul>
            </div>
        </div>

        <?php
            }
        ?>

        <?php 
            $headlines = $data['HeadlinesController']->getNewsHeadlinesBySource('bbc-news', 5);
            if ($headlines) {
        ?>

        <div class="col-sm">
            <div class="card">
                <div class="card-header">
                    <?php echo $headlines[0]['source']; ?>
                </div>
                <ul class="list-group list-group-flush">
                    <?php

                        for ($i=0; $i < 5; $i++) { 
                            
                            echo '<li class="list-group-item"><a href="'.$headlines[$i]['url'].'" target="_blank">'.$headlines[$i]['title'].'</a></li>';

                        }

                    ?>
                </ul>
            </div>
        </div>

        <?php
            }
        ?>

        <?php 
            $headlines = $data['HeadlinesController']->getNewsHeadlinesBySource('cnn', 5);
            if ($headlines) {
        ?>

        <div class="col-sm">
            <div class="card">
                <div class="card-header">
                    <?php echo $headlines[0]['source']; ?>
                </div>
                <ul class="list-group list-group-flush">
                    <?php

                        for ($i=0; $i < 5; $i++) { 
                            
                            echo '<li class="list-group-item"><a href="'.$headlines[$i]['url'].'" target="_blank">'.$headlines[$i]['title'].'</a></li>';

                        }

                    ?>
                </ul>
            </div>
        </div>

        <?php
            }
        ?>
    </div>

    <div class="row sport-headlines">
        <div class="col-12 text-center">
            <h2>Sport.</h2>
        </div>

        <?php 
            $headlinesCategory = $data['HeadlinesController']->getNewsHeadlinesByCategory('sports', 2);
            if ($headlinesCategory) {
                for ($i=0; $i < 2; $i++) { 
        ?>
                <div class="col-sm-12 col-md-6 col-lg-6">
                    <div class="media">
                        <a href="<?php echo $headlinesCategory[$i]['url'] ?>" target="_blank">
                            <?php if ( $headlinesCategory[$i]['urlToImage'] !='' ) { ?>
                                <img src="<?php echo $headlinesCategory[$i]['urlToImage'] ?>" class="mr-3" alt="...">
                            <?php } ?>
                        </a>
                        <div class="media-body">
                            <h5 class="mt-0">
                            <a href="<?php echo $headlinesCategory[$i]['url'] ?>" target="_blank"><?php echo $headlinesCategory[$i]['title'] ?></a>
                            </h5>
                            <?php echo $headlinesCategory[$i]['description'] ?>
                        </div>
                    </div>
            </div>
        <?php
                }
            }
        ?>
    </div>

    <div class="row entertainment-headlines">
        <div class="col-12 text-center">
            <h2>Entertainment.</h2>
        </div>

        <?php 
            $headlinesCategory = $data['HeadlinesController']->getNewsHeadlinesByCategory('entertainment', 2);
            if ($headlinesCategory) {
                for ($i=0; $i < 2; $i++) { 
        ?>
                <div class="col-sm-12 col-md-6 col-lg-6">
                    <div class="media">
                        <a href="<?php echo $headlinesCategory[$i]['url'] ?>" target="_blank">
                            <img src="<?php echo $headlinesCategory[$i]['urlToImage'] ?>" class="mr-3" alt="...">
                        </a>
                        <div class="media-body">
                            <h5 class="mt-0">
                            <a href="<?php echo $headlinesCategory[$i]['url'] ?>" target="_blank"><?php echo $headlinesCategory[$i]['title'] ?></a>
                            </h5>
                            <?php echo $headlinesCategory[$i]['description'] ?>
                        </div>
                    </div>
            </div>
        <?php
                }
            }
        ?>
    </div>

    <div class="row business-headlines">
        <div class="col-12 text-center">
            <h2>Business.</h2>
        </div>

        <?php 
            $headlinesCategory = $data['HeadlinesController']->getNewsHeadlinesByCategory('business', 3);
            if ($headlinesCategory) {
                for ($i=0; $i < 2; $i++) { 
        ?>
                <div class="col-sm-12 col-md-6 col-lg-6">
                    <div class="media">
                        <a href="<?php echo $headlinesCategory[$i]['url'] ?>" target="_blank">
                            <img src="<?php echo $headlinesCategory[$i]['urlToImage'] ?>" class="mr-3" alt="...">
                        </a>
                        <div class="media-body">
                            <h5 class="mt-0">
                            <a href="<?php echo $headlinesCategory[$i]['url'] ?>" target="_blank"><?php echo $headlinesCategory[$i]['title'] ?></a>
                            </h5>
                            <?php echo $headlinesCategory[$i]['description'] ?>
                        </div>
                    </div>
            </div>
        <?php
                }
            }
        ?>
    </div>

</div><!-- end container -->