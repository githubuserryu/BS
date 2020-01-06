// $(function(){
//   var today = new Date();
//   var tomonth = (today.getMonth()+1)
//   var toyear = today.getFullYear();
//   name = $('.incomesss').val(); 
  
//   // function HTML(){
//   //   var htmlincome =
//       // `<div class="main__main__show">
//       // <div class="main__main__show__income">
//       //   収入`
//         // console.log(name);
//         // Array.name.foreach(function(val,i){
//         //     console.log(i,val);
//         //   });
//         // <div class="i">
//         //   i.each do |a|
//         //   link_to a, "/main/show", class:"main__main__show__income--content"
//         //   end
//         // </div>
//         // end
//       // `</div>`
//       // return htmlincome
//     // }

//     //-------------今月を表示
//   window.onload = function (e) {
//     e.preventDefault()
//     htmlincome = HTML;
//     $('.main__main__month__year').html(toyear + "年");
//     $('.main__main__month__to').html(tomonth + "月"); 
//     $(".main__main__show__income").html(htmlincome);
//   }
//     //-------------次月をクリックで来月へ
//   $(".main__main__month__next").on("click",function(){
//     var tomonth = (today.getMonth()+1)
//     var toyear = today.getFullYear(); 
//     if (tomonth === 12){    //tomonthが12(12月)でなら
//       var toyear = (today.getFullYear()+1);
//       $('.main__main__month__year').html(toyear + "年");
//       var tomonth = today.setMonth(today.getMonth()+1);
//       var tomonth = (today.getMonth()+1)
//       $('.main__main__month__to').html(tomonth + "月");
//     }else{
//       var tomonth = today.setMonth(today.getMonth()+1);
//       var tomonth = (today.getMonth()+1)
//       $('.main__main__month__to').html(tomonth + "月");
//     };
//   })

//     //-------------先月をクリックで先月に戻る
//   $(".main__main__month__back").on("click",function(){
//     var tomonth = (today.getMonth()+1)
//     var toyear = today.getFullYear(); 
//     if (tomonth === 1){    //tomonthが1(1月)でなら
//       var toyear = (today.getFullYear()-1);
//       $('.main__main__month__year').html(toyear + "年");
//       var tomonth = today.setMonth(today.getMonth()-1);
//       var tomonth = (today.getMonth()+1)
//       $('.main__main__month__to').html(tomonth + "月");
//       console.log(11112)
//     }else{
//       var tomonth = today.setMonth(today.getMonth()-1);
//       var tomonth = (today.getMonth()+1)
//       $('.main__main__month__to').html(tomonth + "月");
//       console.log(111111)
//     };
//   })


// });