Rails.application.config.session_store :redis_store,
                                       servers: ['redis://localhost:6379/0/session'],
                                       expire_after: 90.minutes,
                                       key: '_demo_devise_omniauth_react_session'
