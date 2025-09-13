Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32FC1F4191
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757762980; cv=none; b=aep5vNkR1R3R9swLaCmjH+NbM6jNy5eolEw1toEjo6B7hGdbenQAVdIHAPgw+6T9lKHJ8zLmaatMXO9AFaB405fDWFSV8aLr48WVR5CrGAsrOSeq5lUfDXNoOtnYsoLqo0+Zo1WD5yQKEaapbpqjg9eAxIyhjxbe41/w6Nm4RWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757762980; c=relaxed/simple;
	bh=TYXbLO+kOKJUzkyQuk0TWYQxWbv9RVNrgbRkhz69Gko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YsLOkOfiY8Zs4khHb/epweoGThxXgN42+qT5Yrv4orwc4ULAAE7Um1s2oy2hXHKHz/8e41kbuhxVi6rMsXz9gMoWMINcVdhtjHo8ZvMW6iwCfQAskLkPzwlxkENRLN4CR4xP1NvlIxOwjb6L1weTt54ESRpqgNlh/3pGkZKD7t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSC/Mqok; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSC/Mqok"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b07c2908f3eso267341866b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757762977; x=1758367777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMMoSzCc5h3tOZ4YYR+aO/iNO1TdT3TVeZmWGA5I9nI=;
        b=YSC/MqokkE4FNR7KCBTHR5fNWlcU6xklluu2YH4QIF9Howb4eI6kZrpH9Y6BGdfCFd
         Hrdl3hGnqQvG1+66IPellgoxHaB9sBb0n6UiUlpR398XQCx62zgA35JLx74GPOx3hHhn
         ARCI2X8RWlPfPaa1IqY04Puu+kbhoK0+SLRuyVKmQiyX1coGuRA+0MBYYp4FSM6+gpH8
         y1diXo4sfZ1koEPT4tad1u0KEoKtOEtuZXtl3gEItJsl+pidPec9bxSwmMg9i2N13uW6
         yJo4nb4kCmvX8zFGYxcxQG7BeR+fxynnf6ukkNPCjXW9lyjue/NfSqAz5b9/ozuDBqKn
         RvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757762977; x=1758367777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMMoSzCc5h3tOZ4YYR+aO/iNO1TdT3TVeZmWGA5I9nI=;
        b=C4ANbb6eO035w/uuVrPX+satNGdbrzShCjPq3OXT+aQ4gbR39ircJCP3Ni88D+l4j7
         MUaS4TNnOtApKKJWSSv6XJ+8iGZxXFHQq3epYB+XuhmOanXWamx/xgBZRr0YebryVYqI
         dme4jzD69hqLDT6hcIgtOqCsKRP/QSS9l2Yt+/IBmAFO3nTI1bLCiwFAvXPcV0iDPc5e
         g440x6xFMzNLUT44tAWh6iaZ/P6gIWaWCK9Cvv5AP5WbSsMgUTyKvF2aUaqtQLmosd2F
         H5/O9Krh7TUNEWePWNc8Vb5ymb8Xi+lImrrqy3qbI+y9iEz1h9jwF5NtXItLAPyOu108
         TkdA==
X-Gm-Message-State: AOJu0YwyS8/y/xrMOhKjl/K6pAJf4/kZ47+XwgG/HrMm8VvN3DGACdXm
	cZcSoZT35fuX01X78jdTwU2BT5GGTGlGce4zpE9ql/umcmGzukPr1Vx0
X-Gm-Gg: ASbGncvW7iJLNfgjrxMVFtFxlKnFLrlHyV1aMzNc3w9E6XRICp7GY57S15a7Wqr16K0
	CqVopcW+RlotW5a26GSdO7yLRIMdkmhloQLZCI9lx+n4A/OCr9G/wAtMcuchrVLbel62F4ey5ND
	2tCUp2QZ+SKCGBWdJ0A5g5PiBhxxNPAIz6IpS4dUPBDyU6Ntw9JFGK16pbgtSqImzcbPtVcEbqB
	23SIg/ghWPstzvdg+FNyf5S8JvFuG23juHvzB/1MJ9jjP+1hZzNRkqDScSCnTqy8CslSsYIoVyL
	w5C804bThH15pIoWB1Q9Pk++d23dkWPDzadh3Qsmd+p2ioH9xjS/MyoLv3S2vFZf/YRV5Uw6iSW
	sJkZoHYwG3L8UUDAbJF5UygaatRhbMDngkasiSnksXrJEHXXq5WHdGAg=
X-Google-Smtp-Source: AGHT+IHjrg9HhMV8KoVTmQL6sNcOl2lLDDIPwEcS0bg0jeSuB02uw0MNZjGq45peF5NvlyJozkp5Pg==
X-Received: by 2002:a17:907:968a:b0:b04:a289:7b with SMTP id a640c23a62f3a-b07c347f8cemr599471366b.4.1757762977003;
        Sat, 13 Sep 2025 04:29:37 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07de03d93csm167035166b.12.2025.09.13.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:29:36 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm64: dts: sun55i: a523: Assign standard clock rates to PRCM bus
 clocks
Date: Sat, 13 Sep 2025 13:29:34 +0200
Message-ID: <12739001.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20250913101600.3932762-1-wens@kernel.org>
References: <20250913101600.3932762-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. september 2025 ob 12:16:00 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> At least in the initial version of U-boot support landed upstream, the
> PRCM bus clocks were not configured, and left at their reset default 24
> MHz clock rate. This is quite slow for the peripherals on them.
>=20
> The recommended rates from the manual are:
>=20
> - AHBS: 200 MHz
> - APBS0: 100 MHz
> - APBS1: 24 MHz
>=20
> Since 24 MHz is the hardware default, just assign rates for the first two.

I think it's better to be explicit than assume. However, this is fine too.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 3aad1b909501..5cd6ddae86c8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -767,6 +767,8 @@ r_ccu: clock-controller@7010000 {
>  				      "pll-audio";
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
> +			assigned-clocks =3D <&r_ccu CLK_R_AHB>, <&r_ccu CLK_R_APB0>;
> +			assigned-clock-rates =3D <200000000>, <100000000>;
>  		};
> =20
>  		nmi_intc: interrupt-controller@7010320 {
>=20




