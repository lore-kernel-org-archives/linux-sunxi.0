Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF877E
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Mar 2022 02:19:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2E2EE5C01C2;
	Thu, 10 Mar 2022 21:19:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 10 Mar 2022 21:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=+XFT+Lfgn427A+
	6tXJyQ+43YT6ORTpFZr5fYnaX85TQ=; b=ZBYMY1n2B/1P32VA3wrmudUdT0/Ty9
	GLuuPP08bTHbX3wJGOfE53FJ2T5fEP3QXQITRgTV1GBh5Fha6nSeA7flG9So8q3x
	lgOH90O+TZQIGbbdZAPbuIfHm3SnhEF5CZSYtq7xmd2hKhQLiBjdkGDoAbAh93GX
	0HazWfRNXOWSDvrGvHbZaRFhIOGJ+XeFG5gXvh23qjXsDSgjaFkNvLWZd54XF2oa
	VSkV+Wkl6daBJXHz1r5ZGfgr6ap4RUX31ESlFDpYrF48b4wOd/MLGZmhrqJbJ5Ki
	Uh52iXd7awR02YnD9B52N2OypxyJxa8+CS+6KZdbMCSu960vgwyTBwSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=+XFT+Lfgn427A+6tXJyQ+43YT6ORTpFZr5fYnaX85
	TQ=; b=eXCIauoroYgZwpOPVrih0bRTmYhvuWMJQ8roeLiw19pTNjS+o/pni/J92
	bVuvJyWcYwIPmDkHwiGa3WoLQzuozJhfVUG3jAwkQsWxHQo4uuMniNnN727zagZN
	iKptTNSQY6tH6hK2p4pS/XKxq9uEWF+ntveU4N1z8/LxMpCXH2fwb6+i8oaRDugJ
	YgD2Bp5i8m0D8NEmUGRVTgHeQVcF81KiRTSF/di1TCMu+7Y0QrYp5BpzH6J7ufjo
	3bOwkvOp1836kmVp4USVLv0K2mFXOEunXSDAOHIDzO9kGPLh+W8NMY4yjTZ+jsgH
	FkFmxUM7xPQQ/dpdvM7VFz29/Cemg==
X-ME-Sender: <xms:qrEqYnd9_1KZXj6bxMG5aAeXuV-6cdpNcX8ORJozTs7b23IaiqNxYA>
    <xme:qrEqYtNxKwVp-6OFuinLZ6So2UY3MZjCiZcOXyFuQTpetA-3JTxYer6S0frnSIpXP
    BMq5ipKZ895vfHihA>
X-ME-Received: <xmr:qrEqYghhpxtz_fs-wnv-6FbLkJb9F1EjbAtsVaAElGV94K7QdXHQI0gFkk9WCw0ywQMGcozBbGaoYrg1IWAMC0AcL9g9NJz5sUJyESqTsR-M7QfGwj4rhO5r3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvuddggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:q7EqYo_stM8FUgMXTM8dSlGh88lDq80kFZHqR30gRnNdz4dUK-bNbw>
    <xmx:q7EqYjv3qE5oWMbydOrReM79lSy4soES8Bz-5OD8AsbqzOXwQizqfQ>
    <xmx:q7EqYnHiWuERabgJsehSZf2QtGsVtX9Ps6DXX5anSf3Fd5dVPsw5DQ>
    <xmx:q7EqYnFzoifYe2UtLj4ZDGuBg_aE6gWLwuPug9E3xRgSwuGcdhqM2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 21:19:22 -0500 (EST)
Subject: Re: [PATCH 06/14] ARM: dts: suniv: F1C100: fix timer node
To: Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 George Hilliard <thirtythreeforty@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-7-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <b32b9928-b885-41d3-799c-1eb5c18377d4@sholland.org>
Date: Thu, 10 Mar 2022 20:19:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220307143421.1106209-7-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/7/22 8:34 AM, Andre Przywara wrote:
> The Allwinner F1C100s has three timer instances, each with their own
> interrupt line.
> 
> Add the missing two interrupts to the DT node, to match the DT binding.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Samuel Holland <samuel@sholland.org>
