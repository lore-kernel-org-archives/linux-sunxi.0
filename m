Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13C9379ED4
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Aug 2026 21:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089016; cv=pass; b=tr2Ud57SG1PPPI/60xpJ97c7X8UYJibWDRKHtIV6YYSxYJ6PUZYJzNlvhxNHgX5SymSJsbINa9H0ZIH3jCavaeNVk4HZRx1c61eEhDOT6fVGYSvDrhXX0xvD/VOLk9aYjwyGqC/jB0by7csdXnol5Eox694et66vtcMls3Le4r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089016; c=relaxed/simple;
	bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIkSdwNEgf7a2k0on6VkRinb8wFoAZ5s5lKE/4i45M7W+PzSlHrLn+38F7dfu1WC4OejGdAgGKmf6g1FuMWg80WnJePXWFcZLA3/y8HhYXHmYcRIqrAiKwh5+rIvMnq53SbU3U7P4P2BDoij+vwi+ZgfOn+91mABP0FDeLQqSAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQaqSmMc; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQaqSmMc"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-758caf52714so130792137.0
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Aug 2026 14:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787089013; cv=none;
        d=google.com; s=arc-20260327;
        b=T6OG9y6P3+AMZ6tpTtvfT4t+uNQddEWrfEGjla5w6NlmINnKObfvYq6teAmmh0UFWk
         JCh1ZffHq/bLzpNhyx6JQYTaux9u19Gm2/KxxNhtMrYQxE6gHJZLK4B8DSVRWJFNWAAV
         oMgEb8YxrA58vv/eAZ73h/Hm5teLAA5cF01NUwsSXjnJ6zh6yinS6vflp/4zb1fzapPG
         dGwgbMBvu7UKLZwP9cn5YXb16KKC5sajGSqGsetK3kmxeBxlKKwo4GZ69mvuVQdo9ufK
         JC5YCdRmjAKahm6Fw4PXJDXq/zBJaU8P5h3UknxIw1hdhydGK7IwS1DtvdN4iPMU+CyB
         sYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
        fh=GM5KiAIHav4PkW1NA4A+EgeTAB93HabcgT/G0t6oUck=;
        b=FAS0JEWpwfdqq+ntuCp34hQ3+xRifjWJH1V/7fCUDAI+vkf/BQmesOH+dYcOOCq6qb
         B1cBYHew6GO0UXuis2WqQuJ6/kmxzwEHIKNB1WPybc2rei/MHFdQ57hVwL2tOXymP+Ff
         g1ziJeIChgOumT7KR74jHzZgEL3hSj9kqYCfM98b5tu4GwO57HO/WESNNewvLRe43Z3/
         umhCWs/O94nTJBWVRJG34Y4dEnj3jqTvvVM8VeMMeS1Buva0E4iQair07ydqiB+GHrqU
         y2gMpIv94SGELx2+k1k5FUrwe8Fig+b8Q5XDyB3POIuqJh2C8qDcrFA0vne0BlBPX9UQ
         Uf2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787089013; x=1787693813; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
        b=EQaqSmMcZHJRhAUUoQtnOvYVWVT1A8nsDFXONzHqBzu7pQMSrMMVUBFHQiqy6nvzBQ
         /t3Zb4UT/trx8ATwBGZnMg2IuJ/W83DRsS9/VhihaH6Tpy5Mv+bCWsKnQJupWvNLE/Y+
         0XfBKkuDo3dDBuZbnafFyXeuVRUxS2Tl8ZbqndG0KRD9yj7Ik+zxi5cXQtPQrLvhbwEB
         hf9eBeg4/tVqVwR0C9k6ZHgiXS1cx5EhkF8svSlDjnaPZBLfiuJlnLIMUFldlXn9ikWy
         K/rMwiBpSQ2jewZKOhYlrFwaCcfbOioTppVpkqMHzPOKXEdtRF53s3ApaFSxFds7d6KE
         RhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787089013; x=1787693813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
        b=XZmvoximbWj8kJhgWIzDnxfoHjjjm2qSm/biNk3i/x4O8xOyk1S9CRuKbG/JHBAEo3
         skTvZAKW+VM6iDRztk4Lgngg4Wn8XBU/IHyHSfQXp8qmSpZcvwr2i4ZzYe/9B2/fTyeW
         2ZSIgSskPvvMjQPdR+ezsBVlmPtLJPJnRb56B93FgaAViklk0tJw5npBEvkuMSWt5Yw0
         SjbjGUfv8qqpWqwkOt9c6CRjKgI7dL2sznToh3ZeUqwcv4CUkyUAFHrN6ZoSQnfGdgXN
         Sajq5i9DanpmefgAH2un1k7LXST55mmgkxha3MsD9PVyit2fgb+MInFrGHKaU4HedSIx
         pk1w==
