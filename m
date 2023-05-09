Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EC31094D
	for <linux-sunxi@lists.linux.dev>; Tue,  9 May 2023 11:11:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 894EBCEEA3
	for <linux-sunxi@lists.linux.dev>; Tue,  9 May 2023 11:05:06 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
	by mail.gandi.net (Postfix) with ESMTPSA id 9750EFF806;
	Tue,  9 May 2023 11:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
	t=1683630298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cDT0BtDNWazrZ4uv2nOgwA/L/iBlds6MCiBQoDX01O8=;
	b=nSHUVWeB/sHhhhKvC0ANQeATJy/AYsdWCoxH6/rR0iq/mzZY5b0etDsw0+/CMFVtiUQ3Ov
	xjmj4eLNviD5ppjGWTJjtUBeXTmJ8RT6p2h+pCQAqVdM71f1CHBzdM8yVsjMwxGreTxhiu
	2dgJaAq3XqNjRd4sQN/cH18YXNgfZUYSvf4u8fa4EC/96ssNFlZYM3/nD383t2AOlbMn1w
	zI3KMUaYMg9ZlR1SYVeHQHEpi6eBaFEjPToakJ28UeUKS0mzkXXMtn5XD/2v4gNQQrNDTE
	TDBj073uecqHyipjvbp3JZPPVwAQ1wetsx+Taa0ZlgNQEzMS+hweEMFlQiGVNQ==
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 13:04:50 +0200
Message-Id: <CSHP4M31IC80.2WGQC75I3PX71@void.crly.cz>
Cc: "Maxime Ripard" <mripard@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Chen-Yu Tsai"
 <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Icenowy Zheng" <icenowy@aosc.io>,
 "Ondrej Jirman" <megi@xff.cz>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/4] drm: sun4i: set proper TCON0 DCLK rate in DSI
 mode
From: "Roman Beranek" <me@crly.cz>
To: "Frank Oltmanns" <frank@oltmanns.dev>
X-Mailer: aerc 0.15.1
References: <20230505052110.67514-1-me@crly.cz>
 <87jzxjp5tp.fsf@oltmanns.dev>
In-Reply-To: <87jzxjp5tp.fsf@oltmanns.dev>

Hello Frank,

On Mon May 8, 2023 at 10:47 AM CEST, Frank Oltmanns wrote:
> I tested this on my pinephone on drm-next, using additional patches for
> the pinephone's panel. [1] [2] [3]

Thank you for testing this and all the previous version of this
patchset. I appreciate your help.

> I played back a 60 fps video (10 seconds) and recorded the panel's
> output with a 240 fps camera. I noticed only 2 dropped frames, that I
> account to the imperfect data rate of 107.8MHz instead of 108 MHz due to
> pll-video0's rate being 294MHz instead of the 297 MHz for reasons I
> described in the thread on your v2 of this patch [4]).

Yes. That's what should happen, right? Or do you report this as a
defect?

Roman
