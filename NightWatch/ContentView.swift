//
//  ContentView.swift
//  NightWatch
//
//  Created by Zvika Ekhous on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var nightWatchTasks: NightWatchTasks
    
    var body: some View {
        NavigationView {
            List {
                Section(header: TaskSectionHeader(symbolSystemName: "moon.stars", headerText: "Nightly Tasks")) {
                    let nightWatchTasksWrapper = $nightWatchTasks
                    let tasksBinding = nightWatchTasksWrapper.nightlyTasks
                    let sectionTasks = nightWatchTasks.nightlyTasks

                    let taskIndices = sectionTasks.indices
                    var tasksPair = Array(zip(sectionTasks, taskIndices))
                    
                    ForEach(tasksPair, id: \.0.id, content: {
                        task, taskIndex in
                                                
                        NavigationLink(destination: DetailsView(task: tasksBinding[taskIndex]), label: {
                            TaskRow(task: task)
                        })
                    })
                }
                
                Section(header: TaskSectionHeader(symbolSystemName:"sunset", headerText: "Weekly Tasks")) {
                    let nightWatchTasksWrapper = $nightWatchTasks
                    let tasksBinding = nightWatchTasksWrapper.weeklyTasks
                    let sectionTasks = nightWatchTasks.weeklyTasks

                    let taskIndices = sectionTasks.indices
                    var tasksPair = Array(zip(sectionTasks, taskIndices))
                    
                    ForEach(tasksPair, id: \.0.id, content: {
                        task, taskIndex in
                                                
                        NavigationLink(destination: DetailsView(task: tasksBinding[taskIndex]), label: {
                            TaskRow(task: task)
                        })
                    })
                }

                Section(header: TaskSectionHeader(symbolSystemName: "calendar", headerText: "Monthly Tasks")) {
                    let nightWatchTasksWrapper = $nightWatchTasks
                    let tasksBinding = nightWatchTasksWrapper.monthlyTasks
                    let sectionTasks = nightWatchTasks.monthlyTasks

                    let taskIndices = sectionTasks.indices
                    var tasksPair = Array(zip(sectionTasks, taskIndices))
                    
                    ForEach(tasksPair, id: \.0.id, content: {
                        task, taskIndex in
                                                
                        NavigationLink(destination: DetailsView(task: tasksBinding[taskIndex]), label: {
                            TaskRow(task: task)
                        })
                    })
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Home")
        }
        
        
        // THIS IS HOW A FIXED LIST (WITHOUT LIST VIEW) WAS IMPLEMENTED:
//        VStack {
//            HStack {
//                VStack(alignment: .leading){
//                    // MARK: Nightly tasks
//                    Group {
//                        HStack {
//                            Text(Image(systemName: "moon.stars"))
//                                .foregroundColor(.yellow)
//                                .font(.title3)
//                                .fontWeight(.heavy)
//                            Text("Nightly Tasks")
//                                .underline()
//                                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
//                                .fontWeight(.heavy)
//                                .foregroundColor(.yellow)
//                                .textCase(.uppercase)
//                        }
//                        Text("- Check all windows")
//                        Text("- Check all doors")
//                        Text("- Check that the safe is locked")
//                        Text("- Check the mailbox")
//                        Text("- Inspect security cameras")
//                        Text("- Clear ice from sidewalks")
//                    }
//
//                    // TODO: TODO1
//                    // FIXME: This is broken!
//
//                    // MARK: Weekly tasks
//                    Group {
//                        Divider()
//                        HStack {
//                            Text(Image(systemName: "sunset"))
//                                .foregroundColor(.yellow)
//                                .font(.title3)
//                                .fontWeight(.heavy)
//                            Text("Weekly Tasks")
//                                .underline()
//                                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
//                                .fontWeight(.heavy)
//                                .foregroundColor(.yellow)
//                                .textCase(.uppercase)
//                        }
//                        Text("- Check inside all vacants rooms")
//                        Text("- Walk the perimeter of property")
//                    }
//
//                    // MARK: Monthly tasks
//                    Group {
//                        Divider()
//                        HStack {
//                            Text(Image(systemName: "calendar"))
//                                .foregroundColor(.yellow)
//                                .font(.title3)
//                                .fontWeight(.heavy)
//                            Text("Monthly Tasks")
//                                .underline()
//                                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
//                                .fontWeight(.heavy)
//                                .foregroundColor(.yellow)
//                                .textCase(.uppercase)
//                        }
//                        Text("- Test security alarm")
//                        Text("- Test motion detectors")
//                        Text("- Test smoke alarms")
//                    }
//                }
//                .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
//                .padding([.top, .leading])
//                Spacer()
//            }
//            Spacer()
//        }
    }
}

struct TaskSectionHeader: View {
    let symbolSystemName: String
    let headerText: String
    
    var body: some View {
        HStack {
            Image(systemName: symbolSystemName)
            Text(headerText)
        }
        .font(.title)
    }
}



struct TaskRow: View {
    let task: Task
    
    var body: some View {
        VStack {
            if task.isComplete {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundColor(.gray)
                    .strikethrough()
                }
            } else {
                HStack{
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let nightWatchTasks = NightWatchTasks()
        
        ContentView(nightWatchTasks: nightWatchTasks)
//        TaskRow(task: Task(name: "Task!", isComplete: false))
//            .previewLayout(.fixed(width: 300, height: 70))
    }
}

