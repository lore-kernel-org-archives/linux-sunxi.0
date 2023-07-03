Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A028A34
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Jul 2023 07:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBA7C433C7;
	Mon,  3 Jul 2023 07:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688370000;
	bh=2Fuonf3inGH6Anz8QQf5AfqCEcy/ALYXqeeLCq68Olc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Px9Kb2FMUtGc2uRE1HnA39rxVKAwOwfN31jg5IVAujwpq+pRCxOHXIdrhlHuKMioh
	 WjK0nGaGY2hhkmPoCA7jZ2klY+Qe5zjJ2baSrWvwLISdZZxobINgyi91P6nf8WzkqR
	 vcI3bWYIrhJY+4M3ROkt16glLaER6CoarhPoxSMEze/FzqEqhSpfGRFgbyiGG7BMPe
	 LpTzamyELTy6mNeaCG9ljiRg9kVoxBRSlCdBEu/yXZz6wczs4ScN5V4bMsLgXwzkR9
	 PCktpxjDZZT6pKwxkUfmYkzKll4V8kQB2/Y/nYsRwco0vWPo7W+3dnXCSWIXht5mh1
	 1gEEt8IGCChjw==
Message-ID: <0624919df393575c25c454b14ca790e5.mripard@kernel.org>
Date: Mon, 03 Jul 2023 07:39:57 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v3 7/8] clk: sunxi-ng: div: Support finding closest rate
In-Reply-To: <20230702-pll-mipi_set_rate_parent-v3-7-46dcb8aa9cbc@oltmanns.dev>
References: <20230702-pll-mipi_set_rate_parent-v3-7-46dcb8aa9cbc@oltmanns.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andre
 Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Maxime Ripard" <maxime@cerno.tech>, "Michael
 Turquette" <mturquette@baylibre.com>, "Roman Beranek" <me@crly.cz>, "Samuel
 Holland" <samuel@sholland.org>, "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Sun, 2 Jul 2023 19:55:26 +0200, Frank Oltmanns wrote:
> Add initalization macros for divisor clocks with mux
> (SUNXI_CCU_M_WITH_MUX) to support finding the closest rate. This clock
> type requires the appropriate flags to be set in the .common structure
> (for the mux part of the clock) and the .div part.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
