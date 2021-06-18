Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8141173
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Jun 2021 22:09:01 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.205.41])
	by Aruba Outgoing Smtp  with ESMTPSA
	id uMfcl7BkAWIZBuMfclvgxg; Sat, 19 Jun 2021 00:09:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1624054140; bh=nuW/UWo6N+TAVrhc/aFtdDQ7EA/bHV0pGwE4cMqhS5c=;
	h=To:From:Subject:Date:MIME-Version:Content-Type;
	b=gYiy+HTwKarTAPjCdtdnMXPeuQ8OZVaxNeL09afRsd2m1HctTUSx+3S5beHSndQPS
	 vCTgqrXApEPIK1kuhZ0nBHpH/K/s5YRaK82HSaNC2dZOzlu+d75DT5LUpxjg6Qb4DA
	 eUyTbOa/zptARRhwr8CyN5w/vCxsgf0en69oSblPk/a3bx6uaau1yF8NIw6SKDWOQP
	 TS4xXbQusqzcbVBKZHVo6440iqTiW2JnazyrIUV4053BKFBU10nqZvBG+NF6y2E8xN
	 xjP33QnmXgigZKmUYm8iiHirpiX/j8ObGdLjthCceHfy+s7UEKVinl/EGLfaH0sGks
	 KIHAbThAsFhsQ==
To: linux-sunxi@lists.linux.dev
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: S-JTAG on A33
Message-ID: <39ce90de-a17f-272b-2915-c9c50780a859@benettiengineering.com>
Date: Sat, 19 Jun 2021 00:09:00 +0200
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
X-CMAE-Envelope: MS4wfGi/PTrUSC3SqjTxjZU8mxN2J474rXcy32cRGpQ8nvgUIAHDtyczvUu+jZfpXyl2KjZugrg00bwgN9RQmDdUls4wj3xaw3v4WRmQKCimnp65JfHMLU/A
 EwLSA2s4qkOf0/hOlNFdtZ9IaPrLMRHbyoUgWdspA3KZ+hejOma/8cnEbb3k4cFf91I7giWZZifmdt9RAhuPvQDEgX867IyXVoo=

Hello All,

have anyone accessed A33 jtag through S-JTAG(PL4-PL7) port? In u-boot
present in sd-card on SDC0 I've configured those pins as jtag mux(both
tried 2 and 3 as values), but while Trace32 answers on JTAG(PF port)
it doesn't answer on S-JTAG on PL port. I've double-checked with md.l 
under u-boot and the values are correct, it seems something is missing.

So I've tried looking for PRCM if it has a JTAG gate/reset but I haven't
found it except the ones for R_PIO etc. I also have the doubt that 
S-JTAG is dedicated to AR100 co-processor, maybe?

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas

