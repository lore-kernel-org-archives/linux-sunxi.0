Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A33D3FB070
	for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672653; cv=none; b=QKerZsIISderoYJ2KdYV2zM96qPAlk1iOo/5ucIJfM1ZeZEbYjaDBN83gvwG7DYh5UEYtwTxpaAjlIRSfGGCeBIcoPAr5A2sAftFJpGkQlRaYWHq227LWQ4SRTNsj0rRU3MBZZ1aOBxV21VDFTkSuCPlf44L6Ke3OMIYOzGnnPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672653; c=relaxed/simple;
	bh=1a+V7SN5Ad1tvDfgTgTwhX+lul4htUJKibU3Otb53LQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=IAXpr5MzEJjZL3W6T/Ehgtb5vPiwY61XINmFi3F7kptn02QO5ZB8xXWkNVXP/mXRg/ujaDb4LxB5sMELnVFG3oewvLNihnhkUP3SM7+nYML2gHz5o4Z+85fUV5zeMuDxifQ1QcX03uPAsB+0BYMKJ5/FH7uJzDJ4b0qdx2nhXw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyci9Dbm; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyci9Dbm"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so4420322a91.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 04:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778672652; x=1779277452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qYAcfX5TZQ1aO/tUlnMIN+1pF6qLETPLwxG8ZHIUVfI=;
        b=pyci9DbmN7dQu4BUg/KSpoBpvV/eQVzYna+6J3OA3mYWgOkQfU2OS/6y/4S/WK4H6p
         VmYlWAUHDv37xeFMVhCNbpa6cXxsLT2se7Lcsk+ijwFWIz/cYAefBVc6hm9syQfp+xzV
         sSwqFupgAf7EEf/DgDCddgAKmX8kCYKxtkyE2L6IU7sAVVpOKG3WHSNfar40qJlnAzvq
         YR9KJOkWEFnjaIjkRQ+kNTlN5o/LNaNe3ye6GAwbrWPuynj043LeBvBY+mjgdbgebihU
         8Q/RjCftX8rSUdmOZ8WA57AylXGxvpB/IKjt+7Ct51NcUC93xdarM8WbkpfP3YKjXv7Y
         WftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672652; x=1779277452;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYAcfX5TZQ1aO/tUlnMIN+1pF6qLETPLwxG8ZHIUVfI=;
        b=SvOyn3Hy2GPZ2L6nQCMiqh14lAAr1+q3ZYdJdy3GLp50dPEOJC8C+BAxy19Ofu5WZM
         r0OJG89tZ0m5llq4lYJ/GmY0VmaE+zVKYtTUQWnvoSgJKwgWC71osi/u4wo6McZMTWPo
         pljZi2mfwtopA72q5FKgq0pBV25MiRSitb7yktYYyH7HM++XEkxjM3vnsqwTTM5KVbJI
         u3fYxhty+lgLdf0i18DAuekrLt7ffdICRN7KWOHRMwputVpizJHae+Q4taSIme98D3ys
         ApLKegxB14THJNnhB8PijdRZwE8/iG+h1dmsgwkY4dpl+QS9JK0/K04gORSSMS0K/uuT
         QjGg==
X-Forwarded-Encrypted: i=1; AFNElJ9mh1JNfgMIYxwWxbtdeXLeYMTAx3AAOjPEqtsyXA+UbzSdkwHoI2m75gWJ/caqTOh0pVbMTF8YJT8ybg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0McKgwmBNFqCPIcITPpfWNPEKBkKQOvtWfaKuXtaLkmKD0Fzy
	BJoV3FUxm1Dq2mpQ8uHURNlTO30FUYXeAF6hKWPWV2F8//8+ZhGORCHd
