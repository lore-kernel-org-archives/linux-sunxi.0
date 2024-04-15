Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F98515575F
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 20:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713213993; cv=none; b=Nhyc4BMOqQtueybK0MfSUCooCoF97uw2NsSXk0zbb+aCUbWMcurRMz29wGSQv/YelXXViC3af0rgYzDcjYod8pse2SeeEJ69P1jnG1TNmnemlAgZuWcVrfSP3OrrM/QIUlTzBaI63WxO2nE920EaBwMcNvjlLdL46FHXNsvL79I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713213993; c=relaxed/simple;
	bh=DXWvgmZ3OBUiLaT3J5TtSgfTI4GViAYB4pLbra/t6SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VtVpYB9mddgSkXoyip5B7/6M1y7bUyhIQoEGMgLGMQudORMngcdg+U8Z0+5askb2D4ASImTC8twI5an+Dz1P81TrFKvTrDEBwgGNoSq5nJakkC0/Q/sbOYf017ZcIFpDPMuYhiqsYyIwIqSdFsGaO/G1W61AwKMs6jTK9Prw8L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml/DnbPE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml/DnbPE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41868bb713cso10321585e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 13:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713213990; x=1713818790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQH1fnHdxuhfyl8z9lLAyiPd+rF+Qf9RWJEuMIgG794=;
        b=ml/DnbPEwM7/TnLO2XdehyiQIOitID/o9Xp0kRczRgsgBRQ4ADvKDFd3Q5H9QYGhdw
         iaXMT8VCJPd3PUnXgrv9oNl/e3sn4CvVwkbQg8A39JmaBVcdI/0JpNA1h2sxeFAFaGAu
         mWDPqQa3x7HUUyF47pEOee2WWdUnxBOIzVU8FI86I0fdfZe6t9HDuNn144Q2R2afSGXD
         fdGDaNLmszaAD71hw5UpAWoyHuqx88iuDD6HgEzlQ0ow1WPCTJ9P5WK72PBOnRrUzXS3
         j/MUsqheZk2jc51jp0jaz2irdi+N/yKiBZ+9UiXgb0hpPm980S3JRVL9DC3e0I4ZAH5h
         JnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713213990; x=1713818790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQH1fnHdxuhfyl8z9lLAyiPd+rF+Qf9RWJEuMIgG794=;
        b=nNds69XyD0ou/524/WZSrqdaSQSrd6hlOgjdsgpWzZ/ZfNmDrSGiUwPJ9kjJ1SaG5V
         KauvXUHOqMXLH7ZyNULMtGPB46aVgb4MjoekLlv881T2npow/SuZS3+uHuJF2jDz7A3m
         8RTlmG1J0ObZHYi5G2ROStuM+GGYAlDQIUW6B0+Av8D0wDrBuOS2wKpddtIeDgvGXbS4
         Ur63y+WLuVC7k+s0colrGXX/EcsbT0TxcIuMrHKzDXuJqyiAUf/pGNDajbkfTl2fjg/r
         bhf3fA/A/puyd2HIDhJp32SyDaQgBB/WjRDVJy/cpn8BPRcqikR/NgFPIPYgbOMM8G6y
         LJsg==
X-Forwarded-Encrypted: i=1; AJvYcCVQDj1QEG/AFg1BQSSUCrbKBcPP76IcQfgMAry/KZIVYhXytR/etC2h203gWopID87MUKPfgblXGMDDwmSvw67BYkurt04G8fqNC6c=
X-Gm-Message-State: AOJu0YyrrEej+7MEJlIU6Ssy79AplhzpPSOOqNQ+AkOOGTzVWpbz45vs
	MByjC1EfrGxFeTAnvESJAyo90504GIPvd6z2NizxGxUdCsGXFiVJ
X-Google-Smtp-Source: AGHT+IHz0wOP7okRZmGKnlB9cgbQaWoJFhJdoBH0pyaqWvuNkIdpW8kz8KDqkPKRxlBdxvcDsLAroQ==
X-Received: by 2002:a05:600c:4f87:b0:418:1e10:ab6f with SMTP id n7-20020a05600c4f8700b004181e10ab6fmr7029506wmq.35.1713213989864;
        Mon, 15 Apr 2024 13:46:29 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id j20-20020a5d4534000000b003434f526cb5sm12938715wra.95.2024.04.15.13.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 13:46:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Aren Moynihan <aren@peacevolution.org>
Cc: Aren Moynihan <aren@peacevolution.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-iio@vger.kernel.org, phone-devel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Willow Barraco <contact@willowbarraco.fr>
Subject:
 Re: [PATCH 1/4] dt-bindings: iio: light: stk33xx: add regulator for vdd
 supply
Date: Mon, 15 Apr 2024 22:46:28 +0200
Message-ID: <2319549.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20240414175716.958831-1-aren@peacevolution.org>
References:
 <20240414175300.956243-1-aren@peacevolution.org>
 <20240414175716.958831-1-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 14. april 2024 ob 19:57:13 GMT +2 je Aren Moynihan napisal(a):
> Signed-off-by: Aren Moynihan <aren@peacevolution.org>

Commit message cannot be empty.

Best regards,
Jernej

> ---
>  Documentation/devicetree/bindings/iio/light/stk33xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/stk33xx.yaml b/Documentation/devicetree/bindings/iio/light/stk33xx.yaml
> index f6e22dc9814a..db35e239d4a8 100644
> --- a/Documentation/devicetree/bindings/iio/light/stk33xx.yaml
> +++ b/Documentation/devicetree/bindings/iio/light/stk33xx.yaml
> @@ -29,6 +29,7 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  vdd-supply: true
>    proximity-near-level: true
>  
>  required:
> 




