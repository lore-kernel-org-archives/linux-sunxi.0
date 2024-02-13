Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBA558AB4
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Feb 2024 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707838004; cv=none; b=UgP4oahzjwt2dfP5EHppVP3R2ZgOddnf/UOu2QhegOZD1uSIfHQvLkGtTc/KPsd2L4wV2TNrcPT5AduQecSa3Pk1QwruRvlrUfKbndtOUYBc6D4tgN63xMtPo6O32fETSK1v3YiYN1evBGYuTVG+TSjTeC1aClrxYNraon+z9uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707838004; c=relaxed/simple;
	bh=BvPgZ+dKvTPbLnx9uYUjOST7fIy0URICxrmEvH+D5qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOXF8UxpzKt3uG/SNlrV3o/FCdbXp1tyZw9urqSQrtecA4YszP07qqgw2y08dTEb98o2kjEM8GTmZVL0HZhAqJTA+rPOITuWNVlisw9lsnk6/1UUPsrd/SgGtR2t1xc8Ns7e5NTYrEuovK7w2AQBilgy8zGxLueOENJd/AR532k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNDgKclX; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNDgKclX"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5d3907ff128so3575867a12.3
        for <linux-sunxi@lists.linux.dev>; Tue, 13 Feb 2024 07:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707838002; x=1708442802; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+GIHngw2Uv/9x1adyo14J65FsyM0q1LqEDIZ2pVeC/E=;
        b=CNDgKclXMVs1o79SQHsFB4hEJPyeMipE3VCAO0b8Msbu8wNwQYsdsb2nwHcwHLpQL8
         S/LFUR/EsAYRmVwZ8Zmz/gIvioUGigEFHUUv6jysxnJx+A82bELTevdDpqxVXJ5vwxse
         RTIvzqnzdzYKSLVLU4rMIqgjk1ZFV5vYX2eXB0T2SETUZNrSbdlBmUfiY/ycEgIxkFK9
         uh7l1OxV2CP0GTuyS84XB86Gysqa4DrZ7rBSD4GJbHuBAnRBfv/ZsWaRgRLzIcdQ92/m
         mRUzDTYJWX5lYob/HAD5rD9hNePTSPyhMpzWgeIWAD2OZyXivTd3ECGy5WMoABvhwHk3
         YUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707838002; x=1708442802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GIHngw2Uv/9x1adyo14J65FsyM0q1LqEDIZ2pVeC/E=;
        b=LTRT1lZP0BK6Hl5jTBUr+QiI7DqZ7M0VbrarND5Xkwd2ymhw6C9fS1S3hiSI8y2+9s
         1e+P/kqKGMj+Sx8hpWB1yEpscjIkLg/6DYf52sECyCjnPQSEfLRbA16yjGo6belQdEa5
         XSfT2MOhOjB/QDwBQlHdBt6sihgwC4W9CVsDMpEbmEvh9iGlpD3YuhQab3W5CXfEBNY3
         3cKSlHllrhBJi7ovEqXg8jyzf1QvpBp4ys2j+lXpyvkF4un1E4fE9XXzAh0YtEz4UTFP
         9QZ+k2Rn3Lif6O3EYa0eycfYT5peN1X9L+QBduqE9IzcKPHHjqLYKXtsph4HakqhDoED
         oKPg==
X-Forwarded-Encrypted: i=1; AJvYcCUA0m6T44m9puuT6CAP1qfp3k2bCE31jHVrovcEZT/8X8/kL2raPfqoQgcIQdWEUhYjV+cvoO756XhMGQfgsPUfFHM8fIryazrHvWc=
X-Gm-Message-State: AOJu0Yw6yxhm3XE+IPeX+s5iOg2AYwrPYHyPxi8VJ6yUVBzSjheuoRyJ
	Cw1rkTHhRDTDjICzTS0MFfWhyna34BqSvBZpOsTmpRZoVpufEpoU
X-Google-Smtp-Source: AGHT+IG0HcXD1rWo9g1JLTi5S5Xtb+Kag9Ao9jEu8Uy7TWW+NEyts0jd9VKEPbyr2WgtQsV6DxPe7g==
X-Received: by 2002:a17:902:eb8e:b0:1d9:9774:7e8a with SMTP id q14-20020a170902eb8e00b001d997747e8amr11805935plg.24.1707838002213;
        Tue, 13 Feb 2024 07:26:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVENJMIdmgJ8B933ISdsKbYjSLSNNiJw9hRe426uNo1XtrsNmNeodhN0qpObJ9NtQYV8RwRej3RqLjlxrzZrqvl6mgt12eP47Ur35tp8EEFEMuphG8QUquIDvA6DArx4d8okDMx21Zo1jOE2JyD0v7LMCReLjU1FW44uWoIu79wqMcAaH+s19tj/EcYHeKRbWHQLe0ddUzSfbl4BIgsajpcykzny1W0qAbTQTFpJ/H3lC9O9PMAP0SEex1On9fqmseZhA7X4WOqTZgifMndJ4gS7Z/jxzKtqL3ikJZ5CW6tLGfMLV/a5vpXxu9bwsxXAdezF7dte4z8rYwH8lsZy7r9/sfd4Bj+l06636KbC028E2hT32G0JPmtTjzEF3rgx41mpDYjsWQFa7d98IDuFjTp3dhtZuXbzh9/u8T5AooeQU20qGyr0fXhczSigKglRJTjwc+zX0JwWnCzFs6GUZQBeDDxx+xuXsvk9PVwysfucCCwRKgR+FLwVWJIQJj0iDhobkEsSUnGQTXMAvlL2pS5+HnhVX7ij2Na6RBsXYTdPgFrPVzFT4+Z6CUIPJ5+zZkaPE3FBbzZyR5qvn6IMhUJIeQpdmmbXnBeUHr2pCjmL+Ssr/kqAHnvv3cjy8lXjKjMVbTUZoWsAU5jZ+wTj4uytdeTnHgLUNrL0plApt+l
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o8-20020a17090323c800b001d78a08e8e7sm2213947plh.250.2024.02.13.07.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 07:26:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 13 Feb 2024 07:26:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eric Dumazet <edumazet@google.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Petr Tesarik <petr@tesarici.cz>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	Marc Haber <mh+netdev@zugschlus.de>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH net v3] net: stmmac: protect updates of 64-bit statistics
 counters
