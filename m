Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7751EF08B
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Nov 2024 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072657; cv=none; b=U7JAyR/zVibH+No8gskI8Fa3IptBs+fSfp6n7iNFhOZQl3uDwrV3Pmb8DtyGxGFaIjBkHNMERZWGuu8G3Cmj3uxSbpHjXokjyD6+JVWAuPb8CygExAh33gBCefQTGO8z9nE9DsHggXNNk1BIO4Q/e4h8/k2q6EzG2cgvT1NhoQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072657; c=relaxed/simple;
	bh=wPZJlLnI08tmm1U0YRB/ISYI69snjo4u+8znWWEyD9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WV3EdyVXXGOjg9l+lWkJ63fHfLrOVWM/5fbgUshin+qi2bNs7OmFXm0aO5yX3yeOCe8YHiEnFAZAFEBgAKvGfmtTAahOi0dnYRI1z6nLKpm2jqvbEGOssyIP/vTVsqbH+aibcJh3NDQptHEq5kWh9XGcff6A4b5XQ7dIzqAQOOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jookia.org; spf=pass smtp.mailfrom=jookia.org; dkim=pass (2048-bit key) header.d=jookia.org header.i=@jookia.org header.b=Tb5YOYZt; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jookia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jookia.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jookia.org header.i=@jookia.org header.b="Tb5YOYZt"
Date: Sat, 9 Nov 2024 00:29:12 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1731072651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UIXKP+RHW4XCjdsq76k5coFeMmA2KINbHEm689Ip5fU=;
	b=Tb5YOYZtj1JEeci4IP+D3ftq3ruIwUPUHeJ8qPzlbNcF7xnPlBBSs6hOMFNjZGrcenze6h
	zHvPkaEqTsl8VjT2uU85t69ZM79EKJH5FkgoFUXwkmMDAp56dgOs8SUlc+Y/bG6NggMUXj
	FyAU+M+ZmtWY1eXU/07Zu7dyQneaZ/qEfLBhuCuobk3bP14vC80Pdu2sBD8p8rszkjN7WK
	vZ+pBO81+zvuphinfTKzhtSq4RJy5zD83Pj/c1rnMd91P3C4v7t2jzysDJm+K8zEswXgJk
	xpdCkiL65jh+aWAcW/02ihU+aIsALl68B0xGSbQryn2QzBjFeamzOa/6MMRO2w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
Message-ID: <Zy4SKCBwce3q0yj5@titan>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108115357.691b77b0@donnerap.manchester.arm.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Nov 08, 2024 at 11:53:57AM +0000, Andre Przywara wrote:
> Hi John,

Hi Andre!

> Can you say *why* this patch is needed? Is there something broken that
> needs fixing? Where does this show and why wasn't this a problem before?

Oops, that's a good point. There is currently a bug where the LCD output will
be tinted. I have full context here which I should have probably linked in the
patch description:

https://lore.kernel.org/linux-sunxi/Zn8GVkpwXwhaUFno@titan/T/#u

> To be honest, given the isolation on this patch, I'd rather wait for this
> full fledged solution, especially if there is no pressing need (see above).

I'd be interested to hear if that's still the wanted solution given the link
above. This currently blocks many people from having working LCD output.

Doing it the proper way might be overkill for now unless someone deliberately
tries to run two DEs to the same output. I haven't seen this use case.

Allwinner kernel fork initially sets them up to values like these then makes
sure both DEs can't be set to the same TCON.

> > -	writel(0, regs + TCON_TOP_PORT_SEL_REG);
> > +	writel(0x20, regs + TCON_TOP_PORT_SEL_REG);
> 
> Sorry, but that looks weird:
> First, please explain the 0x20. Is it bit 5? If yes, what does that bit
> mean? The commit message suggests you know that?
> 
> And second: the comment above clearly states that those two writes just
> *clear* some registers, to have some sane base line. So please adjust this
> comment, and copy in some of the rationale from the commit message.
> Explaining things in the commit message is good (so thanks for that!), but
> having at least some terse technical explanations near the code, in a
> comment, is better.

Bit 5 is value 3 of TCON_TOP_PORT_DE1_MSK. The R40 datasheet explains the
values of both masks as follows:

00: TCON_LCD0
01: TCON_LCD1
10: TCON_TV0
11: TCON_TV1

So this sets DE1's input to DE0.

> 
> Cheers,
> Andre

Thanks,
John Watts
