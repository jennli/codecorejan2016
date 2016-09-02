require "pony"

class MailSender

  def self.send(params)
    Pony.mail({
      to: "ldnjennifer@hotmail.com",
      from: params[:email],
      subject: "You got contact from #{params[:full_name]}",
      body: params[:message],
      via: :smtp,
      via_options: {
        address:        'smtp.gmail.com',
        port:           '587',
        user_name:      'answerawesome',
        password:       'Sup3r$ecret',
        authentication: :plain,
        domain:         "localhost.localdomain" # the HELO domain provided by the client to the server
      }
    })

  end

end
