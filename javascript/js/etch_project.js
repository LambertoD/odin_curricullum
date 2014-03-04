$(function() {
  createGrid16();
  $("#clearGrid").on("click", function() {
    $("span").css("background", "#eee");
  });
});


var createGrid16 = function() {
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
    $(this).css("background", "red");
  });
}