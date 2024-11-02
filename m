Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AD418733B
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Nov 2024 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730548145; cv=none; b=CkvJN8zOcn3Mk2vTBhngPPVqSjOHP1v3nLPij5B9hCOUc7fEhjY+0yVE7uelak71L7+QVG4z+BsT7zaHiZfHRUeAAJfh592/MA9AQpemol6NtIttpP1h0sprMljKa7dwYPI094DTZ2zcksdVcemjhahUIrgB8N7uOIk1RJQKZUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730548145; c=relaxed/simple;
	bh=W2cSYdIgTxYR8mOPhf+ODb+RkckYv34eRxJumqWmJ98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWFYcGQ6wAXxeXNk05OdfnY+yLd3eyohNu269l2f5/9Z2DCg54M2vQ08Ue2uphjhm1o5rGfIY3VMcntJ9DJaObzoqGaygWYrnZYjZK+sRkmnYQQ5E6Nm6338EucHZGMbZIXyrbK8tISNV83brdrBbQ1oHIi/OJrMBGO0iUcen/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-8323b555a6aso153134139f.3
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Nov 2024 04:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730548137; x=1731152937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UCDur7kMwBxLZ7iPM36W+L8Iemo6gZ+3RoWOEA3d2yQ=;
        b=Ib6dP0p5qyMOIVldrrX1c0XwNhlMv2wEzPI25LTSMwn6Y93tMJSG8FBd7/VUSu/+ne
         evqVJn3vO9bXQdTdJu3oscMc4JTz9sMEP2VUbgtGRUxLRN5rwmIKjRI5S/4/YrKCCLdF
         RGWjNUnaGBX8jBRaW4oUmqsbLllt77VQXbsVPhPquMbxHzLjubWKXvU7DP0NrHEzYRp/
         vaTMqXK2GwtJGTFJdQelmFgCXoaYfW2QNQc+VA8aQqUVY5l8T+w8cfLifIMJq9GWvERO
         azbdKUWsiI4axSBPX9ggVjH4GdHFd7UFJvIf7otZqISlIrCwNHmIQ3J6eS4c3j6Pfp9w
         +Y9w==
X-Forwarded-Encrypted: i=1; AJvYcCVigZIwhzeSdYFEEp6A/2sixjxC/4GZ8c7MAilXNvH6euVObnWlDcVJWbA6F9VCSYsmnyI3H7tgVKWEew==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi8vk6XDZYU+gvAPZo8GLFYO0oOY28Jc938iiyS2uG9ZfZTDmf
	cofird6Xvgz81Awv8vEPZvboKL+kfvCY0s6760T56o0nHZWj+UmQTHCJLFu6hgY=
X-Google-Smtp-Source: AGHT+IF7xhWlLcDGJS8gszu38BmuyiYLZVnevMzIFmHAcn9jKcuE2jM+ZO9xjgrhGT/ACwPoiMLdKQ==
X-Received: by 2002:a05:6602:13c7:b0:83a:942d:7ded with SMTP id ca18e2360f4ac-83b64f8752cmr962280739f.6.1730548137270;
        Sat, 02 Nov 2024 04:48:57 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83b67b29ae4sm126341739f.20.2024.11.02.04.48.55
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 04:48:56 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-83ac05206f6so104434139f.2
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Nov 2024 04:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqZoBujelElkcxZzpXPMonHj+y6xgqTMxGA/zl7DldstJv4BRD+rkvKffuJZ0vF8iskIan9lfkEsElkw==@lists.linux.dev
X-Received: by 2002:a05:6602:29ce:b0:82c:ed57:ebd9 with SMTP id
 ca18e2360f4ac-83b650372b4mr1250261339f.10.1730548135524; Sat, 02 Nov 2024
 04:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest> <20241031070232.1793078-11-masterr3c0rd@epochal.quest>
In-Reply-To: <20241031070232.1793078-11-masterr3c0rd@epochal.quest>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 2 Nov 2024 19:48:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v66TAttAezXE7TnT5N6XFW2482ipuqkcpwjeDud6v=xD3w@mail.gmail.com>
Message-ID: <CAGb2v66TAttAezXE7TnT5N6XFW2482ipuqkcpwjeDud6v=xD3w@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] arm64: dts: allwinner: a100: perf1: Add eMMC and
 MMC node
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Yangtao Li <tiny.windzz@gmail.com>, Parthiban <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 3:03=E2=80=AFPM Cody Eksal <masterr3c0rd@epochal.qu=
est> wrote:
>
> From: Yangtao Li <frank@allwinnertech.com>
>
> A100 perf1 hava MicroSD slot and on-board eMMC module, add support for th=
em.
>
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>

So I skipped this one since Andre had some questions about the previous
mmc clock patch. And I believe this one won't work without it?

ChenYu

> ---
>  .../allwinner/sun50i-a100-allwinner-perf1.dts    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> index 2f8c7ee60283..d418fc272b3c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> @@ -39,6 +39,22 @@ &ehci1 {
>         status =3D "okay";
>  };
>
> +&mmc0 {
> +       vmmc-supply =3D <&reg_dcdc1>;
> +       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> +       bus-width =3D <4>;
> +       status =3D "okay";
> +};
> +
> +&mmc2 {
> +       vmmc-supply =3D <&reg_dcdc1>;
> +       vqmmc-supply =3D <&reg_aldo1>;
> +       cap-mmc-hw-reset;
> +       non-removable;
> +       bus-width =3D <8>;
> +       status =3D "okay";
> +};
> +
>  &ohci0 {
>         status =3D "okay";
>  };
> --
> 2.47.0
>
