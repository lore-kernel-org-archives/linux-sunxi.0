Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20851FBEBE
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 03:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745553223; cv=none; b=hbtdTjKT+1rt6tPoI5yzaQynDTI6hYWlWP9YbaTQ43a5wAFOXU0WsEANd/m0sc3MkpYUB2RutJxIrCHG2J2UK15pHXIIzLZKh87jHm+B2OnOrSPEeK2eWpKkoP23JHUKzjqYHTSTNd8Fbve3akIhs6HNDn5R4gwjtj8jirSWJYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745553223; c=relaxed/simple;
	bh=VztMRKzeOesNfHq7g9+wiowKS/oWGEpXbSGKWsDLxuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4MfAP4uJahFPHNgp6CtdOitq2G2P+FOcfmtoRt+wHo/gMEb1laTzdQRoD8hPpa9bl4bwTBl5lFbXR+p0mbqFkkBT76uopeqGkJFs+BKl/lRNMb6UzTMm4eV1Y5ycwExERgYsnxIwGU3aNY3N2m1Ycud/7EXmgPm/394lAwbcWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85b41281b50so70117239f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 20:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745553217; x=1746158017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4gLbG2Dv99fli5CpF3p4x5McAYSv7OcSMqvlFvR3oA=;
        b=Lv98ig57rrFwbABPnv6AbPBjpVJmSNtckotCo04beeHrqJm6Jaz960Pi8FdtnR9nlj
         roBoBlS4E5x6n9z1rpY6sKrQphseu+oRcGyA3MVIQCoa+1384kVT2uPn3nAMjW7p1uYK
         lnPVriZ9G8iNlKfcQnwCwA6a55PvAxE3qjttbedvezrMdOfvcVSMlP5OPVoxHs99YqpI
         lVqe33YK7W6Heqb5q8PUmdwlavFuaTuBXQXQ6hhSZ0R5ug3wb55fh+Pfq4gFzeZZ+M7j
         9FkxjTBRG+7+rbY7dPlC6HYborvYCyXHHIX4wOlIau8MyKlka7NVk50sGEMAxnrjrstV
         a6lA==
X-Forwarded-Encrypted: i=1; AJvYcCXqso2VpNwfk8YiXm3/dDI/S9SS+9SDYIOlxMYNoxpHsnR2Z2opQprrXihyZmNmOtTFkrixKHN1j37P1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEN+0MU3cXz5Jx9dYUER4GMpa9/zJjUtsK2NRf1LgPwmZEcCaY
	qp5CXEvcsn9DJTXHGvBWg4TBkzf+i2gBLBF5wIkjyJS/Ro42ckTWK4XxXNjR7nE=
X-Gm-Gg: ASbGnctst2tiGcpz+81UO6Z2784HRxjzSbYGVrojiWeMlrmMScFmtsJml7n12ya7ryo
	DXQ9829EhpKF7mG6MT7mjdysP8PlsgN/+xjTVisasmUm6ZxDDr5zThyCm8uEovwCYj7epN4fFdX
	Jbz3QJOasFhdaVU6FzAqWykAZruaOCIBSZiuq6G+7Mof4wwK8QUbihAeEd1AiGjAVcJq92iYptG
	iva56OKKM92tikV/Yu3IJ4XpvcXLvwnRwYYeVadNzxiNtUHEBvJLYf7TfnbBqysuYXaQdP1qgCD
	4C5GxoyhoagR51BaTWzIStsQwwSr/UAliTfb1hw/OPpdojU3euYCS+jl1y9cZYbK+UYH5jTfBQ=
	=
X-Google-Smtp-Source: AGHT+IGldwtRq99wLiidHkp8rCNWbTY14nxEDN53jJdt9nGVRC4ys+0mH+S+BKnoYk+QwY0FyGDrBw==
X-Received: by 2002:a05:6e02:1785:b0:3d3:dcc4:a58e with SMTP id e9e14a558f8ab-3d93b41dc14mr7367925ab.8.1745553216670;
        Thu, 24 Apr 2025 20:53:36 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d9314c7e0asm5149825ab.18.2025.04.24.20.53.36
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 20:53:36 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d938fcb70cso1647005ab.0
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 20:53:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJ4l16y65u0xKgeAmdXr8yfdnFx/pw2vGxW7mC7J4gwPW9lolglQBtiBQUNegbuXP+jWGdH1/XSGaFhw==@lists.linux.dev
X-Received: by 2002:a92:cd8a:0:b0:3d4:3ab3:5574 with SMTP id
 e9e14a558f8ab-3d93b3ae9fdmr8037145ab.3.1745553215789; Thu, 24 Apr 2025
 20:53:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425003422.3465-1-andre.przywara@arm.com>
In-Reply-To: <20250425003422.3465-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 11:53:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v66vr_X3cB1g-On9opGQ7a4j1ASQyi4G=fqY07safrjfFw@mail.gmail.com>
X-Gm-Features: ATxdqUGK_blFRIEkriAwI7w8rQlOD9oM5XGsLLIwKX1qwqnzLE3yxYAXQjZKka8
Message-ID: <CAGb2v66vr_X3cB1g-On9opGQ7a4j1ASQyi4G=fqY07safrjfFw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a523: fix SD card detect pull resistor
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 8:35=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Trying to use the SD card on the Radxa board revealed that the card
> detect wouldn't work as expected (insert not detected). Looking at the
> schematic shows that the pull-up resistor is actually not populated
> ("NC"), and the transistor just pulls the GPIO pin to GND, but it's
> floating otherwise.
> So using the pull-down flag is definitely wrong, we need the internal
> pull up to get a reliable signal. The same is true for the Avaota board
> (there is no transistor there, but it's floating in the same way). There
> is no schematic for the X96QPro+ board, but experiments show it's the
> same behaviour.
>
> So change the GPIO flag for the card detect GPIO property to activate
> the pull-up resistor for that pin.
>
> Fixes: 80e0fb4e491b ("arm64: dts: allwinner: a523: add Radxa A5E support"=
)
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>
> please let me know if I should split this up into 3 patches, with proper
> Fixes: tags, or if you can maybe squash this into the original commits
> still?

I can squash them in if you prefer.

ChenYu

> Cheers,
> Andre
>
>  arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts | 2 +-
>  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts  | 2 +-
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> index 03c9a9ef5adc2..2d2f3af91d05e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> @@ -56,7 +56,7 @@ &ehci1 {
>
>  &mmc0 {
>         vmmc-supply =3D <&reg_cldo3>;
> -       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF=
6 */
> +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 =
*/
>         bus-width =3D <4>;
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arc=
h/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> index c0bce3f4fa925..59db103546f65 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> @@ -56,7 +56,7 @@ &ehci1 {
>
>  &mmc0 {
>         vmmc-supply =3D <&reg_vcc3v3>;
> -       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF=
6 */
> +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 =
*/
>         bus-width =3D <4>;
>         disable-wp;
>         status =3D "okay";
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index 85a546aecdbe1..dea2acc1849bb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -66,7 +66,7 @@ &ehci1 {
>
>  &mmc0 {
>         vmmc-supply =3D <&reg_cldo3>;
> -       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF=
6 */
> +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 =
*/
>         bus-width =3D <4>;
>         status =3D "okay";
>  };
>
> base-commit: 1e5a69d67d1b3c55c9b0cd3933af1436b5d52aa1
> --
> 2.46.3
>
