import Rails from '@rails/ujs';

import jquery from "jquery";
window.jQuery = jquery;
window.$ = jquery;

import moment from 'moment';
window.moment = moment;

Rails.start();