Message-ID: <20d94512-c4f2-49f7-ac97-846dc24a6730@roeck-us.net>
References: <20240203190927.19669-1-petr@tesarici.cz>
 <ea1567d9-ce66-45e6-8168-ac40a47d1821@roeck-us.net>
 <Zct5qJcZw0YKx54r@xhacker>
 <CANn89i+4tVWezqr=BYZ5AF=9EgV2EPqhdHun=u=ga32CEJ4BXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89i+4tVWezqr=BYZ5AF=9EgV2EPqhdHun=u=ga32CEJ4BXQ@mail.gmail.com>

On Tue, Feb 13, 2024 at 03:51:35PM +0100, Eric Dumazet wrote:
> On Tue, Feb 13, 2024 at 3:29 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > On Sun, Feb 11, 2024 at 08:30:21PM -0800, Guenter Roeck wrote:
> > > Hi,
> > >
> > > On Sat, Feb 03, 2024 at 08:09:27PM +0100, Petr Tesarik wrote:
> > > > As explained by a comment in <linux/u64_stats_sync.h>, write side of struct
> > > > u64_stats_sync must ensure mutual exclusion, or one seqcount update could
> > > > be lost on 32-bit platforms, thus blocking readers forever. Such lockups
> > > > have been observed in real world after stmmac_xmit() on one CPU raced with
> > > > stmmac_napi_poll_tx() on another CPU.
> > > >
> > > > To fix the issue without introducing a new lock, split the statics into
> > > > three parts:
> > > >
> > > > 1. fields updated only under the tx queue lock,
> > > > 2. fields updated only during NAPI poll,
> > > > 3. fields updated only from interrupt context,
> > > >
> > > > Updates to fields in the first two groups are already serialized through
> > > > other locks. It is sufficient to split the existing struct u64_stats_sync
> > > > so that each group has its own.
> > > >
> > > > Note that tx_set_ic_bit is updated from both contexts. Split this counter
> > > > so that each context gets its own, and calculate their sum to get the total
> > > > value in stmmac_get_ethtool_stats().
> > > >
> > > > For the third group, multiple interrupts may be processed by different CPUs
> > > > at the same time, but interrupts on the same CPU will not nest. Move fields
> > > > from this group to a newly created per-cpu struct stmmac_pcpu_stats.
> > > >
> > > > Fixes: 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics where necessary")
> > > > Link: https://lore.kernel.org/netdev/Za173PhviYg-1qIn@torres.zugschlus.de/t/
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Petr Tesarik <petr@tesarici.cz>
> > >
> > > This patch results in a lockdep splat. Backtrace and bisect results attached.
> > >
> > > Guenter
> > >
> > > ---
> > > [   33.736728] ================================
> > > [   33.736805] WARNING: inconsistent lock state
> > > [   33.736953] 6.8.0-rc4 #1 Tainted: G                 N
> > > [   33.737080] --------------------------------
> > > [   33.737155] inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
> > > [   33.737309] kworker/0:2/39 [HC1[1]:SC0[2]:HE0:SE0] takes:
> > > [   33.737459] ef792074 (&syncp->seq#2){?...}-{0:0}, at: sun8i_dwmac_dma_interrupt+0x9c/0x28c
> > > [   33.738206] {HARDIRQ-ON-W} state was registered at:
> > > [   33.738318]   lock_acquire+0x11c/0x368
> > > [   33.738431]   __u64_stats_update_begin+0x104/0x1ac
> > > [   33.738525]   stmmac_xmit+0x4d0/0xc58
> >
> > interesting lockdep splat...
> > stmmac_xmit() operates on txq_stats->q_syncp, while the
> > sun8i_dwmac_dma_interrupt() operates on pcpu's priv->xstats.pcpu_stats
> > they are different syncp. so how does lockdep splat happen.
> 
> Right, I do not see anything obvious yet.

Wild guess: I think it maybe saying that due to

	inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.

the critical code may somehow be interrupted and, while handling the
interrupt, try to acquire the same lock again.

Guenter
