Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0852F18A6AB
	for <linux-sunxi@lists.linux.dev>; Tue, 31 Dec 2024 19:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735673510; cv=none; b=IfW6Ne1G+X79kpTPsz3bMjc8vG4VzSupx5AuFLKgSEuLZV70whXW/KW5vkbqxpWE03VN1lAOZPYqDaRUwmUohMjlDRpLs7cHXaOq5pNcft0r1uvTXXd3IopBFEIQHR9pT/dgiEHzo8j3EUg1Rl77+9z9ZBWs8NI+BWVIO79E8mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735673510; c=relaxed/simple;
	bh=1IBP/CbWOe8XNYy1yhGQC0nEhfBHuxql2uqOe/kJnSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uzuTGJf0TxPkmz5P/zdRPoEHmfUU3ZcsyvNOzF/KVoVNV/N11Rv0kpxtLon4lMqexJlyI6OXgbqrNkkjDzadjBxyfRtsZ0P0ipYj6lPHOj0alE5gCan7OYGE9kqPFf5F1jNyNFNmvp+S9cBLVkCk4+6SqRVmPa3Uxm2j2DKgtTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUStbWcx; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUStbWcx"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-71e2766994bso5257066a34.3
        for <linux-sunxi@lists.linux.dev>; Tue, 31 Dec 2024 11:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735673508; x=1736278308; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivUPqyCU6yjFi/yyaL60jmScG9p289+S/O0luR0dfiU=;
        b=MUStbWcx+Z2GuAO7ilHefFPWs8vgbDK4nDjWU2n8c431wMlaJb1QGA6kbZm9XQv3zr
         rrmshIjqJ1Lc4d6fyqkaMuDP4LVxAC17cPspsS8U/0ju+66hu2PihINlVuQzXcYx+RlQ
         fR9sAdy1vnokX8iCpJ9GTuyTkBRmQXDbGfB8/EH6pVUpd1ofyq1pCna9dEIM+fNi8Pxp
         /Nt90iLa7QQLmTmxZORmAOy6LyJ2Am9vcLeGP1huCECvF4mji0Hnpbo6YvpkLalnF/EB
         9tOWPA0W9jxdrqmchPEdAJMgiEWkuJwgo0kuUkuxmW699rtobENjDVsvcTHZfD3dMFBu
         nLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735673508; x=1736278308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivUPqyCU6yjFi/yyaL60jmScG9p289+S/O0luR0dfiU=;
        b=SGedc9xHz/O99T9EZu0P1TRScktUwdgRtcYmVZuWGm/LSXqc3w3+srrFmToE/Fsb2i
         1VgHkvNmpu2Kpjw0F9FveD154dyBBaUoeONqQ9s5SecfI2L3iUwM9w6v5ynr+dBA6cvy
         cbfViDycGZITa/5Z3LyBDkqkcLl8eCtd3+5HII149M06n9jixt5jLIw9U6ii1EnAdQVo
         pazlNHnIMlaiEaDmZmGM4liaX/pA1JH1BWtMXEyLHkJNHFTDFkGaTEw/ihEE0aExV8qo
         NHmZwlIZqFNaI6j6k90HpuL0iqcuXX+8LfrOnbAPI8v3SDAirnNZUuAN+B7azsGOCdI7
         44Sw==
X-Forwarded-Encrypted: i=1; AJvYcCX9N9L7A8FswGQeDiGL0XiOYlWgBqJMJqakuhdq/79WWVaUhq5jM+JP459jz2EpxPishV337zA/HlkFFw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3jb0+CEqgopviTiQl3dQrffyV1rqOWhZRDr5kDPdkhaCHvYXu
	XUW+/V9suQzgb/MWNssrGP/pD9zKfnTZnY/PuUxm6ldUr8At5CpDZSFzEAiDaH32T2Qh2iYEb5u
	nNvDpv6laWRCWqG13Hzmca3MxYMQ=
X-Gm-Gg: ASbGncvzgcxadpT1b8FwLFXZWwSVTm5MRd44G9kGwepjD8rCyNs1tp8Eq+PhJ47eqIF
	nT3Nn8rfartNDzyvwwUX46eAZ2lgCgRPv01o6EdnT/Ua598aA4yNC
X-Google-Smtp-Source: AGHT+IFiaHDkPu6NWg+9kL19uqrO69oJjfD/9cD76ZjPsLNZz5UXh21bTOnwF6Jt2Y9g2MV/ab8KjAxo8UaDb2It1xM=
X-Received: by 2002:a05:6871:7c03:b0:296:b638:1b1a with SMTP id
 586e51a60fabf-2a7fb3fed8bmr20848926fac.42.1735673507851; Tue, 31 Dec 2024
 11:31:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241231165103.800752-1-andre.przywara@arm.com>
In-Reply-To: <20241231165103.800752-1-andre.przywara@arm.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 31 Dec 2024 11:31:21 -0800
Message-ID: <CA+E=qVc+v_io04u2zvF7cjqkYhZKt=KB4+VRtQqOK4BJ2PJx_w@mail.gmail.com>
Subject: Re: [PATCH] Revert "mfd: axp20x: Allow multiple regulators"
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, 
	Chris Morgan <macroalpha82@gmail.com>, Jonathan Cameron <jic23@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2024 at 8:51=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> As Chris and Vasily reported, the attempt to support multiple AXP PMICs
> in one system [1] breaks some of the battery and charging functionality
> on devices with AXP PMICs. The reason is that the drivers now fail to get
> the correct IIO channel for the ADC component, as the current code seems
> to rely on the zero-based enumeration of the regulator devices.
> A fix is possible, but not trivial, as it requires some rework in the AXP
> MFD driver, which cannot be fully reviewed or tested in time for the
> 6.13 release.
>
> So revert this patch for now, to avoid regressions on battery powered
> devices. This patch was really only necessary for devices with two
> PMICs, support for which is not mainline yet anyway, so we don't lose
> any functionality.
>
> This reverts commit e37ec32188701efa01455b9be42a392adab06ce4.
>
> [1] https://lore.kernel.org/linux-sunxi/20241007001408.27249-4-andre.przy=
wara@arm.com/

Doesn't it need a Fixes tag?

Tested-by: Vasily Khoruzhick <anarsoul@gmail.com>

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/mfd/axp20x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 251465a656d09..5b8e88341a305 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -1445,7 +1445,7 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
>                 }
>         }
>
> -       ret =3D mfd_add_devices(axp20x->dev, PLATFORM_DEVID_AUTO, axp20x-=
>cells,
> +       ret =3D mfd_add_devices(axp20x->dev, -1, axp20x->cells,
>                               axp20x->nr_cells, NULL, 0, NULL);
>
>         if (ret) {
> --
> 2.25.1
>
