//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by Ricardo López on 18/02/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textLabel.text = "'El violín (etimología: del italiano violino, diminutivo de viola o viella) es un instrumento de cuerda frotada que tiene cuatro cuerdas. Es el más pequeño y agudo de la familia de los instrumentos de cuerda clásicos, que incluye la viola, el violonchelo y el contrabajo, los cuales, salvo el contrabajo, son derivados todos de las violas medievales, en especial de la fídula. En los violines antiguos, las cuerdas eran de tripa1 .\n\n\n Hoy pueden ser también de metal o de tripa entorchada con aluminio, plata o acero; la cuerda en mi, la más aguda ―llamada cantino― es directamente un hilo de acero, y, ocasionalmente, de oro. En la actualidad se están fabricando cuerdas de materiales sintéticos que tienden a reunir la sonoridad lograda por la flexibilidad de la tripa y la resistencia de los metales. Además del efecto logrado por el arco, se pueden conseguir otros efectos: pizzicato (pellizcando las cuerdas como si se tratase de una guitarra, pero no con la misma posición), trémolo (moviendo el arco arriba y abajo muy rápido), vibrato (haciendo vibrar los dedos sobre las cuerdas), glissando (moviendo la mano izquierda arriba y abajo sobre las cuerdas), col legno (tocando con la parte de madera del arco), sul ponticello (tocando prácticamente sobre el puente)."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

