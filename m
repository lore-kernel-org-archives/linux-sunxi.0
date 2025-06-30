Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767A94A23
	for <linux-sunxi@lists.linux.dev>; Mon, 30 Jun 2025 04:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751257974; cv=none; b=Fy/X/Fxmky2C9mTkYWfzTAaCgXYUaRVENtqnTl0MqwkqK2cuc4yC9O3qUipq1sEEVYiTHS5FfNjEQpJ/lIJGBdJ26Z6F6CWdoblAvItnM1b3O/qwJBN8B8Al7BCdEw5Oeomf/qEfGyAHh46tAJZc5vE0zV8X6GLWLKfYzP+zEHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751257974; c=relaxed/simple;
	bh=R7zcCovUjtiZyN7Xl7zbfCp3HhGk37QNCfMdhJI4qQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OV+mY8GedZfAKrwTjFMRBeOPqRHLEsGOaTH1A6WqRNDwn/6O827lX07sFLffQAodm2M+FYXEL1yWgHtOPqzSqSy5yHyadKVcoppU7nsjd22W6Olai425HvtokStPTu3t17G8Lec8sUooXXfbbkmM0OqsPHo0zDbVOWLj7U49XkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b6a349ccso1837563e87.0
        for <linux-sunxi@lists.linux.dev>; Sun, 29 Jun 2025 21:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751257967; x=1751862767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JbVuaR12V0J6Xt+/G9MNTrnfxERz+sAIcOpg6dKC95Y=;
        b=IKK5z6AiiOZm50QPZf00Ojy5ikGUs7slKKKsQAizHf9eLYLXF3EdiZrr4mc3xBD3PQ
         PUyhCIo5kUQS49ICWH49/dNP4N97zEXVY6D6cNKZIbYjrpmedb96zt5nNT5+mbhchv8v
         x3ZVWGQ4sLNpTfeG1C/3k5/W36nhmn/yfVkgHGLvrxWGJDdbd1vVVa3J1GmPlR8iqAi8
         XWYlbQ8orEx+DLmPH7pNplMKENk/FUXGYBq1qB/eui/LkOCTfRBfAKoyPHH162gy/xi5
         /pY2vdlasbva7+MFGemrj3gVYSQFmqxSlU4qXqRM67g4J9etbzkP0Sxn3FSm8zxvaHko
         kM1A==
X-Forwarded-Encrypted: i=1; AJvYcCXBPoVyHAJ7qsPhvwz73tmvwSR3C9YhHJV9NfuZTGvhS5n2htJOEudPxgOlH2o3tktSorbeKhSBXkoWzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVysIKxAjcvEvqRbkaFyKIn2l4ySYniqaiz4zXX4MEOkSWsxJP
	y21GZwnTeM1gAOZJ3WFglpmpyEzx8+sN65RZ/nXtzISwiZz/EwSBTfpytcMTJt79
X-Gm-Gg: ASbGnctoPpQXfB9adCkZdc2fL5e7h8QY5OQCUGFDWpsKkLDrmNfiU0575GsBYoO+s1Z
	jJUAw0/7IXBRBKdatnV3uAuNTFVr8juJ5+aoYhbrU5iHdFjgYvmxksRC8/iXZP2eEC8orExuXpz
	DN9RosGO3JAlF12cd37pY048gZdU/GkrqKhABBEq2MOQs8GqCeDMBN0GAbYl6oymolEtgY/ybOI
	vpmYbfxMyKVpvzOw9lLON3zm9IPJc9ZPtooiIeI6wrBOhonH3qiwaswG8X9QGRgcMjCL3YyXeeX
	RSA8p4ZFSlso3vCLiZVF8YfyLLX/XjF76vEvEEMg6nQCnGvWrkYoQNV0tWwgImkwvzOHgq95uxZ
	r4rBmV7Bh8/QryF7ITco=
X-Google-Smtp-Source: AGHT+IF0DQbmA+pDLjrdea8igNwpWkTt1oK4GkpdTLteMBEqw1FOiVUvpR4h3Wpz1j3xQG/c0ViuJw==
X-Received: by 2002:a05:6512:4012:b0:553:2480:2309 with SMTP id 2adb3069b0e04-5550b7e6c8amr4295775e87.3.1751257967294;
        Sun, 29 Jun 2025 21:32:47 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24d0f8sm1290867e87.59.2025.06.29.21.32.45
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 21:32:45 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32aabfd3813so16914071fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 29 Jun 2025 21:32:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUb5HitoXWGj4Yp1z+j70ljGPdqqvd+2Ng8seQNNOaI5CTV3LrOc2B80GZQKMeN6qE7J1jMzX6CbsVHCA==@lists.linux.dev
X-Received: by 2002:a05:651c:20c5:b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-32cdc329543mr23944531fa.0.1751257965460; Sun, 29 Jun 2025
 21:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250411003827.782544-1-iuncuim@gmail.com> <20250411003827.782544-5-iuncuim@gmail.com>
In-Reply-To: <20250411003827.782544-5-iuncuim@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 30 Jun 2025 12:32:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v659nQit-cOsr6q+ACO2MJ+c6RyfBWVg7iP_u1DO4fXBHQ@mail.gmail.com>
X-Gm-Features: Ac12FXycZ4eBZnw1-9h5Z5_HZw9HoRSOqmeNCAZOYMw7KeNLsUjQ12gZN6IqRgQ
Message-ID: <CAGb2v659nQit-cOsr6q+ACO2MJ+c6RyfBWVg7iP_u1DO4fXBHQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: allwinner: A523: Add SID controller node
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 8:40=E2=80=AFAM iuncuim <iuncuim@gmail.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> The SID controller should be compatible with A64 and others SoC with 0x20=
0
> offset.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

But this also needs a matching update to the binding.

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index ee485899b..d626612bb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -171,6 +171,13 @@ ccu: clock-controller@2001000 {
>                         #reset-cells =3D <1>;
>                 };
>
> +               sid: efuse@3006000 {
> +                       compatible =3D "allwinner,sun50i-a523-sid", "allw=
inner,sun50i-a64-sid";
> +                       reg =3D <0x03006000 0x1000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +               };
> +
>                 mmc0: mmc@4020000 {
>                         compatible =3D "allwinner,sun55i-a523-mmc",
>                                      "allwinner,sun20i-d1-mmc";
> --
> 2.49.0
>
