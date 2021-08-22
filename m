Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750CB72
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Aug 2021 01:15:41 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 8A7765C00A1;
	Sat, 21 Aug 2021 21:15:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 21 Aug 2021 21:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=2
	jUwAOsYm7NGxbU53voW7SQqUCFlMtcPM9jh9VdS7Ww=; b=LiB5deVIzy1epr/AT
	+E1qDECuCamFPGlXG3FHhgVYconTF5dYU9/3TSNWbst44jwcGW4xNwSwHKMM2w98
	X1l1DSIcGWrJulIHabYrZYVdrxyQEuuDd7OI/JIHS0Ou5UoUieTINruWH4l6ciX/
	7jOFJvKg/SF6uUJjKBfX8oZfr6rR8z+55ja9UYK0diBlGqPbaZkAbtbj2AuRoPIw
	6yP3eQHFoKo3Bqs6cI6hhu3iz5QDkDLaXhzcNcfq/jN7DtE3nu1A5aH0ADzzdaWO
	2JqGazboHPrJ7YEYcYh4QYZJPOy/YbfYb3dBz5duA2UmdXJ8aEK3PlTOFArLz1hy
	u0QFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=2jUwAOsYm7NGxbU53voW7SQqUCFlMtcPM9jh9VdS7
	Ww=; b=Xj0JwFIjAjeNUBjzsl8a+ntoAp7IiHnMCTT7/X2aohUUJWBgpw5NTABQG
	tZnNsU7G4dVRZEjxY/ulsgF+CZtkSBzvcNRoVO9wOVsIBqQDowR0ghjJJ8FAqSoe
	09qc6LDzwBgQhbCEOgEA7EFpEdJFe80iNVOX6Y11/jFlxFdAxq+nFzBbRLgsyHPR
	xgbQINew0jPp1JZp+41y4hhVOPBBBl5sV8zyVKGc27u+qk+Q5+Yh9V9FhoKKzAhq
	yICGmVoIn7dLyTwIlx7Pim29RSGx59GdY0/oMbU/1GGp2+b63QR+K6/2WQ0Rarvl
	/bis6+CbrQ+LGxsdi6pucOcLkeA4g==
X-ME-Sender: <xms:O6UhYaoKOQ48yapkHB5WuKRrr2fkvprmwvsvKgUpsmmR-UlitMaC2A>
    <xme:O6UhYYpijNaM-dy8g3ctLsL8NiWmMGjtzD-yrkwdiWgmVYW6UG0QNeRwTIMl0cBJB
    jPTqsDZ_TqfuX-m7g>
X-ME-Received: <xmr:O6UhYfNI5vSWUrTVxzVPVRm5kexI0iOufWcQRHqnsHd5ifnGEfuXTAlc9k68qnWFC42EbWnhDtyJ32IFXH1KMOaA-geIdn_UZ4zgif241sUAwH3T3adfdV8lYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtvddggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:O6UhYZ7NfmrQUzWTVb-3US5J4CbUoknFLQMWGxjCUvS99bAmlepnmQ>
    <xmx:O6UhYZ5EpRLnT0yI6S3xvJTDPVBHwM0x8rsYmpahJjg-U7tHa1kr0Q>
    <xmx:O6UhYZjHkjJr8G--u2fgznEi1R-q1RsFZVIXW55JeGB8cd8rlNw92Q>
    <xmx:PKUhYXQsfe3RTgcsZRT1eoQN83GYuOx2_zpR5K8p8jNzlCu2YRkdiA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Aug 2021 21:15:39 -0400 (EDT)
Subject: Re: [PATCH v2 0/4] mkimage: sunxi_egon: add riscv support
To: Icenowy Zheng <icenowy@aosc.io>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
 Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Andre Przywara <andre.przywara@arm.com>, Tom Rini <trini@konsulko.com>
References: <20210619091838.646779-1-icenowy@aosc.io>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <fa18e1f2-ab31-337c-2d75-5b1938e35251@sholland.org>
Date: Sat, 21 Aug 2021 20:15:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210619091838.646779-1-icenowy@aosc.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/19/21 4:18 AM, Icenowy Zheng wrote:
> This patchset tries to make mkimage -T sunxi_egon to be able to generate
> an eGON.BT0 image for Allwinner RISC-V SoCs (e.g. D1).
> 
> In addition, to keep the compatibility, it will still consider the
> architecture to be ARM when no architecture is specified.
> 
> Icenowy Zheng (4):
>   mkimage: add a flag to describe whether -A is specified
>   mkimage: sunxi_egon: refactor for multi-architecture support
>   mkimage: sunxi_egon: add support for riscv
>   sunxi: specify architecture when generating SPL boot image
> 
>  scripts/Makefile.spl |  2 +-
>  tools/imagetool.h    |  1 +
>  tools/mkimage.c      |  1 +
>  tools/sunxi_egon.c   | 86 ++++++++++++++++++++++++++++++++++++++++----
>  4 files changed, 82 insertions(+), 8 deletions(-)

This works great on D1. For the whole series:

Tested-by: Samuel Holland <samuel@sholland.org>
