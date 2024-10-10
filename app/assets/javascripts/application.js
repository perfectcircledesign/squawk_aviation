// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery_ujs
//= require jquery.colorbox
//= require refinerycms-pods
//= require intlTelInput
//= require jquery_nested_form
//= require isotope.pkgd.min
//= require_directory .

$(document).ready(function() {

    // Messenger toggle
    $( ".contact-index > ul > li > a" ).click(function() {
      $('.message-display').addClass('message-view');
      $('.contact-index').hide();
    });

    $( "#step2-highlight" ).click(function() {
      $('.stepper li:nth-child(2)').addClass('completed');
    });

    $( "#step3-highlight" ).click(function() {
      $('.stepper li:nth-child(3)').addClass('completed');
    });

    $( "#message-back" ).click(function() {
      $('.message-display').removeClass('message-view');
      $('.contact-index').show();
    });
    


    // $('.plan-option').click(function() {
    //     setTimeout(function(){
    //         if($('.plan-container:first-child input').is(':checked')) {
    //             $('#plan-table').removeClass('checked-second').addClass('checked-first');
    //         }
    //         else if($('.plan-container:last-child input').is(':checked')) {
    //             $('#plan-table').removeClass('checked-first').addClass('checked-second');
    //         }
    //     }, 50);
    // });

    

    $( "#toggle-notifications,#toggle-notifications-messenger").click(function() {
      $('.mobile-notifications').show();
    });

    $( "#notifications-close" ).click(function() {
      $('.mobile-notifications').hide();
    });

    $( "#toggle-nav,#toggle-nav-messenger" ).click(function() {
      $('.side-nav').removeClass('side-nav-hidden');
      $('.blackout').fadeIn(500);
    });

    $('.blackout').click(function() {
        $('.side-nav').addClass('side-nav-hidden');
        $(this).fadeOut(500);
    });

    $('.table-more').click(function() {
        $(this).hide();
        $('.mobile-table').show();
        return false;
    });

    $('.table-less').click(function() {
        $('.table-more').show();
        $('.mobile-table').hide();
        return false;
    });


    var originalimage = $('#preview').attr('src');

    $( "#reset" ).click(function() {
      $('#preview').attr('src', originalimage);
    });

    $('#requirements').html(function(_, oldHTML) {
       return '<li>' + oldHTML.split(/(?:;)+/).join('</li><li>') + '</li>';
    });

    $('#benefits').html(function(_, oldHTML) {
       return '<li>' + oldHTML.split(/(?:;)+/).join('</li><li>') + '</li>';
    });

    $('.requirements > ul').html(function(_, oldHTML) {
       return '<li>' + oldHTML.split(/(?:;)+/).join('</li><li>') + '</li>';
    });

    $('.benefits > ul').html(function(_, oldHTML) {
       return '<li>' + oldHTML.split(/(?:;)+/).join('</li><li>') + '</li>';
    });

    $('.dropdown-menu a').click(function(){
        $('.form-nav li').removeClass('active');
        $('#selected').text($(this).text());
    });

    $(".cboxElement").colorbox({
        maxWidth: "90%",
        maxHeight: "90%"
    });

    $(".nav > li > ul").addClass("dropdown-menu").removeClass("clearfix");
    $(".nav > li > ul.dropdown-menu").siblings().addClass("dropdown-toggle").attr("data-toggle", "dropdown");
//  $(".nav > li > ul.dropdown-menu").siblings().append("<span class='caret'></span>")
    $(".nav > li > ul.dropdown-menu").parent().addClass("dropdown")

    $('.carousel').carousel();

    // $('.date_pick').data( "theme", "calendar-squawk" );
    // $('.date_pick').data( "modal", true);
    // $('.date_pick').data( "large-mode", true);
    // $('.date_pick').data( "format", "Y-m-d" );
    // $('.date_pick').data( "max-year", "2030" );
    // $('.date_pick').data( "min-year", "1800" );
    // $(".date_pick").each(function() {
    //     var v = $(this).val();
    //     if(v.length > 0){
    //         var value = v.substr(5,2) + "-" + v.substr(8,2) + "-" + v.substr(0,4);
    //         $(this).data("default-date", value);
    //     }
    // });
    // $('.date_pick').dateDropper();

    // $(".date_pick").datepicker({ format: "yyyy-mm-dd", autoclose: true });

    $(".date_pick").flatpickr({defaultDate: "2000-01-01"});



    //////////////////////////////////////////
    $('#airlines').lightSlider({
        item:5,
        controls:false,
        auto:true,
        pager:false,
        loop:true,
        slideMove:1,
        easing: 'cubic-bezier(0.25, 0, 0.25, 1)',
        speed:600,
        responsive : [
            {
                breakpoint:991,
                settings: {
                    item:4,
                    slideMove:1,
                    slideMargin:6,
                }
            },
            {
                breakpoint:767,
                settings: {
                    item:3,
                    slideMove:1
                }
            }
        ]
    });

    $(".hide_this_tag").hide();
    $('.read_more_content').click(function () {
        $(this).hide();
        $(this).parent().hide();
        $(this).parents().siblings('.hide_this_tag').show();
        return false
    });


    $("#article_share").jsSocials({
        showLabel: false,
        showCount: false,
        shares: ["twitter", "facebook", "linkedin"]
    });

    $("#job_share").jsSocials({
        showLabel: false,
        showCount: false,
        shares: ["twitter", "facebook", "linkedin"]
    });

    $(".age_range").ionRangeSlider({
        hide_min_max: true,
        keyboard: true,
        min: 18,
        max: 65,
        from: 18,
        to: 60,
        step: 1,
        type: 'double',
        // prefix: "R",
        grid: false,
        // max_postfix: "+"
    });

    $(".flying_hours_range").ionRangeSlider({
        hide_min_max: true,
        keyboard: true,
        min: 0,
        max: 15000,
        from: 500,
        to: 15000,
        step: 1,
        type: 'double',
        // prefix: "R",
        grid: false,
        max_postfix: "+"
    });

    $(".ex_range").ionRangeSlider({
        hide_min_max: true,
        keyboard: true,
        min: 0,
        max: 15000,
        from: 0,
        step: 1,
        // type: 'double',
        // prefix: "R",
        grid: false,
        max_postfix: "+"
    });

    //////////////////////////////////////////


    WaterMark('input#inquiry_name','Name');
    WaterMark('input#inquiry_email','Email');
    WaterMark('input#inquiry_phone','Phone');
    WaterMark('textarea#inquiry_message','Message');
});



function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#preview').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInp").change(function(){
        readURL(this);
});



function WaterMark(id_name,watermark){
    //init, set watermark text and class
    $(id_name).attr("placeholder",watermark).addClass('watermark');
    //if blur and no value inside, set watermark text and class again.
    $(id_name).blur(function(){
        if ($(this).attr("placeholder").length == 0){
            $(this).attr("placeholder", watermark).addClass('watermark');
        }
    });
    //if focus and text is watermrk, set it to empty and remove the watermark class
    $(id_name).focus(function(){
        if ($(this).attr("placeholder") == watermark){
            $(this).attr("placeholder",'').removeClass('watermark');
        }
    });
}

function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#photo-preview').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#customer_image_upload").change(function(){
    readURL(this);
});

$(window).load(function() {


    // $("#customer_nationality :nth-child(1)").after( "<option value>All Nationalities</option>" );

    var $container = $('.portfolio-isotope');
    // initialize
    $container.isotope({
        filter : ".portfolio-item",
        layoutMode: 'masonry'

    });
});


