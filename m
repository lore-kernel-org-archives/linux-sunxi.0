Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773519645E
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Jul 2024 09:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721122057; cv=none; b=uMB1rHmpl9SiTryVyCAZmDSyDoaLu61Ci/r05ORfGSeHskjSPKZ951qs1Ou3oxXQxMbtGupusmShK90g3CHYL+wUJw4HM55uLyUwRG9TTxh7kx1NGPzNMqENyeuWj9g0YopywhpZktXpj/gwmrULevS/VidY+/ZJEIUTcwocZpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721122057; c=relaxed/simple;
	bh=0AvImW20JI33GnYfDuA9xlRzQVQN5eOuU1t4kmhQGTI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=hYgpxhZ8HdYeBfnNHvp2g+Xi+h5X97OrytYii6ZhRc533Wgm0yTYg4J8EWTtxhMPJQ+WQGHq3EB+zTYtufDFgXG61qNShf0KscxBkyJJqf+G3AOXVLdGM8MOI7RNNd9vjWT8HMTwYnajWkPKHUWqhzRxOpbHS0AE7Irm2K1Ktag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyG+GYR1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyG+GYR1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42679f33fefso35674725e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Jul 2024 02:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721122054; x=1721726854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PEU4qwN7WxP6VJDTGvYtCPzC+v0lV1/cj8lPv93ylU=;
        b=FyG+GYR1IbXDyqoup/Cvkh5ZyMYwIfjoyVzktaMGIedwV+w7oTkK5nb078LzBD4jS0
         KR8q0U2Z7m3WV3wYJPR+aRdLTVxBGkVZxtZIn5FqtZ3IBNn+QiDTXK0t5l/Ku8PFz7IX
         or3ruImipJI83rIfEDjLTVYWVnY+G+lP6D+AaC04ULNlJUKMy7tV068vCFDYovXu7Tf/
         CznxxlFL1KcxVtxNCRA0VKFyl+Xjml3reV+UPfx/kzF5Urp8vslTYmKKVbBW0m+jO+B1
         mAmo7UlvGMIkDuMsFrdEaqpHsmv3hCDgQXcPNiViWX2URAVSb3GfMgjx05jeKIXfWT+O
         86uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721122054; x=1721726854;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2PEU4qwN7WxP6VJDTGvYtCPzC+v0lV1/cj8lPv93ylU=;
        b=pf00bIxYDdX2cBL5ETDmQHhlRW1j8zroCd8/23ITUBUix9UqpJ3kg032QdM0L3i3kx
         urh9wMmpmavQffjm6/SkNJHMsJBgFReQU/uwIRqwLymQIa9yeU5VtbGetxmlOg9G60QY
         yrzDy/wHXnfNJUzXbbUYRdJ83AK8geMNroJYOX0DvD/XM/EKlsLLjbhEZZKjyQesg2kl
         jf1+Nfjp3UARwLISRrEFj+kH/3Ko6kKY+P+z+VMH7yAzDC62RIbrfLYk3ZdyTxSmVbtK
         sVVzM25+xZfS6KG61/F95Pa6cg3sWAdFs7yNTeshXr/7MhmhJRCnnntToVloyh7F4RKD
         sE6A==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8h6l2w8dd1ty9rft7codqdBxp4659DFPe4OSF3R5smQ17gJXEoZARJyMuA7zRrUO3M5x5A+jSzR4/tPH1AmnMQLTDv/x8rjZIHk=
X-Gm-Message-State: AOJu0YzH4HlvEq6kcA4IXv6Ljpwavrqqp8JdoDstn9GOh50AFD/LIt0J
	FOZhPu+etcpnITOPhhm4oAZnaMZzdpA3KYh/BLuxVupbK+Q3uxqn
X-Google-Smtp-Source: AGHT+IEGHl0l97n2oZGPosdV8rJBmnt5GWQ20KKOkfy2e9pjEUSSh+vmDhtfqRS+c9+nFRYnAae6Rw==
X-Received: by 2002:a05:600c:3152:b0:426:6eb9:db07 with SMTP id 5b1f17b1804b1-427ba684a4fmr10488545e9.13.1721122054395;
        Tue, 16 Jul 2024 02:27:34 -0700 (PDT)
Received: from localhost (host-79-55-57-217.retail.telecomitalia.it. [79.55.57.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427bb9976casm9090835e9.1.2024.07.16.02.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:27:33 -0700 (PDT)
Date: Tue, 16 Jul 2024 11:27:33 +0200
From: Matteo Martelli <matteomartelli3@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Matteo Martelli <matteomartelli3@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Marcus Cooper <codekipper@gmail.com>, 
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
 linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Message-ID: <66963d0531f17_7063708a@njaxe.notmuch>
In-Reply-To: <20240715-rigorous-bipedal-sloth-c8df1b@houat>
References: <20240529140658.180966-2-matteomartelli3@gmail.com>
 <20240529140658.180966-3-matteomartelli3@gmail.com>
 <20240606-savvy-wallaby-of-champagne-d4a50e@houat>
 <6662bf1b61bbc_2f51737023@njaxe.notmuch>
 <20240702-copperhead-of-unusual-intensity-7f43a8@houat>
 <668419fb8ef9f_2a76d370f1@njaxe.notmuch>
 <20240715-rigorous-bipedal-sloth-c8df1b@houat>
Subject: Re: [PATCH 1/1] ASoC: sunxi: sun4i-i2s: fix LRCLK polarity in i2s
 mode
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Maxime Ripard wrote:
> On Tue, Jul 02, 2024 at 05:17:15PM GMT, Matteo Martelli wrote:
> > Maxime Ripard wrote:
> > > On Fri, Jun 07, 2024 at 10:04:43AM GMT, Matteo Martelli wrote:
> > > > Maxime Ripard wrote:
> > > > > > -	/*
> > > > > > -	 * DAI clock polarity
> > > > > > -	 *
> > > > > > -	 * The setup for LRCK contradicts the datasheet, but under a
> > > > > > -	 * scope it's clear that the LRCK polarity is reversed
> > > > > > -	 * compared to the expected polarity on the bus.
> > > > > > -	 */
> > > > > 
> > > > > I think we should keep that comment somewhere.
> > > > 
> > > > I think that keeping that comment would be very misleading since the LRCLK
> > > > setup would not contradict the datasheet anymore [1][2].
> > > >
> > > > Also, do you recall any details about the mentioned scope test setup? Was i2s
> > > > mode tested in that occasion? It would help clarify the situation.
> > > 
> > > I can't remember if I tested i2s, I think I did though. But most of the
> > > work was done on either TDM or DSP modes, and I remember very clearly
> > > that the LRCK polarity was inverted compared to what Allwinner documents.
> > > 
> > > So the doc was, at best, misleading for these formats and we should keep
> > > the comments.
> > 
> > Thanks for the reply Maxime, would you be able to point out the Allwinner
> > document part that is (or was) misleading? The current datasheets (see links
> > [1][2]) look correct, the current driver setup for TDM and DSP modes respects
> > those datasheets and it's not "reversed compared to the expected polarity on
> > the bus" as the comment states. 
> 
> I clearly remember having to debug something there, but I don't remember
> much more, sorry.
> 
> I guess if you have tested on the H3 I2S, TDM and DSP and it all works
> as expected with your changes, go ahead and ignore my comment then.

I did test it on the A64 SoC only (all modes I2S, TDM and DSP working).

Best reguards,
Matteo
