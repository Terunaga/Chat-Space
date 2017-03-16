json.set! :text,  @message.text
json.set! :image, @message.image
json.set! :user,  @message.user.name
json.set! :date,  format_date(@message)
