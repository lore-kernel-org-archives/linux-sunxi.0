Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18DB803
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Jul 2023 06:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71ACC433C8;
	Mon,  3 Jul 2023 06:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688366883;
	bh=LF9Ox8Htv3rolEvmigMZebHpaU16k1YxFdL17HM+3Bg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=bP8Vc/5KNXKQxK+6UAbDU2fuA4Abe3mNDhaSegy8AxfYQsvJby8B7EIpYaPxWuwfW
	 6sLS0ASmvz/673uxXZ6lTm7jqKhXHpGJOrrthih9K4i8/JGZxnkHxqpBC1I+hm/Gqh
	 ubuxVouKBiLvAsJ/ugvTUBnqxi7ZtfSHpuHswl1zKbe72pmbAicnMwOY3QMDSG9dcu
	 CJ7xkjE7gk0guVcwJOygEcYm3+QVO2lQdm36IJKkuTvyED/fw8aN2iO1O4gcFDwRoQ
	 UXoPf4mJ8IGo/eHzW5uisqMH/Ap9D4zu9GMii4rqpMAX2CFDvquSOE/AasYBWTu43G
	 NjbdTXcGK0Aqw==
Message-ID: <7cde12a668f9b0cc0e6654e2e6827419.mripard@kernel.org>
Date: Mon, 03 Jul 2023 06:47:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v3 2/8] clk: sunxi-ng: a64: allow pll-mipi to set
 parent's rate
In-Reply-To: <20230702-pll-mipi_set_rate_parent-v3-2-46dcb8aa9cbc@oltmanns.dev>
References: <20230702-pll-mipi_set_rate_parent-v3-2-46dcb8aa9cbc@oltmanns.dev>
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

On Sun, 2 Jul 2023 19:55:21 +0200, Frank Oltmanns wrote:
> The nkm clock now supports setting the parent's rate. Utilize this
> option to find the optimal rate for pll-mipi.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
