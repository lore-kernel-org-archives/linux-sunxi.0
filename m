Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF26B3A8E4
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jan 2024 20:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGC3lkIb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e47dc8b0eso21330335e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Jan 2024 12:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704831677; x=1705436477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SV192nZl7wwZqocnDFeUodUzhIyPq553m7hm6fzBgSg=;
        b=fGC3lkIbO/gbASfmIhIfT81z4KDrYqmaB0lDssGvzA5tyvPC4Bbjn+XSs4ROLmtvFt
         NDkMQJlF4SA5qRdtahfClfWGe9TmARROI7FvX+owMMdbZejs3+CRTxCnL/CO/g4yFw3f
         lXsN8VFhBC8/2iwL3CIVDS/JwPYlQZOipsUd8EqW9dhgtHkeYZVDvKKviYwFvZkn/EsZ
         smOJ0QB+rGafmj3RP3objnWRC3LgK0g9GMHJ5640YiIseALo3jJT2cdBm9kEZHRkUliD
         DRaMk2VniTVedu3B3iLiqQ2mZbIUa41cQqKhPnr4XOcUQKKZ+6eo+H3LYbVWblimV8lU
         VCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704831677; x=1705436477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SV192nZl7wwZqocnDFeUodUzhIyPq553m7hm6fzBgSg=;
        b=G44CK1wohmppYLh+gzXue43p1rN3nVJCnlX6TGRFpaCPg5A2jE1XVDDgzC/XVfkjeN
         Dx+/romnDGm5acJafUC2mDPTteiJQro6hvScLkO2ikcsasxHPBF9gkgEEAL/Ya0caEa5
         iZf3OXCcSFgb5hqd2gneaD5M3+KMiWbtoRhCx2raEQAaSu7N7PvmbNpHJF2CueCff9pS
         /tl8ddl+UBTST7HY5c+EntG+/INehYwii0CGobSSgfvYe9F3tJESKZKTfyVGB3eqalin
         7MK1Rec9tDg17ljB9+l/ifmNeqGy2gCYIF2y0OgdliKu3kGoaaFgFUi4PBEn1TdVs/ZH
         l4GA==
X-Gm-Message-State: AOJu0Yxb8gVW0hFAAVdCbKRjWOn9UoM67YgLBMQ8JCcWxM5QgAKXhPpd
	3j4eQ3hxJeJxaYBBhHFQK2w=
X-Google-Smtp-Source: AGHT+IHG/BUU9h0G4AHEcZub4AHtt+rBOqTvADVCj3ASiPBNesPC+msk3izuB2XDdqx2MI2K3BGAfg==
X-Received: by 2002:a05:600c:4512:b0:40e:3549:9021 with SMTP id t18-20020a05600c451200b0040e35499021mr3368771wmo.33.1704831677080;
        Tue, 09 Jan 2024 12:21:17 -0800 (PST)
Received: from jernej-laptop.localnet (213-161-3-116.dynamic.telemach.net. [213.161.3.116])
        by smtp.gmail.com with ESMTPSA id f6-20020adfe906000000b0033609584b9dsm3213016wrm.74.2024.01.09.12.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 12:21:16 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Wei Xu <xuwei5@hisilicon.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 =?utf-8?B?6bqm5YGl5bu6?= <maijianzhang@allwinnertech.com>
Subject: Re: [PATCH v2] ARM: dts: sun8i: Open FETA40i-C regulator aldo1
Date: Tue, 09 Jan 2024 21:21:13 +0100
Message-ID: <1780716.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <ZYqRZev1g_mztff2@debian.cyg>
References: <ZYqRZev1g_mztff2@debian.cyg>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 26. december 2023 ob 09:40:05 CET je Fuyao Kashizuku napisal(a):
> The USB PHY in the Allwinner R40 SoC seems to rely on voltage on the
> VCC-TVIN/OUT supply pins for proper operation, on top of its own supply
> voltage on VCC-USB. Without a 3.3V voltage supplied to VCC-TV*, USB
> operation becomes unstable and can result in disconnects.
> 
> The Forlinx FETA40i-C SoM connects both the VCC-TVOUT and VCC-TVIN pins
> to the ALDO1 rail of the PMIC, so we need to enable that rail for USB
> operation. Since there is no supply property in the DT bindings for
> the USB core, we need to always enable the regulator.
> 
> This fixes unstable USB operation on boards using the Forlinx FETA40i-C
> module.
> 
> Signed-off-by: Fuyao Kashizuku <fuyao@sjterm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Changes in v2:
>  - Subject include board name.
>  - regulator name changed to vcc-3v3-tv-usb.
>  - explain why we need to enable the regulator.
>  - use full name of the commiter
>  - Link to v1: https://lore.kernel.org/lkml/ZYKjYypuAx7gNuam@debian.cyg/
> 
>  arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi
> index 9f39b5a2bb35..c12361d0317f 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi
> @@ -42,6 +42,13 @@ &pio {
>  	vcc-pg-supply = <&reg_dldo1>;
>  };
>  
> +&reg_aldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-3v3-tv-usb";
> +};
> +
>  &reg_aldo2 {
>  	regulator-always-on;
>  	regulator-min-microvolt = <1800000>;
> 




