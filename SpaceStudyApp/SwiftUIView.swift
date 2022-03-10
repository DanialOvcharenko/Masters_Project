import SwiftUI

struct SwiftUIView: View {
    
    @State private var showSheet = false
    
    @State private var checkFast = ""
    @State private var skybody = 0
    @State private var planet = 0
    
    let planets: [String] = ["Сонце", "Місяць", "Марс", "Венера", "Юпітер"]
    let waySizes: [Double] = [150000000, 384400, 55760000, 38000000, 588000000]
    
    var TotalDays: Double {
        let planetWayLong = Double(waySizes[planet])
        let orderFast = Double(checkFast) ?? 0
        
        let tipValue = (planetWayLong / orderFast) / 24
        
        return tipValue
    }
    
    var body: some View {
        NavigationView{
            Form{
                Button(action: {
                    self.showSheet = true
                }){
                    Text("Інструкція")
                        .padding(.horizontal, 120)
                }
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Космо-Калькулятор"),
                                message: Text("Спочатку вкажіть швидкість 'вашого космічного транспорту' у кілометрах на годину -> Далі оберіть небесне тіло до якого летіти -> Отримайте кількість днів, за які ви зможете дістатися до обраного вами небесного тіла, з вказаною швидкістю"),
                                buttons: [.default(Text("Зрозумів. Готовий користуватись"))])
                }
                
                Section{
                    TextField("Ваша швидкість (км/г)", text: $checkFast)
                }
                
                Section(header: Text("До якого небесного тіла летимо?").foregroundColor(.blue)){
                    Picker("Planet", selection: $planet){
                        ForEach(0..<planets.count){
                            Text("\(self.planets[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text("летіти \(TotalDays) днів до небесного тіла (\(planets[planet])) з вказаною швидкістю")
                }
                
                Section(header:
                            Text("Важливо розуміти")
                            .font(.title3)
                            .padding(.top)
                            .padding(.horizontal, 60)
                            .foregroundColor(.blue)
                ){
                    Text("дистанція до планет прийнята найкоротша (коли планети - на 1 лінії від сонця)")
                }
                
                Section{
                    Text("щоб вийти з калькулятору свайпніть єкран униз")
                }
            }
            .navigationBarTitle("Космo-калькулятор", displayMode: .inline)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
