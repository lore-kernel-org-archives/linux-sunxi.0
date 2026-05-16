Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D8618EB0
	for <linux-sunxi@lists.linux.dev>; Sat, 16 May 2026 05:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778907884; cv=none; b=VqKZljfSwVDG6FHXm1mfXMRVD6f1hmInF54msq4XdB5YvdmU6G9araxKeYph9jCN6eNEHGYV8+7ujqWjjcJfCh2A7wBj3m6QvL1Hhoe2ZrqdriOhu8qVB0sbTkUhmdzrH8C8WGaifdiFO/Qt19OWA2hBQX50v8Tr8z6fk8OeBKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778907884; c=relaxed/simple;
	bh=rbO3gcaCP001DrFZ8X4JsqATun2Kc1mGof4HOgLgopU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J1uD+seZYUdPOrMrsjaWMcicnODgHQek+ZX3czy4fbnyn3Bs6e2d2Hqjo2GsaiU7lSJqZwzcq3tnZUMkm3Iwdx0TZOnnLJ4C2YgasfgwK3IC9dOZuwxlU9IQjrypu/snDEQKy9AaHx3Z1p/bQxZUM/5XMMacwh0p8zrGEu/yUE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bK9j4n4B; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bK9j4n4B"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so5252005e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 15 May 2026 22:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778907881; x=1779512681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbO3gcaCP001DrFZ8X4JsqATun2Kc1mGof4HOgLgopU=;
        b=bK9j4n4BYwQyew9o2VFCJxtaWG31FtsH8z+LARL0QqukvbmyXTM1DPS+HPMcVSC6Kf
         veTz1S/zhdSHYOpBaPOK1eBb2Lu2RXQ3xKGPvGol52F85k4HesEyYw0NW38rUKu24lFI
         bfCi5iSXsEXSqf5q8FGhy4BOKYkohOOgKoIujwZR2OuyttfPMBdzdaqfcsKRbh9T10yB
         9+jCCX4MFZQXqv38NW/s62I39LCyPJAIwEt+tHpfMdY7COEfrDOsQXf9Jk+TWsNgvace
         56S/zgAzIl10yPhgZV3D4Tdl8t2XP+pOFbeWQ/wh8fZw38jk05QHu94a+AvbGtdRD3OU
         OzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778907881; x=1779512681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rbO3gcaCP001DrFZ8X4JsqATun2Kc1mGof4HOgLgopU=;
        b=SatSW65d2K9Wlt7UQ0pdExNLG3D+1Fsn/vKXbV6fVvQzI1rsbR6cESjaGdaBnT4Oex
         boJZODTIvlnDp6+OZR0wDsJvF7F4hJBtuB8BN9fJdsMAdxFxyct0RNLBsc/hBIgYFluv
         1xNS1gDDMAkyd1H/oAhaOc+LfekV9ZeQD4P7NEstAvSB6b6Imtg6sVP8ONPIG9fzpRje
         U0f9PwGUn6CLCyBut3LKOA+kRnvQsuwjPqwLiS06TIFA2lyXEtSRbap9drLcR+lPH+p2
         4s21fj8sAzgl0EkWUNp7Vr6XBr0u8i1SQh3DYDLJWM/R+8qtMxEDLtIsL7zoVZupw5YS
         vfVg==
X-Forwarded-Encrypted: i=1; AFNElJ8d2oaOGGy6aTfpzyJLh1Sb2A1hxzzlSUr+eSA+g/LHG8kBQhx9Y2XIFNtlt6b/hy5L0mji8PkYRTmDIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLYzs1OzBDH6Sc4xWMnJiIyN2arLjxoygyEThTsm3/mnLAXG6D
	82HbRJz7sbJCz/afkdqwcLnQqsVLp/9b8d6hQZnTyM+Wz1nW9SLQw8iM
X-Gm-Gg: Acq92OED0ptW//Abksv939F3jWqQKKOxdPgelUfmNy8/N3t4A72oFF90Igltb1GtTa/
	s+sprbWoBsfMhhLeg6uEdKWskOgzfbFD12NXy9q0yOL3jDrNq1O6hUk2+Hd9H14rRUiW6BFp1p8
	Y/7uYxcF+aRGKBMpRGIQha8p8lceYNzbbAcSZeFdr9SFIU+/3Vvgthd4JzxBNKWX3F3EbksXpqJ
	TP7fyzwSVNejgylGEA3SP1pVFkrGcmn4Zpt39abF2cYYRMRHxFxEwHP5EuQNopKU+hhnP9J9gpd
	dJ5axOB5Iwy4fV9FK9cQlejmUT9GQtwrhYKkuefyoEaJut4OjZ7oaUg2kxnhN/z1v0f5zyt3zNd
	DEbiYaILOrh0j7bVpANMEPIFWLU9ZWGn83JRnc0RcTiTl4CvsW1qLgOzCAFpzhdtngtzElRgfwH
	SRAQaHZIn0Jsvol6T/rH4RcpEPoqRjrOLzhHgzj9Pu2PE4
X-Received: by 2002:a05:600c:4fc9:b0:48e:706b:53e3 with SMTP id 5b1f17b1804b1-48fe60e51eamr85035075e9.1.1778907881198;
        Fri, 15 May 2026 22:04:41 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm116839375e9.11.2026.05.15.22.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 22:04:40 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Chen-Yu Tsai <wens@kernel.org>,
 Paul Kocialkowski <contact@paulk.fr>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/5] sunxi: spl: spi: Clean up SPI0 pinmux setting
Date: Sat, 16 May 2026 07:04:37 +0200
Message-ID: <BMPMpqHgSfSjFLCZJY9zjg@gmail.com>
In-Reply-To: <20260515234601.15431-3-andre.przywara@arm.com>
References:
 <20260515234601.15431-1-andre.przywara@arm.com>
 <20260515234601.15431-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 16. maj 2026 ob 01:45:58 Srednjeevropski poletni =C4=8Das je An=
dre Przywara napisal(a):
> The function to set the pinmux for the Port C SPI0 pins was looking more
> like a logic puzzle from a magazine than something that readers could
> understand and extend.
>=20
> Replace the convoluted pinmux setup, grouped by pin, with a simple array
> of the four pins involved, and just initialise this array at build time,
> based on the selected SoC.
>=20
> This makes it easy to see which pins are needed, and even easier to exten=
d.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


