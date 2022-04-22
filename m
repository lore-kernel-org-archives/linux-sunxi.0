Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F12A2F3B
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Apr 2022 23:28:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 9ABDC3201F33;
	Fri, 22 Apr 2022 19:28:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 22 Apr 2022 19:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1650670125; x=
	1650756525; bh=sVFvJn0waws0huqXtaOE4/eUsYmyydlP/Izjgm4OF6M=; b=W
	5XZ+obawGydKuH0oHzBtc1dAFeoxo1MCpIqwqHehtoQIj48YxhpNKmwhgdyZceQt
	ZOkw6S81EwZIfgj/UunDlCIRQFB4m8R8BN2pcyOUgqv6ezQBFc/QD9RX/08TyVK7
	+uyG4XMF/oNjoD3S+51pr1EKbL65W69Abq7bTQV4GxQ5bdZ5SwkAOXXb4LnSaEuQ
	4I2bsGE4RYtL79CRX34taP9iWziTTjhxiegpAGd+QrTqs5H3Q/r8QGf0UCd5VjsL
	M8diNyijzmghjrVnHDS9s/Zy+RBtVhWKhA99tu02hylsRrX7xusBJPs6y7HYZu+s
	CTC2xbJ+aNUqNlcKUeW3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1650670125; x=1650756525; bh=sVFvJn0waws0h
	uqXtaOE4/eUsYmyydlP/Izjgm4OF6M=; b=Jbn/oL+i+KTVsMVOikDmAgBU8ss6w
	FwFgomqno2UoS+C6GfjzjASPff79cUauu3grf94e6j2mfWII+U0qm917wruQv2nA
	jMkN+lIi3kqUmvEY2uLVALnXo84fhgc1G8JGiHGF4Teb+N+I/92/8Ns6ztXiTBvy
	wOOUNNC7GUDiznOaFvAsdmVkU/IgXjO4f73oFXZ5wE0NhaNdmOYqBlStWy9RtLQ1
	cTXCWsFDzwb3t3dBd25hC19XolTi11dwfOBHl4IE09/XpVIMKOe2BEioguJm+IaT
	4HKBlNVhjdEOCpKLkazcfiUlxy9HYWaxQ6h6uaWwMdJkdRVdzOVJfpJOw==
X-ME-Sender: <xms:LDpjYg71Io2H-Z-EPR3w9_oA3M7zQ2TBqkeTpx2971jCCg5BqLMOmg>
    <xme:LDpjYh4H69RhzYXu8ruuNLTZAezCbFFJExY0rSzUIYnLoEtu7eNHXCe17e0PjmcMi
    lhyJKjFa-TIOa-qog>
X-ME-Received: <xmr:LDpjYvdTf1u95CfSTFRMcWaXdxXOpibrkEmBbdBw6IBFbiVFqUv25GkPzOmNUMiPzuG0uKA9mOgCy-O_deAuWGIsn0eSYZqE0bP64VxBwm0vnT2BQKIyLeDFyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdehgddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepleetjeffvdegheektdekveeuueetffetffehudefueejvddufedu
    teeiieejveelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:LDpjYlIWPjmpMWg9F_1pCq3mPYjGwUPTQzba_yKZLSZXuN2nHFtQCw>
    <xmx:LDpjYkLxWBM7VKkmktTvlmJ8PiEzWRgl5KK44kEshuYKPO3uZtVavg>
    <xmx:LDpjYmyhXktio00qmHo6EzAJ-QgyBROk2ze5cGnSc61flOET_sGTrQ>
    <xmx:LTpjYiznz8PFVA2Y_-68t0NX5lK8KotoXHic2wmFD_xZlJcz3IVl8g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Apr 2022 19:28:43 -0400 (EDT)
Subject: Re: [PATCH 1/2] dt-bindings: input: sun4i-lradc-keys: add R329 LRADC
 binding
To: Icenowy Zheng <icenowy@aosc.io>, Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@sipeed.com>
References: <BYAPR20MB2472D625C876D97E95CB6078BCF79@BYAPR20MB2472.namprd20.prod.outlook.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <db2c4d90-0097-442a-68df-3dd77f7a4d0b@sholland.org>
Date: Fri, 22 Apr 2022 18:28:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <BYAPR20MB2472D625C876D97E95CB6078BCF79@BYAPR20MB2472.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Icenowy,

On 4/22/22 11:07 AM, icenowy@outlook.com wrote:
> From: Icenowy Zheng <icenowy@sipeed.com>
> 
> R329 has similar LRADC with previous Allwinner SoCs, but with bus clock
> and reset.
> 
> Add binding for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>

I sent this binding/driver update (also with D1 support) last week:

https://lore.kernel.org/lkml/20220414002349.24332-1-samuel@sholland.org/T/

Please see if it works for you.

Regards,
Samuel
