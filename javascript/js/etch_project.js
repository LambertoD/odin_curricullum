$(function() {

  $("#clear_grid").fadeOut("fast");

  $("#generate_grid").on("click", function() {
    create_grid();
  });

  $("#color_selected").on("click", function() {
    update_grid();
  })

  $("#clear_grid").on("click", function() {
    $("span").css("background", "#eee");
  });
});

var create_grid = function() {
  if($("#my_grid").hasClass("showing_in_page")) {
    $("#my_grid").remove();
    $("#my_grid_heading").remove();
  }
  var grid_color = $("#color_selected").prop("value");
  var grid_size = $("#grid_size").prop("value");
  create_page_grid(grid_size, grid_color);
  $("#clear_grid").fadeIn("fast");
}

var update_grid = function() {
  var grid_color = $("#color_selected").prop("value");
  draw_on_grid(grid_color);
}

var create_page_grid = function(size, grid_color) {
  var my_grid_heading = $("<div />", { "id" : "my_grid_heading"});
  $("<p>Your " + size + " x " + size + " Etch-A-Sketch Grid</p>").appendTo(my_grid_heading);  
  $("<p>Start Drawing</p>").appendTo(my_grid_heading);
  $("body").append(my_grid_heading);

  var new_container = $("<div />", { "id" : "my_grid", 
    "class": "showing_in_page"});
  var side_value = 960 / size - 2;
  var side = side_value + "px"
  for (var i = 0; i < size; i++) {
    var new_div = $("<div />", {
      "class": "cell_row",
      "class": "clear"
    });
    for (var j = 0; j < size; j++) {
      $("<span />", {
        "class": "box",
        "height": side,
        "width" : side
      }).appendTo(new_div);    
    };
    new_div.appendTo(new_container);
  }
  new_container.appendTo("body");
  draw_on_grid(grid_color);
}

var draw_on_grid = function(color) {
  $("span").on("mouseenter", function() {
    // alert($(this).css("background"));
    // if ($(this).css("background") === color) {
    //  (this).css("background", "yellow"); 
    // }
    // $(this).css("background", color);
    if(color === "Random") {
      $(this).css("background", get_random_color());
    }else {
      $(this).css("background", color);
    }
  });  
}

/* Thanks to Stack Overflow for random color function */
var get_random_color = function() {
  var r = function() { return Math.floor(Math.random()*256) };
  return "rgb(" + r() + "," + r() + "," + r() + ")";
}