$(function(){
    //-------------今月を表示
  window.onload = function () {
    var today = new Date();
    var tomonth = (today.getMonth()+1)
    var toyear = today.getFullYear();  
    $('.main__main__month__year').html(toyear + "年");
    $('.main__main__month__to').html(tomonth + "月"); 
 }
    //-------------次月をクリックで来月へ
  $(".main__main__month__next").on("click",function(){
    // $(".main__main__month__next").one("click",function(){
    //   var tomonth = today.setMonth(today.getMonth()+2);
    //   var tomonth = (today.getMonth()-2)
    // })
    var tomonth = today.setMonth(today.getMonth()+1);
    var tomonth = (today.getMonth()+2)
    $('.main__main__month__to').html(tomonth + "月");
    console.log(tomonth)
  })

    //-------------先月をクリックで先月に戻る
  $(".main__main__month__back").on("click",function(){
    var tomonth = today.setMonth(today.getMonth()-1);
    var tomonth = (today.getMonth()+1)
    $('.main__main__month__to').html(tomonth + "月");
    console.log(tomonth)
    
  });
});
var today = new Date();
console.log(today);


// if (tomonth.getTime == 1){    //tomonthが1(1月)でなら
//   y = y - 1;
//   i = i - 1;
//   var toyear = (today.getFullYear()+y);
//   var tomonth = (today.getMonth()+i);
//   $('.main__main__month__year').html(toyear + "年");
//   $('.main__main__month__to').html("12月");
//   console.log(tomonth)
// }else{