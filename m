Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C7A2E764C
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754926578; cv=none; b=a9bRzKLDetmF6Ux3mj2fT0IMyqprUEVls7siDz7TkyKiKLCguw1Lg4mDjQAAulTVhO9vt+459C21VkS24VcTF8dJ6dQQmUGA4SoLzVn5Vgi3JIee0pjM9dxw60vOZeYTKKS5rzAT473cVqx+X/vioRE2MACV94daHKM5iBwhtXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754926578; c=relaxed/simple;
	bh=tWFGG3lKFAqsuNPLQTetsjhGwGW+GPzIT/7c4wdcPv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0jMtUpCspIXsWyTIIJhqvCWbNDLA+AZJLPMI8DvQ70DtXROTxB06BZGhwYwkbesbuo4MQ3XJfSErk1R82L2+txRl1JSE7miv/p7nuQXZVqEWSYNOBgk/amx+BbiQna59wvO0CssOWfOEbbJ9q+3OMeBjGaRjWiiTVUoNpnhlw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUwaZyFv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUwaZyFv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b90ab438edso1300124f8f.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754926575; x=1755531375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MARdMrj7j95wET+0GfdIjVDG9+tfCI3tCFzuFFdiH+g=;
        b=YUwaZyFvpmUl7pLHZHeJNNLhI99+jKCuEv5pw+aDt5NFEG3UTPXU8apvLYtf1F80dQ
         iAB6HDso+is3Uv/fI8LisKR47Gjr4jILslNeVZKo4lnwkKnIABgQ1h7N5Euuo/IG6zc+
         5s/FdkT1Ona/aghMmnLHEpkMItEf/cIAaizhvDgK0E6qPr+AWhc5tSCUZ/kxYp6ObLDj
         IgkcXUKouF7BVwzky0BN9eOxClCS01zjU6EXb7rePwS3CZYhY5Q3zh1lmL/Bw9ZK8JmX
         iF7nE69A4F6eyJzfeOSTD7ET83Bh2aAvSOH4nJxwccagerwzSCAuzE1dfpVSLpGRgXIt
         xQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926575; x=1755531375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MARdMrj7j95wET+0GfdIjVDG9+tfCI3tCFzuFFdiH+g=;
        b=muJt+UepxVpS27n3koMWa6QzBCgws4v+jtjCGTtUigaOderYJVvAi0cRoaO+vJxZ5t
         vTkJEtK6izosjloRzvw+T9Kc6rjYYcS3ntvGoxVY2Vew5c5qSuZAd/40uo1dXn8Tb+LY
         yRbccjjPrUAbfujmYBFigozAjmztUlksd1TAy73ES3xEyCZupJ6c4Ci9lwlr3ob0xFCQ
         1/pdTtbrv6kUpCTPh55Z8aNvnBbLHHKrCxDvbC5RnxZ6/Skl73sPqq82SkIw37tSTnr1
         NyIG6Cj8gRPoNwJuuKcxLi/+Be75qOpjYxJ8t5i/xyfk3Vb1MhP/JNM5y3oIqNwnJ6MZ
         oCOA==
X-Forwarded-Encrypted: i=1; AJvYcCXZGunPOrgB14WDkswXNTYiQ8GTt5crpjZFcWF1VfzXUEQq1nYYc2gmvspw0PWe+jIJUA/3f20KVCFSNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YznU/QdnjTJY3t22xv/GcTweoUt/VextRReez5aumRXsaJI+mXb
	PkORg1PUB9xlP2CwfUdWlpqCdGQiKy+Lo/ctB3Pk98boaumYI9WdePcE
X-Gm-Gg: ASbGncvbfieS+3HBHWzVoBIaYlZzUn5mdEa8jBuE6FBBo7tnc/jfxtMOvPsrKShVoqS
	N26+f8RQ6FrSG9LbP6/nzCDo3Ny8OlzTCd/dwr/W+/k+Mv5HuzY/64KKLtiF60rIDzTUh2RaHud
	J10I704WBbxxCUbBUlsgRo3xY3k6K0cHwIwXEwjGADZIWcfh66rOmQhi+rDOLzAxYB0VI/w9BAG
	U8GKH735f+Wt2V3HprqRNaOiee8dj/oRhXCho4VdpdLSaKiCFVHupvJOJaoS+74Z+c3a6MRZ4V6
	GaammYYL9tgVpWmkgyEyr0TOY36uHPpCZyovfGMhuBRGK/2FhWtirpuAYiIsqCnGT0Sv3Xieh7+
	PeTZMrjhdQiK1IZmtunFPEWBVA4CsvYUDA4oCcHmjJ/6QhhGnYBOBd3vXSLfm20t6Ci1mqJd5GE
	PWDsj9IiQY
X-Google-Smtp-Source: AGHT+IHcUY2aaPliOo9PDVkhuEJ3aoGr/a/6EIpAImT58OdOxpU7th0gigMNvkAJrRPT2gYr4jjA9A==
X-Received: by 2002:a05:6000:2482:b0:3b8:d4c5:686f with SMTP id ffacd0b85a97d-3b91100ea49mr143019f8f.39.1754926574712;
        Mon, 11 Aug 2025 08:36:14 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e586a011sm281083275e9.19.2025.08.11.08.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:36:14 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 Chris Morgan <macromorgan@hotmail.com>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/3] sunxi: a133: dram: fix data type for address variable
Date: Mon, 11 Aug 2025 17:36:13 +0200
Message-ID: <8562188.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20250801234918.19176-2-andre.przywara@arm.com>
References:
 <20250801234918.19176-1-andre.przywara@arm.com>
 <20250801234918.19176-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 2. avgust 2025 ob 01:49:16 Srednjeevropski poletni =C4=8Das je =
Andre Przywara napisal(a):
> Variables holding addresses are typically using the "long" C type in
> U-Boot, to be easily compatible with both 32-bit and 64-bit builds.
>=20
> The A133 DRAM driver is typically compiled for AArch64, so u64 is the
> same type as unsigned long, but that breaks when compiling the DRAM
> driver in AArch32 (for some experiments).
>=20
> Fix the type to make the code more portable.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/mach-sunxi/dram_sun50i_a133.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_a133.c b/arch/arm/mach-sunxi=
/dram_sun50i_a133.c
> index 3a231141168..1496f99624d 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_a133.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_a133.c
> @@ -416,7 +416,7 @@ static void mctl_com_init(const struct dram_para *par=
a,
>  static void mctl_drive_odt_config(const struct dram_para *para)
>  {
>  	u32 val;
> -	u64 base;
> +	ulong base;
>  	u32 i;
> =20
>  	/* DX drive */
>=20




