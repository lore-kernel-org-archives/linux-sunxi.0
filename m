Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AB71B6CFB
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Dec 2024 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735312709; cv=none; b=opNn2xaykcqkwcjEgVD8um5FGA+Nv4yn5FRA7Zf045gCkr6BFfgj0txqwT9G6clV6Mm6HS9KOdjiTIyjDO0MjCi/0QcxFzADrAdsHytke4TMXOqh3mCnGA5LX4U1YaUsmmfROGYZQQPmcrdOtUZatks2BGHTMxkKNsQczX6nL+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735312709; c=relaxed/simple;
	bh=5mHgPD47KHRO3TRouHZwXsGVGtTqUwYDN+U+WO6IdEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rH8MiG0xIY0QbF+bTTiU5WDptK/vjbwXQibvPYpRLm80NQjiI1fIskaGJPEwQ1Ti+EN6mr677Q1+fQUyUoQfSeBws3mzPQuwQ9raB2BUtKIfLkzzuJUA7Aq2IB7Y7D1h26k9fTPWsZ6FK0PgbAyDSxNh7vzXssTBrYSHBnKu+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3023c51146cso75354431fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Dec 2024 07:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735312703; x=1735917503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L0eDlOw9p3DnVtbNe3F5E+YgQxPXK7eYD6omdeJR05k=;
        b=Qux0fOiEWS3vAttcHTjGovYOJNyMvPS3oqy3dx5EHSL1HfAXaDjDa0XJGNGPz8bwYQ
         9tUT8IPRGbLjh8mq7LhlWjdgy6w7f8FcOf3ZR9YGsk/QwF7YcHMaXahoTZxrSn041bqd
         z1C42ClA/hg2w6lSyYznmI85wxcVk3aE1fIJoMgjZ3+GRLB1SSI2xcM63aY+DINIhqrB
         rKkFto58GGl4CS3pZmQ5PjMTa1tw7Eh0Y8OAD9I5HltLzLnx8zL7cUZutX2jZfq4fFza
         0Upq6FV9Y3Uzl9pZ6CM0UM+RpB8b46CGMdm99JWj7V9LdKy7Xsnkc/7YqMkdz2PcZ3oX
         pAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMKJIY3juIcU+BofChCUgG901FCclN0k5jXkZQ31oHMluH6Zdx5nPBECRxZPXfevP9b78KY359ewIVDg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1Olska9va8I9Trc4FyfjTz9Igt44bOqPFEiWHhKD7y8I940ur
	I0CtyPmPdpmIJ2YNRBBPzS611POxJ65MLvtwEj/FG5gqXZauc4juKDCJVqRe
X-Gm-Gg: ASbGncvHmWktUgh+hDp4ILDDnmT4MUZJOKVY0CUsS1kmRaLlEAxd6og+yOgX1rc8tUJ
	IKUmhZ9rXkxtINjvenr2hCmsowZghydIQWSYpzvpYiq7pwFqxxKfsLPAfQli3vAxI4DCLvQ6AYG
	NKNyTE+1uTFqLUFvhhqXSwoIkBIInHZ9I5HrMS2BZQm8kltZaq/55eYgkc3wwRqjN4wckxEoaNi
	gnBx53XHM670S6ej7Pf1UDHtAJ0NizkhnB7ACQ4dGcxzcC3Um0em0vMO/dteXqJ+cDd3IXzSZ0H
	AXJVNPhbnHY5EQ==
X-Google-Smtp-Source: AGHT+IEmdtOZrm4uVxR93GaO/oFYTjhYDd/RMFRs8/qO3dipCfdHBB+DWcUPG3Pb475FQNggr0nX5w==
X-Received: by 2002:a05:651c:b24:b0:302:49f7:1d72 with SMTP id 38308e7fff4ca-30469b34be9mr92228441fa.9.1735312701412;
        Fri, 27 Dec 2024 07:18:21 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad99d1esm25504201fa.38.2024.12.27.07.18.20
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 07:18:20 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3023c51146cso75353821fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Dec 2024 07:18:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUF5EZCqKZtw83T6uyqIhF4hFLHWoJMnzl6Jazn3qLhRze0H8YRkKdnweJXtoIaabg6q9wHBvaJymyTnQ==@lists.linux.dev
X-Received: by 2002:a2e:a591:0:b0:302:1fce:393d with SMTP id
 38308e7fff4ca-3045833692cmr107500831fa.2.1735312700069; Fri, 27 Dec 2024
 07:18:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
 <173124139852.3585539.10704015898700065278.b4-ty@csie.org> <9415ca9c-f303-4507-8cd6-cb08ee09e988@linumiz.com>
In-Reply-To: <9415ca9c-f303-4507-8cd6-cb08ee09e988@linumiz.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 27 Dec 2024 23:18:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v650sctP83mdoYtcws2zVzJzfBqq=AvAXYH-WaOoPBDx2Q@mail.gmail.com>
Message-ID: <CAGb2v650sctP83mdoYtcws2zVzJzfBqq=AvAXYH-WaOoPBDx2Q@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: a100: enable MMC clock reparenting
To: Parthiban <parthiban@linumiz.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yangtao Li <frank@allwinnertech.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Cody Eksal <masterr3c0rd@epochal.quest>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 4:45=E2=80=AFPM Parthiban <parthiban@linumiz.com> w=
rote:
>
> On 11/10/24 5:53 PM, Chen-Yu Tsai wrote:
> > On Fri, 08 Nov 2024 20:37:37 -0400, Cody Eksal wrote:
> >> While testing the MMC nodes proposed in [1], it was noted that mmc0/1
> >> would fail to initialize, with "mmc: fatal err update clk timeout" in
> >> the kernel logs. A closer look at the clock definitions showed that th=
e MMC
> >> MPs had the "CLK_SET_RATE_NO_REPARENT" flag set. No reason was given f=
or
> >> adding this flag in the first place, and its original purpose is unkno=
wn,
> >> but it doesn't seem to make sense and results in severe limitations to=
 MMC
> >> speeds. Thus, remove this flag from the 3 MMC MPs.
> >>
> >> [...]
> >
> > Applied to clk-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, =
thanks!
> >
> > [1/1] clk: sunxi-ng: a100: enable MMC clock reparenting
> >       commit: 3fd8177f0015c32fdb0af0feab0bcf344aa74832
> This commit is missing in 6.13-rc4. Will it be merged in the next rcX?

It looks like I tagged the wrong commit when I sent the pull request.

I'll try to send a PR for it as a fix.

ChenYu
