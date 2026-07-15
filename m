Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DB7432E62
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127910; cv=none; b=rjfSXanfgPGIzZKEUT5RgGme1P9JT2r8OADKLb4EVgh4bEXnHNJLXrUGdYvINlyz5uhOlYpvj7297S8GIE/MedlwdExNEnHda6SwkYyJ/LsliuLqvnfWmOj5xTPY4QoSeBTirdrJFcdBSgwV/EUTSjKFJl+wSjhWBzoM4tK7CMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127910; c=relaxed/simple;
	bh=1i7b3l9rJpq4HTYvS3RcBvBfTdofsIZ1RrmCSl+AOlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3ZQ+ikX9H6rEX1v3Ir1RUBZwu/FZMLzw1DPiMV6LQiEYj4AnXZHjoAAroyifF0HSfRNuCbVEl4DULg/CJbp39jMy9QXrD5EJMB47FDuMRoG6Eifrci58/KLFCRhRsHjns2Q1eJt2nF2bR8pfim6wcMdlwjbqjfA9lFSdy66UIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NeR+IabX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NeR+IabX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B82E1F0155B
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127909;
	bh=1i7b3l9rJpq4HTYvS3RcBvBfTdofsIZ1RrmCSl+AOlc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=NeR+IabXQW17kUJfwecht8YQ/HkK/kLqSIGyZ08BtCEClA+DyIw7EhtiazEb72jUZ
	 DQpRGCli7gqQwUnCVvuYa+FNmzEeJFJnRS5b0U0+jDv0ZnespLIDF+0uvb26hhvdAG
	 YVvyMeplBbKRTNHL6qh6udg33CiElN8xT/5Cy7JYSFlTDpqOT+Aqv7HPeImw2SHyK8
	 2kbtEqX3dYnpRxWHksZuikPpWeMEJtn9buY4GFU9FODT0ljKFabsiBz64G97U8d+UA
	 j+YYL27lNaZqz79nVTunJS9Q9px22wYROhZ2K0jyITz9p+M3S3briPWmy1rSSu5nQx
	 rswOxbLKqXKEQ==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4471b489240so1745072fac.2
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 08:05:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoESww4Ue33ngxYJdyKssRYQGnyxsLJ0GRU/W+0fVjAoVZJl8Fx64OuXpcwkgv1bAGMK40vnGbUUPvzRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ/2+qDvU8aqFViR1YFoI0RP1W1Kg317F+F/YCPEolfw5FNaTq
	6onm0ph341GeoxFYZ8NYGa+JNpKEqOnVw+avanVNDRDNdnqFPMCNW6sxmKqIpBA0CUPCNW58NIb
	1dQsZi6h7JG6EdPnmabcWGiAVITHEeOY=
X-Received: by 2002:a05:6808:1b26:b0:495:f67c:d96a with SMTP id
 5614622812f47-4a495eab032mr1747679b6e.12.1784127908616; Wed, 15 Jul 2026
 08:05:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-7-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-7-phucduc.bui@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 23:04:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v66EfrZLMB3fhpMtHJ=p6+JKr8xo4YoNcUZFbufT-Q7k-A@mail.gmail.com>
X-Gm-Features: AUfX_myL8GPNUfHP8VLcNCxbPlwWk_yA0cgJ1EGx2St68obk-BOfwKmsXMj10Vw
Message-ID: <CAGb2v66EfrZLMB3fhpMtHJ=p6+JKr8xo4YoNcUZFbufT-Q7k-A@mail.gmail.com>
Subject: Re: [PATCH 6/6] ASoC: sunxi: sun8i-codec-analog: Improve probe error handling
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
