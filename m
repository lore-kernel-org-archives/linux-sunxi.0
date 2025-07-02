Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A8A2F5E
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Jul 2025 05:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751432482; cv=none; b=L9w/Y7QnVaGc7RygYXv/zNYyAnkyb3qubJFfmv4fQUAmacpZOrwJh1kY+l17j091GgZbQ0CTUIZ6nercQ5rMCEXKRJV0y34eqOtiPdMrDHPdsxzX0McNDdgGWEWqy4PuBr64XoV/A98fY0+qynkDp/e0ibgXMube2tktQVTTiuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751432482; c=relaxed/simple;
	bh=aM2O311AG0MI5x8qPgoLBcOvvK+KMw4egyrI2NlTIh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNWG1BqtqjPsfXE7ge7gcPMwDuU8cA63VPm+jIq7AABz0vR/cC7A/ZmeZ1KZVbnHjBRYfumFQIVqZ+q3TJMkLw/SgZlWsJfvNe8gS60Dn0JDa3xtTd55whTC8ZZclNtgkLd3eQzhoBtORf1UvFMJyV3coaUa6OUk6jz7rgr2EWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b82f3767so4589133e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Jul 2025 22:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432478; x=1752037278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V0rt2nH/TWlCePhqIMfxbMwVAseEB+3Yn8nvDGBHf0Y=;
        b=iUp/0b3GHa90dNu8VSmlwdr0BUVClPusobKjs5lwZYBOgZZecwBFphUa/iUCZOErkD
         4oJeKAt1/TdHU/yJxY5GgqYtGaPBP8Cg05m9zw8/vH8rcdoK1UZS2qAEqmlO8flW9/pK
         9TokE48PuBz1KCpDTTLo1sk9KfCCWyz0/j9kNIHS1bYq8vb3jKhq3QGapY+eDyJfi1pd
         EMLVshBECEnCLUdwD/Z7lAuSTVNf2jBHtSJ6gWVVpOXntw0DYeFSdjPtR8YJk6tQZV4i
         iT47pUi0ygqO7/TrmGWWT87MfjAYPcfMIB2IN1b37u6LMEF8tfDMpcv9qU4GnPAAGQFJ
         WSiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJntI7wHZuh/IsA4JerO6xBHH9i8pFOs9xbtYHnnnB1Sdile7AXclYG4jvIXnqNU0h5Qh7Vw0lWfdGeA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/srCCTBN1QTjf7Gcr2lMFbFX7ToUWD8g2vA/MFoVGlNPIl7T1
	+xE2LR+tNhYbjUkMmfAJni0gwHGZ1ndC0pjBgg3AWHdBQa0ou9KOnSdRv5ETkP7F
X-Gm-Gg: ASbGnct60AC3HPU28MpGddcaneY+tJwPZKX/0tuR5hbogRdywU5f+dhIjYpWWpUc8YR
	AHk2kuKxbyWbbN/1XAP+DCuXhPONfKCFIqj0vvmIEBKnNCyhXAFRQHzk+jyWldm2y5fia9cgHn1
	A0pyM6iWvgwIFFJUz4mx3zsAWJNFGx5Kx6ncUwxIfRXi/BQl83QK5vSqU3KQrlPvxxazHrWpPJw
	gM4JYFA9H01roh5xwumnr8MW4K1SlR//GbWFJwaRhEpirHIOoqM7PBZRTbHRcxZerKAtiix0nLN
	CkCGPQLjfSpmg60hJ7ZpNjTqSxjJDi6sQRD5Keb2CmPrmy5DKAGIrT/T80YQgrvOHEjCwNTowYZ
	l7aq4DsLpk+MVYUUMxDs=
X-Google-Smtp-Source: AGHT+IFyVvt3cztPFfw1gr5c6WkbcWIED6/2PJ+T3+CJiaPVGboL0iQeq86Yro1fXaZHJkV+WbdzTw==
X-Received: by 2002:a05:6512:68f:b0:553:2355:1f26 with SMTP id 2adb3069b0e04-556283872damr455383e87.50.1751432477943;
        Tue, 01 Jul 2025 22:01:17 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24028esm2032924e87.19.2025.07.01.22.01.17
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 22:01:17 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so38898211fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Jul 2025 22:01:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU22NDjt6bcWzWTe+G77uWoOXTeA+eGsbfawHz3P+Xjp5i0u0l8J5S+Ii6aoKvcvSPdKMW04wfK/+s3+w==@lists.linux.dev
X-Received: by 2002:a05:651c:e1b:b0:32a:6c63:92a with SMTP id
 38308e7fff4ca-32e0004b940mr3217911fa.22.1751432477399; Tue, 01 Jul 2025
 22:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701165756.258356-1-wens@kernel.org> <20250701165756.258356-5-wens@kernel.org>
In-Reply-To: <20250701165756.258356-5-wens@kernel.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 2 Jul 2025 13:01:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v646HvqipGd_C=WJ4LGsumFfF5P9a7XQ7UGO6t1901DDiw@mail.gmail.com>
X-Gm-Features: Ac12FXxOhT5Y9cipxD-0Dp_WlsoVmLL1HMEja_1PgcoQyh6p3ZogoQeQ7CimJkk
Message-ID: <CAGb2v646HvqipGd_C=WJ4LGsumFfF5P9a7XQ7UGO6t1901DDiw@mail.gmail.com>
Subject: Re: [PATCH RFT net-next 04/10] soc: sunxi: sram: register regmap as syscon
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 12:58=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> Until now, if the system controller had a ethernet controller glue layer
> control register, a limited access regmap would be registered and tied
> to the system controller struct device for the ethernet driver to use.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/soc/sunxi/sunxi_sram.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sra=
m.c
> index 4f8d510b7e1e..63c23bdffa78 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -12,6 +12,7 @@
>
>  #include <linux/debugfs.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -377,6 +378,7 @@ static int __init sunxi_sram_probe(struct platform_de=
vice *pdev)
>         const struct sunxi_sramc_variant *variant;
>         struct device *dev =3D &pdev->dev;
>         struct regmap *regmap;
> +       int ret;
>
>         sram_dev =3D &pdev->dev;
>
> @@ -394,6 +396,10 @@ static int __init sunxi_sram_probe(struct platform_d=
evice *pdev)
>                 regmap =3D devm_regmap_init_mmio(dev, base, &sunxi_sram_r=
egmap_config);
>                 if (IS_ERR(regmap))
>                         return PTR_ERR(regmap);
> +
> +               ret =3D of_syscon_register_regmap(dev->of_node, regmap);
> +               if (IS_ERR(ret))

BroderTuck on IRC pointed out that this gives a compiler warning.
Indeed it is incorrect. It should test `ret` directly.

ChenYu

> +                       return ret;
>         }
>
>         of_platform_populate(dev->of_node, NULL, NULL, dev);
> --
> 2.39.5
>
>
