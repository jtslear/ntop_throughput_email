class Mailer
  SMTP_SERVER = "zimbra.informed-llc.com"
  SMPT_PORT = 25
  FROM_ADDRESS = "support@informed-llc.com"

  def initialize(email)
    @destination_email = email
  end

  def deliver
    Net::SMTP.start(SMTP_SERVER) do |smtp|
      smtp.send_message text, FROM_ADDRESS, @destination_email
    end
  end

  private

  def text
    ""
  end
end
