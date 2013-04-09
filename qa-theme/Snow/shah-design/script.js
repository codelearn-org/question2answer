$(document).ready(function(){
	$("#shah-nav li").click(function(){
		$(".shah-arrow-down").css({'display':'none'});
		$("#shah-nav li").removeClass("shah-active-nav");
		//$("#preview-image").attr('src',"images/preview-images/"+this.id.replace("nav-","")+".png");
		$("#shah-preview-image").attr('src', $("#shah-preload-images img")[this.id.replace(/shah-image-/,"")].src );
		$(this).addClass("shah-active-nav");
		console.log("#"+this.id+" .arrow-down");
		$("#"+this.id+" .arrow-down").css({'display':'block'});
	});
});
