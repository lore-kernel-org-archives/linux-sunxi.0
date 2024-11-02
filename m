Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F140176FB6
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Nov 2024 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730547345; cv=none; b=n7poty8joaXNKlx8S3CUfnuNrLVRcwxvkLeSRPyhYmBZyb+d7uFnAIBYoDxUs/n96b8wm2Qm232A56d84Go68GweAXKkPIZhqpoCpdvEpIvFvYfHC6QQKCowNW7IlMqiU/WpYYutAI8RltudEqsTw3JkWN4vK4X37HIzIZAyiZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730547345; c=relaxed/simple;
	bh=/F1oVefCGAZN0JK03Otc0zwkAJofnTFCZ5g14PrPdhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aQreXGftLG8kXl1QZulYJV+BN+0deU2afeYJ6aY613hOrqzRNuiW/idlXPIJvqiImxUqN4Govk5tQCIFFIMEbtDtwc6p5U7GxsVIZPppaTdbt9kqTCL/PUqFC71mio1nUl6s1AV5JbBKXgiIR6+U+BNyEA1ljUeSvnzodeKDm9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a0c40849cso457429166b.3
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Nov 2024 04:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730547340; x=1731152140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2//9P0I4J3XvBkNzIbbNIA2dq470ULwziNwddPzImEE=;
        b=AlBTuVOITXJ68Vio+CGmn9o/tpjUmyTpSuTU+Obl0ABWNbXLyIo8MgieQlIHC7Rnod
         4Qr1UmdLcUrV5s1/ZXxw7WNZT5zeqAcDcNmzgKo2DV37376DkCA5KEnguBIrmFpBe/yg
         ke7k6toXwzk6AG3vXFX/Cvam5u34qJerWcywYIf7YcBcjuyQ0WvkQqXpYeLZRwTsJ0UQ
         WZ+jhquRKfkb5eW+6HEiLlTqwaNC3akoxrk8cNfS3TqTMgCBZIA8xRrX97MPWke/KFGj
         3Uv3RIHzMy6QsZ4if36MMnsRB2oidObq7TQrLG2K8uOrFerbN+UoncJI0/cLgqONIQdz
         DG8A==
X-Forwarded-Encrypted: i=1; AJvYcCVh5Qayx4aQaATfhL2cNvQTizypxEH+uqmOcox8PXkPYHEHJJcYQoh7kgEheNeF85Zq/szFMHsgjzG/EQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCZIW8DRFFLRQFdVxEk2s4Q96QHa1ElQjjdMlJYO69+MPeWu4c
	2VXEeAbz/ctYzUZ4PPcY1cnQ9+xZdxC+8UyPQVPe5ZyBuoHYJA5atMcXFy/5QM8=
X-Google-Smtp-Source: AGHT+IHhikRt8/mGWkxbOHdbqdV34KvthyjB/9PEaWrikrmgsF//vlByJcnUd8onD3gRNsWxlVmAdw==
X-Received: by 2002:a17:907:3d9f:b0:a9a:5e3a:6423 with SMTP id a640c23a62f3a-a9e3a573902mr1279875466b.10.1730547340285;
        Sat, 02 Nov 2024 04:35:40 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56645ecesm303615266b.178.2024.11.02.04.35.39
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 04:35:39 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c9709c9b0cso4026072a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Nov 2024 04:35:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbfwLi1aNB3FQQi76SxYbDTkkahILmbBgwuM5WyT+bebUAZcThBZU0kc7C+ajs7Rm4QhFJRrOwYHVfLg==@lists.linux.dev
X-Received: by 2002:a05:651c:1508:b0:2fb:656b:4c69 with SMTP id
 38308e7fff4ca-2fd0df8886amr74910741fa.43.1730547000254; Sat, 02 Nov 2024
 04:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest> <20241031070232.1793078-8-masterr3c0rd@epochal.quest>
In-Reply-To: <20241031070232.1793078-8-masterr3c0rd@epochal.quest>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 2 Nov 2024 19:29:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v66meMUPwOUr4Qutqu7TO-UwDtCdwOhwDv8JE_JMZi=58w@mail.gmail.com>
Message-ID: <CAGb2v66meMUPwOUr4Qutqu7TO-UwDtCdwOhwDv8JE_JMZi=58w@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] arm64: allwinner: A100: enable EHCI, OHCI and
 USB PHY nodes in Perf1
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
> Add USB support on A100 perf1 board, which include two USB2.0 port.
>
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
> Changes in V2:
>  - Add dr_mode here, instead of in the .dtsi
>
>  .../allwinner/sun50i-a100-allwinner-perf1.dts | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> index f5c5c1464482..2f8c7ee60283 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> @@ -7,6 +7,8 @@
>
>  #include "sun50i-a100.dtsi"
>
> +#include <dt-bindings/gpio/gpio.h>
> +
>  /{
>         model =3D "Allwinner A100 Perf1";
>         compatible =3D "allwinner,a100-perf1", "allwinner,sun50i-a100";
> @@ -18,6 +20,36 @@ aliases {
>         chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
> +
> +       reg_usb1_vbus: usb1-vbus {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "usb1-vbus";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               gpio =3D <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
> +               enable-active-high;
> +       };
> +};
> +
> +&ehci0 {
> +       status =3D "okay";
> +};
> +
> +&ehci1 {
> +       status =3D "okay";
> +};
> +
> +&ohci0 {
> +       status =3D "okay";
> +};
> +
> +&ohci1 {
> +       status =3D "okay";
> +};
> +
> +&usb_otg {
> +       dr_mode =3D "otg";
> +       status =3D "okay";

Since you noted in the previous patch that OTG doesn't work if OHCI0/EHCI0
are enabled and probed before musb, maybe we should keep them disabled
for the time being?

You could leave a TODO item above the &usb_otg node.

ChenYu

>  };
>
>  &pio {
> @@ -178,3 +210,10 @@ &uart0 {
>         pinctrl-0 =3D <&uart0_pb_pins>;
>         status =3D "okay";
>  };
> +
> +&usbphy {
> +       usb0_id_det-gpios =3D <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
> +       usb0_vbus-supply =3D <&reg_drivevbus>;
> +       usb1_vbus-supply =3D <&reg_usb1_vbus>;
> +       status =3D "okay";
> +};
> --
> 2.47.0
>
