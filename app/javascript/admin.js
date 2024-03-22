import "./initializers";
import "jquery-mask-plugin";
require("jquery")
require("@nathanvda/cocoon")
import 'bootstrap/dist/js/bootstrap.bundle';
import "./libs/admin/sidebarmenu";
import "./libs/admin/app.min";
import SimpleBar from 'simplebar';
import '@fortawesome/fontawesome-free/js/all';

$("#product_skus_attributes_0_price_table, #product_skus_attributes_0_price_listing").mask('#.##0,00', {reverse: true, placeholder: '0,00'});
