class SupportMailer < Mailer
  SUPPORT_EMAIL = "johnskarbek@informed-llc.com"
  FROM_ADDRESS = "support@informed-llc.com"

  def initialize
    @from_email = FROM_ADDRESS
    @destination_email = SUPPORT_EMAIL
    @epoch = GetEpochTimes.new
  end

  private

  def text
    email_text = <<-EMAIL
                From: Support <#{@from_email}>
                To: Support <#{@destination_email}>
                Subject: Bandwidth Utilization Report

                Content-Type: text/html;
                  charset="iso-8859-1"
                  Content-Transfer-Encoding: quoted-printable
                  Content-Description: Message in HTML form

                  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
                   "http://www.w3.org/TR/html40/strict.dtd">
                   <html>
                <p>The following graphs represent a 12 hour window, starting at 8AM to 8PM for the bandwidth of both of our T1 bundles.</p>
                <p>Coporate Circuit (our internet and VPN connectivity):</p>
                <img src="http://10.1.1.230:3000/plugins/rrdPlugin?action=arbreq&which=graph&arbfile=throughput&arbiface=eth2&arbip=&start=1363276800&end=1363320000&counter">
                <p>Web Circuit (client facing websites):</p>
                <img src="http://10.1.1.230:3000/plugins/rrdPlugin?action=arbreq&which=graph&arbfile=throughput&arbiface=eth1&arbip=&start=1363276800&end=1363320000&counter">
    EMAIL
  end
end