X-Gm-Gg: Acq92OFXG3Es89JQR436XnpmrZroo/TgLlZJ6CIaSzp2wBiWCXVZtTvd40z0SA/ci5W
	5rl8wVWqJH1iABI3y2/x97TYigcqXlt/ARmxhicrpodJ8L2QMNzhdF1xdTAOmyuIphmE0YJcH0j
	qsumkyj+l7RpETsD3RZs+0LMcv8YR2xjFCViZv5ftFws2w67MwLWuYj7LsbkrUcYWzuDKyBbrAN
	k0V3H7FaU8T0z7uRs0V7N7AfVY/bAoIJ7+u1gbDdsXmrPjX4eYHoyFsvxGMDEbiO8iBJZ0K114a
	Ulqo16x6TxUqp9B1qAzIUzrAJI6EgUHVfLGzaHDt9JJgJEjGyDrzG6sbokYw1nnOB2pEIe46tSP
	uPPM0EDbJJsbWj6kWKoMxrlhsfwL6vMc6Yx7eGw8RxPAewTGTpqsEANtbKAwu9KqTtebkDJm1cD
	HAfW9RchegKMHl8otqjzLVTRLRK6iSvMZkdlOW/os9AXszZog=
X-Received: by 2002:a17:903:9ce:b0:2bd:56c:97ad with SMTP id d9443c01a7336-2bd2ec5abd3mr25711825ad.0.1778672651705;
        Wed, 13 May 2026 04:44:11 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:ac0f:c362:ceaf:f4a4:19f1:7e92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm204870005ad.36.2026.05.13.04.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 04:44:11 -0700 (PDT)
Date: Wed, 13 May 2026 17:14:05 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?ISO-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maksim Kiselev <bigunclemax@gmail.com>
CC: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
User-Agent: Thunderbird for Android
In-Reply-To: <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
References: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl> <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
Message-ID: <A7772824-E704-4BFD-A796-BCD81197E5A2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 13 May 2026 10:29:43=E2=80=AFam IST, Michal Piekos <michal=2Epiekos@mmp=
systems=2Epl> wrote:
>A523 differs from existing sun20i-gpadc-iio by having two clocks; bus
>clock and module clock=2E
>
>Change driver to enable all clocks=2E
>
>Signed-off-by: Michal Piekos <michal=2Epiekos@mmpsystems=2Epl>
>---
> drivers/iio/adc/sun20i-gpadc-iio=2Ec | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/iio/adc/sun20i-gpadc-iio=2Ec b/drivers/iio/adc/sun20=
i-gpadc-iio=2Ec
>index 861c14da75ad=2E=2E3f1f07b3a385 100644
>--- a/drivers/iio/adc/sun20i-gpadc-iio=2Ec
>+++ b/drivers/iio/adc/sun20i-gpadc-iio=2Ec
>@@ -180,7 +180,7 @@ static int sun20i_gpadc_probe(struct platform_device =
*pdev)
> 	struct iio_dev *indio_dev;
> 	struct sun20i_gpadc_iio *info;
> 	struct reset_control *rst;
>-	struct clk *clk;
>+	struct clk_bulk_data *clks;
> 	int irq;
> 	int ret;
>=20
>@@ -205,9 +205,11 @@ static int sun20i_gpadc_probe(struct platform_device=
 *pdev)
> 	if (IS_ERR(info->regs))
> 		return PTR_ERR(info->regs);
>=20
>-	clk =3D devm_clk_get_enabled(dev, NULL);
>-	if (IS_ERR(clk))
>-		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock\n"=
);
>+	ret =3D devm_clk_bulk_get_all_enabled(dev, &clks);
>+	if (ret <=3D 0)

Thank you Michal for the change=2E

Have you validated the changes ?
It looks while success ret would be 0 and it would give return error=2E

Thanks, Sanjay


>+		return dev_err_probe(
>+			dev, ret,
>+			"failed to enable clocks or no clocks defined\n");
>=20
> 	rst =3D devm_reset_control_get_exclusive(dev, NULL);
> 	if (IS_ERR(rst))
>@@ -243,6 +245,7 @@ static int sun20i_gpadc_probe(struct platform_device =
*pdev)
>=20
> static const struct of_device_id sun20i_gpadc_of_id[] =3D {
> 	{ =2Ecompatible =3D "allwinner,sun20i-d1-gpadc" },
>+	{ =2Ecompatible =3D "allwinner,sun55i-a523-gpadc" },
> 	{ }
> };
> MODULE_DEVICE_TABLE(of, sun20i_gpadc_of_id);
>
