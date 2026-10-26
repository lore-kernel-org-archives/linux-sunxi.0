Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793042548;
	b=dD7LhkJqYTXP0VKBV5VgrDjnOvk67FoPcVuYj6gBk8SmXJG8iOtXZpjM5y4tfcjALlOo
	 WrRC9I7WpbJNB+/HhUGKp+YRqdFWdriDWyfuWImDKOuDMRlRMprMjxtsCeAGYPLXOGaAV
	 g79e/idUnMPRnBrgbLJxfEwCqSKeT0R++kgq/BZwzQYj1/CKQpy29/xkKHjvNSOPWNhDz
	 FETM5FNwcKCiKD+8kQ8xDcvdm2EX1WGq+bR9NrmoJA3dlrQ7D/PkUOCbhQWNBSR5yn9ft
	 rOAI2pq0cAXnty2kJ8qYAXekNPYfneWH3ZCJzv8JqXDPCQBTVu1BvISen0kfm8Tblog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
	b=kRBMIp7QMUKItGY4hyI5ojqCCBRpFkNhDz3qVZ2FaCF/ErxhqMQ2zNtQBTYNWVuIkRpJ
	 VfpOQc20jF2twVjSSGO8gUXQLb1JGQibgrPShcDIO5/g+rASvSVaYqq2UhLcaFHgdM0aW
	 1q9CyuCgKQMSYH9ifsK6TCpbprhaCs8u5SD9hrRgyuzOMwHi+YLvYfAKS4jcL9qtJVNyi
	 vq6SbmCiALYno2LLLA5ekBfzj+XHElhoBIsbfR7ehGlcQUqecjOK81EOL5ro3srTmA7Xn
	 Y0MVVsGzxt/oljySYjV+5/kDkuyCzDeq6JtX8GxzaLJATaCV09Bj1jpN7wq/n5xU6Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jy4djcBc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB431606A31D
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 19:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB431606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jy4djcBc
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ea1e7fad99so17535775ad.1
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 12:22:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793042547; cv=none;
        d=google.com; s=arc-20260327;
        b=kcYAdt0egKUUKbQgXNyhKv4oEBh1C1A4mbruRP/BTTgfxxxRpISDPhLudw+e2ZUQir
         g4Po3mCsOl5T2n1/G+5aKek4d2QbL3hSlEZKgMh/0X3vIASY0d1++fR9+a8fN1P5oPfs
         M86/CQCoWv/CXnUaMCna8iVofu85+I2dfQBDA5WBPQJt0UbMnphuPumzxfn3OtiJNjfm
         nsAjY/DWN0LC9xPrc+Mo8M2YpAECEX4scSTI9afi0Aip33noak/bYh4Do90JAhzJeAop
         SfhF5c+8OInTgIuSERY8cq6OMg34ZbgdKhZnaBe2U4hp60e1u3HwsJr/XxZvL0jwdJca
         6BSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        fh=DKSmjcHl1zxVz98vqhi+azCKZFwrxJFfoSY1Qv/ylgY=;
        b=peyvblwfoNOWt3NaFSKuC0shNyaSP7XyI05maZs80RXB75U9AK//42r2x/1Ds2NDkw
         jh8O1/lxbJoHc3udCRgHZxCzsp3bFGxQ2AfrEud17l5myyddbR0op2zq+lvstIgGzdq2
         wiZmmAJs9unRdFcawsufRq2kQx/uIrU3LWMlP9pYeFxYZVl5vg6R8rVOohhO/tw5GrOO
         XUrK5KXZOo1oSfQyoJH6GzMWkYkBFRbXw2UUMy04ZHOAYejgqmrOCfeGKZ7NhdF8PIRc
         4oGxEEcq1RfXs/OcWuxWkkjfVNq5O8+tIk2eObdlFuytH++Mvmk8I4vkt7QEdMMXybu2
         9Mmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042547; x=1793647347; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        b=jy4djcBctk2HsWaiSlM9nvMmrVXPg7pf8IF/V6ZQlacoygjuEwQXrmq7YFBg8IlltC
         +1F9wJnhmtmY+DkdgO/hWJy5wabLbZTkT1iOFlW7BH0AGT9FtRIkR2uPuPi7FRAkvanG
         Bnaod0gj2Vu5SbkMXbc2ZSXH++xi7A9o4tezToGsE9U33ojOBJIczw5/+N2OQXbwg3M2
         e+xyoSdmc8FrjtP+Jpi1bDxpCuBqviwNAX2m8K25/pIIsCFhhAY6sV9jzr3t6Wm8sxsL
         pOYaIBh7JOoTexTwj5lAbtJEslgiCkkXAfoFM2dn3LPuENgRotiApaaCBKrrImi64HRZ
         NhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042547; x=1793647347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        b=Umthh62BmySAn/IFkOlTBZ6OQItyR3RxoQsPRBx5bkZ8GP84NszPALa5M9qjLTgd5w
         5ye4uhU+1O8lAZYY8gucpKYw1eOuQOrJvoAZgmjG+qMnBj6rc+5880WHSXdRPFUnv3/S
         l6gwUefnBaM7P2f9Os6DsYVd6EY6u4kiXyms8phXW7MWY9y9R0U9r3i8BDfW+YNovape
         b1EhzcLBlDEYQQ6haPxac66OaEUJ/T/Jz/GHNlMsPwYGiHvkctvpTDJ7pzumpPZ1sp3s
         9b051E5dG2JY/zdlA7iaZq16O4vB4wmlrSEv40zZaaQ4Zbxdx2q6qmT6SCsoXuB4UUcx
         Hr9w==
