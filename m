Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3D4202992
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742732510; cv=none; b=exksMgBvuSM8MnTBVqSoG2jb/CB111Zej4lPOmBnU3oFft7BPTIpag7EB34A7oOcmzXE2xpWLulPBB9SOUeF8na6VvFnbAEGeaDUMAF7YMr7rC/q82j3qCcoqaCJ3HVkvW2JaivP80W6a1NveJSjxrolpkipvlbwD3KB+9dPjzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742732510; c=relaxed/simple;
	bh=1VFq6uMfYqkj0AAORYslalUN6RwxlBL7R/ojnrd+vjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e4i7R+F/wemcGxIZI4onmSDKIi4It1jdhNRVWKsJDeVv9LwtPhehFwxuQWFAq+UUI2d5mw3IZ35L7ys1dmF8aBXjUBqBFvZqYfK7jFwkvgzouv5dGaVrjDYYnWHE6TMnnD2R5FK6GRfZpn3D2Fs6GqtxO8m3cJ/iLpXFurX9if8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5Qx3KRW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5Qx3KRW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3995ff6b066so1980629f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 05:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742732507; x=1743337307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CD9fiySrjSJymCyfiJ81CRwTFuIUBgVU3mKrzaw5TP0=;
        b=S5Qx3KRWYsHC6+EjHbVSmWiJmlSymolsKYLz6C1BBjVRz0cn4dfmFkX3/uwrQv3mUG
         EZGYiXvP/Kz6aBGXJ04MyZWwAhK6jcB2fxezmRTzRjdP7wfAiPgDkZnGEwhfuH9OjBj8
         i3vOC/k1BJDrGi6d95LBa0HkYBHJFhCUEpu2hx4WsSI3i0ZARC/mkCziO8zTJkKrCgov
         fJWJY2pzhWBkC6kk0qoySZgVVy2jbZPRcHV2NX9HmpnQfDNZp1nTg2Bfb5LE6qsoBIWz
         8ANAkBFR+FScIOPJmGl/tsn/t91WQO5JpDzC/GLYADxO49ASwnhI3J6tTdPQkxYU55mt
         bvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742732507; x=1743337307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CD9fiySrjSJymCyfiJ81CRwTFuIUBgVU3mKrzaw5TP0=;
        b=Go/nNkdh+S3zr2evp+RmABz45hex/opSd/lS+/D/gcu9ygJEB23uz3rrxh1LX4bXTQ
         BJnQixhLP+8qs0suG4qWFkzB2u9nSN+RUuKcZPRWWtInGfm4EiOXkpKQhiPQhTscylZ1
         DAwKihVX9ATs6oeVRPYmeHCtBfFSqRv4vcVhKboefUp+fTFVgTuFTIeMAohcF6qLHBWA
         wzjmomZm1+GeXKFYMxL7InTPk29r6XfMqyXNaBSnZTPxP92NQqSv+ZO18ppToJQxGG/S
         6V4Sy+9FPQdIlUWOFastAZpf8qAVMMpgT9gDI3qdfo0KPVwOJwNhg9ynKcbsUaHWgF50
         HcXg==
X-Forwarded-Encrypted: i=1; AJvYcCWT8a52K9jaChmmtfu0ALO0Y6Jrve9LDXNIv2gfUUiLTKQsOnIvowi/9Y3JUwQq4UoTpxjmWbnNF83P5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZYnhhN8y09DgoWh/+45so/k87wlyTAZqMIQPg3wDdDcgjX4t6
	FOlAUX2GWkFPJKOlkAakZY8vPgsEYyHXDzSKMKvr3ixZkkuHiEPj
X-Gm-Gg: ASbGncuZCfxLGrB30atutgXbQTRSzWtwd0+We3x9EIGp27GNOuRF5UtLJB8SVTT/6z4
	WWQIp1eKA8iGA6b87ONol+7BHCj+HwZNXkCqxEFDIqpy3Cj66g1yc4CkScBVhTU6eGdqARhZkk2
	NZaQdQouQUDUGVsnHdIXpuz4Xhj+prFPDc/d69JDGgUT6g+zM9CAYRH+/eZwcx1qcKUpPeL1TId
	QecC3W53HXMVcNlFlwibq1bcsuT/3FCaHDEfsb59b6aJQW9yEZDyNS0uWCZTw/FUqAhjSRUD/zx
	UKuebPhW+GLvirGT2Mi3VnJh5OvBwbr/ey+RGqFcGpOdyJUVbDxaKDpKpm1t2Hbl4G6B8qbFS4w
	MNZwqT6MB97lQ7Qo00nzn
X-Google-Smtp-Source: AGHT+IEnFssmByWF6LQ07zj3s5eQ1YB6d+qCuh54xlEPBKkvmQX4FCl8xYyU1T7s4HPRY2SITZYy9w==
X-Received: by 2002:a05:6000:1788:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-3997f900d5fmr9220163f8f.9.1742732506589;
        Sun, 23 Mar 2025 05:21:46 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9eff6esm7576566f8f.100.2025.03.23.05.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 05:21:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Mikhail Kalashnikov <iuncuim@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 22/34] sunxi: Kconfig: consolidate SYS_CLK_FREQ selection
Date: Sun, 23 Mar 2025 13:21:45 +0100
Message-ID: <8502726.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20250323113544.7933-23-andre.przywara@arm.com>
References:
 <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-23-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 23. marec 2025 ob 12:35:32 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Most Allwinner SoCs (used on 107 out of 172 boards) use a default CPU
> frequency of 1008 MHz during the initial setup in the SPL.
>=20
> Make this the fallback default, in case nothing else is selected, to
> simplify the Kconfig stanza and make future additions easier.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/mach-sunxi/Kconfig | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 950b9047470..ab432390d3c 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -716,16 +716,10 @@ endif
> =20
>  config SYS_CLK_FREQ
>  	default 408000000 if MACH_SUNIV
> -	default 1008000000 if MACH_SUN4I
> -	default 1008000000 if MACH_SUN5I
> -	default 1008000000 if MACH_SUN6I
> -	default 912000000 if MACH_SUN7I
>  	default 816000000 if MACH_SUN50I || MACH_SUN50I_H5
> -	default 1008000000 if MACH_SUN8I
> -	default 1008000000 if MACH_SUN9I
>  	default 888000000 if MACH_SUN50I_H6
> -	default 1008000000 if MACH_SUN50I_H616
> -	default 1008000000 if MACH_SUN8I_R528
> +	default 912000000 if MACH_SUN7I
> +	default 1008000000
> =20
>  config SYS_CONFIG_NAME
>  	default "suniv" if MACH_SUNIV
>=20




