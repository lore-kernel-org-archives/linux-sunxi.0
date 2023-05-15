Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808C9A943
	for <linux-sunxi@lists.linux.dev>; Mon, 15 May 2023 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1684154031; bh=0yXiPXLG1mE9Cp0QFJsDToPAJuYXk6I4juqB/x64HMM=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=NmbH2EXdkDST+t545oWgvXbyEH2Wd6r/DrYWrzyAsN23XGFDWHKA7pxlCAsCS6+IV
	 Zw+JPcfhIAFVp67PipJyizpQpACFp9LNF4bnbYreZrVNqlz02nBiCkBYFv+73twX9R
	 qh9CbPY8WSaaQofjqHpNE6BAzwhfwJoJElQbnlD4=
Date: Mon, 15 May 2023 14:33:51 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] thermal/drivers/sun8i: Fix some error handling paths
 in sun8i_ths_probe()
Message-ID: <u7mmywm63bm5q4zlsbnooeplscn4rrd3qnslkfq2xnquxgnkkd@n3tsnrutmfjp>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Maxime Ripard <maxime@cerno.tech>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <a8ae84bd2dc4b55fe428f8e20f31438bf8bb6762.1684089931.git.christophe.jaillet@wanadoo.fr>
 <ucnnixemxbpkjlbyenboydicslozt5jpyjjfbd4gjk4oye52et@fgyd3zqdqsh2>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ucnnixemxbpkjlbyenboydicslozt5jpyjjfbd4gjk4oye52et@fgyd3zqdqsh2>

Hi Maxime,

On Mon, May 15, 2023 at 01:54:41PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Sun, May 14, 2023 at 08:46:05PM +0200, Christophe JAILLET wrote:
> > Should an error occur after calling sun8i_ths_resource_init() in the probe
> > function, some resources need to be released, as already done in the
> > .remove() function.
> > 
> > Switch to the devm_clk_get_enabled() helper and add a new devm_action to
> > turn sun8i_ths_resource_init() into a fully managed function.
> > 
> > Move the place where reset_control_deassert() is called so that the
> > recommended order of reset release/clock enable steps is kept.
> > A64 manual states that:
> > 
> > 	3.3.6.4. Gating and reset
> > 
> > 	Make sure that the reset signal has been released before the release of
> > 	module clock gating;
> > 
> > This fixes the issue and removes some LoC at the same time.
> 
> It should really be three different patches:
>  - One to fix the resource release, that can be backported to stable
>    releases
>  - One to switch to devm_clk_get_enabled
>  - and one to change the order of clock enable vs reset deassertion

The order was correct before this patch. I don't think an incorrect order
should be intorduced, even if temporarily between two patches.

regards,
	o.

> Maxime


