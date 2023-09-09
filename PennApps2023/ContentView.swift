import SwiftUI
import MapKit



struct ContentView: View {
    @State private var tabSelected: Tab = .house
    @State private var points: Int = 400
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $tabSelected) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            if tab == .house {
                                house(points: $points)
                            }
                            
                            if tab == .scroll {
                                scroll(points: $points)
                            }
                            
                            if tab == .map {
                                map(points: $points)
                            }
                            
                            if tab == .trophy {
                                trophy(points: $points)
                            }
                            
                            if tab == .gearshape {
                                gearshape(points: $points)
                            }
                            
                        }
                        .tag(tab)
                        
                    }
                }
            }
            VStack {
                Spacer()
                NavBar(selectedTab: $tabSelected)
            }
        }
    }
}

struct house: View {
    @Binding var points: Int
    
    var body: some View {
        
        VStack {
            Text("House")
        }
        .background(Color.blue)
    }
}


struct Task: Identifiable {
    let id = UUID()
    var point: Int
    var text: String
    var completed: Bool = false
}

struct scroll: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @Binding var points: Int
    @State private var tasks = [
        Task(point: 200, text: "Run 5 miles"),
            Task(point: 100, text: "Pick up 20 pieces of garbage"),
            Task(point: 70, text: "Take pictures of 4 flowers"),
            Task(point: 90, text: "Go on a walk for 20 minutes"),
            Task(point: 200, text: "Create a homemade natural compost bin"),
            Task(point: 350, text: "Start your own backyard garden")
        ]
        var body: some View {
            ZStack{
                Color("lightyellow").ignoresSafeArea()
                ScrollView {
                    Text("Daily Tasks")
                        .font(.system(size: 40, design: .rounded))
                        ForEach(tasks) { task in
                            if !task.completed {
                                TaskView(points: $points, task: task, onComplete: {
                                    completeTask(task)
                                })
                            }
                        }
                    .padding(5)
                }
            }
        }
    
        func completeTask(_ task: Task) {
            if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                tasks[index].completed = true
                tasks.remove(at: index)
            }
        }
}

struct TaskView: View {
    @Binding var points: Int
    let task: Task
    var onComplete: () -> Void
    var body: some View {
        HStack {
            Text("\(task.point) points")
                .padding(10)
            Spacer()
            Text(task.text)
            Spacer()
            Button(action: {
                points += task.point
                onComplete()
            }) {
                Text("Complete")
                    .foregroundColor(.blue)
                    .padding(20)
            }
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        
    }
}

struct map: View {
    @Binding var points: Int
    
    var body: some View {
        VStack {
            Text("Map")
                
        }
        .background(Color.green)
    }
}

struct leaderboards: View {
    var dim: [CGFloat]
    var texts: [String]
    var colour: Color
    var body: some View {
        HStack {
            Text(texts[0])
                .foregroundColor(.white)
                .padding(10)
            Spacer()
            Text(texts[1])
                .foregroundColor(.white)
            Spacer()
            Text(texts[2])
                .foregroundColor(.white)
                .padding(10)
        }
        .frame(width: dim[0], height: dim[1])
        .background(colour)
        .cornerRadius(10)
        .padding(dim[2])
    }
}

struct trophy: View {
    @Binding var points: Int
    var body: some View {
        ZStack {
            Color("lightgreen").ignoresSafeArea()
            VStack{
                
                ScrollView(.vertical, showsIndicators: false) {
                    Text("Leaderboard")
                        .font(.system(size: 40, design: .rounded))
                    leaderboards(dim: [370, 60, 2], texts: ["1", "User 1", "\(points) points"], colour:.yellow)
                    leaderboards(dim: [360, 60, 2], texts: ["2", "Jane", "350 points"], colour: .gray)
                    leaderboards(dim: [350, 60, 2], texts: ["3", "Adam", "320 points"], colour:.brown)
                    leaderboards(dim: [320, 40, 5], texts: ["4", "Samantha", "260 points"], colour: .green)
                    leaderboards(dim: [320, 40, 5], texts: ["5", "Darryl", "150 points"], colour: .green)
                    leaderboards(dim: [320, 40, 5], texts: ["6", "Mike", "90 points"], colour: .green)
                    leaderboards(dim: [320, 40, 5], texts: ["7", "Nathan", "20 points"], colour: .green)
                    VStack(spacing: 20) {
                        ForEach(8..<21) { i in
                            leaderboards(dim: [320, 40, 5], texts: ["\(i)", "Username\(i)", "0 points"], colour: .green)
                        }
                    }
                }
            }
        }
    }
}

struct gearshape: View {
    @Binding var points: Int
    
    var body: some View {
        VStack {
            Text("Settings")
                
        }
        .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
