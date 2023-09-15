//
//  ContentView.swift
//  Memorize
//
//  Created by Ana Clara Olegario de Souza on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      let emojis: Array<String> = ["🐳","🐸"]
   // let emojis: [String] = ["🐳","🐸"] or let emojis = ["🐳","🐸"]
      HStack(content: {//{0..<4, id: \.self) { index in
        //CardView(content: emojis[index])


        CardView(content: emojis[0])
        CardView(content: emojis[0], isFaceUp: true)
        CardView(content: emojis[1])
        CardView(content: emojis[1])

                 })
//colocando os modificadores dentro do ZStack tornaremos padrão para as views, o que não impede que uma view tenha seu prório modificador
      .padding(.horizontal)
      .foregroundColor(Color.red)
    }
}

struct CardView: View {
  let content: String
  @State var isFaceUp: Bool = false
  //@State irá criar um ponteiro para a variável
  //var isFaceUp = false -> tb pode ser escrito assim (Type Inference)
  var body: some View{
    ZStack(content: {
      let base = RoundedRectangle(cornerRadius: 12)
      //let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12) -> Não precisa colocar o tipo (RoundedRectangle) pois o Swift(linguagem fortemente tipada) define(Type Inference) implícitamente o tipo da constante/var
      if isFaceUp {
        base.fill().foregroundColor(.white) // -> responsável pela "cor" de fundo. Pode ser tb -> base.fill(.white)
        base.strokeBorder(lineWidth: 3)// -> Não é padrão, precisa ser definido  Padrão: .fill()
        //.strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10,2] -> linha tracejada
        //.foregroundColor(Color.red)// ou somente .red
        Text(content)
          .font(.largeTitle)
      }
      else {
        base
      }
    })
    //adicionar uma ViewModifier a ZStack para ocasionar o evento de "clique"
    .onTapGesture {
      isFaceUp.toggle()
      //.toggle() -> alterar o valor de true/false
      //outra maneira de ser escrito: isFaceUp = !isFaceUp
    }
  }

  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
        .preferredColorScheme(.dark)
      ContentView()
        .preferredColorScheme(.light)
    }
  }
}
