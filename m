Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B1A2D1F44
	for <linux-sunxi@lists.linux.dev>; Sat, 23 May 2026 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779538307; cv=pass; b=rDYxrG3bEIKQmyUyKN03cPCY1N3d2kgwVSKFhvdpYKT/mBxMe2FnpM2gGRqC0xrmyz8JP6cYRu9BC4jBBHQZloveKTtB51klO3lEbPSZJvnAokfGdQUPTyoQhoOcDOEDA9UTu53CBxbzZ3Crvnw+MKN68whbt1efL4dduO6cCX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779538307; c=relaxed/simple;
	bh=8wpphr3zABAARr+Xe3rZOUncnYSZS0BnTX9QeRFwgyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQShm0rPKtwFhSQCQqwZQ6rgpEPKZa1d8+92oomzXiHcqC9OeOCtZJwjZwuk9yKgE0cDJBQRNPPE6Y3rNW47bISeJFb10N2C01q41XQfyChXIXXYyQMxIe1tmuCR2LMMmcHZIf1VSIziV0Gb03YJB4AZHqXf58OPyOafhqcu6OQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJh9cehO; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJh9cehO"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c828daf83e2so3773319a12.2
        for <linux-sunxi@lists.linux.dev>; Sat, 23 May 2026 05:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779538305; cv=none;
        d=google.com; s=arc-20240605;
        b=K+ZMqMww+yTaWt75I+hUikjHPrKmGaKj86pU2DfmOh1zcoBvc87QFKW3aiYmGoJgCM
         ESiXauGyOqSWpTpdris6kLMTQYHy0LClc4Aef5MT/D+3hQHC7Nve3yrkloPOp5UFLq+o
         Pf8o2oV54I0x3AjCdWCGIsQVuHHpMZs+2xM5JtbXkeB6TB0/eNqbwzwo080aT8tXke/6
         7+86hAKoAH2AgkOBkcjU8HAVS45PyYysrQeXjuF3eCsZzcJngz5PyqWuRxBTivO7LFV5
         equvLEZlZkxMdReY17zSU2yVIpnTRn9s0F96vXz9WoVkZEPpIRGnJ4g0eLQpC0RxttQr
         Ytwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8wpphr3zABAARr+Xe3rZOUncnYSZS0BnTX9QeRFwgyw=;
        fh=Csk26F0BS9PlLgLSeshuBNQWeT1qq/vcrkh0N0uMMB8=;
        b=FWiHFz+vaybdihwb+YHPsZBg15Gz0t+ovN3eqr1X+9s2Hgq3rnjKHUuOqJn3KtFG1C
         xzXFQOSkPOs9cUkgDmdAesEX9Vy0xt7H2exbA7p4ysigBSS5V4OmHLgetMNXDc4F4bwo
         hJRoscbn6LxD+AeCoXOlRNV09vTR4bm81c7WmBhEcLua184gN3kZwN5G0HIyS5uRQEBL
         N3FcfBWul8QNIvKWPUR8jvdOXTYflvrQJX1LhW5oHuI7jd3QTCY/2XKgOdv6Wwm9KKrJ
         O4AsQrIO53p0vtPKMCkSYZ8jqs5xTZFnluOnyzknx9PIums8hu/gsWX5g6kWByB88P1/
         e+ew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779538305; x=1780143105; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wpphr3zABAARr+Xe3rZOUncnYSZS0BnTX9QeRFwgyw=;
        b=fJh9cehOoHXW5vAiyH8siTT2bywbnVTnMAMVTl5B8VK4WnOitssQDgct5ujoMtlvvY
         s8xnCF6lJ/lhC9ie0apMXBUqo4duMhtDrFOLAgy6E+1cc4rdz+2ovovyCdai/kjLcyoO
         vRb7v9cVdY4Bi+bt90AjBLb3vNWbfK8Bt8b/R1/1WvZaOWkME/ZvDhpGlcOvgZHH6yIv
         BvzkhekgBnyaG7tbF6MzFGrJXUcRwz4S1EBLzflaY8/dp4ATczvgZ7QPq8N91Tr43R1m
         0eJdQhtrvXXrlv01kxx+rftAVM6Hyyq2tX1eLcJhyF/Hy/ZptUUeUY+PDgzfHTy94C0k
         9o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779538305; x=1780143105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8wpphr3zABAARr+Xe3rZOUncnYSZS0BnTX9QeRFwgyw=;
        b=QG2hqY45qsRGBPm42oOrtGqxuofHNX60BxF9qbDgH0HUIkyeV4GJoN8pD2jQ75P1sI
         MjaSbeKvtIynvRrqrzJ1eXKgdLWCkTSV3uXP/q18qxROrvnH4AKEo22/d1ikRvNLDat6
         fJPklAiB25sW+uPBYigz+d+WgJ5vE+S9m8COjSpprLFxsePqpbEWaV641Y7RfulDFGfB
         cKmKgdFeRu9cCZsW+JHNM+DB6JztxM+njCJlTNaFMJ2AZsXinN1oIAuqjVgyQYG49Wsf
         Yubt+aV19W5xRLI9P4lxVsE5We8oOJoZN/GjSfZAcx3xDDYTIzOZLqKlcyN9IR8omdae
         zebw==
