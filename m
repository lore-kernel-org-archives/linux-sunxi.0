Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F804322B
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 23:36:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 9BA985C011B;
	Mon,  2 May 2022 19:36:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 02 May 2022 19:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1651534573; x=
	1651620973; bh=oSO4IG1e2PvfQf3XV7EPd0FAQcRG5NB9lh6PhBhOWU0=; b=j
	R4NzYUu6ZyxnW0ChBkVSV2F7DEd4Q7PwsuEVl3RsmVO1INnfrlNK58S9YZHYZFgu
	3Cc+dn52ukaqbE53pkFyS1b1vUgurIMTtwpEZlEsCKZsEQCkb8VClKp/tmQo9DuN
	92CS7Zt1ecinlzAfuhSgUqlJxzKp0N4CZvswVlggkUEISo4LNLAViB8XMlPYhnN5
	i67h8D/M0Y10E+gDvEnFUAT9h18pE26ZBcoOpWcY4JwkjMhc56TwMPMij2CWUWTH
	S4kgwtAdS5ZEl1WK4+9swTBJofjXG5klGnN5Uf9OJRb6D++eHdc25heX+GXGjNhY
	ysh7LD3gy1GpiJleWVYRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1651534573; x=1651620973; bh=oSO4IG1e2PvfQ
	f3XV7EPd0FAQcRG5NB9lh6PhBhOWU0=; b=qCSFNl3h+wYIrr6VTq86raeDUzGro
	d8jzb7tTd0AQ+WyYE5nPuDaFZs3dQ+K6FXfr5aWNv/wQB5g3aaDy4rB7IcgLu3i9
	g5S0BiotrIWtc3Xko08M1Xqg9gNn88/fcqyWPi0d3wZY7ogscKqQlteFAM0g05y4
	sNiue4K94B64xBWCKjGBCpf2ujeJXX2g79W3aBeEjX3XP7fFy16e9/hIYQxFvYdk
	3OVIbpafWmKCxFn3J0m6eYdSHZ1YdzF1tL4nJtZvcg/E6PaeuapNmu1jnET+p3v3
	FUAs6HaOf305Vzv8XUJ9doiJ/JZ1vXO6lTwz4xidutDJMbGRQ821LbIyQ==
X-ME-Sender: <xms:7WpwYlyE23xcU5kBR_BXw36htvimcJCiLIRSjzwAs6TsMqhCTmXflg>
    <xme:7WpwYlQfKHdwtS3HMUnnXmdNy96f09lChyLNtDDseVFruuGrMByuZbezkHYio_0nS
    e6kRZxqGL5eQfUT7Q>
X-ME-Received: <xmr:7WpwYvUmC3nM0pteWW4jEgL7EniO0m1EfGinvzXI3sUduGzywIu0XvL_x0400n92xMRwaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeigddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhevhffkffgfgggjtgfgsehtje
    ertddtfeejnecuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhes
    shhhohhllhgrnhgurdhorhhgqeenucggtffrrghtthgvrhhnpedvtdetjeekkefhieduhe
    dvjeehjeelgeeiudeiudeitdehjeevuedtteeigffggfenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurd
    horhhg
X-ME-Proxy: <xmx:7WpwYnggfzPG1poNLI-jM0wr2Aw-YMpJloqC3BKQU1yI5lVZ-hRsTQ>
    <xmx:7WpwYnBnMF9ZnopT6rl0uZXaV5wtCzwQsAr7nYhSAZW_HR8f-InUZA>
    <xmx:7WpwYgJHsQAoYAH7LJcM1JzBxbo5wB_52cxGVwuWq0iyio14Y_uz-w>
    <xmx:7WpwYqpNWHxuOoxklO5HmFV2Oa-8cR4tyA_mgmPp02rrMrpQvMvVcw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 May 2022 19:36:13 -0400 (EDT)
Subject: Re: question: How to toggle gpio when init_early
To: qianfan <qianfanguijin@163.com>
References: <2ecb71b6-6df1-6728-3d30-a401e181b326@163.com>
Cc: linux-sunxi@lists.linux.dev
From: Samuel Holland <samuel@sholland.org>
Message-ID: <1915b311-05f5-f650-262a-24cbb5ff69e0@sholland.org>
Date: Mon, 2 May 2022 18:36:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2ecb71b6-6df1-6728-3d30-a401e181b326@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/28/22 11:30 PM, qianfan wrote:
> Hi everyone:
> 
> I want toggle a gpio when machine_desc->init_early, but failed.
> 
> The gpio is pd24, and I searched the datasheet of r40, the address of PD_DAT
> register
> is 0x01c20800 + 3 * 0x24 + 0x10. So I modify this register by __raw_readl and
> __raw_writel.
> The system can't startup when I adding those code.
> 
> Seems the physical address can't touch due to mmu.
> Can I get some advice?

You need to call ioremap() to get a virtual address for the MMIO region. But you
really should be using the GPIO API and not raw MMIO. And you really should be
using devicetree and not touching the machine description. For example, if this
is for a GPIO-connected watchdog or LED or regulator, Linux already has
devicetree drivers for these.

Regards,
Samuel
