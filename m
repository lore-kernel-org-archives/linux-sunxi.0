Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CB81DFFD
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Jan 2025 02:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736303108; cv=none; b=gsWuFwlvurA3eyXPyMnDoHpy9y+7Of7WcT6eCnrmroCoYY6K4OfeLhqDYosOtHDV0YK2lW3JBEWDFr74SIRW84Ef7ziSzajYvWhFU6qPZONM7H80AgoNkTfuBX7QO6p1WDGFUXq9hQv0/55B6A2h5lGmpTKLrMjPmkjSh7KsBWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736303108; c=relaxed/simple;
	bh=mTST5LhFE7Ct4A/sGXE2C7XwvC6rb7/IgSvpf8cQe8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=d7WYw8aA8KSUinjwKi/Bjw3lehFKqTS5jXvFe0xMCBb3MTZpdKTuTGWPQ4PuOxx+lpY5UCUuhZQ0XSgJYs7dzqAr10PVJTiDtj5oVriPHlX4WJ3EyUh8/PTOfasY0XtSaqcA1ZAEgRyw67YvfhqMxaqWhZHhB/o/79XE9R9RKck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvZdlke6; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvZdlke6"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2a7ccb2c618so8772485fac.2
        for <linux-sunxi@lists.linux.dev>; Tue, 07 Jan 2025 18:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736303106; x=1736907906; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+znau2/SxzOfAm5TaFDXUlYIMNrBzWX4AMaXWidTqo=;
        b=BvZdlke6U1A6kVYy14DG31yvBURJ44RmpmiEVCeKh812VtmgN0IDB0dXK267H1w//C
         0DxPVSsxoOo38qSD55OJvDHIQY6GWPI5Qrb+Kv5elmJU9hP/qxOVZKptkLju2LDcrWP9
         kHVR0BGz/IeHes9V+JOayMd+5vswfHL42kiUyR7N9eqFNji1Gtj99sjmeU3JijBIpmHz
         5F2QqQzqsXmQQTuvOxxu9iSk8Kx8hr2WGTVsKXICSpvteH8S0F+Zb+STuId/ww6XLElV
         rMd6pamyFRmZz0ODnBH2Sr6rw4PR0GUu37tPxbVQd54ug+lj1U4x/wrhLivLpqcqc1vV
         NplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736303106; x=1736907906;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+znau2/SxzOfAm5TaFDXUlYIMNrBzWX4AMaXWidTqo=;
        b=gx5HHY3A/3sHM2yjK4EcjVljCyxcUZJIwFlZlgF0u8T6Psvjif6DqzRsJwLZkKdDlR
         GCnqLh53EeiD3nCN9HrvCtlBl8uG72n/XwRVirDRgSDX7VYV5kEsNDrldJgOAAZuJhhJ
         xiUsO5DaCNXGWbMUBy4zYsmZhjMQfYyOYk8tL7+FsB+Oj9EYLCGGfCAJQteajP7wZxtN
         iHB+CaI7iTVCpCKRN0XUnafgQhdaECDJ+VlOE6PcagnaGkmBfEwfsa6V04aYXxz7VZ5q
         MLsHStZKO3C+Ehod4KvrBHg08auez1c2bFxQv9TR0Ps8cdHO1CXMGXjU5rPc/EASZ+xT
         ruaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwhbLWkJwma536GDzLBy845NdQKzgWNVskTqjQHIfvs1VXuBkMvG6W1UpDlQ7m/ymcAr7/sfmtGDez4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwF5viplkQ8Q/vbyPqv3A6tsCCKTQ1kz5pr6NZ3y+xikDcZRe0w
	BE3tLi3z1q2SiMHJwUkvfNNzIG4CP8IY0vYgmC/UTR9k3i2BI4XLF3StFPijIguCF0uEpszdn+x
	EFnvbrBE9I2Vd3i2Pfmol6y7BsYE=
X-Gm-Gg: ASbGncvIE8njSoMKdxbqsCUr8agyh5QS+99VwRYbXiKdSiQVWaNjqu2OJKH7aEnabAW
	qroTkWXaFddI3kFIglaCi3pJvOgK+d0TZhB8/tOG9F/vt1oE6f1diZNXSX4j0RQeStMawuAA=
X-Google-Smtp-Source: AGHT+IGimp31Q2+GIXmJCiU77kiAeGfSZMa6DDCh5lmqyMkyk3np84Arcp+XHpNIL2EKTQUC4MdlEo+8QKTb3zmsQGo=
X-Received: by 2002:a05:6870:2f18:b0:296:9c08:51a3 with SMTP id
 586e51a60fabf-2aa06998fd6mr540344fac.39.1736303106023; Tue, 07 Jan 2025
 18:25:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240302140042.1990256-1-megi@xff.cz> <CA+E=qVdq7AHYj1scKbyGmarSZ7u=vLMsQ63nDTDQBu2UaL=Xag@mail.gmail.com>
 <dfb3lsuqf4yowkovwwi6iiroslb4r357u7ddevntdk72ivxcjz@3spuwm24ubwr>
In-Reply-To: <dfb3lsuqf4yowkovwwi6iiroslb4r357u7ddevntdk72ivxcjz@3spuwm24ubwr>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 7 Jan 2025 18:24:40 -0800
X-Gm-Features: AbW1kvarpSVOWiQEcu5eIaDkv8lEzWepv1weHLELLVGIQHmXGts_5WHJYUNkVAM
Message-ID: <CA+E=qVeDw=p+1qSmifXTscOUVSSXnrYFVNY2+-_DcUNXe51eAA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for jack detection to codec present in
 A64 SoC
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Arnaud Ferraris <arnaud.ferraris@collabora.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 11:23=E2=80=AFAM Ond=C5=99ej Jirman <megi@xff.cz> wr=
ote:

> > Has it ever materialized? As far as I can tell, this code has been
> > sitting dead due to missing dt-related code.
>
> The code is used with some non-mainline patches. There was a bit of
> a problem with simple-sound-card not being flexible enough for complete
> functionality of audio jack on Pinephone, so I had to extend it a bit:

So maybe it's time to respin the discussion? :)

> https://codeberg.org/megi/linux/commit/afbe7688083cd1e3ab98c37e0fe0c28d53=
0829e1
> https://codeberg.org/megi/linux/commit/95552b66a269c2da434edd3880f9819c0b=
d5602f

I think the only fishy-looking part is using device name instead of
device node here, i.e. something like this would look cleaner in my
opinion:

simple-audio-card,jack-pins =3D
<&codec>, "Headphone Jack",
<&codec>, "Headset Microphone";

However, I'd like to hear the opinion of ASoC maintainers. Mark, Liam,
what would be the best approach here?

> https://codeberg.org/megi/linux/commit/c15070c220e7425dd0d0445ae0eacdb4a4=
872ad7
>
> Here's a bunch of patches that I use currently for complete audio
> jack detection functionality:
>
>   https://codeberg.org/megi/linux/commits/branch/audio-6.13
>
> But no, complete upstream support did not materialize, yet.
>
> I'm not sure about the direction. Whether to push more features to DT or
> just write a sound card driver for Pinephone, that would be able to handl=
e all
> this without extending simple-sound-card or DT changes to codec driver.

It's not really Pinephone-specific, all A64 (and probably other
Allwinner-based) devices can benefit from generic code, so I think
extending simple-card driver is appropriate.

Regards,
Vasily
