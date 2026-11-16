Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794796117;
	b=Qv66JzlGgZ160JN+ZtopiC9a4uDR+YENbqZJik6m4SLF7JJlFDQ5P8cfP3tqAi1w91Xd
	 dIqp2y1tCcpYoF4fglm1gtZN7PEburKG+N349KITqLp2uR95TcOJ/5ZTj18wiuVP7Gu2b
	 Nw3SXfNTmHVrEcWaOVmIdd4qdGBIfreqd59vMF5UD0T6xEtDinp8GXFzyWbkv5mgfrcCu
	 kkH+FHbdau+MfZ560qWyydJlCHKP++JLPgKNCPgDkCuMi3JPVXlbsbn1HU4Zaeo1sEVNj
	 6XPZ/ydSpb/+jbB0pr0YSZs0bqAfU+lQAFtrhCiA2EJfxJAZ6Ufy8GruXBHyCdFfxNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
	b=04F25SHbIcvKXLKksZgdqLEpG1C7FUh6cFLKjOVX2e5H045NcH8UyR90Ap0R6UufS+F4
	 MoA7R07xWlCSTgiQIDQo1jS9PHiln94gVwXBdKhCmFHA5l48L22KioJUEg7J00qItGw8p
	 1tc/bAV+JC2RntlcEcMuCrBvdzSfVpSeDz3m5a6ZjEtkW9voxWq4xfAtwYqdLGSxK/oZh
	 RwC0nfGZu7wGBPADBqOI4SFz39Xt+lT3C0BynThRylClIiJiRlCElBNX5Dk3a5Rzg3yN1
	 9QEAv5/KFFvex8UbiSIkdyN1gI6mmNZibirtXzv2TAzTQ1vbCNmrHCAKMNZ9WEkq8Nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0RVeKPRa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29E8606A31F
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 02:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C29E8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0RVeKPRa
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so4604764241.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 18:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794796115; cv=none;
        d=google.com; s=arc-20260327;
        b=GPluTEtD3pwyVSL+31o5qZ2YpCag8fMgSbN9afpjJ/1LJfgOkSfLzyPPg/VLGINj7b
         CQCoQOOkL3ZOhfyc3g4eAqsRymAvOOdVPf5vCUFA77ZiPhhX7T2CcE1rpNSf1PVpEb9Q
         k8mjnIDOm2tZzkQZnR2/MECRybQ9CWqhnStuMZ6aG8ISgKhajd4hC7DrQUIWlck5vVVE
         1Lle3XyCtLlkC/AwKJGPzReC6cMG4lhjg9C4F8ZmOoBJ2uIy4kJmJP4lYKMZ768e3rgO
         bRa6LCgnCSUjv1ZFKvsOhaID4weYrCKqjjN0zC2CwCTl/aqWOo/8V/iavDwxYd+eFrvz
         eZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
        fh=riXnkwm1eHV/A8up2WV1Yd7WJxrAMDWhpplQfmDuy6k=;
        b=LLuGxdijxNtN431tQJITPFX1vaeT5w4ZHWFWO62h7NmpsRThyNNvVRdHryjpvNDEA4
         SNpmzGN1qkHya9LHBr+g97mcjG+COaFxMDuDYMljfkFQK5vwjNmhqIeTku8t0isT6lqz
         uOHNvJXKWTyLnzNamA33q750lUfT5rrYojpqpWvQdR12CjGGOAECq73qZUqJuS0irbio
         HGKivOKZqD3yO+PU8kKQW2C0JmJtA+EXrSWjaCnxdZx8xT3PmeAZhzXtm6Jj2Ry6JwCL
         bNzsZJF2KIZ2WbWZNW1/tLIcuS1zSvNaga7xiNGoqhHiuR+EtPDqsZdA0xUahjkgtwUp
         3QMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794796115; x=1795400915; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
        b=0RVeKPRauYJGZZ1O31KwP/1QhPTnOgdV1YWsBp65Rg0FKb17FzGzDziUaoJpOQ861B
         C5d/666gSsFSpz7HpIfSNgK26F5yV1oO6LHouNEN7rFaK1NdOZrR5MHj05FHh6ENykjg
         /caZ6ieiStzAELgSjaQ6YPohyA01Abx7QQ2IKZhTR/XY2AyFhL2T2xj+gR0xrBQkGUvc
         Aepdh8lkDn2MXVzheW8/KZgdWQfNkAkIvMC0yTJHpa8vHjhrtqH2LA+1Lfv1hmdf7WUz
         7SHgry6GzReOTtooV8Pl5tkxJrvChBCnJlKxcQjQVkd8XwPlqpSOwbkN6aRr64SxbJkk
         b/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796115; x=1795400915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
        b=odzBgJP4/AmIdnRcXVs5rcCJzs/l6dS2rRjut7UBU0PPzeGCmOpG2zVHLUc7aNma6Y
         qG1TuTao9vLUerZK2eqn53edWClV3kHAr1C0gKsnxo3gSlbL61EVkqUJ8twNUuIG3EKs
         +3/ZgRjyNz5z5ZHqB0nkjCQsNawvcMKhhv+Drusx1eoZZx/eiml+6hi9NEcnv30FZxPH
         B6cEqM1Y1ltYVOXAXHn+j66ERXjP2O4WhJS6TOaqsoaf04AgJtNHRU3H3npf1eOREXQY
         cP1m7ScX7xoG+7Xru4/pAI47QH0TAJ6G9qN0uIhcPOt9yDXUDMkDzkKllxO41zjDpTkU
         hO9Q==
