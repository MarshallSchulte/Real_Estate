/*
 * jQuery File Upload Plugin JS Example 6.5.1
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */

/*jslint nomen: true, unparam: true, regexp: true */
/*global $, window, document */

$(document).ready(function () {

  $(".row").hide().fadeIn(350);
  
  $("img").hide().fadeIn(350);
  
  $(".row").blur( function() {
    $(this).fadeOut(350);
	});
    

  $('a.picture').fancybox();
  
  /*$('a.btn-show').fancybox();*/

    function update(coords)
    {
      $('#picture_crop_x').val(coords.x)
      $('#picture_crop_y').val(coords.y)
      $('#picture_crop_w').val(coords.w)
      $('#picture_crop_h').val(coords.h)
    };
    var cropbox = $('#cropbox')
    if(cropbox.length > 0) {
      cropbox.Jcrop({
        boxWidth: 770,
        boxHeight: 433,
        onSelect: update,
        onChange: update
    });
  };


    'use strict';

    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload({
      autoUpload: true,
      uploadTemplate: function (o) {
        var rows = $();
        $.each(o.files, function (index, file) {
          console.log(file);
            var row = $('<li class="span3">' +
                '<div class="thumbnail">' +
                  '<div class="preview" style="text-align: center;"></div>' +
                  '<div class="progress progress-success progress-striped active">' +
                    '<div class="bar" style="width:0%;"></div>' +
                  '</div>' +
                '</div>');
            rows = rows.add(row);
        });
        return rows;
    },

    completed: function(e, data) {
      console.log(data.result[0].url);
      $('a[href^="' + data.result[0].url + '"]').fancybox();
    },
    downloadTemplate: function (o) {
        var rows = $();
        $.each(o.files, function (index, file) {
            var row = $('<li class="span3" id="picture_' + file.picture_id + '">' +
                (file.error ? '<div class="name"></div>' +
                    '<div class="size"></div><div class="error" ></div>' :
                      '<div class="thumbnail">' +
                        '<a href="' + file.url +'" rel="gallery" class="picture" title="<%= pic.description %>">' +
                          '<img src="" alt="">') +
                        '</a>' +
                        '<div class="caption">' +
                          '<p style="text-align: center;">' +
                            '<a href="" class="btn btn-mini btn-warning" style="margin-right: 4px;">' +
                              '<i class="glyphicon glyphicon-edit "></i>' +
                              'Edit' +
                            '</a>' +
                            '<a class="btn btn-mini btn-danger" confirm="Вы уверены?" data-remote=true data-method="delete" href="" >' +
                              '<i class="glyphicon glyphicon-trash"></i>' +
                              'Delete' +
                            '</a>' +
                          '</p>' +
                        '</div>' +
                      '</div>');


            if (file.error) {
                row.find('.name').text(file.name);
                row.find('.error').text(
                    locale.fileupload.errors[file.error] || file.error
                );
            } else {
                if (file.thumbnail_url) {
                    row.find('img').prop('src', file.thumbnail_url);
                }
                row.find('.btn-delete')
                    .attr('href', '/listings/' + $("#listing_id").val() + '/galleries/' + $("#galleryID").val() + '/pictures/' + file.picture_id);
                row.find('.btn-show')
                    .attr('href', '/listings/' + $("#listing_id").val() + '/galleries/' + $("#galleryID").val() + '/pictures/' + file.picture_id + '/edit');
            }
            rows = rows.add(row);
        });
        return rows;
    }

  });
});