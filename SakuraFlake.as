// +----------------------------------------------------------------------+
// | ActionScript 2                                                       |
// +----------------------------------------------------------------------+
// | SnowFlake class                                                      |
// | Copyright 2004                                                       |
// +----------------------------------------------------------------------+
// | Author: George Forest <george-forest@inbox.ru>                       |
// +----------------------------------------------------------------------+

// класс снежинки
class SakuraFlake extends MovieClip{
	
	// x ось колебания
	var x:Number = 100; 
	// скорость ветра
	var wind:Number = 0;
	// скорость падения 
	var speed:Number = 1; 
	// амплитуда раскачивания
	var amplitude:Number = 10; 
	// частота раскачивания
	var rate:Number = Math.PI/12;
	// пределы окна
	var clipBounds:Object;
	
	// конструктор класса вызываеться при создании екземпляра
	function SakuraFlake(){
		// выводим сообщение при создании екземпляра класса
		//trace("Class created!");
		
		// получаем пределы окна
		clipBounds = _root.getBounds(_parent);
		
		// устанавливаем начальные координаты случайным образом
		_x = x = random(clipBounds.xMax);
		_y = random(clipBounds.yMax);
	}
	
	// пегружаем функцию MovieClip.onEnterFrame
	function onEnterFrame(){
		// поворачивание при движении
		_rotation = _x * rate * 8;
		
		// смещение от ветра
		x += wind;
		
		// движение по синусоиде вдоль оси x
		_x = x + amplitude * Math.sin(_y * rate);
		
		// проверка окончания падения
		if(_y > clipBounds.yMax){
			// начинаем падение заново
			_x = x = random(clipBounds.xMax)
			_y = -_height;
		}else{
			// продолжаем падение
			_y += speed;
		}
	}
}
