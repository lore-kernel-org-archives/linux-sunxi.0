Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7CA36D503
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 17:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578667; cv=none; b=sqswpx4EpXL9PqxmpMsdw1cYj9olrimp9UFhMT4C04tnKLZbMKuMQ2KsF80aS6MeexINnuLzxytS53rYaYLv7PlSvNvNn1ZacZQgL/s044kAu0UnUxOQ9GWGeTXYlbFlBZf4+R7jAKk7Dq9bl/WKrgIzounBeshBLEPWKN0d9uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578667; c=relaxed/simple;
	bh=Ljrz3/ym5aL3W5hSXMvMnSrl28+5TPjOO+yW6zlyHRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5TrIumnWz/OSpQBga9aq1IP3fvXBNzoUWwWwbaqTY70o2ODhZJeKB7SGo4Uc8xgKKEFeFQ65BB3P60VtD5kW6DmI7DR4y4q5t0BWFbX+pc22HV06Ud8L2RRiI2jZuNaOtmyQmA6GjRYUcYwUQLd65jDZrDWsoH4Nz6hqMAvecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkqqu8zp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkqqu8zp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9F31F008A2
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 17:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789578658;
	bh=Ljrz3/ym5aL3W5hSXMvMnSrl28+5TPjOO+yW6zlyHRo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bkqqu8zpSudVqSwPAfClBSGzFquPbiDxvce8sshFCNObsZ20EVP/0+iQzww+yfp8h
	 Knbx0yTBFbbg49xHF8gW8s+G3B1aFJGWbztT0XAQo30gHGaiqTduMHKVHXb7kB+H6c
	 mvn+fXe6B9Bz6mDWQt54CzQN3zDlB8QudJtk3YxqvGM41WtbLCgA8GZ3SFkd3DzgTj
	 cDE5eAQR4RDiHyjmkUOBumOtsbxf0ByycNeNrGtmIcoPk44EridtqKqIQbfeAXkKup
	 qO7xUIYCvHiXN41Z9HY9sqJ/dg4bKfxhSrL6uuSJx6mY/Bt5IyiN8xytKMeVJebbia
	 27Eoxxefe5HTw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso1332935e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 10:10:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxO8tI7R6tb1DLury5BG7tdUumkBgKef28sd8rOi8XUXM4B/ZXnthk7WXa7sUYRbd3sQaHPS2XtfCRzHQ==@lists.linux.dev
X-Gm-Message-State: AFuF++l2a7/fE2AKQhwwzNEGY5nTMIZWnz8Eh/U4oPRGDHYQOAT723x8
	hcMfWF+oB/NM5qzt1Ph1xdYmc3U8fauhnZshIA7PwnzQ70fWMq6iRnBA/pAzJb4y0ZlWCY9r4Ov
	H3oRbUyZnTmcZolDCFPG8vRelQim44VQ=
X-Received: by 2002:a05:6512:1329:b0:5b7:65c0:8b92 with SMTP id
 2adb3069b0e04-5b8b6624616mr2095448e87.12.1789578656776; Wed, 16 Sep 2026
 10:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910133519.459011-1-andre.przywara@arm.com>
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:10:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLnR-pyB8ZZXwn0ffDBQ5n3eWoqMnbxH59B1U6oDHDiRTA@mail.gmail.com>
X-Gm-Features: AcwNN1WMRMLXV0VY47rk_rDL7ZhlcD1BjU6erIZy7wdE15mC-YpMq3fTzq6SO-U
Message-ID: <CAD++jLnR-pyB8ZZXwn0ffDBQ5n3eWoqMnbxH59B1U6oDHDiRTA@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: sunxi: Add Allwinner A733 support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Yixun Lan <dlan@gentoo.org>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 3:35=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:

> more than a year(!) after the RFC, now the first "proper" version of the
> pinctrl and GPIO IP support for the new Allwinner A733 SoC.

Perseverance and grit!

Patches applied for 7.4.

Look into Sashikos comments and address with follow-up
patches if applicable, I'm not a friend of the perpetual back-and-forth
Sashiko causes and prefer to just apply and fix in-tree.

Yours,
Linus Walleij
