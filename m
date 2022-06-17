Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E867F
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jun 2022 03:56:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 994D95C010E;
	Thu, 16 Jun 2022 23:56:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 16 Jun 2022 23:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1655438202; x=
	1655524602; bh=AgEDvz+cw4RVOmL9USG0wqNDy4vNacxqxz1ctQNYbOM=; b=C
	rM2JjExkP1W7P9Uj7Drjk6PDHwlZ/BYcU82vvxhyJWI7ji4eH1fhmgN/NKSeRH6J
	FcctYuLTWDnF3UILYNZFzRAWdCsIFBgZb2pveShbX4UPZ6k8sNz2Vgssv0Nit1cZ
	K2Cju5sH/xyBM8iDw1HV/18VY8x3E1IaZLLbF6TgZPHp/pK0Ty1ZTQ8sONh6eTWs
	8+xyy9dFvdNE300YZkCyao5smk+ooaipqS4A8t2578tqWTtLrr9+J1AtH+RxALVz
	x8EyrjTkm46RU0YsaroCOH+baakH+kcg/t+Yr5N1VJ6eMZjS+plhZJUGMJezWun5
	Oe63hJ/uXmw1KITsqsB7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655438202; x=
	1655524602; bh=AgEDvz+cw4RVOmL9USG0wqNDy4vNacxqxz1ctQNYbOM=; b=o
	M4crVDhL8tOgdG5YtHmt4crq3uzYqb/u65Io9SCtRs60pOpvRXlYz+bSCuXHVBTa
	UW+L3o+H8e1kiNkYxiTgw55pcgY6NjJhTsyoQ+HcWrRDcRAoBcOSsMeQa0EgRMT6
	ItANAjNQLlRwnPuD8serp53nHpmDVHEaldr3DHkmlIG3k0FMe1VBYhNFi2AldEAJ
	NCb3LulxgwLDNafL9q+bl1+CJ28YMYPWC2ElQtPKfs5CmjvDP/HnhjYj1ZJ6pONs
	1EQ8xJCVoyE8RstB3cQ+RajATTXvyDwESda4VDYG4e3/0l93MqnpywfpMUzncT10
	vDe09UZv1dfim0xOcQxSA==
X-ME-Sender: <xms:evurYpmRIEbCt3hUL2okeU-4FVwO3Yt_xaHeXnUuFrGhoCpowS5BQw>
    <xme:evurYk2Qr00_wgQ2Tmmr1zJHDBEqF0H13bqqqq1SoqOuRHPPx9SqJEsBrVpT_OFoU
    JLwwdO1eI--8wr4kQ>
X-ME-Received: <xmr:evurYvr2wZPnlxB6KRJtDCBeWYMwWPnPxr8K6KDc4yvQKYE4ghGfAExoX9CVvCK9-b-YoYg_aHYJ_A9we2IVed8S0np9ztsO-OqmxDQlT6Yktf8bUIDGxDYM-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvgedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefftdevkedvgeekueeutefgteffieelvedukeeuhfehledvhfei
    tdehudfhudehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:evurYpkw1uyyHi100HZ8Kph2maY85Tp8y6d4aJbmcLL4At3g8a-XaQ>
    <xmx:evurYn3rK_4rsGJAoZ4F887OHE350s93hc11HYb31Y1TReXQ-chnXw>
    <xmx:evurYosuaKyksBHOE3b7GI_C6srRS8d6x8UZdcSVEN0er_WPv_ZfEg>
    <xmx:evurYiTVfW-yKhDmh3rRfZKtULSXm-nIZ_9_nB4Mtivk3doLAQz9rg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 23:56:41 -0400 (EDT)
Subject: Re: [PATCH] arm64: defconfig: Enable Allwinner built in CODECs
To: broonie@kernel.org, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, jernej.skrabec@gmail.com,
 wens@csie.org, linux-sunxi@lists.linux.dev
References: <20220614100343.3135227-1-broonie@kernel.org>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <052b1bc3-f110-fcdd-e88c-a3df77c921c5@sholland.org>
Date: Thu, 16 Jun 2022 22:56:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220614100343.3135227-1-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

+sunxi maintainers

On 6/14/22 5:03 AM, broonie@kernel.org wrote:
> From: Mark Brown <broonie@kernel.org>
> 
> Allwinner provide an audio CODEC as part of their SoCs which is used on a
> number of designs, enable the driver as part of defconfig in order to
> improve coverage of this in the various automated testing systems.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Samuel Holland <samuel@sholland.org>

> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7d1105343bc2..c2ad42bd8536 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -804,6 +804,9 @@ CONFIG_SND_SOC_RCAR=m
>  CONFIG_SND_SOC_RZ=m
>  CONFIG_SND_SUN4I_I2S=m
>  CONFIG_SND_SUN4I_SPDIF=m
> +CONFIG_SND_SUN50I_CODEC_ANALOG=m
> +CONFIG_SND_SUN8I_CODEC=m
> +CONFIG_SND_SUN8I_CODEC_ANALOG=m
>  CONFIG_SND_SOC_TEGRA=m
>  CONFIG_SND_SOC_TEGRA210_AHUB=m
>  CONFIG_SND_SOC_TEGRA210_DMIC=m
> 

