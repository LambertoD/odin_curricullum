$(function() {

  $("#clear_grid").fadeOut("fast");
  $("#clear_grid").on("click", function() {
    $("span").css("background", "#eee");
  });

  $("#generate_grid").on("click", function() {
    create_grid();
  });

});

var create_grid = function() {
  if($("#my_grid").hasClass("showing_in_page")) {
    $("#my_grid").empty();
  }
  var grid_color = $("#color_selected").prop("value");
  var grid_size = $("#grid_size").prop("value");
  create_page_grid(grid_size, grid_color);
  $("#clear_grid").fadeIn("fast");

}

var create_page_grid = function(size, grid_color) {
  var side_value = 640 / size;
  var side = side_value + "px"
  var newContainer = $("<div />", { "id" : "my_grid", "class": "showing_in_page"});
  $("<p>Your Etch-A-Sketch Grid</p>").appendTo(newContainer);  
  $("<p>Start Drawing</p>").appendTo(newContainer);
  for (var i = 0; i < size; i++) {
    var newDiv = $("<div />", {
      "class": "cell_row",
      "class": "clear"
    });
    for (var j = 0; j < size; j++) {
      var newSpan = $("<span />", {
        "class": "box",
        "height": side,
        "width" : side
      }).appendTo(newDiv);    
    };
    newDiv.appendTo(newContainer);
  }
  newContainer.appendTo("body");
  $("span").on("mouseenter mouseleave", function() {
    $(this).css("background", grid_color);
  });  

}