X-Forwarded-Encrypted: i=1; AL+hErH+SDp8R1u6e289J96OTjqzgheyrDONGoid/gZpCYH99RoY3nVW4+sb3Auzv+OInkl41L5kwB8KioOf9Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z97GZ84CF8qhn539cxN0cxZO/WvPZ9x77dRMT8kTT9lcM5LLOmf
	Ebg3QkJ7pRHQ4WF6GPTBDLZ8aswL94xoqEi9oAoaw/v4m2iz4z/BXrm5h1kJ13+RJd5rzSTCkpb
	bwuIfMaqRHojjve7lclR0GEryfgePv0c=
X-Gm-Gg: AYBFou3Xm86NHMHQNd4PC94LQbQQn/bBQNlrX/AUPMwoy4R9NJ49C5y+Q3SwY2ncYMQ
	hHSzbXnIQcZESAZM7aIsfJFGs5oNbCSuBlXk1dkMJCCUQw2INYZXUmvihBD/lO2l5h5dxIgnHpI
	tD3OKivEP7xll4wvizK9+Qby9I7GUMnVl8kvAMPG6zQqlua/1ua7R7DS0+WJt0BnFkFEKFpxKn9
	SAAJAIIZhwSfskDuuc0Ox2b1GFQbcTCun//tYyz2q/q/ohetDeFY9XsHesyHVwVwj9/GSEHnr9Q
	hmTYF/bKG5bgK+eK3v8/OQBx33T6A3zBjvFHvqD06HV7LK54PA72m0IUqq40G7aRqehCwLqqrA9
	uWbxq0yZFuLyvuGqA7GOqVwd/T3/h+WtY2m0MEryEXiKpGCErbbdquzGA6oS87d2TOoEAD4hoKd
	2qwz+pu3k1bsfqs9z1+Rw18v3Pe+xqo3Lvu0aIExmHJSXY7sp2QaRsmU4GUVfpUOgboUWmOCXEO
	4w8LIkeBgrORYcohkyDZkb2CAogeUbn1FkXwF5cJGNTFKaGvKs=
X-Received: by 2002:a05:6102:6a92:b0:7c3:874d:60bb with SMTP id
 ada2fe7eead31-7d64d6c4928mr2278451137.5.1794796115630; Sun, 15 Nov 2026
 18:28:35 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <179479100276.3291.7162632058743254408@kernel.org> <CADvTj4rK0Ew7WDKoxmYhf1FMKx-xZwkhAKc-ABJ3EmOkaSHLPg@mail.gmail.com>
In-Reply-To: <CADvTj4rK0Ew7WDKoxmYhf1FMKx-xZwkhAKc-ABJ3EmOkaSHLPg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 19:28:24 -0700
X-Gm-Features: Aa3M54oIQfFIPxOH03SzX-2akhqZowcy4hsXJL6cGaB7t5DHcgJ3SVo0-C72FkU
Message-ID: <CADvTj4pV02w3pQeeVH11L-HOTaEbc-1jE+ErF+z4zU0QRfANUg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:19=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Sun, Nov 15, 2026 at 6:03=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wro=
te:
> >
> > Hi!
> >
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> >
> >  - How the issue was discovered, e.g. hit in production, hit during
> >    development, syzbot report, manual code inspection, LLM or static
> >    analysis tool scan.
>
> This was found while investigating RX checksum offload behavior on
> H616 and reviewing the shared setup and feature-filtering paths.
>
> >
> >  - Whether the issue was actually triggered, or is only theoretical
> >    (e.g. found by LLM and not proven at runtime). If it was triggered
> >    please include the symptoms, like the stack trace or kernel messages=
.
>
> The capability loss was reproduced in a source-extracted test using the
> actual GMAC, GMAC4 and XGMAC checksum callbacks with mocked MMIO and the
> relevant setup and feature-filtering logic.

I mixed up the two threads. That explanation belongs to the
separate checksum-capability fix [0].

For this sun8i patch, the issue was found and reproduced during MAC/PHY
receive testing on an Allwinner H616 board with an AC200 PHY. Even after
ethtool reported RX checksumming disabled, EMAC_RX_DO_CRC remained set
and the hardware kept dropping packets with invalid IP or transport
checksums before they reached an RX descriptor.

With the fix, disabling offload cleared that bit. In steady-state tests,
those packets then reached the host and were rejected by software
checksum validation. Valid traffic continued to work, and Ethernet FCS
rejection remained active.

[0] https://lore.kernel.org/r/20261115-submit-stmmac-rx-checksum-capability=
-v1-v1-1-ea26fa3689be@gmail.com/

>
> With the original code, disabling offload and following the reopen path
> clears plat->rx_coe. The feature filter then prevents offload from being
> enabled again. With the patch, the saved capability survives that
> sequence. A requested enable that fails hardware readback still clears
> the capability.
>
> >
> >  - What hardware the change was tested on. For driver fixes please
> >    mention the device (and if relevant firmware version) used for
> >    testing, or say that the change was not tested on real hardware.
>
> Tested on an Allwinner H616 board with an AC200 PHY.
>
> >
> > Please do not repost the series just to address the above. Instead,
> > reply to this email with the missing information, so that reviewers
> > can take it into account.
> >
> > *IMPORTANT*: If you do repost (for other reasons) - please include
> > the relevant info in the cover letter or commit messages.
> > --
> > The evaluation is done by an LLM so it may be wrong, if you think
> > that is the case please reply and explain.
