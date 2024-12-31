Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80975789D;
	Tue, 31 Dec 2024 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735652255; cv=none; b=q5iooCn6LbqWqmx3PrlocbdwZozWYirkvQMgv6w1ctmhNLtOoORm/wZtKmHFaDe1qFNmbo8mKPAVLTD/ETrrURJDQePxENwCOuUbt4D5ejvHwYOF3tvUFe3QFQi/KTJS1b7yGz1fcZhMEW7GlKo1zstTUiV2KalMOAZz/pOoPU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735652255; c=relaxed/simple;
	bh=VlKLhUN+zDmr0U5+deIXHrgXfztAdQTHo3T3VjafnL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpniNZEMXfEXzLAcEiBSVYQBDs9oSrbQdRlhhviogxi0pMzwhTQ6OyoAcilBULIoFq9p2Zj1uKX7V2TBf2tXgzktPKl1Jg7bRGuwV9pGLX/RK+LFjRmspp+nWwOY1GGYJU2mF4HkUt20tQtZEMtN/r+xiCsDaHjFTw2R0ShHvzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQnkiJbc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQnkiJbc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE259C4CED2;
	Tue, 31 Dec 2024 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735652255;
	bh=VlKLhUN+zDmr0U5+deIXHrgXfztAdQTHo3T3VjafnL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQnkiJbcSg0EI64smS1a4LcCoIU/L0WXtYnGipGgmpWIH2l991MQlg4Yctfk7RYnS
	 lqG/0sdMv4Kp4uD5s1BwRxmPKSN08NtUzPItbu71bVaCUohaW5ok+3KTF/m3U08bV4
	 vzrBjkJqbM3yt6fa0fmzZ1MPBzGz7KjBsTPKqT6RgYwDntZknUCREmaDlq4ySlji3s
	 LhX5mq7G5P9KMdQxJl9sNtHGMv7/qbAxnEv8Uw0bMp1WoOPLxEtnMFIMfSdH5Qs79E
	 eJ5ZMpN6bT4fKG+TLvWJgGdY36Up+ixdzqVqV8wtV9fsaTia10Vqp/lZJpH2bp6ojD
	 0W5EY0hh9XY5Q==
Date: Tue, 31 Dec 2024 07:37:32 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
Message-ID: <20241231133732.GA76940-robh@kernel.org>
References: <20241221094122.27325-1-ryan@testtoast.com>
 <20241221094122.27325-2-ryan@testtoast.com>
 <6768438d.4a0a0220.399c57.89b6@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6768438d.4a0a0220.399c57.89b6@mx.google.com>

On Sun, Dec 22, 2024 at 10:51:24AM -0600, Chris Morgan wrote:
> On Sat, Dec 21, 2024 at 10:26:32PM +1300, Ryan Walklin wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Devices integrating Allwinner SoCs may use line-out or headphone jacks
> > with jack detection circuits attached to a GPIO. Support defining these
> > in DTs.
> > 
> > A number of Anbernic devices featuring the H700 SoC use this mechanism
> > to switch between a headphone jack and an internal speaker, so add these
> > to the allowed routing items.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > ---
> >  .../bindings/sound/allwinner,sun4i-a10-codec.yaml           | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> > index ebc9097f936ad..b4b711e80b65a 100644
> > --- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> > +++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> > @@ -98,6 +98,10 @@ properties:
> >      maxItems: 1
> >      description: GPIO to enable the external amplifier
> >  
> > +  allwinner,hp-det-gpios:
> > +    maxItems: 1
> > +    description: GPIO for headphone/line-out detection
> > +
> 
> If possible, I wonder if we can keep this without the vendor prefix?
> It looks like for now Nvidia and some Rockchip codecs have the vendor
> prefix, but audio-graph bindings and Freescale codec bindings have this
> as a non-specific property (and it looks like simple-audio-card does it
> either as "hp-det-gpios" or "simple-audio-card,hp-det-gpios" depending
> upon the circumstances).

Yes, drop the vendor prefix.

Rob
