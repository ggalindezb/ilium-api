# frozen_string_literal: true

user = User.create(email: 'user@sample.com', password: 'test', role: 'member')
clerk = User.create(email: 'clerk@sample.com', password: 'test', role: 'admin')
book = Book.create(title: 'Meditations', author: 'Marcus Aurelius')

book = Book.create(author: 'Ken Forkish', title: 'The Elements of Pizza', reserved: true)
reservation = Reservation.with_code(pick_up_time: 5.minutes.from_now, user:, book:)
reservation.save
