$( function () {
	let height = 25.5;

	function widthHeightSplit(value, ele) {
		let eleHeight = (value / 100) * height;
		let leftOverHeight = height - eleHeight;

		ele.css("height", eleHeight + "px");
		ele.css("top", leftOverHeight + "px");
	};

	window.addEventListener('message', function (event) {
		if (event.data.action == "updateStatusHud") {
			$("#boxSetHealth").css("width", event.data.health + "%");
			$("#boxSetArmour").css("width", event.data.armour + "%");

			widthHeightSplit(event.data.hunger, $("#boxSetHunger"));
			widthHeightSplit(event.data.thirst, $("#boxSetThirst"));
			widthHeightSplit(event.data.oxygen, $("#boxSetOxygen"));
			widthHeightSplit(event.data.stress, $("#boxSetStress"));
		}
	});
});