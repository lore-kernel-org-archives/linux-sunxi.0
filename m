Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9486E10F3
	for <linux-sunxi@lists.linux.dev>; Fri, 29 Apr 2022 04:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:From:Subject; bh=LAqGN
	Tfao9tUXs9uZ2AZWUiTGQ1JA+EbbcMatXb2T9U=; b=A3uE7wXtbZA9g/epise2g
	8bn48CTkfCRUQYZdjsy5cdHbTWc4S0aZ9tfg99xYSUOfbqr+0IFPTxKpSewLh6Xo
	or61HYjFWTBpDyftHchK9GbGZn3+gX04png8p89aRroY40PzHD1zCMdOOcC6zBxg
	ZLRrmE2rwWvrsYX0Ihm3FE=
Received: from [192.168.3.102] (unknown [218.201.129.19])
	by smtp11 (Coremail) with SMTP id D8CowAAnq+fXaWtiL2eiDQ--.34413S2;
	Fri, 29 Apr 2022 12:30:16 +0800 (CST)
Message-ID: <2ecb71b6-6df1-6728-3d30-a401e181b326@163.com>
Date: Fri, 29 Apr 2022 12:30:15 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
To: linux-sunxi@lists.linux.dev
Content-Language: en-US
From: qianfan <qianfanguijin@163.com>
Subject: question: How to toggle gpio when init_early
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:D8CowAAnq+fXaWtiL2eiDQ--.34413S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcWE_DUUUU
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbCqRnx7V0DfFEq+AABsM

Hi everyone:

I want toggle a gpio when machine_desc->init_early, but failed.

The gpio is pd24, and I searched the datasheet of r40, the address of 
PD_DAT register
is 0x01c20800 + 3 * 0x24 + 0x10. So I modify this register by 
__raw_readl and __raw_writel.
The system can't startup when I adding those code.

Seems the physical address can't touch due to mmu.
Can I get some advice?

Thanks

