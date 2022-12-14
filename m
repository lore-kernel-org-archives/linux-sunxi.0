Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C27617CB
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Dec 2022 05:49:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 2AF605C013C;
	Wed, 14 Dec 2022 00:49:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 14 Dec 2022 00:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1670996970; x=
	1671083370; bh=6mCtzgXvIwprFvAVop8sGtvqPQdxxzNZsafxNLKS9Rk=; b=N
	tNDDPoO6vpIFEIqCHZIBClaostelWC3koLFSDpn61IiQZ3HO6HIzJUNatoucDsSy
	tqiFCBZM1DpWa6t365o5WS1gbbNhge4xQPvxouB7qJeoawYddNVCi8m4jGlYwZr+
	ppD0xrQPo7P/ROi2Hg31jbO6qSoVaDx4fgdGL/R5dJJli7FJLz1eIYi7Y5HruGLN
	0jTO6M4bvpXjMxs7Qyl8cT6h14waCmwM96bFuQNXhlesNT4VivRTqnzeAgDK17t2
	WjfQPmlsvyvxUcmk43KLMAFpaLiXpquQX7lmssFKgdvWGNqf73HEfqYxt5Xd9ca8
	yPWi0Bgmhgl5cyiura5ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670996970; x=
	1671083370; bh=6mCtzgXvIwprFvAVop8sGtvqPQdxxzNZsafxNLKS9Rk=; b=j
	LO5qJIlpL/d6+TfI9KZ3iKX5oLKHRsNZuBcSN6AoWvhqGNuaDJKfHzgYUu8YClhO
	MVq7f9+PVIkLDP+Au0h+7l7Rz2l0dqDU4EDX584isT0/VfZhHQU5b5JGIo4CVu1z
	vI2XjBYGgyFnVfWdPNW0D6b0Erjdn35xbdUO0/h3uskf/D62O9NJRjplVrwL9uKZ
	w/DXtOTIBKKTOVwi7OicIymD9S2y0l8pyGyh0ftxHfqbQmg91Q6hMc4A4h8QYuvl
	MSUoaSVhodiE0b5OsKTbh5kCL7wru+0GJOzkg6l51uuaxcE1Bsxjk22jhfhJocvj
	3xhm4eKe2Nlfvx7+fGcPw==
X-ME-Sender: <xms:6mOZY-OvHtGycVWwjJGI27ekKBIoqhAMWU1skCV6vXSiP2a6FlCxMw>
    <xme:6mOZY8_xUOPZgr_qtHioKG-ibm-qFQM0NeOAmNMOeI-IpzE2UDWflTIewrWnIxFDZ
    PfxGNXgiuuGfN_mWg>
X-ME-Received: <xmr:6mOZY1RH6-YiHzOM5ULJgFDDPQEuHFigxQzcM2I3_Kiifk1OCRYOio55d0HAACTgQOBEJGoQ4oQ07LTfRPin3wpqIqo0o4FxRrLNRKFQ7htIwzfAozk8XDVQxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeelleef
    tdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:6mOZY-tClpKzfe7AViBNB1hWLrCq6Qlu3zGnCPVoQx7N6JYqoMz2-Q>
    <xmx:6mOZY2dkASFUUH5EDgOTVfnCvZpIQKz2B0vMoSOJNVZ6f9sldP5YNw>
    <xmx:6mOZYy3mpq-_L7_64-IKAJ2vT4Z40QS4w6zeH2iAPS8Shc7ZYT-XmA>
    <xmx:6mOZY24Eo2rMGFzbmx7TEtDl7IEYsfIl8uAXO3UoOQEzNqOD7hqJTQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 00:49:29 -0500 (EST)
Message-ID: <43dfb363-0653-da8d-d4a9-722c49e1460c@sholland.org>
Date: Tue, 13 Dec 2022 23:49:29 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 3/4] sunxi: board: annotate #endif lines
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20221214002244.31479-1-andre.przywara@arm.com>
 <20221214002244.31479-4-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221214002244.31479-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/13/22 18:22, Andre Przywara wrote:
> The legacy Allwinner code is cluttered with #ifdef's, some of them even
> nested, which makes the code hard to read and error prone.
> Eventually we will get rid of most of them, but for now let's at least
> annotate the #endif lines with the corresponding symbol the bracket
> started with.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/mach-sunxi/board.c       |  8 ++++----
>  arch/arm/mach-sunxi/clock_sun6i.c |  4 ++--
>  board/sunxi/board.c               | 11 +++++------
>  3 files changed, 11 insertions(+), 12 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>

