Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52950399036
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127354; cv=none; b=kDOEwCJtKbqzNeSwU60kB7nKdRVxYLPrlIWjs+E1Oce8TYdDUa8KCQt1FL39vhjH/w76XAfPawLiC0EEA+9w+RL2ZO1D4cZ0SnjR13CrtefROhnxA0sTExNQrxnvzqg+IOFUmuU0YZTxIViMLBuQw2XCl5xbAj8bSRAcHow60pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127354; c=relaxed/simple;
	bh=Ot+mkzy97NL/CsqY0rSsvtS6zFCj6FDV5nN9Lq+EnEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUZ38QYOPg/DgcadF0LgZWhJMs4PmZEzPeUEqyMSh2PrHMP2DB9s+8FHBgNgPWlsNe2UkRkKTJOzOaJI4oGFzCzZ3GSB1et9CZUp62WBvqUJFwdzR5SUhuU0TUMXb6BcjyoBn/e8/OouSNyIxJxguIa1fOSFbLgVMiido9fueBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfPyQBnM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfPyQBnM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CF51F00AC4
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127353;
	bh=Ot+mkzy97NL/CsqY0rSsvtS6zFCj6FDV5nN9Lq+EnEA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=bfPyQBnMrePgS0gsls84e5NymQoU9NI2k8eIbUXBcnCc/PN0MBsMY0eyzNrGywcjN
	 woIPBL/ZrgTFZxn1Rwid8Ob0hbYXDZums21U87ngVyZh4GGB9qNf3M8856b+SekyGh
	 lghmvhyu7KU9Fa99c+Q0kN5F2DyB59V04xyALAXwYuAytmrRSo0KmUGYD+tKYZjnON
	 qNN4KHzdojKVSjLwUwmhAX91uqAskuvouX52JXMIS3Ivwcaeli+Mx9QbyhppuWUT53
	 TfUgsV2gDIuuoTQQVdNrxmvt5fkJIPFhbezsFS7Dxx14ftB5DXZy/nq6Jk7CHbvurm
	 yznH4IQbvR73w==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39ca300db70so35445351fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 07:55:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpy+E4FE7aScsXy3WdeoMxdm/L6nwQKr7vcc5YX5TbVrLtjtmdw6V/yzsHB9xiQWI1568vXFZnBqs1RQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqE4OAbb9BxICLQ9RPQGo+8hGht7SHR3hEVeuoTaoi1dg9/H+3
	1nIxUOR6L7BBgNnhE0NFlcfaDTwJYy+tdO7l/H+ApuFXn0s7w+Y6X/JeCHCRRNasKyWKke2wXO+
	StZhHt0BhhzMyt+vDAQmVMvU+TKkutps=
X-Received: by 2002:a05:6512:66da:b0:5ae:bbcc:7a55 with SMTP id
 2adb3069b0e04-5b15d76a23fmr548738e87.7.1784127351426; Wed, 15 Jul 2026
 07:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-2-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-2-phucduc.bui@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 22:55:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v67piCB3y=Pzvq9QZi0=zs6299UAxRdU6O2kukSW+JqMqw@mail.gmail.com>
X-Gm-Features: AUfX_mxcQ3YqNDO_ieBbHpUkaQUkcwRm2R6d1PkTwYWjPGrm2EyNbVKGbYPMcj8
Message-ID: <CAGb2v67piCB3y=Pzvq9QZi0=zs6299UAxRdU6O2kukSW+JqMqw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ASoC: sunxi: sun4i-codec: Use dev_err_probe() for
 probe error handling
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

On Wed, Jul 15, 2026 at 5:55=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Use dev_err_probe() for probe error handling to simplify the error paths
> and handle -EPROBE_DEFER correctly.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
