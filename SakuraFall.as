// +----------------------------------------------------------------------+
// | ActionScript 2                                                       |
// +----------------------------------------------------------------------+
// | SnowFall class                                                       |
// | Copyright 2004                                                       |
// +----------------------------------------------------------------------+
// | Author: George Forest <george-forest@inbox.ru>                       |
// +----------------------------------------------------------------------+

// класс снегопада
class SakuraFall{
	
	// массив снежинок с инициализацией
	var sakuraflakes:Array = new Array(); 
	
	// конструктор
	// parent - обьект где надо создать группу
	// count - количество снежинок
	function SakuraFall(parent:Object, count:Number){
		// создаем группу снежинок из библиотеки и помещаем в массив
		for(var i=0;i< count;i++){
			parent.attachMovie("ShowFlake", "snowflake_"+i, i);
			sakuraflakes.push(eval(parent._target + "snowflake_"+i));
		}
	}	
		
	// функция останавливающая падение снежинок
	function stop(){
		for (var i in sakuraflakes){ 
			sakuraflakes[i].speed = 0;
		}
	}
	
	// запускаем падение снежинок
	function play(){
		for (var i in sakuraflakes){ 
			sakuraflakes[i].speed = 1;
		}
	}
}