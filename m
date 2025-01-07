Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99538199938
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jan 2025 19:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278431; cv=none; b=tIMHdBELOYoQZiJY6uNhYwvpzEg7jm5A9pJP9lppqw5X7whlY2fzYYbU2IF/315TRWgPJ8s7VArttHKBpc2vEOIs62kOJrxdMRO+wC0a7VSpYSw7Ab+z6H86EAT9LqavGtBAVpFcpA/jFwuLYnP17jCsCC1r5DU/G820bLaI3Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278431; c=relaxed/simple;
	bh=lnUY3E9Xp9HZsjvS0v5cg5xxXO+EoQQewQPHH6SCUvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5Pc6uviW3KiLYQ06652So6uueoU7d5JREKZQsjOlks0AMNV6frqGZ85r3XluvB0uq+/vFiGsmrlY8gscJBHqx7skU6MPSuuuFNxFPDvNY3K9ulRxyhdWWwQb9fp/KRC2Rq7AAsZ3MoVk8a8tX1M5ckEYnG6jKVUgcVIjUa98zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=ctOF7/uO; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="ctOF7/uO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1736277829; bh=lnUY3E9Xp9HZsjvS0v5cg5xxXO+EoQQewQPHH6SCUvo=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=ctOF7/uOLwYBNG3JYhZ7w6tnM+ObaiBgyN67W6Hcf8v8aqN6QE40ifinp3fbc5B3a
	 RqQ5eWCFNBhGzhMIGoBVOxCgPgeOZb2Kdu0uW9sTc+gVhVoOZn0D35urnDBmTYf50B
	 O53JWrsosK91kVSE/s04Tf9MbzAPUSH/rnyOkiZk=
Date: Tue, 7 Jan 2025 20:23:48 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Arnaud Ferraris <arnaud.ferraris@collabora.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 0/4] Add support for jack detection to codec present
 in A64 SoC
Message-ID: <dfb3lsuqf4yowkovwwi6iiroslb4r357u7ddevntdk72ivxcjz@3spuwm24ubwr>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Arnaud Ferraris <arnaud.ferraris@collabora.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240302140042.1990256-1-megi@xff.cz>
 <CA+E=qVdq7AHYj1scKbyGmarSZ7u=vLMsQ63nDTDQBu2UaL=Xag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+E=qVdq7AHYj1scKbyGmarSZ7u=vLMsQ63nDTDQBu2UaL=Xag@mail.gmail.com>

Hi Vasily,

On Fri, Dec 27, 2024 at 03:58:44PM -0800, Vasily Khoruzhick wrote:
> On Sat, Mar 2, 2024 at 6:02 AM Ondřej Jirman <megi@xff.cz> wrote:
> >
> > From: Ondrej Jirman <megi@xff.cz>
> >
> > This series adds support for jack detection to this codec. I used
> > and tested this on Pinephone. It works quite nicely. I tested it
> > against Android headset mic button resistor specification.
> >
> > The patches are a rewritten and debugged version of the original
> > ones from Arnaud Ferraris and Samuel Holland, improved to better
> > handle headset button presses and with more robust plug-in/out
> > event debouncing, and to use set_jack API instead of sniffing
> > the sound card widget names, to detect the type of jack connector.
> >
> > Please take a look. :)
> >
> > v3:
> > - removed all device-tree related code
> >   (it's not necessary for core functionality, it only helps make the jack detect
> >   functionality of the codec be usable from simple-sound-card driver, and I'll
> >   send it spearately, because it will apparently need several more rounds
> >   of review)
> 
> Hey Ondrej,
> 
> Has it ever materialized? As far as I can tell, this code has been
> sitting dead due to missing dt-related code.

The code is used with some non-mainline patches. There was a bit of
a problem with simple-sound-card not being flexible enough for complete
functionality of audio jack on Pinephone, so I had to extend it a bit:

https://codeberg.org/megi/linux/commit/afbe7688083cd1e3ab98c37e0fe0c28d530829e1
https://codeberg.org/megi/linux/commit/95552b66a269c2da434edd3880f9819c0bd5602f
https://codeberg.org/megi/linux/commit/c15070c220e7425dd0d0445ae0eacdb4a4872ad7

Here's a bunch of patches that I use currently for complete audio
jack detection functionality:

  https://codeberg.org/megi/linux/commits/branch/audio-6.13

But no, complete upstream support did not materialize, yet.

I'm not sure about the direction. Whether to push more features to DT or
just write a sound card driver for Pinephone, that would be able to handle all
this without extending simple-sound-card or DT changes to codec driver.

Kind regards,
	o.

> Regards,
> Vasily
> 
> > v2:
> > - use set_jack/get_jack_type
> > - get rid of some custom poking inside card internals to figure
> >   out what kind of jack port we should setup the codec for
> > - read jack-type from OF as suggested here:
> >   https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-component.c#L288
> > - add DT bindings
> >
> > Thank you very much,
> >         Ondřej Jirman
> >
> > Arnaud Ferraris (2):
> >   ASoC: sun50i-codec-analog: Enable jack detection on startup
> >   ASoC: sun8i-codec: Implement jack and accessory detection
> >
> > Samuel Holland (2):
> >   ASoC: sun50i-codec-analog: Move suspend/resume to set_bias_level
> >   ASoC: sun8i-codec: Enable bus clock at STANDBY and higher bias
> >
> >  sound/soc/sunxi/sun50i-codec-analog.c |  73 +++++-
> >  sound/soc/sunxi/sun8i-codec.c         | 346 +++++++++++++++++++++++++-
> >  2 files changed, 399 insertions(+), 20 deletions(-)
> >
> > --
> > 2.44.0
> >
> >
