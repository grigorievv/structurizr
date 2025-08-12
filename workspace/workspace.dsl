
workspace "Name" "Description" {
    
    !identifiers hierarchical

    model {
        u = person "User"
        ss = softwareSystem "Software System" {
            wa = container "Web Application" {
                ca = component "Authentication Controller" "Handles login and authentication"
                cd = component "Data Service" "Provides data access and business logic"
                cv = component "View Renderer" "Generates HTML/JSON responses"
            }
            db = container "Database Schema" {
                tags "Database"
            }
        }

        // Связи
        u -> ss "Uses"
        u -> ss.wa "Uses"
        ss.wa -> ss.db "Reads from and writes to"
        
        // Внутренние связи между компонентами
        u -> ss.wa.ca "Logs in via"
        ss.wa.ca -> ss.wa.cd "Validates and requests data"
        ss.wa.cd -> ss.db "Queries and updates"
        ss.wa.cd -> ss.wa.cv "Sends data for rendering"
    }

    views {
        // System Context
        systemContext ss "Diagram1" {
            include *
            autolayout lr
        }  :

        // Container
        container ss "Diagram2" {
            include *
            autolayout lr
        }

        // Component (для Web Application)
        component ss.wa "Diagram3" {
            include *
            autolayout lr
        }
    }
}

