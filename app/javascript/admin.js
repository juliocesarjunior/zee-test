import "./initializers";
import "jquery-mask-plugin";
require("jquery")
require("@nathanvda/cocoon")
import 'bootstrap/dist/js/bootstrap.bundle';
import "./libs/admin/sidebarmenu";
import "./libs/admin/app.min";
import SimpleBar from 'simplebar';
import '@fortawesome/fontawesome-free/js/all';

$(document).on('cocoon:after-insert', function(e, insertedItem) {
  insertedItem.find('#price_table_sku, #price_listing_sku').mask('#.##0,00', { reverse: true, placeholder: '0,00' });
});

$(document).ready(function() {
  $('#price_table_sku, #price_listing_sku').mask('#.##0,00', { reverse: true, placeholder: '0,00' });
});