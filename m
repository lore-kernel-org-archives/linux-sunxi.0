Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987820;
	b=HLxm7DrzKo44g+mwyUY7Q68WDmazLFxy1LlzPNnYQfe6Rr/i11NLiehnxyFF4sQaLqWJ
	 esxhGLHhbvlvDFkU1lRCeOdgi/U5v6bmRuBX8ycLcMoV4U+1lbmq0ZkXldQjHYtFuwzLg
	 bI69sGHdEKYtNgSVG3IiIqQ7DQ9rqgqTP1yWJcVTdczA9p8EtEGAt0/INPgLlVnm5pUXJ
	 nBMDy8Q73CoNQerq6y9aSem9R79gSl3ojQTTDCDfuMBs2QV3qOGxiCRETDF1OI0337QzI
	 6zvBK6abNuNJ576Dfq9gVJIpjFGPwm0FlkpfzyCvec10R/PAns0GdWFifLIu+YgTMNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987820;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=5tdOi87MUQVrh0lDnm0y5zaT0nPUT+qlg7v5xkEiqMk=;
	b=c76nfDNzEbdsALBiAltPxaNuzN5NO6N21se3xVhlA2WUhos0FNAIZIfmqYhXSxoZcWIZ
	 fuk6SpjDztA8DS/I5c3bbGQyzlOeynFHjV1K3N1HmxzudUKM1GQLgfyPw+t6Vx3qazlY1
	 Ufyy3nsHr4a2osJkAoGET73RHoiHYBjZXMeufaIErd03PMgEwipkXkiguzVboGI/RAzr5
	 yqx192QfAEb1lrNNDOqgqSPZnHMtHLzcZFjxYvYLClNtD++C2fICGDeclrb4JMbUrAwW7
	 hamShFuDwmg9PRG/1J0yGZzG9L2kvVD6kKSMKfBlhrWp71oRTCzlKlITXm4hVXIipXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lvlw2APD;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEED606A333
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 07:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DEED606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lvlw2APD
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E7754E4160A;
	Wed, 18 Nov 2026 07:43:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DE395FE9B;
	Wed, 18 Nov 2026 07:43:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77C8D11BC076C;
	Wed, 18 Nov 2026 08:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794987811; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5tdOi87MUQVrh0lDnm0y5zaT0nPUT+qlg7v5xkEiqMk=;
	b=lvlw2APDkLOsWdPZXrcTGO0SBvJt5AeVKx0Z42miklOsc8vPctTcjUfLvtwVkHahSrHPLo
	CGkq45BFyuEH8fedQgM6HJ/XMbau2Rz9aKP/PJ7PtvuBj2hMJXvtJKDgvO7p6Q3pjLfN6i
	0Ut1+LTYYEyg77hZo16dxZxUGEgStz4MKBFw9hj/2Tiw4koxWXy5yQ8yIHNJQ0YwvKbt02
	l/18CHS5c8YF9Wb/y9UNTxVZrOZMCPnkOtQCGZPI3/uD2p7Qv4dv6TVs+LHq5iTBVHSMvU
	434h8Tsq1BRLh2Btis1Fush6eJ7xmbr9hxqVcPbs2tV0AeddsTbxh0K8Mz1lOg==
Date: Wed, 18 Nov 2026 08:42:46 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Peng Fan <peng.fan@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Andrew
 Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Billy Tsai <billy_tsai@aspeedtech.com>, Tan
 Siewert <tan.siewert@9elements.com>, Eddie James <eajames@linux.ibm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Caleb
 James DeLisle <cjd@cjdns.fr>, Marc Zyngier <maz@kernel.org>, Miodrag Dinic
 <miodrag.dinic@mips.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland
 <samuel.holland@sifive.com>, Qin Jian <qinjian@cqplus1.com>, Changhuang
 Liang <changhuang.liang@starfivetech.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>, Anirudha Sarangi
 <anirudha.sarangi@amd.com>, Tushar Nimkar <tushar.nimkar@amd.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, git@amd.com, linux-arm-msm@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] irqchip: Convert chained handlers to
 guard_chained_irq()
Message-ID: <20261118084246.5b5bf203@bootlin.com>
In-Reply-To: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
References: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Peng,

On Sat, 14 Nov 2026 23:06:15 +0800
Peng Fan <peng.fan@linux.dev> wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> Use the scope-based guard_chained_irq() helper in all chained handlers
> under drivers/irqchip/ so that chained_irq_exit() is always invoked when
> the handler returns. Handlers that duplicated the exit call on an error
> path or jumped to a common exit label simply return now and rely on the
> guard.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

For the irq-lan966x-oic driver:

Reviewed-by: Herve Codina <herve.codina@bootlin.com> # irq-lan966x-oic.c

Best regards,
Hervé
