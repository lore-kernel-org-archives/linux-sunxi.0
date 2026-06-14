Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1983C37AF
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Jun 2026 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781444169; cv=none; b=Krrqwr+/wOUtqcHgjrCDYFCwUJ1B/H5poy5fEqZrg6SCzLJrapvn2tjrvShKm1Bf7e/HaNN7LPzQAcvwz3GoOaiQ2YKES1R+BL8iLrONuSofwl+TCa59ejz8AY7BMqCm58ISb/8WhKCKMSHDJwrYHmH8j9Rl8LPWlIyIeP+b7FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781444169; c=relaxed/simple;
	bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dDvHRKPA3ZJfG6BddTRV1AAfVSMNJlTxNO7TjcYyoQ51jFS3UpmMuLWbAemnA++m8/fL3qKHPbRIVwXSWxJufqPK5WkFX/NkkIb2AxUJS7fmuRIgq0109Mcg50ORHypSqJojkjEHdbJJ6lWgtFLvtEvVyujHYe4zVUtDX3ydujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6PgiTFE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6PgiTFE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso18335235e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Jun 2026 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781444166; x=1782048966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
        b=p6PgiTFERR9VB9pzgIzLaJu3Zg28umdJu2pdXgAA0NYyBdHBQzxGK13MEmrE0OXoI1
         EWp7FafNEkFiPErmOjZ/ZpNXVOSqspTrZs9AnZjQ4rFetF0LYsnDNC5+JKZpPcOmP7mL
         /ibC3MKAP1Ge0O4hR7K8JT4bRWI/XdKdqRClZaUhEVVblVffCeXZ+ZoL0hS2eMneFwYU
         IIvCaGCCBY0+RJLoLHTu/ukH/JTd8Da4dxXWy1+x/z1EKz2vz5yzNJjQymB9rJE3xlFL
         2xTid7tqrKDDqUzJRqKkOLX9ig5iRXbuZmrX6ZXs8BhBs+9Kp8eFyfZqht92YJAyDqYT
         fi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781444166; x=1782048966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
        b=Q3314Fs8p64r0HhymzVzGQDqXSNH8r14rW0BdQ5d6/5T1URLbuIzp2hq0VaYu/qeDv
         aUQUFP0u88TfltGg/hd89tkUTmHCqJP6wRd/46z53tFuixXHAFluIgquDgj9vCyJmZct
         E1oXCH0cmdzPqv9fukY/a3yN/BsCEcOS7cvZcHAIAwebfTnY8UsCBgGGK6hJYbr5f2BL
         2r9hKchMCM+n3oseBvR0PY5PCPXsq/OsHZ8JSqIi9gWPkYsS+ScYQFUpBjZ1r/nD1xJV
         6lolU9dPf6xf4Utm+1airLNjsJL0WPQ5e20YihK98M2IF/Fyp03Oupc35M2LCNflhOai
         wYCw==
X-Forwarded-Encrypted: i=1; AFNElJ9rcsMsjgiyQdBvpGsCrqmmPg2io4IOPbYI9d9O3nl4EegbylhX4FA3zOh2WGllO3w53XTAqSpoMxcGGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ8WXQG28IAAKB5NICjjlPdWNxj13KAYD+EO23fvd6OmpcKR4g
	gj3+f/sgzF9Ew3EXNT1AB0peLp9GndiSKCW9CM22JMfV+e1SidSissai
X-Gm-Gg: Acq92OHkyUNMlTUDm1A684K0RZvVfZsL34GMeEg1htQoezboDL/zKJNzoP41MUX5Rk3
	BUVSiuskjqGBWWY0bnPjZhAig328t6pG0Gy5/KU1g4hAfz22+ZEafsdVrhnCqgJ0fpEI0ZbPUlJ
	0yp2cWM/3UwJDC+ssjDGpWIOmRqQYJWMzfzpsVA6kMa7a3kmwSpzU/p6Mmbx3NWTbOQMXAKRYL8
	IdZWsKLTn3mecrTbdXHLe5op7hVizdnO1mRyFTc9clAKmgZOld1UdkZE8rLt9KM3+G/lpjqLOCq
	lahXigYHuSTAWPaZrEGQ1yEl6BAg9Fg1nueY5qaLQ5hSfEGOOs64DHRpKDsQ023emRm9pFRCKBk
	UMtTveUIKLDudnYla9eh5Kde2U2XdblW4VlzBpBFLMf4b07E7/a0COcPAoB6Fxa4z96ourjmls8
	5bCxcERnZLejCq2eJkjkJZJS2eaSPWJ70ao5uUF9gNOIdn
X-Received: by 2002:a05:600c:58d5:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490ec523a8amr94122335e9.34.1781444165973;
        Sun, 14 Jun 2026 06:36:05 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea9520f9sm148794265e9.1.2026.06.14.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:36:05 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Sun, 14 Jun 2026 15:36:03 +0200
Message-ID: <XYko-1bVTYuJiQeSr0cTOA@gmail.com>
In-Reply-To:
 <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
References:
 <20260505134812.408316-1-wens@kernel.org> <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
 <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. junij 2026 ob 16:34:00 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> On Sat, Jun 13, 2026 at 6:33=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne sobota, 30. maj 2026 ob 18:43:05 Srednjeevropski poletni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> > > On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.sk=
rabec@gmail.com> wrote:
> > > >
> > > > Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> > > > > The Allwinner H616 SoC has a video engine hardware block like the=
 one
> > > > > found on previous generations such as the H6. In addition to the
> > > > > currently supported features of the H6, it is also supposed to in=
clude
> > > >
> > > > Remove "supposed".
> > >
> > > I can't actually verify that, so "supposed" is accurate from my point=
 of
> > > view.
> >
> > Isn't info from manual good enough?
>=20
> The manual says the SoC supports it. Same was said for the H6. Then
> we discovered that the VP9 decoder was a separate Hantro block.
>=20
> So again, *I* cannot claim in the commit message that the hardware
> block supports VP9 decoding, because I have not verified it.
>=20
> > In the interest of unblocking this, I would be fine with "supposed" too,
> > but manual and all my experiments show VP9 is supported.
>=20
> Please give an ack or reviewed-by with a comment at the end stating
> VP9 verified.

Well, just go with original text.
=20
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
>=20
> Thanks
> ChenYu
>=20
>=20
> > Best regards,
> > Jernej
> >
> > >
> > > ChenYu
> > >
> > > > > a VP9 decoder. However software support for this is currently mis=
sing
> > > > > and still needs to be reverse engineered from the vendor BSP.
> > > > >
> > > > > Add the compatible for the H616 variant, using the H6 variant dat=
a.
> > > > >
> > > > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > > >
> > > > With that:
> > > > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > >
> > > > Best regards,
> > > > Jernej
> > > >
> > > >
> > >
> >
> >
> >
> >
> >
>=20




