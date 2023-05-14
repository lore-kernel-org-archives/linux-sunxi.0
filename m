Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598996FC9
	for <linux-sunxi@lists.linux.dev>; Sun, 14 May 2023 17:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1684084240; bh=BgJR/kqppVUacidrLtYW5Ojg4kMiGFWqEAPq48YsoGI=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=fgGneq8vVbULdCtbHBCWwh3qs4xxOHHpGtfGhZ6U+5D0IS7rIQAacacVJ0oqE68Ur
	 P3lT4F3MrPvmeUchr2OEr0yrTQ4UFQ36NW+UtMbotRHHfF2sRDVbaLmfoH4YRO0h6J
	 xzwyssXpBx+T3ObrewZo4iRbjz8kzNM0/ZEtBKTs=
Date: Sun, 14 May 2023 19:10:39 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] thermal/drivers/sun8i: Fix some error handling paths in
 sun8i_ths_probe()
Message-ID: <qatlg75vf4tbugut2xehwbv4722uklprr36lvsgtcdmgoiqwgi@mdsaurbgy6jz>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <26f9e3bb3fcd0c12ea24a44c75b7960da993b68b.1684077651.git.christophe.jaillet@wanadoo.fr>
 <yd37pz2nbs2i5m4a5avonj4w7ili4kx7d7w7fgbiss7z26jnfy@rwytm26i6v7h>
 <9ae3f111-e13b-cdd7-317d-316585390952@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ae3f111-e13b-cdd7-317d-316585390952@wanadoo.fr>

On Sun, May 14, 2023 at 07:00:34PM +0200, Christophe JAILLET wrote:
> 
> Le 14/05/2023 à 17:35, Ondřej Jirman a écrit :
> > Hello Christophe,
> > 
> > [...]
> >
> > This changes the recommeded order of reset release/clock enable steps, eg. A64
> > manual says:
> > 
> > 	3.3.6.4. Gating and reset
> > 
> > 	Make sure that the reset signal has been released before the release of
> > 	module clock gating;
> 
> Ok, so moving reset_control_deassert() (and my proposed
> devm_add_action_or_reset()) just after devm_reset_control_get() should keep
> the expected order, right?

That would be after reset_control_deassert(). devm_reset_control_get() is just
resource management, like devm_clk_get().

regards,
	o.
