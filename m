Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040361292FF
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Feb 2024 20:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708978091; cv=none; b=GfBPv9CSyl9TmwGImZaIUB0oROY4ArmUaSegO4EXiRPvTyRaJkaZjIRV07vcmknT9aX8x8KiCXh2XdiGMy7wlDdnYO8vM9J3ipYC7vwkSYqQs+36IZ963HPAplCQn4EBhMKbPW9OCSyrNLMhXhiIgXeuXH7m99smvh9aDzcLSM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708978091; c=relaxed/simple;
	bh=P8qiXwV5MVkQofH+MaxU2bpzvzo39pZRh7erGITANy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmiyH3zJbqFjcMNHkVtcQxSTnGg/FOIAIMBOwaKWdMEzmSicizGnrsW3gk1QsrsNBdKQuXv1cn1N9IGQLpVDQBnIc7EFaD9UpuOLQG4M/LSw/GiZRgiwRudAsLMMMSRlWPQN7PJiGOE4h44JhPaAJ5mLizYD2KfPGMYAhM9bELo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUGL2+WT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUGL2+WT"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-512aafb3ca8so3553049e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Feb 2024 12:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708978088; x=1709582888; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8qiXwV5MVkQofH+MaxU2bpzvzo39pZRh7erGITANy8=;
        b=BUGL2+WT2lTNGtgOl+2BCDVwnjNP4virX/UOzyQSwe+uXk5dC0PoF3HOAqJMniWxr0
         wQfC8FFVSxyvQ5Fc3yFkJWFPilUMdVbz1EVrl6u9D0ZefM/o8Pjc6h5tW3jdt5dF4kCq
         SqE/Fulv2r1VC4PwPNpzI5NvK/yJ3wP034Vm0dBUOZ4br5F5XbXwMmc3mCkSq4ZVLYUc
         4k9Qbc3+WELiqfxFGapnUANooR3yz/jJByoIi4+8/3KU/CBKXvTR5WkWMid/SNTT4BtW
         +oXfrQx3V61IDPcCAZCNiohfGivYDANSQkCoWcvgsoJ1lg9ZAqdI71BBsvbvEiS8sM8B
         XnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708978088; x=1709582888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8qiXwV5MVkQofH+MaxU2bpzvzo39pZRh7erGITANy8=;
        b=jskFvIhR7eeDFhnlIR93Xxpa3+lBxr9S6Mo4R8ha1/iLdppJkkVTj4idOITFMOFW6t
         ueuthyCgygFqcVhcHmn4O2KHZ9Y5rBkU3W8MhXxvm+/imLs4hReIaSEXqTqBtCSaF814
         QgbntT8PwMe2Q/7/gDHnVWNIK3F1h8QgQAv2433dWG7sq1Jb/fA4QYRpJje5yeFv6rPE
         +fQlBvmIQEHomDP07KNnpATvPy9kggxXWnspu13UufY76u1/BYGXQfFRc67dsMaAx7yF
         WzdydrcbA9qh12czdw5iHLFWe4D2/uYgXKkGrEP1kodeA7wFq3Q7lRII+cKpZFrXkfve
         aXLg==
X-Forwarded-Encrypted: i=1; AJvYcCUTYFZZi+iPL67TaZ5xx3shrJBZG0V/AmGr2gRK5xEnAGtBRi28RBEYnDENoPq44eYpYZzQRQKyFrbaz0t9GbuVAUv7omJeKz/Ehhc=
X-Gm-Message-State: AOJu0YwuVq38SCsjYt+qNqjixg0fZJ7BCWtkxkERoGdVV5UF4cuZ0Pm1
	32NFwqFEsCDCvyzFZKXrIWinXtWHEsk6oXQc3a+SuVup6xR9FCq7AGZyji6LQsFZpgd8xuGNFgq
	g9MSCZWkjhtcdF4ClvCTcF9qXUrE=
X-Google-Smtp-Source: AGHT+IFpmJYBm2bJLEhvPMIHTu7tdzlLyLLX59ipQuXs0/4omd7yWBrPgt5GQRSg5HsFGvCU9oJ/g+VP5Bvtf6W0Osw=
X-Received: by 2002:a05:6512:3087:b0:512:e1c3:5ab with SMTP id
 z7-20020a056512308700b00512e1c305abmr5473467lfd.45.1708978088002; Mon, 26 Feb
 2024 12:08:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <87r0h8n64g.fsf@oltmanns.dev> <875xybr93t.fsf@oltmanns.dev> <3546609.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <3546609.iIbC2pHGDl@jernej-laptop>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 26 Feb 2024 21:07:55 +0100
Message-ID: <CAK4VdL0oHE72_fJpoL1oQs4y=xP=8MPQq_6DHsARWVZUdQ3qCw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Pinephone video out fixes (flipping between two frames)
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
	Maxime Ripard <mripard@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 26, 2024 at 6:29=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne ponedeljek, 26. februar 2024 ob 08:13:42 CET je Frank Oltmanns napisa=
l(a):
> > It seems to me that all options for changing the GPU's rate in a stable
> > manner have been exhausted. There seems to be no common interpretation
> > what the phrase "Clock output of PLL_GPU can be used for GPU;and dynami=
c
> > frequency scaling is not supported" in the Allwinner A64 manual (chapte=
r
> > 3.3.3) means.
> >
> > The BSP uses a fixed rate of 432 MHz. Unless one of you has a clever
> > idea, I suggest to remove the OPPs from the device tree and set the GPU
> > to 432 MHz.
> >
> > What are your thoughts on that?
>
> I can't find original source of these points. So I'm good with removing
> them. But instead of fully removing table, you can just leave one point a=
nd
> it should work.

I had posted in
https://gitlab.freedesktop.org/mesa/mesa/-/issues/8410#note_2216628
that I also noticed the A64 datasheet specifically claims that except
for PLL_CPUX and PLL_DDR1, other PLLs don't support frequency scaling.
I was never able to find any evidence that it is actually supposed to
work anyway (perhaps it was hope?). Since you also looked in the BSP
and there is still no evidence that it is supported, I support that we
should likely just remove the OPPs.

Also, I wanted to point out that my series
https://patchwork.freedesktop.org/series/128856/#rev2 was merged to
lima recently. That was the root cause of the "flipping between two
frames" issue that people most probably hit. I highly recommend that
people using the Pinephone update their kernel to include those fixes
to fix that issue. As you mentioned about that symptom here, I just
wanted to point out that it wouldn't be possible to fix the "flipping
frames" issue with just fixes to A64 clock, it does need lima driver
fixes.

Thanks

Erico
