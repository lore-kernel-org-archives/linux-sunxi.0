Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.214])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD927C
	for <linux-sunxi@lists.linux.dev>; Tue,  9 May 2023 01:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:From:Subject:
	Content-Type; bh=8k5f8xUHxBQyDb3flKRK9AaZt1QHbdTM1U6Y2KfP+F0=;
	b=k+gt+wJGZA7ZqyR77kERbxz/mhxup7bs2cHVPeKOogagjnZzTYrvxY+0Jg0CFm
	8+uN0tkFUuRftbKDLqLKjwiNUeDsLcpGB0/1G1IdtFb66+/yt2JVNr+M45AI8JSb
	VTweOH6u/lsImjbwxQVsKh5Tjk8dzhK5KNhv8aEEx6tPI=
Received: from [172.21.25.67] (unknown [218.201.129.19])
	by zwqz-smtp-mta-g0-0 (Coremail) with SMTP id _____wCn1ipFqFlkGYtmBQ--.9492S2;
	Tue, 09 May 2023 09:56:21 +0800 (CST)
Message-ID: <0527d592-3829-71b7-e040-d463793500e7@163.com>
Date: Tue, 9 May 2023 09:56:21 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: linux-sunxi@lists.linux.dev
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
From: qianfan <qianfanguijin@163.com>
Subject: allwinner usb phy driver
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wCn1ipFqFlkGYtmBQ--.9492S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF43trWxGryxAryxWryDZFb_yoWxCrX_Wr
	y8JF4kJw1jy3s5Ka1DAw13WrZ0gFnrJa1kAa1xZrn3Gr1ftF93Zry3ArW7ur9Iq3WS9r4U
	G342vry3Awn7KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0yKZJUUUUU==
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiQgZq7VaEFQiWIwAAs5

Hi:

All of the usb phys run sun4i_usb_phy_write to set some private tp register,
but based on allwinner R40's bsp code, sun4i_usb_phy_write only work for
ehci0/ohci0.

And I had changed PHY_TX_AMPLITUDE_TUNE's value to 0x17 from 0x14, when 
the usb
enter TEST_J mode, only the ehci0's amplitude is changed.

sun4i_usb_phy_write is as same as USBC_Phy_TpWrite in allwinner bsp code,
it is used for change otg's tp values. the backtrace is:

sunxi_udc_bsp_init -> open_usb_clock -> UsbPhyInit(0) -> USBC_Phy_TpWrite.

The other ehci/ohci device should use usb_phyx_tp_write instead.
The backtrace is:

open_ehci_clock -> open_clock -> usb_phyx_tp_write