X-Forwarded-Encrypted: i=1; AKwUvByoatm70kFPkE1BVoC1TWfAlcQ4Xw1WWGfkgcLukaIrYyqkv9izY1VCwh7OG6kuQcm5QxFbsLmRO9iupA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKZdA9Y8uWczpPLHFwhTouDl0MLIXstjE5osoVAZsS8hyJbXOVs
	szDteQNDVUYeP47sOP/BqwS+0ZLqKS0bhB9mDRCbAgDqECiCFJVW4wq0PkzVqPwisVBJ3ZhJSME
	hiGdjNksYifT9LS1h9HJARrDCmmpfVgA=
X-Gm-Gg: AYBFou2Vf78Xu3ehmJjLPcNCDZPECgaRFplvqe6Ya3sVhjRvUXBol0DPkx9S6o3HRnS
	fD96Xvdn4yGkmC5EOCbRKJ82O7stSRl7/QqM8fMHUl7UJbJiG5p7SmzxajUOjovrEtBOtEZEUv5
	EayZvs7LAyhn8KaKat/ZSDPWwhSOMTN1l0YGZHbCPWIDzLiMcGJD89zhnbriRY7BYFi2QywH67l
	eubKS5gnZkpbpqBUYu5G9KGV3BlcZBmmm3bZbLS0FWCMAsDKdU0ZDO7c79xSZYDM8kP2XBz898q
	DzDu4R12x/1gsVtDQAiRrMgURpBytvIrtVr+onr4C/jJz0Y6ACKrisL4B3LV+eCSIbOzaVJi7dd
	egl6onh6yY2fQZBCUuOdOTPpt1O2JB9ya3U7OEfXNi7Fbs+osXd5G
X-Received: by 2002:a17:902:ce8d:b0:2e5:a355:56e4 with SMTP id
 d9443c01a7336-2ea9c5e30a0mr60160345ad.11.1793042547045; Mon, 26 Oct 2026
 12:22:27 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025142412.112216-1-pmazzini@gmail.com> <474d4ed0-b011-49dd-853e-697448382a0e@arm.com>
In-Reply-To: <474d4ed0-b011-49dd-853e-697448382a0e@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 19:22:17 +0000
X-Gm-Features: AclHuK8V-ReT1uOg9VTcgyQYzBbm5tikcDUgJYabpKKgd9T74yNLPiBsMiogtYQ
Message-ID: <CAAxh=jupBYZsadg09ig1v+3OkfjLAf+Hd9NwoR_D=te9XKxkTw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: sunxi: number the IRQ banks from the
 first one that has IRQs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Thanks, understood. I will wait for proper reviews and for -rc1 before
posting again.

Pablo

On Mon, Oct 26, 2026 at 4:42=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi Pablo,
>
> just some heads up about process:
> - Please do not repost that quickly! The kernel doc says to wait at
> least a day, but that's only the lower limit, in case the series is
> almost ready and there were only minor comments from real(!) reviewers.
> I would wait for a couple of days, after you got some proper reviews.
> The reason is that reviews (by humans) take time, and it's not like
> people are bored waiting for some patches to look at. So they might be
> interrupted by something or need to do some checks and research. It's
> pretty bad if their effort is ambushed by a new revision, which now
> means they need to start over.
> - Please do not repost just because Sashiko said something. Wait for a
> proper review. It's probably a good idea to acknowledge the comment, but
> don't just re-post then.
> - Try to avoid posting inside the merge window. Depending on the
> subsystem and maintainer, your posts might just be ignored, because they
> might be busy fixing up conflicts. But more importantly: you are missing
> the correct base: you should always base your patches on an -rc1, unless
> being told otherwise explicitly. And since -rc1 won't be out till
> Sunday, this is not a good timing.
>
> I will comment on the patch set separately.
>
> Cheers,
> Andre
>
>
> On 10/25/26 15:24, Pablo Mazzini wrote:
> > The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
> > none. The A523 got a DT interrupt for its unimplemented PA bank to work
> > around that, the A733 would need the same, and on both PK is written
> > past the end of irq_array.
> >
> > Number the IRQ banks like the static drivers do, with irq_bank_map for
> > the A523 and A733, and drop the PA interrupt from the binding and the
> > A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
> > made-up interrupt.
> >
> > v3:
> > - apply irq_bank_map to the A733 register layout too (Sashiko)
> >
> > v2:
> > - give the A523 and A733 an irq_bank_map, and drop the PA interrupt
> >    from the binding and the A523 DT
> >
> > Pablo Mazzini (3):
> >    pinctrl: sunxi: dt: number the IRQ banks from the first one that has
> >      IRQs
> >    dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented ban=
k
> >    arm64: dts: allwinner: a523: drop the PA GPIO interrupt
> >
> >   .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++---=
-
> >   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
> >   drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
> >   drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
> >   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++----=
-
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
> >   6 files changed, 17 insertions(+), 16 deletions(-)
> >
> >
> > base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
>
