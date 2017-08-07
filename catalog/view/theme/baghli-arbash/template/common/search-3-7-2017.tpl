<!--<div id="search" class="input-group">
  <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" />
  <span class="input-group-btn">
    <button type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button>
  </span>
</div>-->

<div id="search" class="col-md-7" style="padding-left:21px ">
                        <div  class="input-group stylish-input-group srch_updte">
							<select name="search_type"  id="search_type" class="sub_selct">   <option selected disabled hidden><?= $select ?></option> <option value="Brands"><?=$Brands ?></option><option value="category"><?= $Category ?> </option> </select>
                            <input type="text" class="form-control srch_sub" name="search" value="<?php echo $search;?>" placeholder="<?php echo $text_search; ?>" >
                            <span class="input-group-addon">
                                <button type="submit">
                                    <span class="search-ico"><img src="catalog/view/theme/baghli-arbash/images/search.png" alt=""></span>
                                </button>
                            </span>
                       </div>
 </div>






 