//
//  SidebarView.swift
//  SimpleSidebarUI
//
//  Created by Léo Lesimple on 28/05/2023.
//
import SwiftUI

struct SidebarView: View {
    @State private var isSidebarOpen = false
    @State var active: Bool = false

    var body: some View {
        NavigationView {
            content
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button(action: toggleSidebar, label: {
                            Image(systemName: "sidebar.left")
                        })
                        .keyboardShortcut("/", modifiers: .command)
                    }
                }
                .onAppear {
                    #if os(macOS)
                    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
                    #endif
                }
            CreateView()
        }
    }
    
    private var content: some View {
        List {
            Section(header: Text("Serveur Web")) {
                NavigationLink(destination: CreateView()) {
                    Label("Création", systemImage: "plus")
                }
                NavigationLink(destination: ContentView()) {
                    Label("Gestion", systemImage: "wrench.adjustable")
                }
                NavigationLink(destination: ContentView()) {
                    Label("Sécurité", systemImage: "network.badge.shield.half.filled")
                }
            }

            Section(header: Text("Documentation")) {
                NavigationLink(destination: ContentView()) {
                    Label("HTML", systemImage: "box.truck")
                }
                NavigationLink(destination: ContentView()) {
                    Label("CSS", systemImage: "wrench.adjustable")
                }
                NavigationLink(destination: ContentView()) {
                    Label("JS", systemImage: "wrench.and.screwdriver")
                }
                NavigationLink(destination: ContentView()) {
                    Label("PHP", systemImage: "paintbrush")
                }
            }

            Section(header: Text("Débogage")) {
                NavigationLink(destination: ContentView()) {
                    Label("Console", systemImage: "person")
                }
                NavigationLink(destination: ContentView()) {
                    Label("ChatGPT", systemImage: "bell")
                }
            }
            
            Section() {
                NavigationLink(destination: ContentView()) {
                    Label("Paramètres", systemImage: "gear")
                }
                NavigationLink(destination: ContentView()) {
                    Label("Découvrir", systemImage:"magnifyingglass")
                }
            }
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 0, idealWidth: 250, maxWidth: .infinity)
        .padding(.leading, 0)
    }

    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
