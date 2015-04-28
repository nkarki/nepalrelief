// $(document).ready(function(){

// $('company_name').blur(function(){

// judge.validate(document.getElementById('company_name'), {
//   valid: function(element) {
//     element.style.border = '1px solid green';
//   },
//   invalid: function(element, messages) {
//     element.style.border = '1px solid red';
//     //alert(messages.join(','));
//   }
// });
// });
// });

function validator(obj){
	judge.validate(document.getElementById(obj.id), {
       valid: function(element) {
       element.style.border = '1px solid green';
    },
    invalid: function(element, messages) {
       element.style.border = '1px solid red';
    //alert(messages.join(','));
  }
});
};

// function theFocus(obj) {
//     var tooltip = document.getElementById("tooltip");
//     tooltip.innerHTML = obj.title;
//     tooltip.style.display = "block";
//     tooltip.style.top = obj.offsetTop - tooltip.offsetHeight + "px";
//     tooltip.style.left = obj.offsetLeft + "px";
// }

// function theBlur(obj) {
//     var tooltip = document.getElementById("tooltip");
//     tooltip.style.display = "none";
//     tooltip.style.top = "-9999px";
//     tooltip.style.left = "-9999px";
// }