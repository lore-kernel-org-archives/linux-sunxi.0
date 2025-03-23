Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC54202992
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742732583; cv=none; b=GWh3UgV4/b/FZBzUJhecKw0kBklw8cmpmrhmL4lUl9j53lTApFcrU8cdf5Gywn+sBNy56OJc8Hd7dII26c27sf+A+IJycB/Qgk7Ik4h8zopOOpOzq99l35u5caX57L4j7qPiGiQS7AEKOOQpdiNU9iKUrmPmj2UGCoh2abcj38c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742732583; c=relaxed/simple;
	bh=DTdIfrNn1k1oB9hKV+by+eO9U8QMFK5a1AfMFrSLvu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ruDvAVxzpQpR7qKJZfyyqDcB1hIZ3cZAFweMbqXNpKOgwzVQgo8C0asz6a61BYN7TXLvHYhoyiqOdg/3SRM5Qm1MueWvVGXuRZZmaBcYGk6aXL1Mw5IJJjWCZUSPL16lLzNk/qe7cc19cp3x1xhkrl3KJKHOOG5Xhg0GbyOLK6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4IzI1g8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4IzI1g8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso15874785e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742732580; x=1743337380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyB7aI8jg7npvoARedijEVN3XKQW+Kn2juSZr/TPcms=;
        b=h4IzI1g80EpGVEZMt9buCKfYsHvcWVVnyJK+00H9vwV5ras/In5FwZbmtPPSGVaqKA
         wdRmyMrlBI7s/BAmH//fL/NqRkhe4IchPhVRfAGd6nTKVou+1LdqXizejhl8JR+MjT8o
         K7lDwJSORB5lkAWNeMxtnyDPdpJHJ7P3sq/Bigfz1DpUJuYB88+Qu+vnVsLkxQch7db8
         GTHoDmFPtZhv0B024g2yNu4in1B0H6XX4rkM9c35/u0FPH+vdMDjf9XIxWJZI7Pxv+hQ
         fRaX4o03UeKGxOLTO2PUiIQEO2DweZBkOVQqwb93Wed9hURkqVxjV4M8tfsPbs1RurFK
         tXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742732580; x=1743337380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyB7aI8jg7npvoARedijEVN3XKQW+Kn2juSZr/TPcms=;
        b=JuY7tC3NvgLZd13p9VrtoALO7AUMbe48UfeT/nNNDko0haf467m1KAN9o3oj+E4i1E
         wcMeUWOK3mp92G+YZkGe4h756+LdMzrlPDw+KIbXTGRKdV2M23078+sCUzJMweOSbkek
         eov0fyi9k2RG3lwK4lLBY3yK3mnY2+GngKwxZIoOs7/bLCFg3tCa7PN20T5YPW+4IEpQ
         jzqhSarVx1M/obOwnMgMFIoQihM7fgYAg7lk8iYQE6Kua8UrA9APruU8d845YJDeVWgU
         1WSaIgiFhnriWpbBx2fXDg35/Q/2OFowijbEgM+If9Rl7QQ4+c8qI3efoDrnpgyayWN1
         JnjA==
X-Forwarded-Encrypted: i=1; AJvYcCVjnLGSRrUdGeacIWsDMKG9c3LRzJ5rhsZNeE6Vok67X3dbL2qvDfMs/kAzjJoXvIK9s9qJMzRW20VtKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTaXrOwLx0iDfJTgxaj9eN9PJ0QbbjiPfAH3i/z0eqpaUhmjPR
	wwZ6efXb/Z1u0O8KZ2tOzZ04JzTRf8V1RQhX0DaDLsWEfH21sS78
X-Gm-Gg: ASbGncs+0QRRMiplRe0w6JLY1ldB5ugeqsBjG3BYu8pZT8vNqxX/Mj5E92jTCNIA572
	Wl6vtPkApQw04uURr1P4opFpjd+vck+lR+9APCrsppt6wFRSi6cRSwrapbxrXajAQbo352fbdmv
	AEHy2A6kOvbZpAF0uQfB7/72/8rhT1Ifzy1wcE7hvYrr7Ax/LcJjyI0d/Y9sK08XbZNgYmsHwv7
	Zyc5cz3E7I8sR69yuKR2AhNBQcOYuEL2su8F5sZLar1tZfeKeXvWT1D677BBnkhXwhOrRPtgS5I
	lBvhZBY+MJC95m9RGh5Jm8MOV/L5XOAwnFIfM8XEOmQBc/Oh9OjyI7ipvYjzjwA4dsHTYbIuUD4
	vLXsTeXVRtFpuG5Op5Nxq
X-Google-Smtp-Source: AGHT+IEEgs4EmyttTAIIb2dfbTBM6Ehc3DEXjELIzMzApLxtN+pUUFtf+o3D2xiRB9bwn5jaHx5gLQ==
X-Received: by 2002:a05:600c:4686:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43d509ee23dmr90116815e9.7.1742732580211;
        Sun, 23 Mar 2025 05:23:00 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd185c5sm84411325e9.15.2025.03.23.05.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 05:22:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Mikhail Kalashnikov <iuncuim@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 23/34] spl: reorder SPL_MAX_SIZE defaults for sunxi
Date: Sun, 23 Mar 2025 13:22:58 +0100
Message-ID: <2300711.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20250323113544.7933-24-andre.przywara@arm.com>
References:
 <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-24-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 23. marec 2025 ob 12:35:33 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Reorder the Kconfig defaults for the maximum SPL size, to make the
> Allwinner specific values more readable and extensible: many older SoCs
> need to be limited to 32KB, so make this the last ARCH_SUNXI entry, used
> as a fallback unless explicitly overridden before.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  common/spl/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/common/spl/Kconfig b/common/spl/Kconfig
> index 94e118f8465..29d30f5040d 100644
> --- a/common/spl/Kconfig
> +++ b/common/spl/Kconfig
> @@ -80,11 +80,10 @@ config SPL_MAX_SIZE
>  	default 0x1b000 if AM33XX && !TI_SECURE_DEVICE
>  	default 0xec00 if OMAP34XX
>  	default 0x10000 if ARCH_MX6 && !MX6_OCRAM_256KB
> -	default 0x7fa0 if SUNXI_SRAM_ADDRESS =3D 0x10000
> -	default 0x7fa0 if SUNXI_SRAM_ADDRESS =3D 0x20000 && !MACH_SUN50I_H616
>  	default 0xbfa0 if MACH_SUN50I_H616
>  	default 0x7000 if RCAR_GEN3
>  	default 0x5fa0 if SUNXI_SRAM_ADDRESS =3D 0x0
> +	default 0x7fa0 if ARCH_SUNXI
>  	default 0x10000 if ASPEED_AST2600
>  	default 0x27000 if IMX8MM && SPL_TEXT_BASE =3D 0x7E1000
>  	default 0x30000 if ARCH_SC5XX && (SC59X_64 || SC59X)
>=20