X-Forwarded-Encrypted: i=1; AFNElJ867ZXpivJk3A83qwmbxLn2+yx6PxwvCCHPb/nOuz2GFOZx5pHw0RDI0fxNx8v9aLGakFHPMqRwYWf3Xg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlF5E+DQNr5KjA/3gekX1p1oLmc54fVkeyAmTb4ySuYpmVbxhh
	EBLZoDNLQoGX24LyyYh2L/VXfHeGBojje8YYSM+aLfhs6Uf6dgk7YsTG4ZtSbcvewTlTDkYR1l9
	/2Ab6Hfft2dAI6Sb1Mt6dTVfaftcOHPQ=
X-Gm-Gg: Acq92OGQ1WwVpw4YSF6qhzaA4Cj4fJYbpPJxw7QVLhJ7hC/vemElWehDCmtpHH+utrV
	27Lw9cgUC60ZXrm68w8FaaBz3BSOMpcD4uLKXBMXVrXYtPTaz67JEt/pqClDlF2hCTLSjJiTy+1
	dQoyoRI3GwQV5b3P5NPkYlRAmuZ0SzX3YDpy746KcLhbXfwRfoCnzkKPtTfNQ2I0N/ZjqqQGrjG
	AHpqbTlqJpYUN89RUF/jeYM9Tl4D/9AYapMwWm3QFahJI7D/pOtcCF1VosSakHdmz5Ygxo9kcPR
	Sia5BFqj5MaWtN6HLKGPp/e59BbGLAy5QF1mm/0QkRyRnJ2O8JyWEZD0HoXHEJ9O8JKesgOV
X-Received: by 2002:a05:6a00:430d:b0:838:af72:fb1f with SMTP id
 d2e1a72fcca58-8415f0e43d6mr7637408b3a.2.1779538305135; Sat, 23 May 2026
 05:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
 <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
In-Reply-To: <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 23 May 2026 19:11:33 +0700
X-Gm-Features: AVHnY4LgJLcY1WKuBCvFOXhD53DeqFEBktLQO4t2Ke2wkQ_NwOIr1on75a8Arx8
Message-ID: <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-yu,

Thanks for your feedback

On Sat, May 23, 2026 at 2:20=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
> > Enable the APB bus clock before the SPDIF module clock
> > during runtime resume, as register accesses depend on the
> > bus clock being enabled first.
>
> That does not even matter here. Access will only happen once the runtime
> PM callbacks return.
>

I understand your point that =E2=81=A0sun4i-spdif=E2=81=A0 doesn't immediat=
ely access
registers within the current =E2=81=A0runtime_resume=E2=81=A0 path, so the =
order might
not trigger a failure right now.

However, if we look at the peer driver for the same Sunxi SoC family,
=E2=81=A0sun4i-i2s.c=E2=81=A0:
Links:
https://elixir.bootlin.com/linux/v7.0-rc5/source/sound/soc/sunxi/sun4i-i2s.=
c#L1296
In =E2=81=A0sun4i_i2s_runtime_resume()=E2=81=A0, the sequence is strictly e=
nforced as:

1. Enable bus clock
2. Access and restore/sync I2S registers
3. Enable module clock

Since both IP blocks belong to the same Sunxi platform and share similar
bus/module clock relationships, shouldn't we maintain architectural
consistency across these drivers?

Enforcing the "bus clock before module clock" order keeps the dependency
ordering aligned with the actual hardware roles, where the bus clock is
required for register access while the module clock drives the functional
audio path.

Wouldn't keeping this order also make the runtime PM behavior more
consistent and easier to follow across the Sunxi audio drivers?

Best Regards,
Phuc
