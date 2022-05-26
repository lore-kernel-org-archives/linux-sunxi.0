Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91C21875
	for <linux-sunxi@lists.linux.dev>; Thu, 26 May 2022 20:47:33 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id y13so5199530eje.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 May 2022 13:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zF0dlNUACtjt+qkupNMI+W9KO4LXB81LDpLHAqqq8bU=;
        b=KKvIvjxG35BgXYRE5GUSWo2W1Eh3brqlBtN2mpq5uc0lPq2xirit4nJHH0YMVit0ak
         8jI3FQhvBmg5xAWR0TS+e8BBm80miOcQ3xIZgyyZlB0RIwCwqMFrWwFpQlv0HZsj16Rd
         wFvPF48VR006mQuYqtErwUgKQC1BRWHqfIFWZukdwJzmFaX2yjm2KLcvT7PnZW1VPuDE
         C1pWoEqmVbu0eaWC8Q9p08E8wjGTFDvwDgnikIBNzIMktt3znlazEwdI4dflMdxvOwNB
         WTiiKyJUHo7uJZUzytM4uXOeu3j15TCEiV3Zb33spBgB59tRP6lsP4A/1Q0C07LsXOxK
         E8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zF0dlNUACtjt+qkupNMI+W9KO4LXB81LDpLHAqqq8bU=;
        b=PCOkVZfJsCfqRjQux++95Zj0DQ+Df9dOLH2TdT7IM93tJj+ebyoilpVi+XfnyPOzMz
         QJno8JraSrJqBDap4Ca9LNeNEUlt+fad6kix5LhdYjC+zgD/AoFyT+QB5YLUedVpLdsN
         LPH9N0D7h6UkiyE6KVBsis1hTZ2+n4eb48xXaEB4RO4DXbVvZvm7gM6EwJW5B7kQ3RIc
         KdvJGNDtKGI4yqxT8XZNt8O5d77YJyWaPXx6Hrrpmx88bdX7DKDhEG53Nzi7jaPdMfXK
         +gAcKCoR9Z7o7vSDswQev59GACA/yChj2r2AHOiZYVdmbYFewOW009rqVySD3ktIqjJy
         4mTQ==
X-Gm-Message-State: AOAM53091ClZZ5YEqqCCKkVmXRk5mgY3x09sBH6AEU1VCNq9aejUXyDa
	7JjDRtuk+2sNvNIPsY9270s=
X-Google-Smtp-Source: ABdhPJw0IIXSFXU9ghub7BEMgfUTM2n9AyloyVrpCQcpB3A7OI/7nUffW+7qG0Yk/U2dJqjtpLXiUw==
X-Received: by 2002:a17:906:3a92:b0:6fe:9029:b62c with SMTP id y18-20020a1709063a9200b006fe9029b62cmr35511240ejd.569.1653598051959;
        Thu, 26 May 2022 13:47:31 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id sb22-20020a1709076d9600b006f3ef214dd9sm823554ejc.63.2022.05.26.13.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:47:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: sun5i: adjust whitespace around '='
Date: Thu, 26 May 2022 22:47:30 +0200
Message-ID: <1893171.PYKUYFuaPT@kista>
In-Reply-To: <20220526203547.830848-1-krzysztof.kozlowski@linaro.org>
References: <20220526203547.830848-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 26. maj 2022 ob 22:35:46 CEST je Krzysztof Kozlowski napi=
sal(a):
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=3D' sign in property assignment.  No functional
> changes (same DTB).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> ---
>=20
> Output compared with dtx_diff and fdtdump.
> ---
>  arch/arm/boot/dts/sun5i-a13-licheepi-one.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sun5i-a13-licheepi-one.dts b/arch/arm/boot/
dts/sun5i-a13-licheepi-one.dts
> index 2ce361f8fede..3a6c4bd0a44f 100644
> --- a/arch/arm/boot/dts/sun5i-a13-licheepi-one.dts
> +++ b/arch/arm/boot/dts/sun5i-a13-licheepi-one.dts
> @@ -67,18 +67,18 @@ leds {
>  		compatible =3D "gpio-leds";
> =20
>  		led-0 {
> -			label =3D"licheepi:red:usr";
> +			label =3D "licheepi:red:usr";
>  			gpios =3D <&pio 2 5 GPIO_ACTIVE_LOW>;
>  		};
> =20
>  		led-1 {
> -			label =3D"licheepi:green:usr";
> +			label =3D "licheepi:green:usr";
>  			gpios =3D <&pio 2 19 GPIO_ACTIVE_LOW>;
>  			default-state =3D "on";
>  		};
> =20
>  		led-2 {
> -			label =3D"licheepi:blue:usr";
> +			label =3D "licheepi:blue:usr";
>  			gpios =3D <&pio 2 4 GPIO_ACTIVE_LOW>;
>  		};
> =20
> --=20
> 2.34.1
>=20
>=20


