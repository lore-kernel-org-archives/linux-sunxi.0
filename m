Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFA463B9
	for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 07:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779608477; cv=none; b=nXm4XADrIpmWC4a3AZIg+ePZHrXTYiL+MMZxEZxxvgDZJSVy5dr+UzIfi+KbieRBCNJHIAEDDXcmOTwx2hbbo9YGIi61KZ7BNAaSF1BoZM/9ZmxsgjNwTP9o2GP/zgXQMeIKw8IfdT5p/tewNS5//r2XH6QsUlmBYT+l7xNambo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779608477; c=relaxed/simple;
	bh=o1mgh5byxeBktHfow5RMbguuKAqxaOFPNueVkaVl7yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JT61InQjxpiKIpbkEeuQahSknmjHxBCWEL5ARa5NcidPTTv3nDWTwd0n+nYy2FHf5YRvG+gleoE+swN99X4xpg2q+B8ljjdRujwcX/aKP3kNZJqWAthsHi7c9FFuoubg5GbW+XR1Xf6pepr2wJqQofzrZtDyhGO1rjHbMPFvDkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2o4My5q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2o4My5q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3B71F00ADB
	for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779608476;
	bh=o1mgh5byxeBktHfow5RMbguuKAqxaOFPNueVkaVl7yg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=S2o4My5qrAsrq/M4O9F8WsxkPAUsd90A+GELJX/NtTw8nHicTFfjptpm6/luY/DUh
	 5zMbVizlPjt+CwTwcmec6d+i+52s6odAa/wI20SwzB8pZCy6xtfUM5CwpdP6WPkkIG
	 Aq74sGB033QRAyKt7t+BXcdGX21eR45nfkHBsQag6jzIAF0G/yfHhK9V2N+sy4Rh+S
	 6ws63SuynDPibTniRhftXEwJ79+4KlBgQw9VheonekdIgEZ4boBsM4v0wk1qOnqivh
	 MJcAMVv02fbqh7SnIF69GzrxtgUBmDmIZVDOn+mIgbHcRHrlLWluzjiljtficwrr+i
	 jlHuOt7CE4sqA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-393800f638bso63815261fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 00:41:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/++hlTjelzMDkNQHUXZQM5AzRshHfchEU9lkHoBVzlWKZBqMhGG9/CBhOKExKo56d/2XI356KugV7f+w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp+sunFRuzcm/rXUYXrC8DkwY9GDvF/kCUw4tS5QQh2ZHVV7iP
	AA0Rb5VddUwSd7vpwsChr/Pqh0sxsyKQytPgnon1o5XJdrBIX763gItzziugGbm2vw2qNSmpF66
	s5SMsoan5fxr0rbEN0sYZ6njJVt/poZI=
X-Received: by 2002:a2e:bc09:0:b0:38f:ec8f:8d53 with SMTP id
 38308e7fff4ca-395d8d7833fmr30102921fa.21.1779608474700; Sun, 24 May 2026
 00:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
 <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com> <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com>
In-Reply-To: <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 10:41:01 +0300
X-Gmail-Original-Message-ID: <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com>
X-Gm-Features: AVHnY4I_qF0YId4u6NuVsYJHQDK9GEC3lFnFgzQna0lbyP_3FUtJ1aNKvqsjn0A
Message-ID: <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 3:11=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> Hi Chen-yu,
>
> Thanks for your feedback
>
> On Sat, May 23, 2026 at 2:20=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> > > Enable the APB bus clock before the SPDIF module clock
> > > during runtime resume, as register accesses depend on the
> > > bus clock being enabled first.
> >
> > That does not even matter here. Access will only happen once the runtim=
e
> > PM callbacks return.
> >
>
> I understand your point that =E2=81=A0sun4i-spdif=E2=81=A0 doesn't immedi=
ately access
> registers within the current =E2=81=A0runtime_resume=E2=81=A0 path, so th=
e order might
> not trigger a failure right now.
>
> However, if we look at the peer driver for the same Sunxi SoC family,
> =E2=81=A0sun4i-i2s.c=E2=81=A0:
> Links:
> https://elixir.bootlin.com/linux/v7.0-rc5/source/sound/soc/sunxi/sun4i-i2=
s.c#L1296
> In =E2=81=A0sun4i_i2s_runtime_resume()=E2=81=A0, the sequence is strictly=
 enforced as:
>
> 1. Enable bus clock
> 2. Access and restore/sync I2S registers
> 3. Enable module clock
>
> Since both IP blocks belong to the same Sunxi platform and share similar
> bus/module clock relationships, shouldn't we maintain architectural
> consistency across these drivers?
>
> Enforcing the "bus clock before module clock" order keeps the dependency
> ordering aligned with the actual hardware roles, where the bus clock is
> required for register access while the module clock drives the functional
> audio path.
>
> Wouldn't keeping this order also make the runtime PM behavior more
> consistent and easier to follow across the Sunxi audio drivers?

This should be your primary motivation for the patch, i.e. what you
put in the commit message as the reason for this patch. What you
currently have doesn't make sense, as I already mentioned.

Some background though, sunxi is done mostly by volunteers, so we're
not overly concerned with rigidness or aligning different drivers,
unless they share a common library, such as all the clk or pinctrl
drivers.


ChenYu
