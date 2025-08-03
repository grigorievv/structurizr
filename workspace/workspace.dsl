workspace "MIB" "MobBank"

    !identifiers hierarchical
fgjhhfgjhfghfjg
    model {
        u = person "Actor"
        ss = softwareSystem "Mobile Bank" {
            wa = container "WebApp-Front"
            db = container "Database Schema" {
                tags "Database"
            }
        }

        u -> ss "Uses"
        u -> ss.wa "Uses"
        ss.wa -> ss.db "Reads from and writes to"
    }

    views {
        systemContext ss "Diagram1" {
            include *
            autolayout lr
        }

        container ss "Diagram2" {
            include *
            autolayout lr
        }

        // styling...
    }

}