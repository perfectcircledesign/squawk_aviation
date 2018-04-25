// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery_ujs
//= require admin/app
//= require admin/bootstrap.min
//= require admin/jquery.dataTables.min
//= require admin/dataTables.bootstrap.min
//= require admin/dataTables.rowReorder.min
//= require admin/jquery.ui.widget
//= require admin/z.jquery.fileupload

jQuery(document).ready(function($) {
    $("tr").click(function() {
        attr = $(this).attr('href');
        if (typeof attr !== typeof undefined && attr !== false) {
            window.document.location = $(this).attr("href");
        }
    });

    $('#requirements').html(function(_, oldHTML) {
        return '<li>' + oldHTML.split(/(?:;)+/).join('</li><li>') + '</li>';
    });

    $('#benefits').html(function(_, oldHTML) {
        return '<li>' + oldHTML.split(/(?:;)+/).join('</li><li>') + '</li>';
    });
});
