Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C8821576A
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 05:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745558804; cv=none; b=twpeVPS4Iu3NoHNSlrqRTi30P/fXCCGtbZfI9AXBAwifzTbotnyeTePS4Y5nQIATycMXXRCmV2iBWCUkG7W7Yg4uRVyaDFHGlba0IUPx5pO+iYnGzmFYDOQPxEcHeynqn9OxXCLQyXumXQoySADYtFO5BvYlrv4U2vQ9Z8+JcGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745558804; c=relaxed/simple;
	bh=DHu40UIhkKdjXoKlsrsSoVrYHeDWq3E3jCkx2mydxzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k8FGwdfBNF0faLXMciqhkO517LQf24FEmQrpX3kpJY4UQzQkW0EOX6RjuDIHYukJBd/BSymsR9e6+yMG8fBuWRQ4iYu5fZbbg4A8erfEhbLZpDpqEJyfTwNZli+Do83DAEz4nIo9XFkLGffZ4YqegQEXJGSVDdGrlCYdS0plge4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54e816aeca6so1219258e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 22:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745558799; x=1746163599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vorWjyWoS+/pe1rTuodzRNXMvlPaeZ3qAjeUiTyfr/Y=;
        b=p+KWNfDrGw65+xVf2w/wBY/72/KxxBOOA409mn8UW59yNSgpLNS1vpA9yITZ7xI2/5
         RA6jKyDcy2yPx2PKllitBQHiAZh81bXcigjwUAYPcYMNxRVn4nfzs85OKLeIfRipkdlA
         lLtMKephywANPBKs5OtBw+PgtjBWdTovvZOsrDn29QyTgUucVSox/6hb4S4gERiu5p1C
         AfopLsB1RzUDtt0ks+qxIC0hKgq7FPzp3ouD2QxfCDoeMQvFFR+8H/NQeQisrz8ZUJrI
         1zAu6P9Iqrtod7xjF2w2qfQnd5veejuBd1Hc8xkrbhL8e5eFdEXzjT3eRjeRY2hEBXj2
         tL0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUx2iYeG09QCZYcrwMWVa6VGPKVEWvJNKz2flVJlVDft9c+aX3hCFBlHDxOW8IiwL+phrW50MTnCY8n4A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+T63Ami+3I4R11HXeGBwIJqCmfig23t5fWrtyOWuO6V6RCXnP
	sPbNPqtpwt70FZQjQM72C281v0m1Xa72XUSsqRHw5VRaXIbR6cHc+c8s22aE47M=
X-Gm-Gg: ASbGncukSYdIPHW5FsTz9rMwXmeUBo0BBtBzfzDRRStN78N3ci0dJh9NtrSFJs3yvpF
	yV8F14BqsQ8G2i0fiWefyQneN5TNYzRZYpPTuB76LTnu2i1fCAQXxOUWQ0LKBx4ecghm2BuacY5
	sOOqIRUuVMZpn2uLnMcJQwIozVH/Kc2/eQOTckXaJekgxIkQuV63pHVVlhtKzo4xmTcACEwPiP1
	NrOgQ3fix3xaym2y2WCGxL1p/t7W0eY/Q6CHceTq5Ngq43Nz7Bv1gnwxA9/JadoZNcb+gCtzWKh
	TK8VG6mCPTfMYo/aTxZQTpI2tfQYswyqaUrkDxtLySoSr1VBNeu9k9sGlmJjXdWjh/0fxyPZrg=
	=
X-Google-Smtp-Source: AGHT+IGfBiDsywVde3U9e+/w2yS3GEFTqDFptCYFVgRsw0r2ca539feHuk2l/EnADq36pVNT9OI91g==
X-Received: by 2002:a05:6512:b89:b0:549:8f4a:6baa with SMTP id 2adb3069b0e04-54e8cbe053emr253871e87.27.1745558798492;
        Thu, 24 Apr 2025 22:26:38 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3b65csm469629e87.85.2025.04.24.22.26.38
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 22:26:38 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30de488cf81so19671041fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 22:26:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWylA3fJksKLixBZ2EN0kHliEAw1y/8j8b1wHI2YVTJbQEyUP+cVSu4VElCRTmzOmgIUY2NEM9iyemasw==@lists.linux.dev
X-Received: by 2002:a05:651c:542:b0:30b:efa5:69c3 with SMTP id
 38308e7fff4ca-31906e314a0mr2145241fa.22.1745558797847; Thu, 24 Apr 2025
 22:26:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org> <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org>
In-Reply-To: <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 13:26:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66a4ERAf_YhPkMWJjm26SsfjO3ze_Zp=QqkXNDLaLnBRg@mail.gmail.com>
X-Gm-Features: ATxdqUFQB3DitZ7r67Jb5Ui1og31mJLNpJsBnkQBmfhJ0SUAid0UCHRMYJY-5Nc
Message-ID: <CAGb2v66a4ERAf_YhPkMWJjm26SsfjO3ze_Zp=QqkXNDLaLnBRg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andre Przywara <andre.przywara@arm.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 6:09=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Add EMAC0 ethernet MAC support which found on A523 variant SoCs,
> including the A527/T527 chips. MAC0 is compatible to the A64 chip which
> requires an external PHY. This patch only add RGMII pins for now.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 40 ++++++++++++++++++++=
++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index ee485899ba0af69f32727a53de20051a2e31be1d..c9a9b9dd479af05ba22fe9d78=
3e32f6d61a74ef7 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -126,6 +126,15 @@ pio: pinctrl@2000000 {
>                         interrupt-controller;
>                         #interrupt-cells =3D <3>;
>
> +                       rgmii0_pins: rgmii0-pins {
> +                               pins =3D "PH0", "PH1", "PH2", "PH3", "PH4=
",
> +                                      "PH5", "PH6", "PH7", "PH9", "PH10"=
,
> +                                      "PH14", "PH15", "PH16", "PH17", "P=
H18";
> +                               allwinner,pinmux =3D <5>;
> +                               function =3D "emac0";
> +                               drive-strength =3D <40>;

We should probably add

                                  bias-disable;

to explicitly turn off pull-up and pull-down.

ChenYu
