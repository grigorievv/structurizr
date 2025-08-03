workspace {

  model {
    user = person "Customer" {
      description "A user of the fintech platform"
    }

    authSystem = softwareSystem "Authorization System" {
      description "Handles user authentication and authorization"

      authService = container "Auth Service" {
        technology "Node.js + JWT"
        description "Manages login, tokens, sessions"
      }

      sessionCache = container "Session Cache" {
        technology "Redis"
        description "Stores session data"
      }

      authService -> sessionCache "Stores session data"
    }

    paymentsSystem = softwareSystem "Payments System" {
      description "Handles payment processing"

      paymentAPI = container "Payment API" {
        technology "Java + Spring Boot"
        description "Processes payment requests"
      }

      eventBus = container "Event Bus" {
        technology "Apache Kafka"
        description "Publishes payment events"
      }

      paymentAPI -> eventBus "Publishes payment events"
    }

    // Внешние взаимодействия
    user -> authSystem "Authenticates / Logs in"
    user -> paymentsSystem "Initiates payments"
    paymentsSystem -> authSystem "Validates session and permissions"
  }

  views {
    systemContext authSystem {
      include authSystem
      autolayout lr
    }

    systemContext paymentsSystem {
      include paymentsSystem
      autolayout lr
    }

    container authSystem {
      include authService
      include sessionCache
      include user
      autolayout lr
    }

    container paymentsSystem {
      include paymentAPI
      include eventBus
      include user
      autolayout lr
    }

    theme default
  }
}
