Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FEF41DECF
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127829; cv=none; b=Jvl2kXifMEJlD6QWkiKRj5EHYcc5uX2COIFxFfdEMw2lsE9IO7DKPrL+TsebKvLvqlorUbydu+KReTf6m7Qg1vFVd9jADAyAvDLOfpUeg5XTSwnZ3cCl+t0XUc94yaaXEjJYzXK0ozMnv5n5sdO8+j5lmk46Ru9SYl0DCaN1sHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127829; c=relaxed/simple;
	bh=Uc9ixU7mpRtpCs70jSp612g1hyAczHyKoacPjXdxzoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ia3gCTIwndH4IZixKTWMXlbVICImpAIzfR/T9E5s5NTS68oLK8OAO5oNVqnEZp/R+je92IRQ04ptMUGwEkg8l+xn1bEOw4FXc0PSYW8pBS9ZZBLP+bsmMDYu7f1w+5p6i+3N6Tg/LPpypMB3ayGcfAC5w4WwFA+gL3hZWJJ7OI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WO77sP1L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WO77sP1L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E6C1F00ADE
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 15:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127828;
	bh=Uc9ixU7mpRtpCs70jSp612g1hyAczHyKoacPjXdxzoE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=WO77sP1LBjx1OQs6QMN2uAIJ+HzcNGdJSVtzETJbmBsmtUniPpRDGo9xfPqrgjwJr
	 Fv5KgSl9S333F1QdhHd8AuPtiQo2PGMPaIF0cHt0pe/DQyVYg9dbPzKqse+UfAzGor
	 QMF+Gah5ol5qHqgVV3V5EeTD+C9TsGo6n0kd7jzdHZDZYIjAdjnrigtF8t+ERznpsv
	 Tzw7tC2D1lc9EvlQEbYCZgYQu4VWvhZlwwrb+RUeDZ5EtA5Ycz+Hr1TVXrvqPW7vbH
	 sPCUAy+BCt1aF5WXajwAsE0do6iV1DdNaMsDA1Id56q7M8UbCAHcz8BM0m8hrpcPh4
	 nMUZGqZVcOLdA==
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-497deab2d66so1887940b6e.0
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 08:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqnfPPT4V7UdZA+0Zj6G6HvXXf1z1g48OfNz8mgDotUnpjANDzKLb6sseT3sCiP2eeFKXLFjote3Q889w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqLSxOA4HAooqnn7Ah7vQsBqrisrMunxABkKJLIQDvkDYG64KN
	hpTH3ejy1xVKh1FvqsDP2SpXSlbfCQZRtYoc0DKgGz+Q3VtgIEVI0oTyI7oVz6fe1XjZQxpQhH3
	M+ecyY8RG1fYaNAHKkqk9cTcAsIzqbgU=
X-Received: by 2002:a05:6808:4f67:b0:491:3c9a:c486 with SMTP id
 5614622812f47-4a40f01dd66mr14811091b6e.27.1784127827370; Wed, 15 Jul 2026
 08:03:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-4-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-4-phucduc.bui@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 23:03:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v65hizaQy=faLehwvdxRN3DDtfsTbtyhfs66-mfomaXMtg@mail.gmail.com>
X-Gm-Features: AUfX_mzJioDX5B6d_Vy4Xtr7WpYHUvgusTkTEi6eeq4XOqzYfJ6OMFJbCn3XcIA
Message-ID: <CAGb2v65hizaQy=faLehwvdxRN3DDtfsTbtyhfs66-mfomaXMtg@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: sunxi: sun4i-i2s: Use dev_err_probe() for probe
 error handling
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:56=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Use dev_err_probe() for probe error handling to simplify the error paths
> and handle -EPROBE_DEFER correctly.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
