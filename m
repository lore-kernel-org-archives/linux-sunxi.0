Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801BF3C27
	for <linux-sunxi@lists.linux.dev>; Wed,  3 May 2023 14:35:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 5631CC7782
	for <linux-sunxi@lists.linux.dev>; Wed,  3 May 2023 14:22:45 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
	by mail.gandi.net (Postfix) with ESMTPSA id E7DE720012;
	Wed,  3 May 2023 14:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
	t=1683123757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uwxo62b1FjDP4W7+iA0HCFX6QqvdaT3I2gnswLMerSk=;
	b=FB08IkDN48YJRRLSHfeNgGlOMZREE3ZUEkFby9Cv+aGnB/sZq08iCFL8Edlmh++pWVjiRb
	MwWxNKoeEGR7QKMyaWPb6jQO7qUvatbqu8ndXhE18UPCFjxqQhQo9HOi4T7YxIBXimgSot
	mRuRo9cxs5euEITFQ0KBEIGmqki143DSaSn6gyFFviGrOoI5UHXXBTtEglILF2Vkt9zQue
	0+DLIhORCVQ0x0/0EmHZHgHeFV8qilx4njBppMlLW6EFR78prU0j1bVFYK+x1wN/c4A4Ct
	V9DyAoB0Ztbdh/IrN8ZO9bEt/LfRMl37aItpqkPTxYclousaDuRpOCMWONd8yg==
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 May 2023 16:22:32 +0200
Message-Id: <CSCPKPC8OB80.1TTBCM3YDVJQ5@void.crly.cz>
Subject: Re: [PATCH v2 0/7] drm: sun4i: set proper TCON0 DCLK rate in DSI
 mode
From: "Roman Beranek" <me@crly.cz>
To: "Frank Oltmanns" <frank@oltmanns.dev>, "Maxime Ripard"
 <mripard@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: "Chen-Yu Tsai" <wens@csie.org>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Samuel Holland" <samuel@sholland.org>,
 "Ondrej Jirman" <megi@xff.cz>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230418074008.69752-1-me@crly.cz>
 <87cz3uzpx1.fsf@oltmanns.dev> <87mt2o9njh.fsf@oltmanns.dev>
In-Reply-To: <87mt2o9njh.fsf@oltmanns.dev>

Hello everyone,

I apologize for my absence from the discussion during past week, I got
hit with tonsillitis.

On Mon May 1, 2023 at 3:40 PM CEST, Frank Oltmanns wrote:
> Looking at ccu_nkm_determine_rate(), we've found our culprit because it
> does not try parent clock rates other than the current one. The same
> applies to all other ccu_nkm_* functions.

Yes, that's why I dropped CLK_SET_RATE_PARENT from pll-mipi in v3.

>  b. Add functionality to ccu_nkm_* to also update the parent clock rate.
>
> I'm actually interested in tackling b, but I can't make any promises as
> to if and when I'll be able to solve it. I'm not certain about any side
> effects this might have.

It sounds like an interesting exercise. But what if HDMI is then added
to the mix?

Best regards
Roman
