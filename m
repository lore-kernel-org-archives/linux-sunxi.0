Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8744417CB
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Dec 2022 05:45:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 505D75C00C1;
	Wed, 14 Dec 2022 00:45:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 14 Dec 2022 00:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1670996749; x=
	1671083149; bh=boCyv5UbR6oafG63P4ow1JnVEwL0CAf1jlVXP6CazSY=; b=n
	NBIOLZbPYXFXcqi2UglGbV6fgsf9285mOFofhGWdqTsCIfNXv7a+xBg8butvrazF
	PKjAA7XLmeesg4wZCqws6nkyGmhl+WPVz3Isgnr2Od+acqqUmNSimOzISXucpnPL
	Mrm1eqcW5uHU8rXKKHxnHkz4Kq6qSw4OGPBORfIF55hOpOoFTBc6YFbXAJMybk1t
	L4DKJDs/gHora3/YVgs7GDkekx91oNebDzoeqAt67ScOj2F5+/pNFyiNipbLsLrU
	W+I5ijOLW7ZCr6P8TkPUcvyIq6itL1+UMkrySKCvdZvS2fD52XFLrB+8JZn+33uo
	IlVwh6lQRAjeoOvy7R2nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670996749; x=
	1671083149; bh=boCyv5UbR6oafG63P4ow1JnVEwL0CAf1jlVXP6CazSY=; b=c
	hwykIOychoXUrL3G0m/wHZ9x5pNabwzZD29HVzsvOdHxsXlGfp38GA2Ohb3dsj5x
	/yAcvFBO3xqvazMiTkuSJ2j4N+YpgjbpHqFUBS82O58ZUQlho5eIbgNmweMaNEBm
	digIsEx+nilf6obXYrNVS0LNl96Kol4sjrn+X0ALXh7Yut81uvCXNoobux7cpH3R
	5o86Ryys7PpDgMwTV/f+cMrwLAoDYc2jRJhYwBv+WCMAUWdwYPG2tbqgq/wMQjAq
	u6bKr7/LGeqAt19lx+cwYx1+bfmop4TVkNOSP55j4x6tQZx9O3GFgWOaODWff5Dl
	akXWIae7BRFn315V/HGcQ==
X-ME-Sender: <xms:DWOZY6WFFrxuqLhPtIHCMtLapcLLlrn-itrX_-s_DF7VZBeBv3rBHg>
    <xme:DWOZY2lBu-NFNBJnbSVBDTJKVfAFuEybViSSXTiU4tEkqPnZ7LG8sLZttIbH6LhpT
    0h1LjRgSY9haQPv4g>
X-ME-Received: <xmr:DWOZY-aHq4XaZTlX3h1e9WCbY42sb2ob0QwjboxYw6Ff3asif4-tvWGfGRBFMF8asnNoQfpQ_oymbbqIhD0nCNZNZyGXX9kNa0CvV72dtpl8KwrGs6Q8SvQOTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeelleef
    tdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:DWOZYxXtDAd4Y7YFQFHaXtz7vHxWpRIjDGcSXX2G_q1BlBYvr9ww7A>
    <xmx:DWOZY0mUIZ--qW9Zg8L9j3GXn4wYjR7rr6YCOhYXsqWa1I1SgM_vrQ>
    <xmx:DWOZY2dVuG7b_kwHMdnRZU8jyhMVJoFOmO_pR-4llHOmGiT-jTW42w>
    <xmx:DWOZY-hgWfkCmdBt58Y_yPusFbyO32qHA0kzIR8WTfSgVKEkIi-zEA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 00:45:48 -0500 (EST)
Message-ID: <2a9d41ca-361d-2cdd-96d3-8dd1793dda9a@sholland.org>
Date: Tue, 13 Dec 2022 23:45:48 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/4] sunxi: remove unused CONFIG_MMC_SUNXI_SLOT
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20221214002244.31479-1-andre.przywara@arm.com>
 <20221214002244.31479-2-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221214002244.31479-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/13/22 18:22, Andre Przywara wrote:
> There is a CONFIG_MMC_SUNXI_SLOT definition in our sunxi_common.h config
> header, which was used to note the first MMC controller to initialise.
> The definition in that header was always set to 0, with no easy way of
> overriding this, and certainly none of the existing boards made any use
> of that (non-)feature.
> Remove that definition and replace it with a constant 0 in the only
> user, in board.c. It turns out that this is safe, as this is only used
> in the SPL, and the BROM also unconditionally initialises MMC0.
> This also removes the last legacy config symbol with SUN*I in it from
> the whitelist.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  board/sunxi/board.c            | 9 +++++++--
>  include/configs/sunxi-common.h | 3 ---
>  scripts/config_whitelist.txt   | 1 -
>  3 files changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>

