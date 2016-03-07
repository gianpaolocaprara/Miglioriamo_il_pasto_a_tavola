package {
	//Importazione degli elementi di display che vengono utilizzati in questa classe
	import flash.display.*;
	import flash.events.*;
	
	//Definizione di classe ed estensione della classe Movie Clip:
	//in questo modo viene sottolineato il fatto che ha le stesse
	//proprietà di un movie clip
	public class Brick extends MovieClip {
		//La timeline principale
		private var _root:MovieClip;
		//istanza della classe nello stage
		public function Brick(){
			//Codice che viene utilizzato quando gli obiettivi vengono immessi nello stage
			addEventListener(Event.ADDED, beginClass);
			//Entra nel frame principale
			addEventListener(Event.ENTER_FRAME, enterFrameEvents);
		}
		//Funzione privata a cui può accedere solo la classe che l'ha dichiarata
		private function beginClass(event:Event):void{
			_root = MovieClip(root);
			_root.brickAmt ++;
		}
		private function enterFrameEvents(event:Event):void{
			//Verifica se il giocatore ha perso
			if(_root.gameOver){
				//Distrugge gli obiettivi
				this.parent.removeChild(this);
				//Finisce di leggere il codice della classe
				removeEventListener(Event.ENTER_FRAME, enterFrameEvents);
			}
			if(this.hitTestObject(_root.mcBall)){
				_root.ballYSpeed *= -1;
				this.parent.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, enterFrameEvents);
				_root.brickAmt --;
				//incrementa il punteggio
				_root.score_1 += 10;
			}
		}
	}
}