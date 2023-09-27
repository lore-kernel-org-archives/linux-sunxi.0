Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B19548EBE
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Sep 2023 20:28:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2D98A5C2903;
	Wed, 27 Sep 2023 16:28:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 27 Sep 2023 16:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1695846491; x=1695932891; bh=DVbBKFnJ4KpOYGaSTwQCG+u4QqU7wtSCnVO
	E7Dfn380=; b=ecNmrI3NY0ZdBdmOebpvtr0Ybs+A/m/UlhZnMuQgPc/PfV959mT
	8RIfAh/JEb7cCO5Da4uMdhJM0QZI5AvIPY6lBPwr81ly0OAKQv7un8bt9pZJRMbG
	MHhJXHSHCjamRRjfDBM0amk9iT6esivqV4D/4cAp9/vl4RHRxz7kHrOKRczzJGHS
	8sgvesAifbhvjDtNCUs2hUjWPc0zIUVKEMqEM1zU+IZkpy+AizGfABxj/1UaOQMk
	qI5+gG7Ws6Y2TPQmFqiouUZFc0innW+o9jU/7+U2M0oCoUFCOenLq9AQEGBUBSwq
	qVY3U+gemCDHZx7YLN5CJy9uKAHnhgJ+bYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1695846491; x=1695932891; bh=DVbBKFnJ4KpOYGaSTwQCG+u4QqU7wtSCnVO
	E7Dfn380=; b=WhnnZnFw9Hhn/Ooht5mwxbbGsUzaHvOB321pPOWhVxGNNsHWXkJ
	TsqducG+pstLHlRzLPClfUxnuz1qS2Vhe4QKV7+Xl8zxdcIZtNnmNrvP20dN+kHU
	9u8yQJ460Y6OtfuOoj9nnicgwXps9a2yS9QfJRUeKHaN0Dd6s+kZl4RAZqwrNgY8
	I4AegXpgOFjc6odIe0lLZ+sP7e3ITp+UEkVT+FX6S8k5P3sd2+QN7IkrvVxDx5s4
	2WSu67qdx12GsD7M1fKUQGz0AxW9MxR61f4FNMxG1fVmdD44zkqKz1WZ9J2lgkIP
	TKpNIQSSjdI0Izr1mMqm5h+YPx8vf3II6pQ==
X-ME-Sender: <xms:WpAUZcNn7SVVp5OU9MLb-NejqftO5fTAN9JmLiecNNvBCuT6YbkZug>
    <xme:WpAUZS98CHt9E2yNf-ZwrovkKRGZww4kDPx7s5CIP6VGr-3xuHwin2I3gVQb2rU48
    1fO_wJT2YwlYkT4Nw>
X-ME-Received: <xmr:WpAUZTRy4zaf3hu7ebbaL7uAoEYcNAz034Gz47uQCgJHZ-3DN953JyhA7QZJxkH3KiRaZm2CCTZu71KJVvJIMRtspDQt5uO0EttwL74k0OyqPeCthAOuI2Xd9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtdeggdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeelleef
    tdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:WpAUZUvERVyoLnBU3ZxPWFcgKiKu5Av2D4mRqBZK4Ph3gfd0--I3sg>
    <xmx:WpAUZUe6dzPnWDMgG1pG2sfw6-H41qdupKaN8MqdUlHtSRynqm9A5g>
    <xmx:WpAUZY22sEdqmE1gLGxM5SCWg4ayPj9uj53IyKll9B1ggP85UJP5EA>
    <xmx:W5AUZVVsbZn25ji8UeeoJCRLXgHM8twGeBbc5xtzUYnCsf2NHoMRYQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Sep 2023 16:28:09 -0400 (EDT)
Message-ID: <158304d2-ec49-f280-4cd5-8f9a36a520ed@sholland.org>
Date: Wed, 27 Sep 2023 15:28:09 -0500
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V5 4/4] ARM: dts: sunxi: add support for Anbernic RG-Nano
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 andre.przywara@arm.com, Chris Morgan <macromorgan@hotmail.com>
References: <20230921135136.97491-1-macroalpha82@gmail.com>
 <20230921135136.97491-5-macroalpha82@gmail.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230921135136.97491-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/21/23 08:51, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Anbernic RG-Nano is a small portable game device based on the
> Allwinner V3s SoC. It has GPIO buttons on the face and side for
> input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
> OTG port, an SD card slot for booting, and 64MB of RAM included in the
> SoC. There does not appear to be a crystal feeding the internal RTC so
> it does not keep proper time (for me it ran 8 hours slow in a 24 hour
> period). External RTC works just fine.
> 
> Working/Tested:
> - SDMMC
> - UART (for debugging)
> - Buttons
> - Charging/battery/PMIC
> - Speaker
> - RTC (external RTC)
> - USB
> - Display
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   1 +
>  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++++
>  2 files changed, 285 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts

Reviewed-by: Samuel Holland <samuel@sholland.org>

