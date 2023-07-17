Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5BEBA33
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 14:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91EEC433C7;
	Mon, 17 Jul 2023 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689603412;
	bh=TR980lv7Vb0E31av0d0J7WcCVxuuDRv28rDvU650wpY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Lum3I2apBOzxL1TokrWM3nbkwBu430wgrqGCYgS/aByDlfQ6rYgkzLpRUQly9EwdU
	 leQaRVgo/Y+6yFxj6FG21eMqd4JiaxcjJLQzQmmkfPT+r9UZHcu5NQNb1Q2XRmvvLa
	 3NFJGCQtw4Pd+3yNqVmlUut5eabCzXyf6yowRfbuf51mgfJEJFGlEE/GCwL4okvXCG
	 1IqdCC2KtFB8S1V9jyxPaja25hK9HlAK7ZjpG3IwPJD85TCFvyEzmDXyGGeUrWndX5
	 GkzdWEq5bA8IVXW6W1GJdu5roSpOxSMHzEN04fHfArcAA54fEaGdScy/dhdD7mddDg
	 LYbSZESICB4Dw==
Message-ID: <e281ed77c9c10213d6f44b2067c59367.mripard@kernel.org>
Date: Mon, 17 Jul 2023 14:16:49 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v4 11/11] clk: sunxi-ng: a64: select closest rate for
 pll-video0
In-Reply-To: <20230717-pll-mipi_set_rate_parent-v4-11-04acf1d39765@oltmanns.dev>
References: <20230717-pll-mipi_set_rate_parent-v4-11-04acf1d39765@oltmanns.dev>
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

On Mon, 17 Jul 2023 15:34:35 +0200, Frank Oltmanns wrote:
> Selecting the closest rate for pll-video0 instead of the closest rate
> that is less than the requested rate has no downside for this clock,
> while allowing for selecting a more suitable rate, e.g. for the
> connected panels.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
