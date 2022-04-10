Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99E2EA1
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Apr 2022 04:28:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id DA24D5C00F3;
	Sun, 10 Apr 2022 00:28:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 10 Apr 2022 00:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=yLADSw+h5JQHrv
	NHISkUOg2dJTlwfaT7t4/0Ag3Hvok=; b=lhL+qel4z3Xp02ngujacxpUoNIQ3Ie
	7mXLuTxX/lA2mmzVVnCWFdITCocuARIAixpDZqpvrWQygpSo1Gi9DMlvp/Eo3viN
	6GdY2R/EVtHJ/B1KfkmkGNIGFm0IY6uajK+lDv8rvuC4qGHUyY6PV9+teAaTTtCb
	sCYKBFyCSPBWKE/XNsL2RY+E06yK9D5M6Z5L0f0Ujbkw549yejp5LzUH55J+q1RI
	jaEjtZ9rcx+xpjLWLA2F7HgGZRCltZOriquWLcj2FYCAtt9BUh/iHg2reIVOTyo0
	jTLWMAh1qE+MRjMcTzWGcewzSsaaAYKC8ymO8CZZ6sccWBsqPwdHYJZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=yLADSw+h5JQHrvNHISkUOg2dJTlwfaT7t4/0Ag3Hv
	ok=; b=BoM2oUibjnSTNgCewU6r7yi3JnhYzY45bBLgRBpqYl68MSZC5Us5usCdQ
	eQeyPaA19FtEjpm4Cw8Uulg/9gQU1a/0IqYh3mz0EPWyPqNhxpAGELwFOEPzObWd
	ekRMlNnQCtdOl36CnzUlDTj5IZHIgSFmJYfjebGJxtu51QtIzIrg6GGHNdLdHMD7
	O4Y4maJk+uoVAV7YVFL45C6/B18Apjt6m0y97uZt3RpYanrcKYKTdqCj/eSryjza
	PfaAr7b8XfZEzBjsBGr9lc98DitnJBqWRNrSR6kclBhPzOzk3XdT7PHuYIl+oZYu
	oQ2w8e5o0ngepR9YBpKknXo1yI4sA==
X-ME-Sender: <xms:6lxSYjhqfN4NBa7hVtd_UpHNP2k93zezUSvhKsLYu3pejZ8C_QnrdA>
    <xme:6lxSYgCm_UUj0Lfb-PwZKFZqIzhTyb4TwwbVlSn-N9WWLBXc_JQ1QyTxSB6rNMgCO
    F8_kWN5evfupNdWoQ>
X-ME-Received: <xmr:6lxSYjEGhK8XWcq5GKVKddlMvzZtr-0MWQlVVXmVxo-XGjAxFktTn3qUFVUkj5rpPeDgO9xvK_RsE0dxcFzIJHchZxk0TGJEN13EmeeM2PQIGXzAJ2pVhuL8NA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekfedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:6lxSYgQV1tBh-StV0BqpDHrYVeQ22uPrp_8r92fZuA24T0b1OZ1qyw>
    <xmx:6lxSYgxP_FXPQox8iB0PuHYvy1zD4zForHuX9g1Zvh_rmeboemNqtw>
    <xmx:6lxSYm4MaRNK91Tv8pT6XDc37LClCjFS4OsExOr43XweCABK1Z4xjA>
    <xmx:6lxSYjywHOtTyuxsSM3qsSZ5hmH1sRIrfZPtZxs5rz8TkZ1Q3Q8oWw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Apr 2022 00:28:25 -0400 (EDT)
Subject: Re: [PATCH v2 1/1] phy: sun4i-usb: fix phy write on H3 and newer
To: Evgeny Boger <boger@wirenboard.com>, linux-sunxi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Yangtao Li <frank@allwinnertech.com>, Icenowy Zheng <icenowy@aosc.io>,
 andre.przywara@arm.com
References: <20220111165153.63632-1-boger@wirenboard.com>
 <20220111165153.63632-2-boger@wirenboard.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <683de674-2613-a96e-2831-7e3172c0f9e2@sholland.org>
Date: Sat, 9 Apr 2022 23:28:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220111165153.63632-2-boger@wirenboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/11/22 10:51 AM, Evgeny Boger wrote:
> We noticed that USB hosts won't reliably enumerate USB HS (480Mb/s) devices
> in our custom A40i-based design. What we observe is that after several
> attempts USB device would fail to enumerate on EHCI port (HS) and will be
> enumerated instead on OHCI (FS, 12Mb/s) only:
> 
> [    6.368009] usb 1-1: new high-speed USB device number 5 using ehci-platform
> [    6.818008] usb 1-1: device not accepting address 5, error -71
> [    6.823868] usb usb1-port1: unable to enumerate USB device
> [    7.308013] usb 3-1: new full-speed USB device number 2 using ohci-platform
> [    7.575045] usb 3-1: not running at top speed; connect to a high speed hub
> 
> On some boards one of the ports would work in high-speed mode, but
> on most of the boards all three USB ports would only work in FS mode.
> 
> At the same time, USB work flawlessly in high-speed mode in vendor kernel.
> 
> Looking for the differences in USB code, we found the issue with USB PHY
> register initialization. Basically, USB PHY driver sets a couple of
> internal undocumented PHY registers to the predefined constants. These PHY
> registers are accessed in a very (and I mean VERY) weird way by shifting
> register addresses and values bit-by-bit. This access method was slightly
> changed starting from H3 SoC, according to the BSP source for different
> SoCs.
> 
> As a result, mainline PHY driver won't set these PHY registers properly
> resulting in unreliable enumeration in high-speed mode.
> 
> We don't know whether this issue will result in broken HS mode on all
> affected SoCs or instead the A40i is an unfortunate exception. What we
> indeed verified, is that BSPs for all affected SoCs write these registers
> properly while mainline kernel don't. We also were able to reproduce the
> USB issue on a couple of A40i boards from other vendors, so we are pretty
> sure these registers have to always be properly set, regardlress of

typo: regardless

> a hardware layout.
> 
> The proposed patch is tested on A40i-based Wiren Board 7 building
> automation controller. More details are below.
> 
> On older SoCs (prior to H3) PHY register are accessed by manipulating
> the common register for all PHYs. PHY index is specified by pulsing
> usbc bit.
> 
> Newer SoCs leave the access procedure mostly unchanged, the
> difference being that the latch registers are separate for each PHY.
> 
> Additionally, accessing USB PHY registers is only possible if phy0 is
> routed to musb IP instead of HCI.
> 
> Introduce phy_reg_access_v2 cfg flag for H3 (H2+, H5),
> R40 (V40, A40i, T3), V3s (V3, S3) and A64 SoCs.
> 
> On A83t, H6, H616, T507 and probably on more recent hardware,
> these PHY registers are not used in vendor BSP.
> So don't set v2 flag for these even newer SoCs as a precaution.
> 
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>

Tested-by: Samuel Holland <samuel@sholland.org> # A40i, H3

I tested this patch on a Banana Pi M2 Berry (A40i) board. My board did not have
any USB reliability problems without this patch, but the patch didn't break
anything either. So since it fixes USB for you, the patch looks like a net
improvement.

And with Maxime's comments resolved:

Reviewed-by: Samuel Holland <samuel@sholland.org>