X-Forwarded-Encrypted: i=1; AHgh+RpDM1oJf+jSAXrOgylxZfsg22wyFvYbEwDDMiGSE9wnplYlrpjSRYSYEcZ7S0vv7xOWzUcjPR4gbjpNDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGw2XHnQOUz5O8cD8EQuBiVOQTPL8i8cgpODc5Fm+1e0aaZAa/
	MpRRRlwtD1Z82BZRcOXGoeD2jK+rUyHjx/vAMqyhMdolM2d3l1giI6I3F9iLFdCGtRlg6+P5Azz
	+BRAsHWVDYdV6xeUqI2lVG+Vk3IiCDdg=
X-Gm-Gg: AR+sD13gm9KhE5bcR9RPy6pm0mvUS/CQ+1/2ntVJrlunFYfSoms5bJb6aWg+d/dxYsO
	2sykJAayaceKvsbfPPojkYlHdZZvcGvCCZdn5nL3MigmMNjK5gScHz2UQvhYCLFShKNGE0JlnTz
	w8lZlXMgh0ELtVflN6wj4W2l7EDsqhZBQRLbyzd25MbYScqCmFpDicbowbymB0kYI5EXeYxHxdV
	6/pAskCzjF4RoISmWhX4SzN0Roek5ak2SIuidwzOnAQIv/8Irh6ThrRFcTuqEkPZZnh/vjKb6/W
	3YP1tMUk7rhKmqrCJteyDERYYZT2Un5kdT8vgX3vRacU5+MOAt1RyREJLcQ5YCS9rXNAUZVfbhM
	ITW3K2LnJN1LmxBs+TRtMQPx2NUwV96o12iUCv45vx+K/DSkiFvz+Z3YLfowDqiX+pjfUNwu3au
	dMMFfWYEmrr+guddeK6iaFj96pNBrmB2u7IgdE
X-Received: by 2002:a05:6102:3fa6:b0:6cb:d562:b96a with SMTP id
 ada2fe7eead31-777b89f4818mr417941137.14.1787089013591; Tue, 18 Aug 2026
 14:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703152215.192859-1-richard.genoud@bootlin.com>
 <20260703152215.192859-3-richard.genoud@bootlin.com> <aoQibj7sCd6o8W6h@monoceros>
 <CADvTj4r=uBJyJdmK3T+jD_Nitg2NBs7fZgtE5p6wt9zwWgj6DQ@mail.gmail.com> <aoTMMAGbWelnjJTo@monoceros>
In-Reply-To: <aoTMMAGbWelnjJTo@monoceros>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 18 Aug 2026 15:36:42 -0600
X-Gm-Features: AcwNN1WNCOQhs7S_JPB6wAilK0gfWlIi5mTrdxNK2MAHoPVv5VHOpQRIxBhuAGs
Message-ID: <CADvTj4ovVmY-TN7u_yj6me88qNEzr_0xbuC9DerPguFGdgOEBA@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] pwm: sun8i: Add H616 PWM support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, bigunclemax@gmail.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 3:26=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> On Tue, Aug 18, 2026 at 08:12:43AM -0600, James Hilliard wrote:
> > On Tue, Aug 18, 2026 at 5:00=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek=
@kernel.org> wrote:
> > > I didn't look at Sashiko's feedback
> > > (https://lore.kernel.org/all/20260703153337.B5AFF1F000E9@smtp.kernel.=
org)
> > > but I would expect that not all 9 high-severity issues identified are
> > > slop. Please look through these for the next revision.
> >
> > I sent a v8 that should have fixed all the sashiko issues along with a
> > bunch of other issues:
> > https://lore.kernel.org/all/20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmai=
l.com/T/
>
> Damn, I missed that because my usual check for newer revisions is using
> the sender as key (because subjects occasionally change). You didn't
> write about your patch series being coordinated with Richard, I hope it
> is.

Richard was working on this for the same project/board.

> Just looking at your changelog I think most of my manual feedback still
> needs addressing. Can you (or Richard?) please go through my feedback
> and address the things still relevant for your v8 please?

From what I could tell most of the v7 review is either already fixed or
inapplicable to the v8. Probably it needs to be reviewed separately.
