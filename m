Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BFA257845
	for <linux-sunxi@lists.linux.dev>; Thu, 11 Sep 2025 18:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757616368; cv=none; b=r0IzAZbKubbsgPh9kMILC/FejoC9RgPhrEZSe4WP1+cYXIV6Zs0Jiki3XrteZtxEoUU2FT5km26Cqzd0Sis8LD2c3cQej+huqJxRG+RgxFU6xUpoLq0m9G1WTwj3XFy3I94J6j9jNJk9g2ETRXDdgewDApbKji9jIMJATJrcdzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757616368; c=relaxed/simple;
	bh=45rVoyKHZDL7i67H3mSqnI9i+I5wrDeHw68fg9kOaTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M2ELuMJm6gBLN59REjQRHlj2Xht8N3fnPtte9kGGxhJkFLE4rxjjcxXTEEoasVOl7A54TzM6NKZQSvVSMWnyS8JsMee/QJF6/ZJoteDMCGsAJY0O6z2xe+oXGXmMaE9J2Ut+pYZqgeU9xzOdfG95DHJ7/8q53lzYayLzJuZPUYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF5L+wa2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF5L+wa2"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so7749325e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Sep 2025 11:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616365; x=1758221165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLnSFY5/QAndl78OHoWYd50tPooQqwlEKZC1g+O6M5s=;
        b=OF5L+wa2AE6tm8HnmNwOKrBf4CuVRJpfUuiT3JwnlNxrFZ1siCsoFTXl5rwIPICOPk
         SoUtC8/frI9fQ3yxzX313nkHqbWtt/QmG2Vu8vWDjaaKjmLhrioEnO3SWPlB4i1aGe53
         jslm6Pgj9SSoHS/CGmRYhoHJBS9WqWWEhtY6vk5j2W8S4CbLfI5YLIZ9+cd3rSBVnudT
         FnYagJS7/NxVLaUwHvG7EkZMqpv8F3qbvZejDAmgzPz70TQx4a8mxnT/XFvt/D8V0IGX
         yvpGJy68qNHLwgTxlMDSoGI0IPXVlFiZEYVKaxpoCGW57ghoLU+Q9VAf7MawBsr+PH8F
         F/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616365; x=1758221165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLnSFY5/QAndl78OHoWYd50tPooQqwlEKZC1g+O6M5s=;
        b=qr6VU1XPNorZErmY7KpwIDO6eSB366noxZAET6e+QzQWmC//+8L0m2tMeQ7idHoPir
         kNe2uPGVB9vqh6smxrf4PIqeZ1OFkfC6ibJSNrmT7tSTBvEdXjv7fobpiQuQeoWdItsR
         SPGSDYFYt27bS9WVrwsxO/cIJNNkaE4n3I3IxSoGyK87NI0OwEaRs7lddke0DOdZ25cO
         DsrBNyDQejZ2NYbatL0qjlEGnfwyBOuCeNoaHn+Uhox6/rGRurY6u8SjURpB6ACURyjK
         2NaOv3wTp1bf22C7iiXU5luAwCa0Dr2LecPtyybqfNvrQNb+yvgZj0ED4tYl7vnnqsDq
         XuvA==
X-Forwarded-Encrypted: i=1; AJvYcCVvSRT1cHxwxIW2HmdB1ecQEubvoAAgL0YC6NmCP6OA/l+XWRk4B0U16HQ5sF3FEdpqz2hQDn9AEDCgiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8HY/KRyu3leBc5EwNClmwfks3BFIpFF+PGcmIPPLB8ISMSSIz
	JLkjHKKg+DBh+16dzoXCr92m2/I/GdJDe8hg9+OzqdPcp81xBp6Vl661
