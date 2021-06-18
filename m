Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E5D173
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Jun 2021 21:58:29 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.205.41])
	by Aruba Outgoing Smtp  with ESMTPSA
	id uMSPl71J5WIZBuMSPlvT2u; Fri, 18 Jun 2021 23:55:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1624053321; bh=mm3+yH3mddbMfUoELEnlNSWNgkRkivfhEz38Is+SRo4=;
	h=To:From:Subject:Date:MIME-Version:Content-Type;
	b=IoglBIGg+3L6wtg465RsDSHt8Oirp8oegxMlLRv9Rqgi+KziP1cNrUo9WQZNsa4ob
	 3aIfsjAalglzZztCCagCH6ZfflNsraTDIObN0Dy8vbDulbJeFvpXP2/TRqMZs1S/W+
	 Be3v4LJqAuHm2hiVJl9gfri/hcVVnxHKekFVn0Y+viN3zJFEXGaUWZB4Aw02v9KUHe
	 zAZQwa7HaD8F8ycRHP3LOvuvW7orszj0F50FokTYFYvRpkXPpAbBFEQEPC2okoVzEC
	 ckjhrNWh7ySzNmlFUU1PKNJgpZXB7RaL83gw5pBmdbWGmLSTB/p8eQX78BNSp9aS1G
	 TdJ86ciN8kW9w==
To: linux-sunxi@lists.linux.dev
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: s-jtag on A33
Message-ID: <c366547a-a19f-2673-d3c8-15771f565256@benettiengineering.com>
Date: Fri, 18 Jun 2021 23:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfABRzVJv4a+DITStL/OFHyp/6v7J8q8Ac7ZN12IaJ12lvQx1bpx6t/tNXzlMd+l534aZeGoRikcg1HuWAUPua4cp5RIeWSeRHmBC5uE0SbbbCk628mlU
 HEAX3OJXFquY0/OMAZEM/OJX94SghGiov6DgYiae+g5mx2CyD91mPu847m0eYwYTw8AeLR9Z5oFMpxVLRPzDvWMVXNsRI3iH5TY=

Hello All,

have anyone accessed A33 jtag through s-jtag(PL4-PL7) port? In u-boot 
present in sd-card on SDC0 I've configured those pins as jtag mux(both 
tried 2 and 3 as values), but while Trace32 answers on jtag(PF port) 
here it doesn't answer. I've double-checked with md.l under u-boot and 
the values are correct, it seems something is missing.

So I've tried looking for PRCM if it has a jtag gate/reset but I haven't 
found it except the ones for R_PIO etc. I also have a doubt that s-jtag 
is dedicated to AR100 co-processor, maybe?

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
