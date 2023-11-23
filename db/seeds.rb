# frozen_string_literal: true

user = User.create(email: 'test@sample.com', password: 'test', role: 'member')
book = Book.create(title: 'Meditations', author: 'Marcus Aurelius')

book = Book.create(author: 'The Elements of Pizza', title: 'The Elements of Pizza', reserved: true)
reservation = Reservation.with_code(pick_up_time: 5.minutes.from_now, user:, book:)
reservation.save
