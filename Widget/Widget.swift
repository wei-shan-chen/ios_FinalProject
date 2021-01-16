//
//  widgett.swift
//  widgett
//
//  Created by User02 on 2021/1/3.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    var tempimg : UIImage? = nil
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), uiImage: nil)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), uiImage: nil)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let number = Int.random(in: 0...1000)
        URLSession.shared.dataTask(with: URL(string: "https://picsum.photos/id/\(number)/200/300")!) { (data, response, error) in
        let currentDate = Date()
        if let data = data,
        let uiImage = UIImage(data: data){
        let entry = SimpleEntry(date: currentDate, uiImage: uiImage)
        entries.append(entry)
        }
        let timeline = Timeline(entries: entries,
        policy: .after(currentDate.addingTimeInterval(60)))
        completion(timeline)
        }.resume()
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let uiImage : UIImage?
}

struct widgettEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        
        ZStack{
            Image("backwid")
            Text(entry.date, style: .time)
        }
        /*
        VStack{
            Text(entry.date, style: .time)
            entry.uiImage.map{
                Image(uiImage:  $0)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }*/
    }
}

@main
struct widgett: Widget {
    let kind: String = "widgett"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            widgettEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct widgett_Previews: PreviewProvider {
    static var previews: some View {
        widgettEntryView(entry: SimpleEntry(date: Date(),uiImage: nil))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
