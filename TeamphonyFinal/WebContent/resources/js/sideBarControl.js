function w3_open() {
	document.getElementById("mySidenav").style.display = "block";
	document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
	document.getElementById("mySidenav").style.display = "none";
	document.getElementById("myOverlay").style.display = "none";
}

function myAccFunc() {

	var x = document.getElementById("subMenu");
	if (x.className.indexOf("w3-show") == -1) {
		x.className += " w3-show";
		x.previousElementSibling.className += "";

	} else {
		x.className = x.className.replace(" w3-show", "");
		x.previousElementSibling.className = x.previousElementSibling.className
				.replace("", "");
	}
}

function closeAcc() {

	var x = document.getElementById("subMenu");
	x.className = x.className.replace(" w3-show", "");
	x.previousElementSibling.className = x.previousElementSibling.className
			.replace("", "");

}

var clickCheck = function(itemId) {

	var items = document.getElementsByName('menuItem');
	var itemsLen = items.length;

	for (i = 0; i < itemsLen; i++) {
		var list = items[i].classList;
		list.remove('active');
	}

	var selectedItem = document.getElementById(itemId);
	selectedItem.classList.add('active');
	resetSubMenu();
}

function resetSubMenu() {

	var items = document.getElementsByName('subMenuItem');
	var itemsLen = items.length;

	for (i = 0; i < itemsLen; i++) {
		var list = items[i].classList;
		list.remove('active_sub');
	}

}

var clickCheck_sub = function(itemId) {

	var items = document.getElementsByName('subMenuItem');
	var itemsLen = items.length;

	for (i = 0; i < itemsLen; i++) {
		var list = items[i].classList;
		list.remove('active_sub');
	}

	var selectedItem = document.getElementById(itemId);
	selectedItem.classList.add('active_sub');
}