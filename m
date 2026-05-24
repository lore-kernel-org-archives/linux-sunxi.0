Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2590B14B950
	for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 17:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779643185; cv=none; b=OpXdDZds21Va+C6Y5+h5EwFQxSVg7dmI5aiJkgYHcY5hXaXtzT16HCPie4rzf4F7vCmUVzlBjUkqGH3mP0lJwlqU3vth9pkXZ94A1+tcoj7PBfgqO0dqV70AXTjuxXOrn0M95TmTERP+CYnn2+XhtLdCA21oHrgGBdZJHlDO/Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779643185; c=relaxed/simple;
	bh=lYCSAGUVAND5q4EW5d8RK9mDufKJduBk3n//pVkW2M0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BuU4KqS5Re+dPV3A4sp8cKDbKkzy6VXwOWjMpOplLXrtGgoPEhVO8RV0N0ESy4f0ilaCUljOCAjAKrYaOC6+5LuN3ORr2owZWPj/7PdwpOCBhOsbprpIdj2ty+P4f6agBPnyoHlDs4Tvz78+aWC9cAVqT/v/G4bmGueUcydyGHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAew3OSB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAew3OSB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2D71F00A3F
	for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 17:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779643184;
	bh=lYCSAGUVAND5q4EW5d8RK9mDufKJduBk3n//pVkW2M0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=KAew3OSBk9HlQAR8yqug08zrq8XdHNANQP0KGjkSMQ/Vmxc6iTp3uSHVujyRw08De
	 teaUqN4Lvu829+1gWsFDAGMW9kPcgsMCz0iI+RbVAZup+E0HxG0vA0gCnd1kddPTJM
	 qeUTDw59CjhRrDLhn2+w8srq7oh2O7hLmn40notzrROLB+UNheQf4/niUX7S/NlJ0J
	 MGZliOzAWnHGjEUp19XXcVSHlugpcVY3koT5arTPRQfyEu9/DQp4b/r4wNa34A4coV
	 gKXqYnC3EWsfIgH7TlQ8fspObREFRVS0PUC2UWlYO6Ui/vFONYYMqTukPfrAWQ7+ly
	 2AtDsuuDx7Dmw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa21fa024cso6484653e87.2
        for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 10:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ziCz3VMLrw0PINuVpiBmdJ3TTJDdXDXaN798tti6Qt4BWy9JFsKcTaDozexlrUvZho8kN6a+VPgrDyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YziRWZiYQbQaIMZTnjM+8AEHX7GdlIAu9nMIU38CkKVVvOU8lh7
	2eEiJN2z2DzjneJv9aDtV6AylesSEW4wkilkCw1sCBykz+JmjHJGSS1XcdQgffbZjua33+hiaW5
	2id9YszAwvatDAJTev3sStsuAfei/OSw=
X-Received: by 2002:a2e:87ca:0:b0:38e:2aa7:3984 with SMTP id
 38308e7fff4ca-395d8c2f009mr26627641fa.11.1779643182406; Sun, 24 May 2026
 10:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
 <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
 <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com> <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com>
In-Reply-To: <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 20:19:28 +0300
X-Gmail-Original-Message-ID: <CAGb2v644whCr6pRSfGMuQ=5afUMbfC2Y3W_kjdMdp9+5+kJhJA@mail.gmail.com>
X-Gm-Features: AVHnY4JQEqR1NRvaAlulfLfl6JFdwlybp-Zu9dQL9cGHE5MXYGpl6ZK4AUWGpHI
Message-ID: <CAGb2v644whCr6pRSfGMuQ=5afUMbfC2Y3W_kjdMdp9+5+kJhJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 9:41=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Sat, May 23, 2026 at 3:11=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.c=
om> wrote:
> >
> > Hi Chen-yu,
> >
> > Thanks for your feedback
> >
> > On Sat, May 23, 2026 at 2:20=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> =
wrote:
> > > > Enable the APB bus clock before the SPDIF module clock
> > > > during runtime resume, as register accesses depend on the
> > > > bus clock being enabled first.
> > >
> > > That does not even matter here. Access will only happen once the runt=
ime
> > > PM callbacks return.
> > >
> >
> > I understand your point that =E2=81=A0sun4i-spdif=E2=81=A0 doesn't imme=
diately access
> > registers within the current =E2=81=A0runtime_resume=E2=81=A0 path, so =
the order might
> > not trigger a failure right now.
> >
> > However, if we look at the peer driver for the same Sunxi SoC family,
> > =E2=81=A0sun4i-i2s.c=E2=81=A0:
> > Links:
> > https://elixir.bootlin.com/linux/v7.0-rc5/source/sound/soc/sunxi/sun4i-=
i2s.c#L1296
> > In =E2=81=A0sun4i_i2s_runtime_resume()=E2=81=A0, the sequence is strict=
ly enforced as:
> >
> > 1. Enable bus clock
> > 2. Access and restore/sync I2S registers
> > 3. Enable module clock
> >
> > Since both IP blocks belong to the same Sunxi platform and share simila=
r
> > bus/module clock relationships, shouldn't we maintain architectural
> > consistency across these drivers?
> >
> > Enforcing the "bus clock before module clock" order keeps the dependenc=
y
> > ordering aligned with the actual hardware roles, where the bus clock is
> > required for register access while the module clock drives the function=
al
> > audio path.
> >
> > Wouldn't keeping this order also make the runtime PM behavior more
> > consistent and easier to follow across the Sunxi audio drivers?
>
> This should be your primary motivation for the patch, i.e. what you
> put in the commit message as the reason for this patch. What you
> currently have doesn't make sense, as I already mentioned.
>
> Some background though, sunxi is done mostly by volunteers, so we're
> not overly concerned with rigidness or aligning different drivers,
> unless they share a common library, such as all the clk or pinctrl
> drivers.

Oh, and you could also add that the resume order should (normally) be
the reverse of the suspend order.

ChenYu
