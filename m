Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAFE2F80
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Aug 2021 02:40:36 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 33E8F580E65;
	Wed, 18 Aug 2021 22:40:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 18 Aug 2021 22:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=T
	1wM2FBYPIX/Et25eZf0s7pE8bzpMRH0d3UvOJ4t5KM=; b=pEOcbPJM9KwUyLnvv
	iL+4RBaE8zSuHccJ/Fqelt3rE99524vwoASXyfzaqOJADkYYVccgug+OFe8rJEKn
	NlJtMUpv4mkqzhQqircbkCzdUW4BqBnyzrKX+BgrREXkTe3u0CLmrGJ8jgVB96CR
	xqIOVzxfFXiWfs4oyg4lD6G5XTp9bTMl2+b6Hjjuv/mEMmHJZXwOZ9Pe7Ddd0g6r
	h8Vv0w9leg5T56civHrIJuP29mjPMnRUKLSp0uj7tyJ3iElKJeSa8iQDCZoNUhIy
	0acSrePP1eRqszr8d0Lfyw0MrLvypjKF1OlOX1M6YQ05cMa7d9apq3c86v3ABlbv
	tmQ4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=T1wM2FBYPIX/Et25eZf0s7pE8bzpMRH0d3UvOJ4t5
	KM=; b=B1mxqfRbZmhqYJ7jS9ziNi+30T51wKrNZXyFT4YHokBudQxpLkn3f/d4h
	BhtJOLu9Vz/bzZhdof9VvgtbKGOggXsvltcGCefnsUZQ5qBKYz3HRxmizv8oTXXw
	zwwyQ6k01tRZCD6w+2LbjaYYPmMQmosLnYg4G+iPhIwfmPd1mZ1UosABZaDfLts5
	mOPGBggKo8ko8ajexrh32uT1Gpd7/fjX3ibNL5W4aZE4N+HUGE+LYObv9KCnmiTo
	PeMIxdwhXVcTQwIp+PKchwfM4s54UTIUHp39od3B8Z/ERcAJrdbGiF4t9MkKwCtR
	NFqwhCwXORMICdbjaPOwAl8dRMzVw==
X-ME-Sender: <xms:ocQdYW-W_YXq1eyoXM06uICFHqOh46WJS0r2e21F6tCUXlQUjDlPTA>
    <xme:ocQdYWvjahrc32U0i_8iMhu93iPOM1tnECh59ZUwSIbO7r1ogc8uJjiRhto0BTFoT
    Vy7O42X-SECUmVKmQ>
X-ME-Received: <xmr:ocQdYcBO2a_18RSlKAKhqZ79NAzsXBnFI3uKrRNXOC3NtXGnDUyi1qIx0sBktEIJe6HFuGbK04voS4wNuv7_XXG9O18TwvA9Wj7otq1IXonVaqjI1eVGU6FSOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleeigdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
    gfettdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ocQdYedzKnqkmnt9Cac2xtsRC9WvJhIUclOl4O3B14SsFiNfbucTGw>
    <xmx:ocQdYbOnbI-jVCOLDFKpepceGcAZiv92WJ3lN3vT68FR8LLYhyeH5g>
    <xmx:ocQdYYnV2ANAWBz1VvIgIobOoDzFOYzXdnoJm4zNRVJkDfPSdOngAQ>
    <xmx:pMQdYYlcYwzHGS5gwkGb6AxRdj4nuzD390vErsQu_oRAzuQCItQy6A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 22:40:33 -0400 (EDT)
Subject: Re: [PATCH 06/17] dt-bindings: pinctrl: document Allwinner R329 PIO
 and R-PIO
To: Icenowy Zheng <icenowy@sipeed.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210802062212.73220-1-icenowy@sipeed.com>
 <20210802062212.73220-7-icenowy@sipeed.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <b2e40538-77ba-6a14-508a-d99d0481278e@sholland.org>
Date: Wed, 18 Aug 2021 21:40:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210802062212.73220-7-icenowy@sipeed.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/2/21 1:22 AM, Icenowy Zheng wrote:
> Allwinner R329 have two pin controllers similar to previous Allwinner
> SoCs, PIO and R-PIO.
> 
> Add compatible strings for them.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Samuel Holland <samuel@sholland.org>
