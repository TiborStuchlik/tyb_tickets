# TybTickets
###Řešení úkolu:

Vytvořte v Ruby knihovnu, která bude sloužit jako backend pro tiketovací systém uživatelské podpory.

Knihovna umožní uživatelům zakládat tikety s popisem požadavku, evidovat kdo na tiketu pracoval, kdy ho uzavřel a s jakým výsledkem (např. vyřešeno, zamítnuto, duplicita apod.)

Naprogramujte funkce pro zjištění:
- průměrného času odbavení tiketu,
- žebříček pracovníku podpory podle počtu vyřešených tiketů v daném časovém období,
- žebříček uživatelů, kteří v daném časovém období čekali na odbavení svých tiketů nejdéle.

Data uchovávejte v databázi PostgreSQL, pro implementaci můžete použít libovolnou databázovou knihovnu/ORM.

Součástí řešení bude i popis, jak knihovnu použít.
## Installation
Add this line to your application's Gemfile:

```ruby
gem 'tyb_tickets'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install tyb_tickets
```

## Setting
Create migration and migrate

it must be run from the root folder of the plugin
```bash
$ rails g tyb_ticket:install
```

Generate some testing data

it must be run from the root folder of the plugin
```bash
$ rails g tyb_ticket:seeds
```

## Usage

Plugin obsahuje základní metody pro manipulaci s objekty:
```ruby 
TybTickets.addMember( email) # přidá nového člena jménem/emailem
TybTickets.addTicketStatus( name) # přidá nový typ výsledek uzavření tiketu

TybTickets.addTicket( member_id, customer_email, description)
TybTickets.closeTicket( ticket_id, ticket_status_id)
```

A metody pro statistiky:
```ruby 
TybTickets.average_work_time # průměrný čas zpracování tiketu
TybTickets.members_stats( from_date, to_date ) # statistiky pracovníků
TybTickets.customers_stats( from_date, to_date) # statistiky uživatelů
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
