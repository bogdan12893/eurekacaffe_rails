// function initPage(){
//   $("#flat-slider").slider({
//     max: 99, 
//     range: true, 
//     values:[10, 80],
//     change: function(e, ui){
//     getDetails(ui.values[0], ui.values[1]);
//   }});

//   var current = $("#flat-slider").slider("option", "values");
//   var min = current[0];
//   var max = current[1];
//   getDetails(min, max);

//   function getDetails(minimum, maximum){
//     $('#rangeMin').text(`$${minimum}`);
//     $('#rangeMax').text(`$${maximum}`);
//     var productPrice = $("[data-product-price]").map(function() { 
//       return $(this).data('product-price');
//     }).get();

    
//       var card = $("[data-product-price]");
//       console.log(productPrice)
//       // console.log(card);
//       // var priceCard = card.data("product-price")
//       // console.log(priceCard)
//       for(var i = 0; i < card.length; i++){
//         if(card[i] >= min && card[i] <= max){
//           productPrice
//           card.hide();
//         } else {
//           productPrice
//           card.show();
//         }
//         console.log(card[i])
//       }
      
//   }
// }
