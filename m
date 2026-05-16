Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3F5380FDB
	for <linux-sunxi@lists.linux.dev>; Sat, 16 May 2026 23:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778975426; cv=pass; b=SAyas/rdNDWGNIqRnmP5lpJlbEknlxYEaUvQSzRJ2slE5ujGocWP3G7wi1OLy7kE8hBIzyB9caIUz9PUphcIJxIg4E6oRCzir8Om5Uw9vwaYlqUPwgowq2YWUa8LSkl5aCCW4LBo5Qvb6U7sRMls9/r0pVk0e+dqpQgRvBdQwnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778975426; c=relaxed/simple;
	bh=Ls8MgqgcsH4l0RhCEuS7VvenDTm2U2W/j/zfAviF4qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuviai4UNgSMUqREVmMeitHyhRpdEOJcL7go3HRT983mqFheIrpNrIfRZCTDpyU3zSfcsac5ecucEWoYD+xGJj6AJD0LOSn51XQGnS3cUlKVQwV+pufukSpeV1PiXXiZE0FxofFezdhfxbk/ChtNIJtP3zgdsA0RFJK6qC0b18U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffwIKxt5; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffwIKxt5"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8021c8c42fso334412a12.3
        for <linux-sunxi@lists.linux.dev>; Sat, 16 May 2026 16:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778975424; cv=none;
        d=google.com; s=arc-20240605;
        b=LmbepFpbEOTM+XdM4FReMX8M5RGHtV79aNV4fjwNPjj3zWpH7GKtDMgqZRsuTRJyF0
         sCvKZZtSYN3xWAAeTUgLJHyY1o0DigpzjhCLAcM9zoZ7Wzukpr3uBtsKt4fcr3u2tbSm
         eVvaZyuj0mVNIpTyWUKbznoYVZ9D7ONLWy0bSIecJcX2USNINTM9MLP3BXpUhLJyjEmG
         2G2N+A/6dmaVpYy/SEBoItKjH36KYex7T/Z45fF7T8StyEh35wJvBm55RtRVb88u+ukM
         kzFEuz+L9V504gEUQLkmJm4urjCKfG+uuJehmVsgGLNfbgckX4f//ElF9zFWQSERv582
         ZoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=;
        fh=clJjuPX1wp73EmI+aQ2kiO/nitl34gvpDqzRs0i0+c0=;
        b=GM0H8mPAM2Ku2ZCrtI7yCVBPCOc8jh1JVGusPGsXjiJ3tMxo7m60+4zw5zAswlgzgs
         NZ1ESuQm0bzVuEtCTE/48tJugZ4HzTTtAxuIDQFfprZbtidMcYqyeFUliv6DfR1nmdww
         Wa+kdeHzJj07wWuqwdPHAbZZg9oq9a702TLx43HTi6GO99uKMriH0Qs1NISpebXePyR9
         23LRsvKbLuhIfY1UZiObQB49BVlTNm/ecU+RonXcY0MrL5D4TrjaUW22Lw5+TSHi2V6c
         OPoW/DEPDu/bhrjzoqXfloL0ofurDeR3F8Yc6Jvo1j42ZFbG6x65NGFIIjq+HAcjz5OC
         iPCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778975424; x=1779580224; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=;
        b=ffwIKxt5Qft0xtG+YKmHIYH3TrDFuSfsA89d7Iz3+OZqUJd9wF41tLWQiQPQTdufcL
         oxPoLsg6i1plScgADhHbBqjBsAk4DTK+/O7TVU0iPSk3lOtQdwGWA9imp6GwcmpnWviD
         XS4Qy2TKHebxtOrpEBUH19WrOQ0Tr4So255kF1Y7g/m18ZUdetrWR2Uq0amROHslXSma
         ALRFf0hipwx0t0mxgxrxo1DECNdcWG7QuA3jVBW1Z4oXoh9vrAwyZR92J6FpL3rAX4Oq
         IJ0P5Pl/SKILpGioUlGR+4gaLm1PMHA3Xhrc8A2a/AXsPz02r2H5a0dtE/A8OVi70LBa
         X7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778975424; x=1779580224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=;
        b=BYXPJU/6179kQxaMfP2yhKDaRzu4at4y3VKveQH5ExYlFadXTmEOvOH8x3bQdGlHVD
         rm9pKL9/ztEn3DYkgYPqM2skKTeh6HsBLIoob/ZWA1SgrghMP7Jsi7d9kwHPamDVbF5d
         I8MYe/NRxS6V9j4FjaKiXmFj4lAJomnPO1gvigGGZpqYunyHkq6TwaM8kj0EnOeGk08T
         asiflp0/osfGp+BrEtpW4hIqua2RH49nH9Q59nKNk0FFAJl6Ksn84kVqIIBG8Hs3IdvG
         h5uyM9haNDqS6Icgy3Iz+o0iottmJ6fV78kya6Q9gTUzAapi0tb6zv3K/+qnGcaeV5Ic
         PIxQ==
