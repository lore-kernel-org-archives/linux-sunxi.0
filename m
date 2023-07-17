Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037304C98
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 14:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFB1C433C7;
	Mon, 17 Jul 2023 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689602908;
	bh=1C/1zFzPAcvFdNbVlwJcLs0b2J8Mxp77yP1oYPB/Bd0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=nkxZhT6S2eQD3ZswL6Gq1CcBLtuji6c7eqZ+k4btRrwenFlKWnbi48oaHWQXOOIBU
	 GdvkpGaxI/dZAAgl1/yJsNYZcf765oz/sngpFXAomD+EsRSyJVWM2enAmRfprtXVzo
	 EALL9EGM3W+q7lPE1uFdHEg/zGW9ZmGOT5Z6kIOvWhXya5fVi+IHNfXetAihrdJq7y
	 MkmX2NKWFLgq8UgQpQILDuw23qz3lR7VDHCZiLi8ZaJh4cvtOg68GWPG7v7p/r8Az/
	 /DHKJcuNvrQC0FqMQR0o1EPkEumytWR9yRyvLg+XK8mNqlH/IJihqLWOORe7JgllEX
	 UZ8SuJBJA1aDQ==
Message-ID: <5721cdc0f98faea5c00051a3e6c8701c.mripard@kernel.org>
Date: Mon, 17 Jul 2023 14:08:26 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v4 06/11] clk: sunxi-ng: Add helper function to find
 closest rate
In-Reply-To: <20230717-pll-mipi_set_rate_parent-v4-6-04acf1d39765@oltmanns.dev>
References: <20230717-pll-mipi_set_rate_parent-v4-6-04acf1d39765@oltmanns.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andre
 Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Roman Beranek" <me@crly.cz>, "Samuel
 Holland" <samuel@sholland.org>, "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Mon, 17 Jul 2023 15:34:30 +0200, Frank Oltmanns wrote:
> The default behaviour of clocks in the sunxi-ng driver is to select a
> clock rate that is closest to but less than the requested rate.
> 
> Add the ccu_is_better_rate() helper function that - depending on the
> fact if thc CCU_FEATURE_CLOSEST_RATE flag is set - decides if a rate is
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
