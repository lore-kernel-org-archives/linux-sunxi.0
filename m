Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3476F5B04B
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Feb 2024 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707835913; cv=none; b=KtCUErAJ8Tq96ZDpvia3r4zHggLTBpeGEIrTt+RQcOafIBBvEJPJDyrhpejgDWNjE+mTU+g7QTLQpnVtfpGpyXruJallSe4q+FUyTw6CV80Muea3YeKIXu1dLf2djb7HUDhlYZi+dowMB7V2vB89z3h1POjMvsGmsfr31sv2gFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707835913; c=relaxed/simple;
	bh=RT+W1llQ2r6hGJ2t8R1MHmof1Jb0u4B+SyQ/6sc6Ooo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWzyhIS3RVdiMGTL1G3xS+78smmr0+MkweqTWYhC6aPF4pfib/hZgXOdcz+P9OR+vjikbur7l3uo1e64HAhAz2PML6gGGDJ0qSaejxK+us3xw7pTxCuw3wf4ccfm4V4Kb37QUPLR2E3VmMlIJ4vnKQ2Uipi0l1mfoHDxQXgPXXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2HWy8Tl5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2HWy8Tl5"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56037115bb8so10780a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 13 Feb 2024 06:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707835909; x=1708440709; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMWDpGfDclpJH/Ggj2FwXDcO3lILA0riLoFGeoe6y8s=;
        b=2HWy8Tl5PpC4Slf4f+mNd/BlUBom6gZhc7BaK5nOn3dS03uNLAVFqRAJFC9fvMJZbs
         j40233RTDjVNcnt8SZuhR1NJJ/2VUb+xQcPqZvgJPmxsy1whBJG7Kb4BWnFZwnW9pdKX
         LmXiYvaOjrKvtJjB4zXZHTd2I3XJtJvwSCu7EYcYUNPSAhuJRpF/elFCW+oPTUPZOg+X
         5pkGEQkMfp4ADEdWBfVzd0tukjDTP4y85iPc/Mo1mLUOs3fTStb54GEIy4DyZNbtgnUc
         D0ED2y15rbo4eDZMf6I1pjq0FAylqO+pP9QnWfMAkZKgbbYjCEAolc0OXLFCC7ysEMzp
         hfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707835909; x=1708440709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMWDpGfDclpJH/Ggj2FwXDcO3lILA0riLoFGeoe6y8s=;
        b=CW4X3u6FlvqdEHCBg+JTdVZ4ioq7QVcryVRFfE9Qm6zDyiw9mL8kZ4SPT+gRX/m0Yw
         QofLHnV8lhIKTPyZLKiQRsmI8qs7y+SqblyOvyfy4AS2ApgUr8ZGlM32F5fxAN2C3/6e
         BwoAPeLhRRg2sSD7jHTQVLUO+/5BWeMn6WCQPHTj/0NVWu7kWudPvNj5MSV2laKs74mN
         AMq+N9+q8+M9ipUCADcwtdWJD0IQKalB4+waYQ7sfgLyUGYqf1APClZuT6TgOMC49hHD
         6ETaqjvcD9MdHf0/VguHQmWtLFtVeQHTTaATiUqIcIIk+mPQs5TZV2OZSMbf2AuSxHFh
         qxIw==
X-Forwarded-Encrypted: i=1; AJvYcCUjhkOjCukpLq5IPZAuKJxygedh6cs7e3RUGrsStI6kiJj4qWlUJfe9KiyTp2rMxiVzQ1C4g5J/SpYefe+GH/0PH1HLO4ko2rq+nUM=
X-Gm-Message-State: AOJu0Yz+/4tXhOijp0DJYj15fkXNk6B4hzZ1D2riliSNxcNIrr2zqwUL
	jdnwa0EBY7a1JXo4Q481x5CnbmreBLFD5BwHqUWWcA/YRkfXGjs7xDIQ5i0iNqYyBrkkejCQ4Lf
	rKmBnYMseCGuu03jxYgM75RbUMtZiOkrSkZGZ
