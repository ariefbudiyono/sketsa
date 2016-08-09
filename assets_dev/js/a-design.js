var pathname = window.location.pathname;
var segment  = pathname.split("/");
var protocol = window.location.protocol;
var site = protocol + '//' + window.location.host;
var base = site + '/';

if (segment[2] != 'table') {
  var url = site + '/' + segment[1] + '/' + segment[2];
} else {
  var url = site + '/' + segment[1] + '/' + segment[2] + '/' + segment[3];
}

$('ul.sidebar-menu a').filter(function() {
  return this.href == url;
}).parent().addClass('active');

$(function() {
    $('.treeview li.active').parent().parent().addClass('active');
    $('.treeview-menu li.active').parent().parent().parent().parent().addClass('active');

    //list.js
    var options = {
      searchClass: ['searchlist'], 
      valueNames: [ 'name' ]
    };
    $("#searchSidebar").focus(function() {
        menune = $('.name').parent().clone();
        $('#menuList').html(menune);
        $('#menuSub').hide();
        var menuSidebarList = new List('menuSidebar', options);
    }).focusout(function() {
        if (!$(this).val()) {
            $('#menuList').html('');
            $('#menuSub').show();
        }
    });

    // Custom Menu
    var linkMenu = [
        {'selector': '#navMenu', 'url': 'myigniter/crud_menu'}
    ];
    customActiveMenu(linkMenu);

    // Alertify Custom
    if (typeof(alertify) !== "undefined") {
        alertify.defaults = {
            modal: true,
            basic: false,
            frameless: false,
            movable: true,
            resizable: true,
            closable: true,
            closableByDimmer: true,
            maximizable: true,
            startMaximized: false,
            pinnable: true,
            pinned: true,
            padding: true,
            overflow: true,
            maintainFocus: true,
            transition: 'pulse',
            autoReset: true,

            notifier: {
                delay: 5,
                position: 'bottom-right'
            },

            glossary: {
                title: 'Alert',
                ok: 'OK',
                cancel: 'Cancel'
            },

            theme: {
                input: 'ajs-input',
                ok: 'ajs-ok',
                cancel: 'ajs-cancel'
            }
        };
    }

    $('.copy-link').click(function() {
        $(this).parents(".link").children(".form-link").select();        
    });
    $('.form-link').keypress(function(event) {
        event.preventDefault();
    });

    $.ajaxPrefilter(function(options, originalData, xhr) {
    if (options.data)
        if (readCookie(atob(ccn))) {
            if (typeof(options.data) != 'object') {
                options.data += "&" + atob(ctn) + "=" + readCookie(atob(ccn));
            }
        }
    });

    // grocery fix bug
    $('.chosen-container').css('width', '100%');
    $('.fileinput-button').removeClass('qq-upload-button').addClass('btn btn-success').prepend('<i class="fa fa-upload"></i> '); 
});

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function customActiveMenu(linkMenu) {
    $.each(linkMenu, function(index, val) {
        if (val.url === segment[1] + '/' + segment[2]) {
            $(val.selector).addClass('active');
        }
    });
}