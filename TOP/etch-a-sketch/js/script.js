$(document).ready(function() {
	createGrid(10);

	$(".grid-button").click(function() {
		newGrid();
		$(".box").mouseenter(function() {
			$(this).addClass("hover");
		});		
	});

	$(".box").mouseenter(function() {
		$(this).addClass("hover");
	});

	$(".reset").click(function() {
		$(".box").removeClass("hover");
	});	
});

function createGrid(x) {
	var boxSize = (598 - 2 * x) / x;
	for (i = 1; i <= x * x; i++) {
		$(".wrap").append( $("<div></div>").addClass("box cf").css({"width": boxSize, "height": boxSize}) );
	};
};

function newGrid() {
	$(".box").remove();
	var boxnr = prompt("How many columns should be displayed? (Between 1 and 120)");
	if (boxnr >= 1 && boxnr <= 120) { //checking if number is in-between borders
	createGrid(boxnr);
	} else {
		alert("Please try again and enter a valid number between 1 and 120.");
	}
}

/*

How to create a grid:
y = side length of grid = 600px
p = side length of boxes
x = number of boxes

y = px * 2x + 2

This formula takes into account the borders and margin between the boxes

*/