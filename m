Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6E438475
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127890; cv=none; b=EoQqD6aOoOjTBluQw5kW/ulZpRNtoAWx51KDAnUHjWVj1sXU3Q0bTPnMcZ08isii3IvaRWhIMJsV9Ro7/CXnd58cZX1h+mSj3UuWqX2S9VyplBMxV8fGh2zLPNfZcR7L6ZiqTdpVGOL34ZG5jSvFlhPKR/eOtRxD8WeMDAW+cvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127890; c=relaxed/simple;
	bh=1i7b3l9rJpq4HTYvS3RcBvBfTdofsIZ1RrmCSl+AOlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwJtseUbzb0lumYrDQpJbCJiulSWokrTIl/EMjNi0wie+9O0RYu6MhHwXUDr+UFDhpVdWTIPRnUbsnrVmWKvHLDuR4MrkCGghAdZWtyj1O26UVCZ8ysoBakpRazPMXSwA3FtzKM1gJ9tznn2ClE3/Ce63uLNUOev2n9yyhG9hYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChP5ArcP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChP5ArcP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1F11F00ACF
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 15:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127889;
	bh=1i7b3l9rJpq4HTYvS3RcBvBfTdofsIZ1RrmCSl+AOlc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ChP5ArcPoyxAheJKZwTqCP9/h3JqTIJqA/OU/wRQw4NdxXhX9JDhVSSJ71YT+2orz
	 GElVYG1wyTwKrzodbclVbvhlZVZOQQ1ssp3AMtWphJlxYqIbMmFiej1eD97kodNDxj
	 tqf/l0KH0c93RLcwKe2hUwnWyox9DSOU0XZkb+vQPckNl+RRiMDHsarz+bbQgbYfDZ
	 gfw0ZIzySpIoUVIgUWchzSZaAHijZxtpBNW0K7NVVVkLd6pe4pV1hvCL9NW+4vpgeZ
	 AO+j/BgzmuYS8Xgue9nVzNqr3GzmKe0sm1AhSnOHD58HwEg6UeTT1FawjP/0hYDJQo
	 F/KLII+HIbxvA==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-447a81776e9so1964878fac.0
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 08:04:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpYGI3GkPtntFddg+xQY/JpLQIiPjOp6v8SlevuD98Uxj21sjKrTcmDyAPEdJMtMiV/4euStdIWCnTTEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YysXxgnWlVoWuLsfBYImSjqAFoaClG49URzkapn8hMZRyFjLMZb
	Gex2PoUhhRdqxctnmsANeFdNPxykzG3yP+6g6ohJYKdwuA1k2RuyoQUrWGTid219kD4UnOTVYWx
	AySxm5hlIJLAqd6elrjd/+nFKBb5lhiE=
X-Received: by 2002:a05:6808:4446:b0:49f:39c9:82bd with SMTP id
 5614622812f47-4a47a7cebedmr4190612b6e.41.1784127888495; Wed, 15 Jul 2026
 08:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-6-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-6-phucduc.bui@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 23:04:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v64CEH5qEgMJsPL9fdT9M6_2vVjgsnv3Ot3f-Y_iHPNpiw@mail.gmail.com>
X-Gm-Features: AUfX_myUc_a5M0pk-6lAb-cYFOcmcs2R1m0ZhqM4rRtcSdSlCczjuxeu7vx0bfI
Message-ID: <CAGb2v64CEH5qEgMJsPL9fdT9M6_2vVjgsnv3Ot3f-Y_iHPNpiw@mail.gmail.com>
Subject: Re: [PATCH 5/6] ASoC: sunxi: sun50i-codec-analog: Improve probe error handling
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
> Drop the redundant error message after devm_platform_ioremap_resource(),
> which already reports failures, and use dev_err_probe() for regmap
> initialization errors.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
