Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C97F2253BB
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 05:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745731760; cv=none; b=uWC7l9it3jqiFESUG0sdIMetIhTbnS7/l/UvwPZ0JcCIm6wWGO37Uqs2GD1ifXCOyh69nikw6YS7+H5yr6lNBq8is5gRVO5LlnVdWv6qlQhcvqcQGlkxl8HSjonnvRzBUA97idrn63kBlxHnwt9Ryfzaa1bFUIxanXmKrogvFGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745731760; c=relaxed/simple;
	bh=1FUe7aXRzxsu+EjRvAhzLXksbJrtabn2nY+5vLDSRVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PDZQjWIZ/tGHawZnDji1o80JCLLZwompv4ifo1pSzekNrbP4yTWAgi21h/sTEAmUSGbogBoYqt9XyTQv7y6d7l+viCbf9ZCIiEhOW5hgp6CueQ+Yi2Yl1KB0Rk2kCOn+p7AL3Ie9+zq/MmPz0cHVTGz1UNIS+jqYNtwBJpAQtSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-317f68d0dffso37900411fa.2
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 22:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745731750; x=1746336550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fDi3xnZL6fsQsXT2rLh2TNElIcjVvgvD9LuKBrnF8Ww=;
        b=Ooc2GG7866XAr6BLVQTDDTau3W0Dxt7j/s5K+Hr2RtBBMzXtVzW3Fh0DubFtc7w73/
         hRa1NWyhz5DtjVLvNRyAcceaJW5KHCiRKQHuLwydvGU5x1IWxQeKgQW3ZBMfbDBAS01W
         juoH18UFpUkCW2bX8EPS4HVO8kqJhC3Fxrli8/jpeBcNjcHmrgKpLShfdHPVB0hYM416
         cN2MqNVjqMvJYS61Sd6YjEITwAyruRopH+tnktt8MTli/7SzgQyCeIBmvr5QV2l2oys8
         dBxk+emjeelRRAy+XoYGMq7Z2U3ijs+PBWSCK8a/sW8/UogHaRuIcRKiOxImDf4Oaj3l
         BYQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6jDElI3MnWnAQ66s/s5FdwZRs+F1Tsxb0V+34OQ1PX3B3OFcmkvhK6ruqaCxF93V3Jo3OQevu5187iA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0Fhk83J3Gi8TVh2nvIjNHAc8minGDMDebUPjCQWHFKFl0PGKA
	8PKWWdbSApesdHr+ZMg1RCKri/q+ToljNpUe7I5jfA/nsumCT8Q71WUquBOLif8=
X-Gm-Gg: ASbGncvv2J4giN3KJPKgHBbQMMKi6iEkv0TPWKXnbao7W+3jv94nbPwyyIq3hi+r/0i
	rq6wDsHWf30zF2z02qGFBeRLw85D8XXi6Zyag65xUJl/zbW/YxKCJ+/AbI7RixTMe5Gy/xJMX7x
	gKaG1rhMNgIpVW1Z/EG4mTOqxfuzM+D6lNEsJ24TAkc0of74Vxzcynn+Ehf7aWHteFQ9QYmTLJb
	CquyP6mrr06pPWmTfnaWo9QPnBcJZQFpsboSQuNGbNpZo09rirbYUiCLJ3QSr5Ngjac9U8hoIw4
	1l0Y9DjrXxrz6tEG0NSxkqolin+cq4IKy5t/813JlzFPetNs+TNHCSVtu1nzmxxcgkfokxmjLjR
	cTuC9a6RP
X-Google-Smtp-Source: AGHT+IGwMxIRseQl4FJHMqCUFKz0t2uREDAeRS02/JPD71kZGw+3qdDUDLDiANnVJXk4jc0yCgpyuA==
X-Received: by 2002:a05:651c:895:b0:30b:b9e4:13c5 with SMTP id 38308e7fff4ca-31905b6a863mr21027411fa.4.1745731750334;
        Sat, 26 Apr 2025 22:29:10 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d206bc3bsm15672861fa.112.2025.04.26.22.29.09
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 22:29:10 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bef9b04adso36472441fa.1
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 22:29:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaPPhVMjM3RAYY+a5Xvpnld2+O3Q3EDN6o3osTXT4DfgYRrj203UwxbNFV2/+HZ8SL8MjbxXZ3421kkg==@lists.linux.dev
X-Received: by 2002:a2e:ad90:0:b0:30d:e104:b796 with SMTP id
 38308e7fff4ca-319087b0605mr23238281fa.40.1745731749733; Sat, 26 Apr 2025
 22:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
In-Reply-To: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 13:28:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com>
X-Gm-Features: ATxdqUEYYTKOqIRqwitrJwW2PxZXei0_VhgNMizMN4MUT9WfXUWnAmdzTIPf0Jo
Message-ID: <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: allwinner: orangepi-zero: Enable audio codec
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 7:32=E2=80=AFAM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> Line out playback and microphone capture work, after enabling the
> corresponding ALSA controls. Tested with the Orange Pi Zero interface
> board, which is a (mostly) passive adapter from the 13-pin header to
> standard connectors (2x USB A, 1x Audio/Video output, 1x built-in
> microphone).
>
>   https://orangepi.com/index.php?route=3Dproduct/product&product_id=3D871

What about the USB ports?

In any case, we don't enable peripherals on "headers" by default. That's
up to the end user. The description for the whole adapter board could be
an overlay that users can then apply directly.


ChenYu

> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
>  arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts =
b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
> index 1b001f2ad0efd2e77218742efe6d8edfdd18a816..d65ede3dd6ed1206248a39c91=
e46065684e7ba29 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
> @@ -112,6 +112,14 @@ wifi_pwrseq: pwrseq {
>         };
>  };
>
> +&codec {
> +       allwinner,audio-routing =3D
> +               "Line Out", "LINEOUT",
> +               "MIC1", "Mic",
> +               "Mic",  "MBIAS";
> +       status =3D "okay";
> +};
> +
>  &cpu0 {
>         cpu-supply =3D <&reg_vdd_cpux>;
>  };
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250417-opz-audio-890849c8bb2e
>
> Best regards,
> --
> J. Neusch=C3=A4fer <j.ne@posteo.net>
>
>
>
