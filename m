Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3220819CD07
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632748; cv=none; b=N5jPHtylJMrf10m21suoDTvlz0SpvkdAq34LAthozAaWdKz4t7XlRJN00b/uVEimFZEuTziM8pJZes7EpGQQuedbvAU57L8/sXw7C8v8uyFuwCAQ0UqL2ur7JaMnTN3XSXWiqv1ILANTvIaDv1tNL48HwViV59XCbtJcmgCrlY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632748; c=relaxed/simple;
	bh=snxIgqDfv9AzTPRASeTgnmdONS2s/uweYA4rLFpghpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+7u1lHkXCI44oENJ6N/KN5HuqSuQ597hIxGLJjKxHr9VBxpjjP1Kaw3EqV9NSqUoKE1HFQZV3CUuCJve6ydP3XkMpqOid9Ywt9ZmudJc2P9/tZfZrlSQcoF6DVx6bf+WqdDg9NDR2ERGJV1aeoO2tQoqYiMTKIfuXSviyABDUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30ddad694c1so75377411fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 08:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632743; x=1747237543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUchLAT2CvoC+0spmKn93ymH4pNN6dMT06ZJPIMdE5s=;
        b=U+h4S42IGv9SklApB7SFX/Ib9X5Bf3BmsHGK3fQmY+ZzDJzz9O2Z5Vsfjn9ptebY/E
         BBi+iGyUxjBOklle8Aqr01jvnEJa6WLIkH9geEToe0MO/6AhKC7+fyyLiN+E3mW0NZSO
         jA9KRzZXGcodCI06VGPcA8+90Hu+FLLz4zhmE646XjnjZKETOsilensPdgNGAV8fD4f1
         LFN4IsIYSgq9N3YdrdynPAWqBgM7ThWo4ryW3X2Mb7rLeYCsHseFHV9XOBGgtKFaS0tE
         mO4oZY1mTI371rXSrntcAjef+Omq58NqJZIgMS1EM/lYJ0NYhz6XjpcQwpMJv13/HglN
         4cJg==
X-Forwarded-Encrypted: i=1; AJvYcCUipd5sabfjnko+fdNnUp4HUVI9M0FZU1XXmeb+MXhghw0P2VhNeBZE3CpGOudQHamMn7xq3DS+mEldbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8HB06BlcV85FBrV3T1i7eleyezDVA3+bBe8SccYV4Imia2hXU
	AZd2v0FK+yVGtIpUzdGxt7KxVWVO0OXozf6xsOMgusBelKWtn6A+cNuFU+vE
X-Gm-Gg: ASbGnctcRzkXBmcadMMC5N477BN3gmXcQLoZ9Vt+6uN0Gtjt94hMm23VqzfmRpp0oA7
	KuVBbta5Wa6y6EWStMpEZAwLZSp3mN1zV3AtUbmgZjdVRWPeAWl0n2jjC9hu/gNkurWeCMuF+Bu
	TjPvdKmLMu3RYOUR08cax8Yv7H/RyBMg12B2rJTm9jxkCE2WV/AWG/p4uzerP9mwQY92d4Pz/lM
	+2VoXTyQMgGfjtd4qz1Jn0Tjva/SP8MFxytiRhlRQBTcCwyQCxTW6NF6OH7vuNLKwCdxWYxvdwn
	HVEUN1lhBBq1jKlgfzgVLL1+jnefrWp0KY7J616eojhNH9t3i+kIXpuA/rMwvIhk57USzm6oiw=
	=
X-Google-Smtp-Source: AGHT+IFjACBevrTzii+aFj15fxrin/v7I4rRq52xSswbfKSnaXubfemnek7yLkx/pn6TOF8t8YEl1A==
X-Received: by 2002:a05:651c:2123:b0:30b:ad2c:dfe4 with SMTP id 38308e7fff4ca-326ad33c67amr14318201fa.30.1746632743044;
        Wed, 07 May 2025 08:45:43 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89f221sm23886571fa.86.2025.05.07.08.45.41
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:45:42 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30ddad694c1so75376581fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 08:45:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYNlkwbLnIFU9PtoV5Gih64PpMePq4Apekx9AVz7yjZHfEjKhivPefsE2GgOfZz2oSnbvhJf79sHG8tw==@lists.linux.dev
X-Received: by 2002:a2e:ab1a:0:b0:308:eb58:6591 with SMTP id
 38308e7fff4ca-326ad33bc90mr16246971fa.25.1746632741134; Wed, 07 May 2025
 08:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250506195524.601268-1-michael@fossekall.de>
In-Reply-To: <20250506195524.601268-1-michael@fossekall.de>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 8 May 2025 00:45:28 +0900
X-Gmail-Original-Message-ID: <CAGb2v671wD7y6n6n20BrhH-pcTGD8RzPp25gCWUtnFmRhh=naw@mail.gmail.com>
X-Gm-Features: ATxdqUGxuy4nk1up7F0wkRPqSR-2r-DSURGKLc-zVrNDcFGAmDsshfUtzZKSfic
Message-ID: <CAGb2v671wD7y6n6n20BrhH-pcTGD8RzPp25gCWUtnFmRhh=naw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: bananapi: add support for PHY LEDs
To: Michael Klein <michael@fossekall.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 4:56=E2=80=AFAM Michael Klein <michael@fossekall.de>=
 wrote:
>
> The Bananapi M1 has three LEDs connected to the RTL8211E ethernet PHY.
> Add the corresponding nodes to the device tree.

I see from old emails that this was supposed to be updated? And if you
didn't, then his patch should be marked as a "RESEND", so tooling doesn't
get confused and ignore it.

I'll wait a couple days in case anyone else wants to take a look.

ChenYu

> Signed-off-by: Michael Klein <michael@fossekall.de>
> ---
>  .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/ar=
m/boot/dts/allwinner/sun7i-a20-bananapi.dts
> index 46ecf9db2324..d8b362c9661a 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> @@ -48,6 +48,7 @@
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>
>  / {
>         model =3D "LeMaker Banana Pi";
> @@ -169,6 +170,32 @@ &ir0 {
>  &gmac_mdio {
>         phy1: ethernet-phy@1 {
>                 reg =3D <1>;
> +
> +               leds {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       led@0 {
> +                               reg =3D <0>;
> +                               color =3D <LED_COLOR_ID_GREEN>;
> +                               function =3D LED_FUNCTION_LAN;
> +                               linux,default-trigger =3D "netdev";
> +                       };
> +
> +                       led@1 {
> +                               reg =3D <1>;
> +                               color =3D <LED_COLOR_ID_AMBER>;
> +                               function =3D LED_FUNCTION_LAN;
> +                               linux,default-trigger =3D "netdev";
> +                       };
> +
> +                       led@2 {
> +                               reg =3D <2>;
> +                               color =3D <LED_COLOR_ID_BLUE>;
> +                               function =3D LED_FUNCTION_LAN;
> +                               linux,default-trigger =3D "netdev";
> +                       };
> +               };
>         };
>  };
>
> --
> 2.39.5
>
>