X-Google-Smtp-Source: AGHT+IGfqYACGEjUOI7V/Rpir4fZ5TMPFFsY+2iSCEWPhBFRoQxs5ewCRgGTA1Fws5XWHQJLWgigu9RN1cYbpTwOfTE=
X-Received: by 2002:a50:d581:0:b0:562:deb:df00 with SMTP id
 v1-20020a50d581000000b005620debdf00mr47709edi.4.1707835909232; Tue, 13 Feb
 2024 06:51:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240203190927.19669-1-petr@tesarici.cz> <ea1567d9-ce66-45e6-8168-ac40a47d1821@roeck-us.net>
 <Zct5qJcZw0YKx54r@xhacker>
In-Reply-To: <Zct5qJcZw0YKx54r@xhacker>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 13 Feb 2024 15:51:35 +0100
Message-ID: <CANn89i+4tVWezqr=BYZ5AF=9EgV2EPqhdHun=u=ga32CEJ4BXQ@mail.gmail.com>
Subject: Re: [PATCH net v3] net: stmmac: protect updates of 64-bit statistics counters
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Petr Tesarik <petr@tesarici.cz>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, Marc Haber <mh+netdev@zugschlus.de>, 
	Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 3:29=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> On Sun, Feb 11, 2024 at 08:30:21PM -0800, Guenter Roeck wrote:
> > Hi,
> >
> > On Sat, Feb 03, 2024 at 08:09:27PM +0100, Petr Tesarik wrote:
> > > As explained by a comment in <linux/u64_stats_sync.h>, write side of =
struct
> > > u64_stats_sync must ensure mutual exclusion, or one seqcount update c=
ould
> > > be lost on 32-bit platforms, thus blocking readers forever. Such lock=
ups
> > > have been observed in real world after stmmac_xmit() on one CPU raced=
 with
> > > stmmac_napi_poll_tx() on another CPU.
> > >
> > > To fix the issue without introducing a new lock, split the statics in=
to
> > > three parts:
> > >
> > > 1. fields updated only under the tx queue lock,
> > > 2. fields updated only during NAPI poll,
> > > 3. fields updated only from interrupt context,
> > >
> > > Updates to fields in the first two groups are already serialized thro=
ugh
> > > other locks. It is sufficient to split the existing struct u64_stats_=
sync
> > > so that each group has its own.
> > >
> > > Note that tx_set_ic_bit is updated from both contexts. Split this cou=
nter
> > > so that each context gets its own, and calculate their sum to get the=
 total
> > > value in stmmac_get_ethtool_stats().
> > >
> > > For the third group, multiple interrupts may be processed by differen=
t CPUs
> > > at the same time, but interrupts on the same CPU will not nest. Move =
fields
> > > from this group to a newly created per-cpu struct stmmac_pcpu_stats.
> > >
> > > Fixes: 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics wh=
ere necessary")
> > > Link: https://lore.kernel.org/netdev/Za173PhviYg-1qIn@torres.zugschlu=
s.de/t/
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Petr Tesarik <petr@tesarici.cz>
> >
> > This patch results in a lockdep splat. Backtrace and bisect results att=
ached.
> >
> > Guenter
> >
> > ---
> > [   33.736728] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [   33.736805] WARNING: inconsistent lock state
> > [   33.736953] 6.8.0-rc4 #1 Tainted: G                 N
> > [   33.737080] --------------------------------
> > [   33.737155] inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
> > [   33.737309] kworker/0:2/39 [HC1[1]:SC0[2]:HE0:SE0] takes:
> > [   33.737459] ef792074 (&syncp->seq#2){?...}-{0:0}, at: sun8i_dwmac_dm=
a_interrupt+0x9c/0x28c
> > [   33.738206] {HARDIRQ-ON-W} state was registered at:
> > [   33.738318]   lock_acquire+0x11c/0x368
> > [   33.738431]   __u64_stats_update_begin+0x104/0x1ac
> > [   33.738525]   stmmac_xmit+0x4d0/0xc58
>
> interesting lockdep splat...
> stmmac_xmit() operates on txq_stats->q_syncp, while the
> sun8i_dwmac_dma_interrupt() operates on pcpu's priv->xstats.pcpu_stats
> they are different syncp. so how does lockdep splat happen.

Right, I do not see anything obvious yet.
