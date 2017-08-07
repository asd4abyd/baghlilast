
<div class="modal fade" id="overlay">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
		<?php foreach ($modules as $module) { ?>
		<?php echo $module; ?>

<?php } ?>

      </div>
    </div>
  </div>
</div>


<script>
//pop up on load script
$('#overlay').modal('show');

setTimeout(function() {
    $('#overlay').modal('hide');
}, 18000);
</script>