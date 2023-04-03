Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729035683
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Apr 2023 13:52:48 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
	by mail.gandi.net (Postfix) with ESMTPSA id 02CD660007;
	Mon,  3 Apr 2023 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
	t=1680529959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yjZVA2mMTeWzOtGqbKtDtJ1agsEpiSlCHKJk6KjuyTk=;
	b=a+axboIp+P2/EKx8WVgBZOoRoRb9hQH4yMUJKl/KYwTUXyWTHkrdOcsRBihMNMuo2dl3QV
	zWOf2kr4ADe3KnTUNknPdufaa+L4lsOwXiR2y7Gma3pvVwv3JpTkY8iVX7m5RtIHlWCqfj
	gtlXcAJzUSIjwDYnwLcdHWT6bi2HsK3G6cunNA5Ir3/fkY5mIBklap5LlA1PVfm27uqBIc
	RM2xnKgFFxAo/EPlKGKCWqf3BP+rWeYJXnEO5ARANwcYxyCRVZd058YKlxfLKQ5MLzUgC6
	upc7FgQGmjHoLlWXZL9JaTEk2pbSI7L8GYt2tdTN6hhcXvidQ3OevjSfPQHwPA==
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Apr 2023 15:52:36 +0200
Message-Id: <CRN65FVKWIUG.1VSDAH8INXQMT@iMac.local>
Subject: Re: [PATCH 3/3] drm: sun4i: calculate proper DCLK rate for DSI
From: "Roman Beranek" <me@crly.cz>
To: "Frank Oltmanns" <frank@oltmanns.dev>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland"
 <samuel@sholland.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230331110245.43527-1-me@crly.cz>
 <20230331110245.43527-4-me@crly.cz> <87h6tya70h.fsf@oltmanns.dev>
In-Reply-To: <87h6tya70h.fsf@oltmanns.dev>

On Sun Apr 2, 2023 at 12:49 PM CEST, Frank Oltmanns wrote:
>
> When apply this to drm-next my panel stays dark. I haven't figured out
> yet why, though. The other two patches in this series work fine, i.e.
> they have no effect as they are just a refactoring.
>
> I'm testing this on my pinephone. It's the same with the patch I
> submitted. For whatever reason, it no longer works on drm-next.

I've reproduced the issue on my PinePhone and noticed that tcon0 had set
pll-video0-2x as its parent instead of pll-mipi. Having tried a whole
range of pll-video0 rates, I'm now convinced that DSI only works when
tcon0 has pll-mipi as its parent.

As little a change as setting .clock in the default mode of PP's panel
to 73500 can fix it. Better yet, dropping pll-video0-2x from the set
of acceptable parents for tcon0 fixes it universally. And that's what
megi's kernel does, though the measure was introduced with a different
rationale:
<https://github.com/megous/linux/commit/7374d5756aa0cc3f11e494e3cbc54f6c7c0=
1e1a8>

Roman
