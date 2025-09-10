Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5462BE65A
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757508938; cv=none; b=AIW5cAO6ZUxi6WFGBQ/y9zLZcVqcIg3nGWlEklua6Uq1uv+vogWO4BApy4WciiafOiq8QxLXMahXnDeSmmLcStMvksTpDNSINbVHdvUI+CPEbo/OS/xXzJZOBvSBCj3CSy4G20y9Fb3FSh5uDZGqcSEzzVElZfZwa2Qj44Dclx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757508938; c=relaxed/simple;
	bh=VRd6OHvO1zviiH8/zWIWyTR5W4kJN7wrHP1CDmkx7/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKLI7usZrUsu9EkSVXzZeB/aMpkwDnK72ykAXhnUc60qZoiwCC2rz5ZskIclX5p/6Vg2MyTmXzPw6YUNiPZQhuIOmClMGIz5AAbSQjekYDMspFzo/JYqmit7TWGYXplKTfwycHwzZzAWXO5N6yIMTAFvMnUgYY3uP/ETQVgcMQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336c2194a65so52633861fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 05:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757508932; x=1758113732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czL3Mu97JDNqFcpEdZAJCI1Ps8ECPwFG6/c6zc3mY50=;
        b=KZV0zxAVuMqg9o7+TxkumkGynFQoItGUnUe0SL/PMpVo4LUGc3larnAwNI2ljJRtFC
         6noNiNkFOfSr2sYJHtcjfM39LimuRVWNTXzLPwGB2QwX4XuSw1Mga3Ri2BHiSdJDA1S7
         Qc2U4VAbkBNvHiT5XXoZLfXiRQ2lpRhdYXuN368kLHVaAVQvCZBHg/kM0WnNPc60sA8Q
         crl2z8SnBEXiKqDPTC36+Z6oyKfjzxv9kgUwkA82OEm5mgyO445dNaxo5gSdjxXJtxbQ
         aD1zBZZ8spSrXC4ojSGqAHjBpQTjO8nN1jv+GAn59yrhciydpyYPPhL3bqbsmqgKDa4V
         oyCw==
X-Forwarded-Encrypted: i=1; AJvYcCXqKOK8DLZxUjZqLCHcBHYoxiuthJwSRwjXSQ7dvWcidcmogE9ZQt9Wksk7+aG+nY9P5nb/kbAZ02rrew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzY6kAlW/HVQna1miBE0BCg4iSjYHDB8a04l5dgb1xx7CoAse3
	FEub8ON2OZmtRH7V1Za268IvNl/0YCEzo/P73gnr7j6GdkHhmoaa967jB+V2r0mi
X-Gm-Gg: ASbGncs6oZl19PCkcLp+iuZYpDdDLH4Ycs/fwNgvWLL6A2C8QujFgEZJU17D9/WPGzm
	9l+ZUwGPkNvXZI/dqPawJUl94OezFYINS1gScGY9voIAyb4pBhkgxgVpwAnCC144/amB8fPrW2S
	OksVb/3c3ZF8mnSUcinPwRmvKfogts725jRfr2iICshu+eyvBJfKaBkMG7xWNjUik1mkn/vyXEn
	D8Pw7b8lNtB78kuTQ0DWl7uEUbCU47eM4/3a2wq7XAPSEtA9ziZffhz0OOOE+JYgiRjhCZwtsyQ
	w2KzHODquisden04ZBVljxmtnpfGMUOZHzer9m7rVR5bpze1JhFdfFDtNDb+c4RAjv+0K8fVMIL
	Yn1lsDLnokqyze5GgfLrtowt5gMmKHx9sLinVe65bh9nokD2A/HVHuU8=
X-Google-Smtp-Source: AGHT+IFCWF4E+ym8uQZAQMJguopQ3L2xI48EHUVHtT0/jc9bQOTD5X0y8xs5sHlzehHHYcxu2pBN3w==
X-Received: by 2002:a05:6512:2244:b0:55f:4839:d049 with SMTP id 2adb3069b0e04-56262d23b1bmr4688190e87.39.1757508932148;
        Wed, 10 Sep 2025 05:55:32 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56818a11806sm1222398e87.129.2025.09.10.05.55.30
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:55:31 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-336d84b58edso69012411fa.0
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 05:55:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUo9uU2e+kTL2lHQ0PfJPVHk45+zeTuRPeqHbAK4Zy818b63baF6e3HNIpWUhstmFaOUcGpkOvHxR3v1w==@lists.linux.dev
X-Received: by 2002:a2e:a54c:0:b0:336:e199:6d95 with SMTP id
 38308e7fff4ca-33b4e07f1e7mr46456191fa.17.1757508930395; Wed, 10 Sep 2025
 05:55:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250901120020.181414-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250901120020.181414-1-amadeus@jmu.edu.cn>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 10 Sep 2025 20:55:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v66wnhyv0x31bO2S1fWeJZzeQgdEze7ChcFb0VGjq5AjJQ@mail.gmail.com>
X-Gm-Features: Ac12FXxzgckCvK2PU-Ug8oHKsMc01hfEJlK1a7HMQ13AEF91phM76xhzrUy-R_I
Message-ID: <CAGb2v66wnhyv0x31bO2S1fWeJZzeQgdEze7ChcFb0VGjq5AjJQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: a523: drop redundant status=okay
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 8:01=E2=80=AFPM Chukun Pan <amadeus@jmu.edu.cn> wrot=
e:
>
> Device nodes are enabled by default, so no need for
> status=3D"okay" property.
>

Fixes: 35ac96f79664 ("arm64: dts: allwinner: Add Allwinner A523 .dtsi file"=
)

Will be added when applying.

> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 6b6f2296bdff..cdf844eb8e05 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -218,7 +218,6 @@ wdt: watchdog@2050000 {
>                         interrupts =3D <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&osc24M>, <&rtc CLK_OSC32K>;
>                         clock-names =3D "hosc", "losc";
> -                       status =3D "okay";
>                 };
>
>                 uart0: serial@2500000 {
> --
> 2.25.1
>
>
