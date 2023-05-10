Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7824939F
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 04:38:36 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4QGMjG03vPz9sbC;
	Wed, 10 May 2023 06:38:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1683693506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TGqUxEs7+KA0bUhtlK1lVZB5oosirddpuH1iKWN/KY=;
	b=qZqEMiiK9m96NDdgm0AnO6/mf8bQdwNxo1oktDksIzGixa+60AHTXNKvWfMMF6WhH9gKJs
	gHE9iAE1unK6VYv+saT9wUn30yAzcKzRIlG8cJVP7esjgJ9/aZGMgkUk6aND/gCVcJXyq6
	cjd2yXOLsKrff8lUanv5SudV64JiUCdic170HU68nroUZJNAc1lbLCmjfopAQnyfWjrLrB
	jzLbHb0lFIVJ/13nse6u0rIu6LiDSXGZI9818rUjqHE3n6OJDKN5rTTujXAHXtju3w1USK
	rX1GF1M7daxUuV1LoOt8h/BWlKNx/oOgMboHfWXshP/Q2fgqZXt9pJBpk/Gxew==
References: <20230505052110.67514-1-me@crly.cz>
 <87jzxjp5tp.fsf@oltmanns.dev> <CSHP4M31IC80.2WGQC75I3PX71@void.crly.cz>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Roman Beranek <me@crly.cz>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel  Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Icenowy Zheng <icenowy@aosc.io>,
 Ondrej Jirman <megi@xff.cz>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] drm: sun4i: set proper TCON0 DCLK rate in DSI mode
Date: Wed, 10 May 2023 06:30:04 +0200
In-reply-to: <CSHP4M31IC80.2WGQC75I3PX71@void.crly.cz>
Message-ID: <874jokg5sf.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4QGMjG03vPz9sbC

Hello Roman,

On 2023-05-09 at 13:04:50 +0200, "Roman Beranek" <me@crly.cz> wrote:
> On Mon May 8, 2023 at 10:47 AM CEST, Frank Oltmanns wrote:
>> I played back a 60 fps video (10 seconds) and recorded the panel's
>> output with a 240 fps camera. I noticed only 2 dropped frames, that I
>> account to the imperfect data rate of 107.8MHz instead of 108 MHz due
>> to pll-video0's rate being 294MHz instead of the 297 MHz for reasons
>> I described in the thread on your v2 of this patch [4]).
>
> Yes. That's what should happen, right? Or do you report this as a
> defect?

Sorry, I didn't communicate more clearly. Without your patch, I'm losing
a number of frames in the realm of three digits. With your patch I only
lost 2 frames which is expetcted. Your patches are a big improvement.

This is the opposite of a defect report. :-)

Thanks,
  Frank

>
> Roman
