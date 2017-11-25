<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h6 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h6>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-filter"><?php echo $entry_status; ?></label>
                <select name="input-filter" id="input-filter" class="form-control">
                  <?php foreach($list_filter as $key=>$val): ?>
                  <option value="<?php echo $key; ?>"><?php echo $val; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
              <button type="button" id="button-csv" class="btn btn-success pull-right" style="margin-right: 10px;"><i class="fa fa-file-excel-o"></i> <?php echo $button_csv; ?></button>
            </div>
          </div>
        </div>
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-left"><?php echo $column_name; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($products) { ?>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-left"><?php echo $product['keyword']; ?></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=report/product_search&token=<?php echo $token; ?>';
	
	var filter_date_start = $('input[name=\'filter_date_start\']').val();
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').val();
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}

	window.location.href = url;
});

$('#button-csv').on('click', function() {
	url = 'index.php?route=report/product_search/csv&token=<?php echo $token; ?>';

	var filter_date_start = $('input[name=\'filter_date_start\']').val();

	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').val();

	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}

	window.location.href = url;
});
//--></script> 
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
}).change(function () {
    $('#input-filter').val(6);
});


$('#input-filter').val(6).change(function(){
    var key = parseInt($(this).val());
    var date1, date2;

    date1 = new Date();
    switch(key){
        case 0:
            $('#input-date-start').val(date1.getFullYear()+'-'+(date1.getMonth()+1)+'-'+date1.getDay());
            $('#input-date-end').val(date1.getFullYear()+'-'+(date1.getMonth()+1)+'-'+date1.getDay());
            break;

        case 1:
            date2 = new Date(date1.getFullYear()+'-'+(date1.getMonth()+1)+'-01');
            date2 = new Date(date2.getTime()-86400000);
            $('#input-date-start').val((date1.getFullYear()-(date1.getMonth()==0?1:0))+'-'+(date1.getMonth()==0?12:date1.getMonth())+'-01');
            $('#input-date-end').val(date2.getFullYear()+'-'+(date2.getMonth()+1)+'-'+date2.getDate());
            break;

        case 2:
            date2 = new Date(date1.getTime()-86400000);
            date1 = new Date(date1.getTime()-(86400000*7));
            $('#input-date-start').val(date1.getFullYear()+'-'+(date1.getMonth()+1)+'-'+date1.getDate());
            $('#input-date-end').val(date2.getFullYear()+'-'+(date2.getMonth()+1)+'-'+date2.getDate());
            break;

        case 3:
            date1 = new Date(date1.getTime()-86400000);
            $('#input-date-start').val(date1.getFullYear()+'-'+(date1.getMonth()+1)+'-'+date1.getDate());
            $('#input-date-end').val(date1.getFullYear()+'-'+(date1.getMonth()+1)+'-'+date1.getDate());
            break;

        case 4:
            $('#input-date-start').val(date1.getFullYear()+'-'+(date1.getMonth()+1)+'-01');
            $('#input-date-end').val(date1.getFullYear()+'-'+(date1.getMonth()+1)+'-'+date1.getDate());
            break;

        case 5:
            $('#input-date-start').val(date1.getFullYear()+'-01-01');
            $('#input-date-end').val(date1.getFullYear()+'-'+(date1.getMonth()+1)+'-'+date1.getDate());
            break;
    }
});



//--></script> 
</div>
<?php echo $footer; ?>