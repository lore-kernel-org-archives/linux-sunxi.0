Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FF54B0E58
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578512; cv=none; b=aHowKlWFNDEO+2Gbk2uKdOwf4QXoJW8DdqfMbJ2jCETIHE1HEh8m1vnCJZUrHeKZyL+khK0pJ4jqYLkaIXHt6VFeWTYzotz6JC9/WPEGUif6Cl0BJN5UNCxBqZs4k+8G7mclXHaHW5xotACdZS6K+JhAXA1RpzZRx4Fj5O5RpQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578512; c=relaxed/simple;
	bh=E5wNtv0wDkIe9aO5f3le6LmPTDNX74MWkohjzIuB+hQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRP0Q69vnf4+M1wwGP31cluIThZCUJlwf5BBvHXPGwMfeuZVMLkNYlrRRftBZx6NaN4LGZJ3NKLoi2TLvfmnTIoAmi8xsnCGX0OsT7fN2kNS7m/Vw1JT+Do3lBdERpws4jCkslw8Tq0FY828DoAAemduPIBFESqYc/uxpSYnnyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvQIKcZ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvQIKcZ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8923A1F00898
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 17:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789578502;
	bh=E5wNtv0wDkIe9aO5f3le6LmPTDNX74MWkohjzIuB+hQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fvQIKcZ0BSExGtlyc2FZkuUme8eICV13j8MfU6a/QfHlpMnHaAxJF+/NOvji76qW0
	 tXDpoH+2uenQ0cyGKI5VeS5JqKmGqCq5xFHCE86dc8wVE2pX9JJLVTYSRJc+qE4tpj
	 JeEN1KJWH/OyQsBVPCSSGU9MLXqPPZgwCWdTmOCEgW7/uTyJCiPg7za1pw6/aKXL+2
	 Nup06Hm2bqpJLZg/KuQd5AWgIS+8G5q4mxHzrtdSnNSA5AHVhrHzyybYkLsaftXVIJ
	 bNVSZT4qqXAXnOHll3Wqq2UDapA3vUEKkHKLqDh2YbIdVmCwEDY7c997RSw66OGPxw
	 WNgI1685s3eiQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso1347334e87.2
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 10:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxDDhxYrJQThdAIaSJD2I7t9SNjmRwVp8ZHevJzqeYEkKycibEu2mJbHerilTjaYBjkeyPXT9E4qIxffQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nkrg2okWYmcYgQwC3w3uxrPmvPbgdWWYZ1hBRhR8x/aXq06MZ8
	5HLoktMuqfY2A8rnmwvjs2BkPXf183JJXYkXufAW/C+VEUDdDb9vg8TOaNmYWiUwhSybGQq6uyC
	sAiB+l6qTwjLTkQw58B+n96WXMZ1Ec3w=
X-Received: by 2002:a05:6512:3a85:b0:5b6:183b:d215 with SMTP id
 2adb3069b0e04-5b8b6666edbmr1065811e87.60.1789578501266; Wed, 16 Sep 2026
 10:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914100744.1039050-1-andre.przywara@arm.com>
In-Reply-To: <20260914100744.1039050-1-andre.przywara@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:08:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLnMB_Fr0i=FgjsqoBj3tOc=nrKy89zsZLMQGup_+Xh0FA@mail.gmail.com>
X-Gm-Features: AcwNN1UmIpTpGrnLd6YNTpMeKuWu3aLaJO6OkS3CIGZ1a2xTye0vQ771yZj10e0
Message-ID: <CAD++jLnMB_Fr0i=FgjsqoBj3tOc=nrKy89zsZLMQGup_+Xh0FA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: A523: fix voltage withstand encoding
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 12:07=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:

> The Allwinner A523 uses the same GPIO voltage "withstand" programming
> (setting the input level voltage thresholds) as the previous SoCs, but
> for some odd reason inverts the encoding of 1.8V vs. 3.3V.
>
> Add a new bias voltage type to note this difference, and select it for
> the A523. At the same time also use the newer "CTL" version, which in
> addition allows to turn off the withstand programming for I/O voltages
> other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used for
> Ethernet PHYs). The A523 has that enable register, but didn't use it
> so far.
>
> This fixes eMMC and reportedly Ethernet operation on some A523 boards.
>
> Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner A523"=
)
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Per Larsson <per@palvencia.se>
> Tested-by: Juan Manuel Lopez Carrillo <juanmanuellopezcarrillo@gmail.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Tested-by: Chen-Yu Tsai <wens@kernel.org> # Fixes eMMC on Orange Pi 4A

Patch applied for fixes!

Yours,
Linus Walleij
