var $ = function(id){
  return document.getElementById(id);
}
newSuggestionToggle = function(event){
  event.preventDefault();
  var displaySuggestion = $("new-suggestion-info");
  var buttonText = $("new-suggestion-button");
  if (displaySuggestion.style.display !== "block"){
    displaySuggestion.style.display = "block";
    buttonText.innerHTML = "Hide";
  }
  else if (displaySuggestion.style.display === "block"){
    displaySuggestion.style.display = "none";
    buttonText.innerHTML = "New Suggestion";
  }
}
// otherSelected = function(){
//   var snackSelected = $("snack-select");
//   var selectedValue = snackSelected.options[snackSelected.selectedIndex].value;
//   var displayOtherSnackInfo = $("other-snack-info");
//   if (selectedValue === "Other"){
//     displayOtherSnackInfo.style.display = "block";
//   }
//   else if (selectedValue !== "Other"){
//     displayOtherSnackInfo.style.display = "none";
//   }
// }

