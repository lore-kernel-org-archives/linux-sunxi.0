Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42157E
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Aug 2022 17:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C41C433D7;
	Mon, 15 Aug 2022 17:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660584413;
	bh=gfrn3wi3lFlHb1DMO/mTQsg4NzAyb0o0/UVlWIOz7MA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZAOTYbOZGP6hcCeGKRAn1Z3DXn8ojOCipv6CPTgverYtBWoJGH+QpFWjV+pzGcRVM
	 cgxjAeuHwTEXydOulDfNDCBUb9COW8hRN97s1SqcKsA6WyK3ZnOXnOh28hZ2TW7fp/
	 7GyamXOA4hvZB6hmDxuSM6BwVkBThqXWPaO7dnUZM8O2TMSGfSwr7YgaWj6QwIpRnd
	 VWhQ1OQtonKYXLx9ChnMwn2PiUeIANAK4RPPezezGfftPT3mgpbAxt7zehwOANvpa0
	 Do0HWzA6P2bZQH5cWfVkwUOXBxXQwtFIPFwDCoSGDc5WrEp65ousCby8cJRq37sjoc
	 /F9V1khJkN+yw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220810014024.27568-1-samuel@sholland.org>
References: <20220810014024.27568-1-samuel@sholland.org>
Subject: Re: [PATCH] clk: sunxi-ng: mp: Avoid computing the rate twice
From: Stephen Boyd <sboyd@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Date: Mon, 15 Aug 2022 10:26:51 -0700
User-Agent: alot/0.10
Message-Id: <20220815172653.51C41C433D7@smtp.kernel.org>

Quoting Samuel Holland (2022-08-09 18:40:24)
> ccu_mp_find_best() already computes a best_rate at the same time as the
> best m and p factors. Return it so the caller does not need to duplicate
> the division.

Did the compiler figure this out and thus this patch makes no difference
to the final object code?
