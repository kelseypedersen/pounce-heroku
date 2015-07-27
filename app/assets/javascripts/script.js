// $(document).ready(function(){
// 	$(".signin").leanModal();
// });

$(document).ready(function() {
  $('#masonry').masonry({}).imagesLoaded(function() {
	   $('#masonry').masonry({
	   isFitWidth: true,
	   columnWidth : 0,
	   itemSelector: '.item'
	  });
  });
});

window.onload = function(e){
	var container = document.getElementById("masonry");
	// container.masonry({});
	if (window.location.pathname === "/"){
		  var header = document.getElementsByClassName('header')[0]
	    var nav = header.getElementsByClassName("button")
	    Array.prototype.map.call(nav, function(e){e.style.color = "white"; return e })
	    header.style.backgroundColor = "transparent"
	    header.style.position = 'absolute';
	    header.style.color = 'white';
	    header.style.borderStyle = "none";
	}

	// var container = document.getElementById("masonry");
	// debugger
	// container.imagesLoaded(function(){
	//   container.masonry({
	//         itemSelector : '.item',
	//         columnWidth : 300,
	//         isFitWidth: true
	// });

}




// window.onbeforeunload = function(e){
// 	if (window.location.pathname === "/"){
// 		  var header = document.getElementsByClassName('header')[0]
// 	    var nav = header.getElementsByClassName("button")
// 	    Array.prototype.map.call(nav, function(e){e.style.color = "white"; return e })
// 	    header.style.backgroundColor = "transparent"
// 	    header.style.position = 'absolute';
// 	    header.style.color = 'white';
// 	}
// }