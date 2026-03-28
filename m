Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0111C34C81F
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Mar 2026 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712782; cv=none; b=i2fLbaCdGxFLkYkeRlB3I9eUl9HuxAIW1Yz0V5BEvIHk3MWm7C6k2AmcT+sXxZhjaz73fjHTfYjJmci3h3gmVSamLiqVPtAFOtuj/DgXtLlXGKsudF/96KFfdoJUWBpz3iX8Z8ayTwtqRS8M46h/yHCSZXIocqKXCLCSgg0ZA64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712782; c=relaxed/simple;
	bh=BEU9rMTbOAWYA1FwR7F4qwNiCjzAb+HmPpFgx2cS7wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y322afR0d5QOm9Wszr8cuqZFZQu3gFYj/gR7zQUP4/SPNbB5wYI/1XsAHhVjF2Sg2ivTfwXdRdh0ALJhcn754U7ay5PNBSgR2ChqlvdboH610yY7hpE3f7RyHkGkPybTyjF4RtI7UCnIKyZXnZ8AdLR4QmuoCuO6vK7LA2YqsME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rrr06uwb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rrr06uwb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84ACC4CEF7
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Mar 2026 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774712781;
	bh=BEU9rMTbOAWYA1FwR7F4qwNiCjzAb+HmPpFgx2cS7wE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Rrr06uwbrksBuLRqNeOMBEtkc2YCL+dfp3wPeGUoXqAiVwHzl3e9gIsjWPIvkSI8Z
	 9jPVIfgsYnCM8L8GffnD6+m6pu4bMnPoZM46/CgozEEMzQwWMrDoMNGlbjgVNgzOEz
	 pp1zN7cD3iL8VpNQBuczlUBrNKNHK26/J4lxiB4yIHGN3RkxHXNaPV+lhJhlMzSpUt
	 Zf2oSC+zvuvzTdlAzd15mL4vrl7nDlUIn3HY0rBAszOMMUy9OtzIEN0nNAgOnjU0W+
	 j3FYPZkKhJbBmt5Uaz7VOuYoX2UUfXtvDlNhzS3hsuEFPOU0lrkpG3KvW+1QmebbCi
	 jED7WT8ub5UxA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b93698bb57aso570121066b.0
        for <linux-sunxi@lists.linux.dev>; Sat, 28 Mar 2026 08:46:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZiwcPUYwbDIxFIk2YiDrYiA5spjcb5oucHfXmGLi8Kngb3za9/LGPQLWJ5HwLezVWh7did4e4g1Hpig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0Nx6YaWaaqDRgWVkCldCrTlQ2yLpwdDudWlHV3kL8oRrZdnvf
	XAp/Vj7DpotRIAwSSOERnZzIqQVu/3uqPqmjc2g5pH0zvzyFaHjPgz77HgEpzOO85sPjfeNp5sA
	3wfxt/MtQB0q0O1t4pRA/2LVj/5tn8Ro=
X-Received: by 2002:a05:651c:30ec:b0:38c:33d1:dd09 with SMTP id
 38308e7fff4ca-38c653f91c1mr24155731fa.10.1774701616378; Sat, 28 Mar 2026
 05:40:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech> <20260121-a733-rtc-v1-6-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-6-d359437f23a7@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 28 Mar 2026 20:40:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v66YWa_CnSh1_rM707Lne4MF+imML3B5ad4TQ34hZgQ-tQ@mail.gmail.com>
X-Gm-Features: AQROBzD9uvYPfehFAvfWSqRC7-wZ99UgUGl_PBhFagiwx6384R3sEI_1rOb_K7w
Message-ID: <CAGb2v66YWa_CnSh1_rM707Lne4MF+imML3B5ad4TQ34hZgQ-tQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] rtc: sun6i: Add support for A733 RTC
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> The RTC in the Allwinner A733 SoC is compatible with the H616 in terms
> of its time storage and alarm functionality. However, its internal CCU
> is different, with additional DCXO handling logic.
>
> Add new match data to register a new auxiliary device for its CCU part.

This is probably incorrect, since you aren't actually adding auxiliary
devices. It should just say "add a new compatible and matching data for
the new SoC".

>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/rtc/rtc-sun6i.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index b4489e0a09ce..a58d9c6b917c 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -865,6 +865,11 @@ static const struct sun6i_rtc_match_data sun6i_rtc_m=
atch_data =3D {
>         .flags =3D RTC_LINEAR_DAY,
>  };
>
> +static const struct sun6i_rtc_match_data sun60i_rtc_match_data =3D {
> +       .adev_name =3D "sun60i",
> +       .flags =3D RTC_LINEAR_DAY,
> +};
> +
>  /*
>   * As far as RTC functionality goes, all models are the same. The
>   * datasheets claim that different models have different number of
> @@ -883,6 +888,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[] =
=3D {
>                 .data =3D &sun6i_rtc_match_data },
>         { .compatible =3D "allwinner,sun50i-r329-rtc",
>                 .data =3D &sun6i_rtc_match_data },
> +       { .compatible =3D "allwinner,sun60i-a733-rtc",
> +               .data =3D &sun60i_rtc_match_data },
>         { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
>
> --
> 2.52.0
>
>
