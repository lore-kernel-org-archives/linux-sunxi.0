Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12493173
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Jun 2021 22:06:17 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.205.41])
	by Aruba Outgoing Smtp  with ESMTPSA
	id uMZzl77TrWIZBuMZzlvayE; Sat, 19 Jun 2021 00:03:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1624053791; bh=xB6DWzvEwIl4DTGQMuR2n7m4AJcwwoBW40nnZbYZYSw=;
	h=To:From:Subject:Date:MIME-Version:Content-Type;
	b=MIUeIL48Twar6YKFhXQbB9Q0Fi/Pi5OxUGVx8SBClVoEzInYE+ng46PFBJ+wR0QPu
	 4UFkrTHckO/V2jtxnzVlsy0bg5TP13ll9PCqDiDNwFJ9JSBOcGwGYAFPeDdURVsG4u
	 eKggYJBeyNcqn5inb/jEgr4lo+JQv3tDRF4+LayWm1uT3J1wyyYIas+gCHTU9D+Wh+
	 0KAqNdATRRYZhI5eV/sb9/gUZY0HcBrR7rsDgKVpzB2jktmdgDxsPNqDSO9OGAY3yA
	 D7mDQ0qxUGrojVGhNWZp3sndGUjNF3XGDgvag9KUa823SPomeIOn9FrOJtCA5/2TjS
	 +uYoRxjQS51JA==
To: linux-sunxi@lists.linux.dev
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: S-JTAG on A33
Message-ID: <d0144325-3f3a-32cc-310e-c7b9d701bb2c@benettiengineering.com>
Date: Sat, 19 Jun 2021 00:03:11 +0200
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
X-CMAE-Envelope: MS4wfGUgym5j+88yBP3sBlKs5Nt5IYGY5yPeNdtPGxwh0u9SGbY88h4SLUGpVwfnDiW5ZMCN8X9O+sz+5Kg9fkapct0H2PadA0sp9MrN3kSXQKnPhHpUoZEH
 c/T0hgkjK99x4Uxiq1Zgq22E9dbiFr4+dccOULNmwoY8u5L4yDGKR8vblN2v0CQ7lu5dkZD9Cfa/OvVo4S+HSb58VLcSVCIiBzo=

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

