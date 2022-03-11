Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2E37E
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Mar 2022 02:19:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 249205C01CC;
	Thu, 10 Mar 2022 21:19:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 10 Mar 2022 21:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=7CP16+qd9eHk/1
	GLjxwgwoM8TdlEnubIBghyw49MQ6g=; b=ZIXh06vpT/qsj3VCCsvmYkAcFv6stE
	6x2HPcQmBCS7obfVv91AGcuWie0az6ETFy3/HqN49sVBVhzVo/iyw0boN1dglcvL
	nJFIQGp1moKKr90YwLdxuLufGdFjl9CJ14Htu3cv9xVNwtYATenRx/95oSfPXt0C
	xi+A2euTRBrnYm7AGOmmQXFRdUwnFKuWocW15kqoqxxZD9qrdgjWeqBR7YL/SwNa
	X5KgI2tG9qEeVCbH/yQlWb/e8QVcB9hPJtWJfROIv7fGsDp9SCmZN1k4RuETl/jg
	a8CxskuFlxQoPo43uxzqn5jQXYaxEXI6IQ0sOKLkIzVpX6TuOh+1TTcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=7CP16+qd9eHk/1GLjxwgwoM8TdlEnubIBghyw49MQ
	6g=; b=nfrTEOZwkjBTy+3OsMLtjoBdLuKbLJTHREP3tF4DD0Jc8GxaEdixh1V+Z
	U7Y4oypU7Bj33V4LFCAMv98G3tLP9x26u1eSKcFR08z9tmhtAu6aTTrsdD20Qc58
	JWO2MN38vd6SZgBtAKjCywKjKxudQFazcKvE4fkD/ATSOC2b53Q68h6imcK3dNxS
	yKpX1vBOzjPTcmrncv2YMrrhtt+d/OdYGpZeRfLk5lQfxHu3LCxs8tQbYJ8LRW1D
	28/N1nWenMYlme0QZpQ6LBAZXkb8w8KLPoFKxCaAu1iWLHJtmyiJgulaO7amT+vg
	/GG1BUBWE4rvFTcXYEwaCclo0tXUg==
X-ME-Sender: <xms:wbEqYhc7kmIUay0O8zmGMf0600-8Io-dElN57ieoHum3vpfsKKxFOw>
    <xme:wbEqYvPugwxoHzSo1Usb5FPcC9ab9zGDEwHM78m-8nfy7o69s9SFqIeBLb5Mi_7Yo
    nXyeCKo_y4ifd_y4g>
X-ME-Received: <xmr:wbEqYqhnP9ZZhNcZORcQCpUGUXqo5eUBzRNU0V4MMajdwJiv-HgP2DO6JQ6T0fw5t8r8Uly1vtK7Fm9htkejpMXKBf_FHTJBraJItOHvcpIx_xhMXY2o8ub8yg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvuddggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:wrEqYq9-47M5f9JVsjd9_V_Xum0ZOXI_nSyEiK8pMWyn05sAi-9CtQ>
    <xmx:wrEqYtvuRcP4tJEI7TRNhgEdtmkog1RCn2ArML4OeFufxpBvZC9MpA>
    <xmx:wrEqYpERKpZZ84vdSEI7qoGukX-XR53ynjUNXXWyVkl7LW0xWAqWRA>
    <xmx:wrEqYuN_c8n55Pp1XotPEatyjHuOhQVSYV4yoxHBVxQiVWoZ8gXw1Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 21:19:43 -0500 (EST)
Subject: Re: [PATCH 10/14] dt-bindings: spi: sunxi: document F1C100
 controllers
To: Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 George Hilliard <thirtythreeforty@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-11-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <e221cdb6-ebee-c674-ff90-ba9072f8cfc3@sholland.org>
Date: Thu, 10 Mar 2022 20:19:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220307143421.1106209-11-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/7/22 8:34 AM, Andre Przywara wrote:
> The Allwinner F1C100 series contains two SPI controllers, which are
> compatible to the IP block used in the Allwinner H3 as well.
> The only difference in the integration is the missing mod clock in the
> F1C100, but that does not affect the SPI controller binding, as we can
> still supply the correct clock (AHB parent) easily.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Samuel Holland <samuel@sholland.org>
