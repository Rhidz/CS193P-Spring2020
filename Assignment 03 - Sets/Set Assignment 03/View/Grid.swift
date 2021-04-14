
import SwiftUI
 
struct Grid<Item, ItemView> : View where Item: Identifiable, ItemView: View{
    
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) { // @escaping reminds of memory cycle and makes the function skip what will appear in the following.
        self.items = items
        self.viewForItem = viewForItem
        
    }
     // MARK:- Code Snippet for Constraints and Gains
    var body: some View {
        GeometryReader { geometry in
            body(for: GridLayout(itemCount: items.count, nearAspectRatio: 1.5, in: geometry.size))
               
        }
       
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in // items need to have a range for iteration purposes thus, it has to conform to Identifiable.
            body(for: item, in: layout)
               
        }
        
    }
     
    func body(for item: Item, in layout: GridLayout) -> some View{
        let index = items.firstIndex(matching: item)!
       
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
           }
   }
    

// MARK:- Use this snippet instead
/* func body(for size: CGSize) -> some View {
      ForEach(item) { item in
         return viewForItem(item)
 
 */
