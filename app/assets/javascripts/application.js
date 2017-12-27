// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ujs
//= require bootstrap-sass/assets/javascripts/bootstrap-sprockets
//= require summernote/dist/summernote
//= require_tree .

$(document).ready(function() {
  if ($(".summernote").length > 0) {
    $.ajax({
      url: 'https://api.github.com/emojis',
      async: false
    }).then(function(data) {
      window.emojis = Object.keys(data);
      window.emojiUrls = data;
    });

    $(".summernote").summernote({
      height: 200,
        hint: {
        match: /:([\-+\w]+)$/,
        search: function (keyword, callback) {
          callback($.grep(emojis, function (item) {
            return item.indexOf(keyword)  === 0;
          }));
        },
        template: function (item) {
          var content = emojiUrls[item];
          return '<img src="' + content + '" width="20" /> :' + item + ':';
        },
        content: function (item) {
          var url = emojiUrls[item];
          if (url) {
            return $('<img />').attr('src', url).css('width', 20)[0];
          }
          return '';
        }
      }
    });
  }
});