X-Gm-Gg: ASbGncvikWn9kM86uoClV2AvVEjVCJtmte8UiTjaXaJ7o7Ts8vnkVOOEy4twv2+7tDs
	6JJRZZbcrK6m6OSPWHLltmcNcdplZuAlCQY4qDSBqiZmldgJmKJ/gDzT8S+6JcSj9d4gtC5sECW
	ZmPlt3s7wJZsvKNTkOWbW0qAbOR1YzCAX12LH3QMKZXw6FOWVB6NTMGPLp1M0X6WUKuCewEHrsp
	bsqw/zMQMIryiHlzM/6SOW61WkXt3itAXPWXljceXzCYYQPnVkD2Cxpg+Qrj4dW76gPJSlWT3W/
	0Bd+BFz7FrOHAMZNcxAO6PrjpMfc31IdBQxS5kio4SexTcxU5AFPGBY2UPngy1knQt360hWPIW6
	uZRYAMhBiyMOuLy7t9e+NlTZuqutLvSy8agrRtLPE/t250FKionGcg0RlR7urqKJ4DkuBH2GIPM
	K9/MzPzHAUSQFE+5yyhiz/d6RsM95f8w==
X-Google-Smtp-Source: AGHT+IH1eoAESwH3mOqBEu1EDRUwtU9bT+NVdrf9ZOgZBSqxSfPicQG9iVoecXpREjH59drqKdf77A==
X-Received: by 2002:a5d:5d89:0:b0:3df:c5e3:55f8 with SMTP id ffacd0b85a97d-3e765a12a7fmr375119f8f.54.1757616364866;
        Thu, 11 Sep 2025 11:46:04 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e3a91504fsm20727255e9.13.2025.09.11.11.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:46:04 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: allwinner: a523: Add MCU PRCM CCU node
Date: Thu, 11 Sep 2025 20:46:03 +0200
Message-ID: <2380002.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20250911174710.3149589-7-wens@kernel.org>
References:
 <20250911174710.3149589-1-wens@kernel.org>
 <20250911174710.3149589-7-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 11. september 2025 ob 19:47:09 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> Add a device node for the third supported clock controller found in the
> A523 / T527 SoCs. This controller has clocks and resets for the RISC-V
> MCU, and others peripherals possibly meant to operate in low power mode
> driven by the MCU, such as audio interfaces, an audio DSP, and the NPU.
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Changes since v1:
> - Enlarged MCU PRCM register range to 0x200
> - Moved "r-ahb" clock to the end of the list and added "r-apb0" clock
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 79bd9ce08c7c..f93376372aba 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -4,8 +4,10 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/sun6i-rtc.h>
>  #include <dt-bindings/clock/sun55i-a523-ccu.h>
> +#include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
>  #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
>  #include <dt-bindings/reset/sun55i-a523-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
>  #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
>  #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
>  #include <dt-bindings/power/allwinner,sun55i-a523-pck-600.h>
> @@ -825,6 +827,31 @@ rtc: rtc@7090000 {
>  			clock-names =3D "bus", "hosc", "ahb";
>  			#clock-cells =3D <1>;
>  		};
> +
> +		mcu_ccu: clock-controller@7102000 {
> +			compatible =3D "allwinner,sun55i-a523-mcu-ccu";
> +			reg =3D <0x7102000 0x200>;
> +			clocks =3D <&osc24M>,
> +				 <&rtc CLK_OSC32K>,
> +				 <&rtc CLK_IOSC>,
> +				 <&ccu CLK_PLL_AUDIO0_4X>,
> +				 <&ccu CLK_PLL_PERIPH0_300M>,
> +				 <&ccu CLK_DSP>,
> +				 <&ccu CLK_MBUS>,
> +				 <&r_ccu CLK_R_AHB>,
> +				 <&r_ccu CLK_R_APB0>;
> +			clock-names =3D "hosc",
> +				      "losc",
> +				      "iosc",
> +				      "pll-audio0-4x",
> +				      "pll-periph0-300m",
> +				      "dsp",
> +				      "mbus",
> +				      "r-ahb",
> +				      "r-apb0";
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};
>  	};
> =20
>  	thermal-zones {
>=20




