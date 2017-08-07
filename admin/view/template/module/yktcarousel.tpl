<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-carousel" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h6 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h6>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-carousel" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group">
          <label class="col-sm-2 control-label" for="input-single"><?php echo $text_single; ?></label>
          <div class="col-sm-10">
            <select name="single" id="input-single" class="form-control">
            <?php if ($single) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-item"><?php echo $text_count_item; ?></label>
          <div class="col-sm-10">
            <input type="text" name="count_item" value="<?php echo $count_item; ?>" placeholder="<?php echo $text_count_item; ?>" id="input-item" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-autoplay"><?php echo $text_autoplay; ?></label>
          <div class="col-sm-10">
            <input type="text" name="autoplay" value="<?php echo $autoplay; ?>" placeholder="9000" id="input-item" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-navigation"><?php echo $text_navigation; ?></label>
          <div class="col-sm-10">
            <select name="navigation" id="input-navigation" class="form-control">
            <?php if ($navigation == 'true') { ?>
              <option value="true" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="false"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
              <option value="true"><?php echo $text_enabled; ?></option>
              <option value="false" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
            </select>
          </div>
        </div>

        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-responsive"><?php echo $text_responsive; ?></label>
          <div class="col-sm-10">
            <select name="responsive" id="input-responsive" class="form-control">
            <?php if ($responsive == 'true') { ?>
              <option value="true" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="false"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
              <option value="true"><?php echo $text_enabled; ?></option>
              <option value="false" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
            </select>
          </div>
        </div>

        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-pagin"><?php echo $text_pagination; ?></label>
          <div class="col-sm-10">
            <select name="pagin" id="input-pagin" class="form-control">
            <?php if ($pagin == 'true') { ?>
              <option value="true" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="false"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
              <option value="true"><?php echo $text_enabled; ?></option>
              <option value="false" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
            </select>
          </div>
        </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          
          <table class="table" id="yk_slider_text">
            <thead>
              <tr>
                <th><?php echo $column_stext;?></th>
                <th><?php echo $column_action;?></th>
             </tr>
            </thead>
            <tbody id="tbody">
              <?php $yk_text_row = 0; ?>
                <?php foreach($slider_text as $text) { ?>
                  <tr id="yk_text-row<?php echo $yk_text_row; ?>">
                    <td class="text-left">
                      <div class="form-group">
                        <textarea name="slider_text[]" rows="5" class="form-control"><?php echo $text;?></textarea>
                      </div>
                    </td>
                    <td class="text-left"><button type="button" onclick="$('#yk_text-row<?php echo $yk_text_row; ?>').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                  </tr>
                <?php $yk_text_row++; ?>
              <?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="2"></td>
                <td class="text-left"><button type="button" onclick="addText();" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
            </table>
        </form>
      </div>
    </div>
  </div>
</div>
<script>
  var yktext_row = <?php echo $yk_text_row; ?>;

  function addText() {
    html = '<tr id="yk_text-row' + yktext_row + '">';
    html += '<td class="text-left"><div class="form-group"><textarea name="slider_text[]" rows="5" class="form-control"></textarea></div>';
    html += '</td>';
    html += '<td class="text-left"><button type="button" onclick="$(\'#yk_text-row' + yktext_row + '\').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '</tr>';

    $('#tbody').append(html);

    yktext_row++;
}
</script>
<?php echo $footer; ?>
