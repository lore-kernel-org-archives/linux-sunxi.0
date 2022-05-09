Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354ED7E
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 05:04:35 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 4A8765C012B;
	Mon,  9 May 2022 01:04:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 09 May 2022 01:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1652072674; x=
	1652159074; bh=0WvXEQu3SpaXdbPUETaOEpR9UR9h7rz8UI6MWXaMQ2c=; b=e
	hdtJmOxVMVeoIZ29gcF/bFkryp/i/g2vM1oEZIRYyKo8ERXa1EX1GnZbWrlWjmjR
	DjjjxVniaBCAwDsxGtec7Vw646ANTTWqbU08xPrDe+78GS6LIVM6CQqjfk4pwZFm
	uA26q49OYIhFVjlSIQtRHZnt6SUt/ZYumsWc10fQktQBDSmqmpBk+uaKMkVPOX6S
	r7FF62k3AeAzsyCNT8Gx6AW6sEPnzt57VDV3eGtApIRAdqR65G30gSXzLHAy6iQ2
	cpUyd4rjm/jHnpYA1X8EkpINIBKA10AVadLEPPhHKeaFTvk4mPOMW/O2d3kxWUYY
	eiQOBI4az+lghTz4ARMJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1652072674; x=1652159074; bh=0WvXEQu3SpaXd
	bPUETaOEpR9UR9h7rz8UI6MWXaMQ2c=; b=VCHbMohwFVt323q3mnhG2mBwjE8KX
	j8NmfeqW7VCMvdFNuWcDOBtnKUvzZOcAkZZ7F1V+jkg3O+VaacGc3uLiFE2jXIiV
	LTTJbUck0s9tQlyGarA+Yv4hgleMlbkLl4hI1Q3hWuWefLY8BSyc3+e1tVgdLBTc
	w6SlEgWjWqp2gE073Yu6S+DHOppbcuzQA56E1OP6HmIRGXVluWTUjRqp2H87OtAx
	OFlFXt+xY2jv4FyTDcPKH7stKOOKkCqu6YXEXa6AlTGXMEocx1gGcF2I92lpcRb1
	Xs+JFIPlEQZi1BH5XFu1AWJc9HGfzTQalV1bPQCNRKQwd+x+xcW7m0jFg==
X-ME-Sender: <xms:4qB4YuuTgYCji1IdtKSyubTUbb_4ARLE-qquaD0aHibS7WNJ3xlQGQ>
    <xme:4qB4Yjc5q5AL5Khb7h6ijyWCpc6nsNFqX3dl_LXiQQa8F5Kt6OxQLR-N-7X0I-H9s
    o8U0sbxNLayZhqjiQ>
X-ME-Received: <xmr:4qB4YpweY9a0Vhm5u68gi3ehKo2ss5YN23iTMq--YXBuQq0rvd0yNBmHuMALs3xwj-Z2aZr5rloEmQRSdhJ_2DJGb7CO-bhzbePMmTfl3_7tjQxIg-FZiifNIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekgdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepffdtveekvdegkeeuueetgfetffeileevudekuefhheelvdfhiedt
    heduhfduhefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:4qB4YpOcZxr3slUaFvnyQ-SRZ59LI3oqmWzjVAhPY56ypA2d5qTWqA>
    <xmx:4qB4Yu-AkWJ3PTfMN_mJkB-kYWHjH1-ZWZbgDCGiqaV3aDQY-t0-0A>
    <xmx:4qB4YhU8BVHAfjXBen8CxysWYP8XHl7ceZcAjsbPOHpQoWHpBtHN2Q>
    <xmx:4qB4YlYvr1HjN_0_YWOzej_DsbBV0VFbDc4SrPlG2VGU75cefS3Arw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 May 2022 01:04:33 -0400 (EDT)
Subject: Re: [PATCH] sunxi: board: Fix UART PortF pinmux setup
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20220506003703.13287-1-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <b5ab2ae3-c42c-3ffb-4d96-d8238b074a9a@sholland.org>
Date: Mon, 9 May 2022 00:04:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220506003703.13287-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/5/22 7:37 PM, Andre Przywara wrote:
> When CONFIG_UART0_PORT_F is defined, we try to configure two PortF pins
> (usually used for the SD card) as UART0. Some SoCs use the mux value of
> 3 for this, while others use 4.
> 
> The combination of Kconfig symbols we currently use was not quite right:
> we mis-configure the A31, A64, H6 and H616.
> 
> Going through the list in the pinctrl driver, there are only a few older
> SoCs that use a value of 4, so revert the #ifdef clause, and name those
> explicitly, instead of the other way around.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>
