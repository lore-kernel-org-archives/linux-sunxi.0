Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3930517CB
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Dec 2022 05:46:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 468675C013B;
	Wed, 14 Dec 2022 00:46:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 14 Dec 2022 00:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1670996787; x=
	1671083187; bh=+R3ADFyPiRdIO1UTzC4sVtJO2PVgDzpQ2rsXrNce6hw=; b=f
	rWXDgKBTlOirsaJJRvrg8MpebhhcLHG9z/+ClYKDKr76Czr6l/3rGfebH/56kpVY
	HPIBHEsHkWfge36mPFJf4rEfCJQq5HRnf11k2DSsUtJFecNL/N3/MfZ7Wv4pIFYC
	E2nVWF0uSXM8p+zvDmW+s8FM//NJCd/6rRIP22PBPHyJXmujrLOR9LfiV3vZdk5G
	3n/7Uiq3ICKs+W1neVn3vXGXbmqQTEa8xSo8Zb/3Jtu/KbrQqr/TmrbfY+fTGkPp
	EHjRM/bRIMNB/ACknWTsEMKzcRBGjevYXbwrg5CNIM2+5+f1Of2Pk9ySyhEsKvmB
	6jG096a7FLetfSnIzFTVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670996787; x=
	1671083187; bh=+R3ADFyPiRdIO1UTzC4sVtJO2PVgDzpQ2rsXrNce6hw=; b=K
	bBFVGjOae9qZ44iW5l/B2ri6aZd5I2tn53HaOZVaY4G5RwDbjJMciL/od3CABTTn
	UkxqEw+QkyBPMWHhYyOdD6o0R0TeWYMjKQGxyG8qROdKSaWx136oDiTuS2l3FDGs
	A7oG22I+Vsp6PxcspDgI43k/s67nSud6uYJeNdYFFPPmqQxCEyg3tlmF8vKUqTSm
	rDQW9kasp2hNaHZrpp/SFEqRx6ZleI6ywykC3oPtjQkTfBzbnD14qsvFqMhjY48Q
	Y/phG5gFbSmaImwa9mD3e62wH4rr4UU5VxSlw9Pg1rch+3l7srVynJkHPF5pxq5P
	MfPHOTN4cnHmOntoyN1GA==
X-ME-Sender: <xms:M2OZYwHCAR5o0zZKXAdjAtUbv_snUvEpmZq5n15MvP67ZHMoo4m-cA>
    <xme:M2OZY5Wc7lm0CWkF1UB2yniEqK8-ZFsNluobRKK3YtavLBQLEUpdZasGjJY1VLNo7
    0eWcO00xQU6crAyFA>
X-ME-Received: <xmr:M2OZY6LhAjIO9MSVeUls4fYsfKl1On9S2hCIK5t0sLk_N2zhd6yBq5A1Q6-OlerNPQAZYMKLXlFi7P4Wybqzbs9evljLQiBkYQjuU3PITU8qyvz0AP8BlveQFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeelleef
    tdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:M2OZYyEKLaSTgg6JmHp8D7J-GjpheerKFaFgmhneJxJ_PHz_YvBHBQ>
    <xmx:M2OZY2W69o7-fzIQ8PQIMe8RbeieIa1WcHj9uRYaAPk1SsBLbdczjg>
    <xmx:M2OZY1O3hnakxkKFTsXWZjhQzMsPi50Ohm8hDQ-OHOY9H7nkHPejkA>
    <xmx:M2OZY1SU4eS1J6xP06uM2awznyZCYuq3ngrrEL193lBAAovMxSEKFw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 00:46:26 -0500 (EST)
Message-ID: <811f8060-9a5d-61eb-7078-0798c21b17bf@sholland.org>
Date: Tue, 13 Dec 2022 23:46:26 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 2/4] sunxi: remove bogus mmc_pinmux_setup() prototype
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20221214002244.31479-1-andre.przywara@arm.com>
 <20221214002244.31479-3-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221214002244.31479-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/13/22 18:22, Andre Przywara wrote:
> Since all callers of mmc_pinmux_setup() are located after the definition
> of that function, there is no need for a forward declaration (anymore?).
> 
> Remove the prototype along with its #ifdef guards.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  board/sunxi/board.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>

