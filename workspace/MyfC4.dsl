workspace {

  model {
    user = person "Пользователь"
    softwareSystem = softwareSystem "Банковское приложение" {
      webapp = container "Web-приложение" 
      db = container "БД PostgreSQL"
      user -> webapp "Использует"
      webapp -> db "Читает и пишет"
    }
  }

  views {
    systemContext softwareSystem {
      include *
      autoLayout
    }

    container softwareSystem {
      include *
      autoLayout
    }

    theme default
  }
}
