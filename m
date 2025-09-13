Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3BD26AD9
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 11:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757763075; cv=none; b=nOQ22UDgnyXchaCY4MDRtVyGkfZ0vpfVBZVd2EZWA7IyQejW3iijs8Q8z8D3T4Xlr4s/bNZzelJ4NmjTduww5FPb0ZDqHSz9IwKm5p0JdzDj0mo/qLYUhyj5v2drnVay+C+0HWpLpItB8PAh1ACrZCIrmMSym2V3LTSdxNnatmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757763075; c=relaxed/simple;
	bh=Bgi/LtOZegcBC2paPEdpNuoA8uNY2waphFWpS0NN/k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qhWNlanfoLIZt+wg2oc9f6QYblgw48kaBqg2FSFscsEylS7VahwYZV8j55y60WiMPpDcmTGHsL7XEDgS20OGo57H1YvqxZ1ErCNwsVMdZFCaKFLaZjv3vIoIKtGs4T0XdcsJTSnQKF5SaGc955lEJu3Yhpk6a4vo8Q4ODx9pEPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBwYmJLA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBwYmJLA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07c28f390eso301381966b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 04:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757763072; x=1758367872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbaWkghAVJNKzBV/Fp3pj0pkQCQlDE9HrxdJcUrmDgM=;
        b=fBwYmJLAlnJMmu8QoAFSuXGaw5kSNo84UX/HLTbL6Wq5IOBvYavqdu/KEaJkTWLXbF
         WltNe5guJ98A8LPu/hgSrk4HZeE/7z3TP7u+yOJHAODD7ism7EGVIni1ezJ59rygbuDp
         iMrPLVwAsXTi4xEw7HegZ0qKGbNV51dCL08y+CXcAnCBWDfTUevGfyGfXvD43rQUAZx6
         itkaSfd3+C2JNS08QA4Eq4XvO82zhwiyRjWuyMfVswWvy3fdWRxMcvbqU0ERKnmQt73m
         yZdggoLi2pVpTEhUC1x+KLP2QBrVd81vT9KMd9ZkD9+JafLX/WGVNd0rNbUQCopKHWIY
         stzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757763072; x=1758367872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbaWkghAVJNKzBV/Fp3pj0pkQCQlDE9HrxdJcUrmDgM=;
        b=NGCPk3997y31BRhTS0HLAxE0Bl6ShFwl+BfO+8H4wLmSXakFRHIt3k4wFy9ZeKMLIY
         0dIwIYcVFfWoi9iCZ5vrevht9sJHa646i3Usxu9/vDtR3le8md9s13DxWx3CHJoqUpfJ
         cmbwu3Li/Rg6pGip4HfwBWIpXlynj/Z8y2VNIBCnCZtfhPs5+yQ+nMw9U9JWBBpP5BQc
         hgU66vkudjlZhCy3qF4VE5b0Cqu7GnTphnI7fOvx9LPyaZD7YGPkJWpzc/+3U4eYyXjs
         lP1IuSxN/k2KBJNtbeBumzHaNdTZD83WYz5KXoTg1L8AT3KpUCNBVlEymzqxRZAtp/jE
         C8JQ==
X-Gm-Message-State: AOJu0YwiYFTlb9mrC7IRrzVVp2ytB41Tz5HZXw3u7sNNYa04g+hYsSHj
	yWIio9Jf2j5SlzPIUqEvkJLdEreSDvVoBmH9tzuJ78rcID6HEHQpEVmJ
X-Gm-Gg: ASbGncu/K9T2Xa86rDBwx2jZCXaRe+mAIf4GKnQfQBk4uskoA9I28uPMK9dpeW+NzkZ
	p/+4/WB5wXkVSds8xeRXKS8Rq27fIyh+UXpkXqO5OI3X26qhRpOyxKnlg4+zlC+602hBFrTIdLZ
	04dYFLbVGE4PfztFh0zUccQOGpzRMk4qGogWsKuSPOXNVXICVqZ2x1Fc5xTByfkFsXPDSoJgSLW
	rZw4JsUinfkHKqNBGop9IAPNS8Ry9d91btaO7YzXYdAr/CD40VI7pWhdm6l0COrxdliCU8iK+DZ
	2OvaUEwEo/Yk/3Axei2qZW8Mn9az7ewOU6FeEB9TmrcWWi5A7ATJj/lvETx3RmP0V9wEanphuHI
	zA0fMQI4O0vpcd7Z0Tyt92XMM1Ju+PQAGq33n65EDY0xl3GGbt/ARoWE=
X-Google-Smtp-Source: AGHT+IGo8CziTZlFFDXaGrQNSM6imSKcLrT5E0r4aNs8WHUFIZfpN9rTwSz+1wD/ImFHnj2/i6E30Q==
X-Received: by 2002:a17:906:ca56:b0:b07:cd08:ff34 with SMTP id a640c23a62f3a-b07cd08ffe4mr358053766b.51.1757763072002;
        Sat, 13 Sep 2025 04:31:12 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da327sm560756966b.11.2025.09.13.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:31:11 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/3] arm64: dts: allwinner: t527: avaota-a1: hook up external 32k
 crystal
Date: Sat, 13 Sep 2025 13:31:09 +0200
Message-ID: <4676490.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20250913102450.3935943-2-wens@kernel.org>
References:
 <20250913102450.3935943-1-wens@kernel.org>
 <20250913102450.3935943-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. september 2025 ob 12:24:49 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> When the board was added, its external 32.768 KHz crystal was described
> but not hooked up correctly. This meant the device had to fall back to
> the SoC's internal oscillator or divide a 32 KHz clock from the main
> oscillator, neither of which are accurate for the RTC. As a result the
> RTC clock will drift badly.
>=20
> Hook the crystal up to the RTC block and request the correct clock rate.
>=20
> Fixes: dbe54efa32af ("arm64: dts: allwinner: a523: add Avaota-A1 router s=
upport")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index 535387912d9b..054d0357c139 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -354,6 +354,14 @@ &r_pio {
>  	vcc-pm-supply =3D <&reg_aldo3>;
>  };
> =20
> +&rtc {
> +	clocks =3D <&r_ccu CLK_BUS_R_RTC>, <&osc24M>,
> +		 <&r_ccu CLK_R_AHB>, <&ext_osc32k>;
> +	clock-names =3D "bus", "hosc", "ahb", "ext-osc32k";
> +	assigned-clocks =3D <&rtc CLK_OSC32K>;
> +	assigned-clock-rates =3D <32768>;
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_pb_pins>;
>=20




