$(function() {
  var grid_color = $("#color_selected").prop("value");

  $("#clear_grid").on("click", function() {
    $("span").css("background", "#eee");
  });

  $("#color_selected").on("click", function() {
    var grid_color = $("#color_selected").prop("value");
  });

  createGrid16(grid_color);

});


var createGrid16 = function(grid_color) {
  var newContainer = $("<div />", { "id" : "grid16"});
  for (var i = 0; i < 16; i++) {
    var newDiv = $("<div />", {
      "class": "cell_row"
    });
    for (var j = 0; j < 16; j++) {
      var newSpan = $("<span />", {
        "class": "box"}).appendTo(newDiv);    
    };
    newDiv.appendTo(newContainer);
  }
  newContainer.appendTo("body");
  $("span").on("mouseenter mouseleave", function() {
    $(this).css("background", grid_color);
  });
}