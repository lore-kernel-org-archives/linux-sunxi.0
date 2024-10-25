Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BDB183CBE
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869968; cv=none; b=OwTAEZ4MjTg5jZxGzTJBZ85lniZh91BvR68g/qCov5RGN+Mav/gp39cGOSfNtk8rz+g24hyCt15GW+3zL25LWuFD7WTXI6WZopZ2sI6iH3uI+LeXB2sFNhBDoIkWVoWEVcZTo/exPgP3xkzRvMO5oNIUb/jlxOsBQ3VtBtKrjsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869968; c=relaxed/simple;
	bh=6ia13AsyjmX8Lwrwd6wTi0X6BN+p3YatrNjQUOaQp8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jft+dyavCtzN+Sef3bmjb9lZUGpzEPglv6L05CuGp89jkcm28161deGHBdYyd1CeKUeSTsZ19Oziiw5VZJGXlFAXYJvw3eyzubqw8J/K9ajCeK0TEyG5IaBCiY1VGKh6YkTsV9gSgAO5+EsAkO8RGYFnuR8ET+FB9ir1ro7HKVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSqVuRJ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSqVuRJ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104A8C4CEE4
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729869968;
	bh=6ia13AsyjmX8Lwrwd6wTi0X6BN+p3YatrNjQUOaQp8w=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=XSqVuRJ3i1TlNm7Ij1PXyq1CjG9tAh1a+Y9+TQNnwpMltIjHl7NnTnaC8t3CM0IWt
	 aBUKfToSuanvADqA+9NcAqkxJGhnSPuUkToRkeoSh9TXswcl4kD7uLhB7yB1LLjfUU
	 8eQ2XEZ+Q54Zhmrl6KQgLEJaRMpKglMJgTtA54W4G4MAgqM/AiMaKc046tsniRzFmy
	 NhvTciXvxZl84qrso7h8FRhAG5FK5oFvuvwyilCSTCq2Zf4qWiOZVDYxJqEUcQjrl0
	 55o46Et7gwTEI/yG7UBflVwQ+xSSIBkoTbSMSG+IUoVBi6/sIoXIyOHkLSYd3esHAf
	 kx9icxHCw1irw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso23721411fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 08:26:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMPxngfJvKmY2ccCHjx7Ve+vd69rumrAq2MYdOB63zwZPwuTBlhsRX3ANtbXzKdtxxDTgBD35v6ltrHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbJCseltWWbxYysAoh4fbUaZAnWRytwCXFPrG0VehwBmFFQaVu
	Za+9/WN6HuTSQzZwZsgHPbW04eoFnW5JrJzGW+A+UHIGAh1x0DP4BWyX9Bp4soo0CNvHrUjSV30
	XLt9EoliBiygKaCLrsqksM45P48I=
X-Google-Smtp-Source: AGHT+IEo867Ec7Lnd6oshSArzmdEOrjJayECiM82fgnDFcpIVX6vVBB/OWT/04hspcNO1LQEAhBr5g20bUF87HTE9qA=
X-Received: by 2002:a05:651c:1549:b0:2fb:579a:fff with SMTP id
 38308e7fff4ca-2fca8358419mr22365441fa.8.1729869966346; Fri, 25 Oct 2024
 08:26:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241006222148.16456-1-andre.przywara@arm.com>
In-Reply-To: <20241006222148.16456-1-andre.przywara@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 25 Oct 2024 23:25:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v67VOR_v50P2ds2-JYXGwfV0onQRGoa_st5nU0De51-zaw@mail.gmail.com>
Message-ID: <CAGb2v67VOR_v50P2ds2-JYXGwfV0onQRGoa_st5nU0De51-zaw@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi: a80: Fix reset description
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Lukasz Majewski <lukma@denx.de>, 
	Sean Anderson <seanga2@gmail.com>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 6:22=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> Clock gates and reset lines share a common structure in the sunxi clock
> driver descriptions, but use different flags to tell them apart.
>
> The description of the Allwinner A80 MMC clock reset lines was
> erroneously using the "GATE" macro, which made the reset driver ignore
> that entry, complaining with:
> sunxi_set_reset: (RST-reset:#0) unhandled
>
> Change that to the correct "RESET" macro, to make the reset driver
> happy.
>
> Fixes e0c7ce7e52b7 ("sunxi: clk: A80: add MMC clock support")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/clk/sunxi/clk_a80.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/sunxi/clk_a80.c b/drivers/clk/sunxi/clk_a80.c
> index e26d42a5e71..4e37fa39986 100644
> --- a/drivers/clk/sunxi/clk_a80.c
> +++ b/drivers/clk/sunxi/clk_a80.c
> @@ -77,10 +77,10 @@ static const struct ccu_clk_gate a80_mmc_gates[] =3D =
{
>  };
>
>  static const struct ccu_reset a80_mmc_resets[] =3D {
> -       [0]                     =3D GATE(0x0, BIT(18)),
> -       [1]                     =3D GATE(0x4, BIT(18)),
> -       [2]                     =3D GATE(0x8, BIT(18)),
> -       [3]                     =3D GATE(0xc, BIT(18)),
> +       [0]                     =3D RESET(0x0, BIT(18)),
> +       [1]                     =3D RESET(0x4, BIT(18)),
> +       [2]                     =3D RESET(0x8, BIT(18)),
> +       [3]                     =3D RESET(0xc, BIT(18)),
>  };
>
>  static const struct ccu_clk_gate a80_usb_gates[] =3D {
> --
> 2.46.2
>