X-Gm-Message-State: AOJu0Yy4QMID/zoMneLNEkwEJC/xykpUWhilX11ikRBAggiHBkPMoJhQ
	akKqT83/Y/wDRyAg9cdPjCIZNSs7AVi/MC+L9p1MUk1kkx613Q+N4BXBCj2OcCuADVY6AK9Oua/
	H3GTRDWdPgvVeU59WOHxiwY2RAtNAuAI=
X-Gm-Gg: Acq92OHmXYL3o6y+A5wgAhp4VYNeqNyyguOmmWiRApF+hPMJi2cFCuNb/d+q02qoDhY
	KIhievlUB2VOQLAnD1AoAs+usaDpQg2KiRLNJiBnozzj8gtM1pasJEEfRNtDR3rdeRPlusV2GKA
	9B20ddZC/edeS+OGu3pXgZYGvQdHAYp1jTw/tn6m9R0aA5ruKrLE/958/jB8YQCwiJJmUUBfXt6
	aOy2bs9sblOnEe+4xrBv22POtmmoTTtAw9yO4z51gFYLRXY0HsckxS3eaW2885UAxUU1HIajFlM
	moe+e80ITKiC5ws9TB29X6KC1sqfniiSKR6fbu+Z
X-Received: by 2002:a05:6a00:3928:b0:837:fe75:104e with SMTP id
 d2e1a72fcca58-83f33bae7d8mr10282417b3a.5.1778975424205; Sat, 16 May 2026
 16:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513105003.81880-1-phucduc.bui@gmail.com> <20260514043314.62222C2BCB7@smtp.kernel.org>
 <CAABR9nGhwtBu9Yhbn-BTD1Scykp2h6eQbtQtT13DcnekUdum1A@mail.gmail.com> <CAABR9nGZM3Bnb3DnObdp2nOJmW6ezmXqRSBtgS00Ps2ve4zsbg@mail.gmail.com>
In-Reply-To: <CAABR9nGZM3Bnb3DnObdp2nOJmW6ezmXqRSBtgS00Ps2ve4zsbg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 17 May 2026 06:50:13 +0700
X-Gm-Features: AVHnY4IsUkQfn46YMLJeefxvMG0oEQBhPAdzpdl8m066r_PvU5WUFTx-_5lbq4I
Message-ID: <CAABR9nGsb_zvH1w6GFDqGFNCYjThCGuQ+RC91Bpkwu=h9ypcJg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Use guard() for spin locks
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: linux-sunxi@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Marcus Cooper <codekipper@gmail.com>, Chen Ni <nichen@iscas.ac.cn>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all

I would like to make a small correction to my previous email, and
also confirm one additional point before preparing another patch.

Correction:

> However, I also looked at a similar case in the
> micfil_rate_set() function from the fsl_micfil driver:
> https://elixir.bootlin.com/linux/v7.1-rc3/source/sound/soc/fsl/fsl_micfil.c

In my previous email, I referred to the function as
micfil_rate_set(), but the correct name is
micfil_range_set().

Additional point for confirmation:

Currently, in sun4i_spdif_runtime_suspend(), the clocks are
disabled in the following order:

clk_disable_unprepare(host->spdif_clk);
clk_disable_unprepare(host->apb_clk);

Meanwhile, in sun4i_spdif_runtime_resume(), the clocks are
enabled in this order:

clk_prepare_enable(host->spdif_clk);
ret = clk_prepare_enable(host->apb_clk);

I checked the binding documentation here:

https://elixir.bootlin.com/linux/v7.1-rc3/source/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml

It describes the clocks as:

properties:
  clocks:
    items:
      - description: Bus Clock
      - description: Module Clock

  clock-names:
    items:
      - const: apb
      - const: spdif

From my understanding, apb_clk is the bus clock, while
spdif_clk is the module clock.

If that understanding is correct, then the suspend path seems
reasonable since the module clock is disabled before the bus
clock.

However, in the resume path, the module clock is currently
enabled before the bus clock. It may make more sense to enable
the bus clock first, followed by the module clock.

If my understanding is correct, I would like to prepare an
additional patch to reorder the clock enable sequence.

Please let me know if this interpretation makes sense.

Best Regard,
Phuc
