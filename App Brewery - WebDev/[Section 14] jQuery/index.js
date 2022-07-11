$("h1").css("color", "green");
console.log($("h1").css("color"));

// Change Text
$("h1").text("Sup");
// Changes all elements
$("button").text("New Text");
// Using HTML
$("button").html("<i>Button goes clik clik</i>");

// Get attribute
$("a").attr("href");
// Set attribute
$("a").attr("href", "https://yahoo.com");

// Add Event Listener
$("h1").click(function () {
  $("h1").css("color", "purple");
});

$("button").click(() => {
  $("h1").css("color", "purple");
});

$("input").keypress((e) => $("h1").text(e.key));

$("input").on("mouseover", () => {
  $("h1").css("color", "purple");
});

// Adding elements on the fly
$("h1").before("<button>Before Button</button>");
// <button>...</button><h1>...</h1>
$("h1").after("<button>After Button</button>");
// <h1>...</h1><button>...</button>
$("h1").prepend("<button>Prepend Button</button>");
// <h1><button>...</button>...</h1>
$("h1").append("<button>Append Button</button>");
// <h1>...<button>...</button></h1>

// Remove All Elements Inside:
// $('h1').remove()

// Animations
$("button").on("click", () => {
    $("h1").hide(); // Hide
    $("h1").show(); // Show
    $("h1").toggle(); // Toggle Hide
    $("h1").fadeOut(); // Hide with Fade Animation
    $("h1").fadeIn(); // Show with Fade Animation
    $("h1").fadeToggle(); // Toggle Hide with Fade Animation
    $("h1").fadeToggle(); // Toggle Hide with Fade Animation
    $("h1").animate({opacity: 0.5, marginTop: 90})   // Manual Animation
  $("h1").slideUp().slideDown().animate({ opacity: 0.5 });
});
