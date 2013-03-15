class Mailer
  SMTP_SERVER = "zimbra.informed-llc.com"
  SMPT_PORT = 25
  FROM_ADDRESS = "support@informed-llc.com"
  SUPPORT_EMAIL = "johnskarbek@informed-llc.com"

  def initialize
    @epoch = GetEpochTimes.new
    Mail.defaults do
      delivery_method :smtp, { :address   => SMTP_SERVER,
        :port      => 25 }
    end
  end

  def deliver
    start_time = @epoch.the_start_time
    end_time = @epoch.the_end_time
    mail = Mail.deliver do
      to SUPPORT_EMAIL
      from "Support <#{FROM_ADDRESS}>"
      subject 'Bandwidth Utilization Report'
      html_part do
        content_type 'text/html; charset=UTF-8'
        body "  <p>The following graphs represent a 12 hour window, starting at 8AM to 8PM for the bandwidth of both of our T1 bundles.</p>
                <p>Coporate Circuit (our internet and VPN connectivity):</p>
                <img src=#{"http://10.1.1.230:3000/plugins/rrdPlugin?action=arbreq&which=graph&arbfile=throughput&arbiface=eth2&arbip=&start=#{start_time}&end=#{end_time}&counter=&title=Last+Business+Day+Throughput"}>
                <p>Web Circuit (client facing websites):</p>
                <img src=#{"http://10.1.1.230:3000/plugins/rrdPlugin?action=arbreq&which=graph&arbfile=throughput&arbiface=eth1&arbip=&start=#{start_time}&end=#{end_time}&counter=&title=Last+Business+Day+Throughput"}> "
      end
    end
  end
end
