<div class="container">

    <div class="row">
        <div class="col">
            <nav aria-label="breadcrumb" style="margin-top:1em;">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?php echo DOMAIN ?>">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Search Results: <?php echo number_format($data['searchResults'][0]['totalResults']); ?></li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <div class="alert alert-info" role="alert">
                You Searched for: "<?php echo htmlentities($_GET['query'], ENT_QUOTES, 'UTF-8') ?>"
            </div>
        </div>
    </div>

    <div class="row search-results">
        <div class="col">
            <?php

                for ($i=0; $i < count($data['searchResults']); $i++) {

            ?>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><a href="<?php echo $data['searchResults'][$i]['url'] ?>" target="_blank"><?php echo $data['searchResults'][$i]['title'] ?></a></h5>
                    <h6 class="card-subtitle mb-2 text-muted"><?php echo $data['searchResults'][$i]['source'] ?></h6>
                    <p class="card-text"><?php echo $data['searchResults'][$i]['description'] ?></p>
                    <a class="card-link">Published: <?php echo date('d M Y', strtotime($data['searchResults'][$i]['publishedAt'])) ?></a>
                    <a class="card-link">Author: <?php echo $data['searchResults'][$i]['author'] ?></a>
                </div>
            </div>
            <?php

                }

            ?>
        </div>
    </div>

    <!--<div class="row">
        <div class="col">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </div>
    </div>-->

</div><!-- end container -->