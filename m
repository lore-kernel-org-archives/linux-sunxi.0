Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9B1320F
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Oct 2024 01:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729906186; cv=none; b=i8fp4cpzJmp+E08Uf+fH9L3xHL10QS05bFHG9L3qaKP88eEroqvR0qfK0hhzDRXXpir0WKuD8064xgrafrMDE1lwm9VrYXuZI+Mi/L7pJMcQ0y69ZMzUR2nPvYZcsM5JIxAsLJ8hx4aYgjmTefl4X0b3VgXpx23BU5vdywxSmFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729906186; c=relaxed/simple;
	bh=wan6ghRrYyCJS2yMSO6K6VxY4zUUUkYsmFebGzhfPBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2iC7mkW8RhNApv/3Fs2TAkf+JG7DKSvFED4coqxD/COF9vrSZnDm5A4UqEzAoLxZqi27xyVHqmIfe5iCF1kW8RiLHPNm1xv+7AmUvxq8lkg5usyIoABDZk7igO1cBT/8yXRz/v8gJYvb15e/4RFuPcB+QED9DxMvdr0TVl/nIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e3f35268so3396313e87.3
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 18:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729906180; x=1730510980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00KlULZXQFFyz7svzxYaJpGGf2+6ICGFX0E8y5C8Vlc=;
        b=CiqwPNW+23958NgBabi3ypentw2NxFLJzDQRSF+cK8kEBfYBID0Z5scQyuovFAspXS
         PzmyQupy6FKX23Rh3K3SqbAW65OkSip+RCiyILR96o/JHbv4r/XUYaYp+YkiwFJUFG9R
         Nfn5CCYvDp+W2XUKmXaD+BftsZh5gqrap8uaDpPAbBEzgbtUT1LMPCpCS2di0dMLMv+1
         u7mKIHo+yckcxJSyv347Xfzt2a6D/e1K7St9WZCtRchXKZpjXSNXu4q2kB0hfiCdMvWi
         OWuPavzDvXbLBXSUQNab/RR25T5ddzAytjtaf/ljyRvuPhZPPdYTKXjyxfaBBCW/2wJa
         e5kw==
X-Forwarded-Encrypted: i=1; AJvYcCVLTKnx2idKVvJEFK0wctiNsxsLXWv0g3Ebe+93k1BuLtr/dotl2A3mwYAyknyXoz9qkp+aIOX1fS8Reg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHDqunpSCUeqQOzgKjqkc0hkZ/000dvMGY5Oe/Eh3jhbvp9Nso
	iRnL3j0iW6sn/TojNLBK+ei3wxtE0FJZsWoyzf2K+bNOi42H58MjlJiy9HCWbWs=
X-Google-Smtp-Source: AGHT+IHiRHNeDJydRv1ayerCTpYlkFFZwje5AVCjRPQJMxOrwfrZQq4tyrzT98PYolpENId2zJczow==
X-Received: by 2002:a05:6512:2243:b0:539:9155:e8b8 with SMTP id 2adb3069b0e04-53b348c0ef4mr468886e87.6.1729906180033;
        Fri, 25 Oct 2024 18:29:40 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1ebe23sm365892e87.281.2024.10.25.18.29.39
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 18:29:39 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb587d0436so27417041fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 18:29:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0+O+7OE5j/2lXfDjM49lDCNOsI5jCC5lTM+eIvubYLWFcOEwrJQUJe3k4N+47BySoKUuJldfr2KQBSg==@lists.linux.dev
X-Received: by 2002:a05:651c:19a1:b0:2fb:5138:a615 with SMTP id
 38308e7fff4ca-2fcbddfcba6mr5324521fa.0.1729906179135; Fri, 25 Oct 2024
 18:29:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest> <20241024170540.2721307-8-masterr3c0rd@epochal.quest>
In-Reply-To: <20241024170540.2721307-8-masterr3c0rd@epochal.quest>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 26 Oct 2024 09:29:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v64tQ_9C3mwJqt-tm-6SV=SHAk75sO5Ho7gT=p=iyRfLcw@mail.gmail.com>
Message-ID: <CAGb2v64tQ_9C3mwJqt-tm-6SV=SHAk75sO5Ho7gT=p=iyRfLcw@mail.gmail.com>
Subject: Re: [PATCH 07/13] arm64: dts: allwinner: a100: add usb related nodes
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Parthiban <parthiban@linumiz.com>, 
	Yangtao Li <frank@allwinnertech.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Vinod Koul <vkoul@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Maxime Ripard <mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 1:09=E2=80=AFAM Cody Eksal <masterr3c0rd@epochal.qu=
est> wrote:
>
> From: Yangtao Li <frank@allwinnertech.com>
>
> Allwinner A64 have two HCI USB controllers, a OTG controller and a USB

            ^^^ Please update this.

> PHY device, let's add nodes on dts.
>
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> [masterr3c0rd@epochal.quest: fallback to a33-musb instead of h3-musb]
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-a100.dtsi
> index adb11b26045f..0aee1b578661 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -302,6 +302,97 @@ ths: thermal-sensor@5070400 {
>                         #thermal-sensor-cells =3D <1>;
>                 };
>
> +               usbphy: phy@5100400 {
> +                       #phy-cells =3D <1>;
> +                       compatible =3D "allwinner,sun50i-a100-usb-phy";
> +                       reg =3D <0x05100400 0x14>,
> +                             <0x05101800 0x4>,
> +                             <0x05200800 0x4>;
> +                       reg-names =3D "phy_ctrl",
> +                                   "pmu0",
> +                                   "pmu1";
> +                       clocks =3D <&ccu CLK_USB_PHY0>,
> +                                <&ccu CLK_USB_PHY1>;
> +                       clock-names =3D "usb0_phy",
> +                                     "usb1_phy";
> +                       resets =3D <&ccu RST_USB_PHY0>,
> +                                <&ccu RST_USB_PHY1>;
> +                       reset-names =3D "usb0_reset",
> +                                     "usb1_reset";
> +                       status =3D "disabled";
> +               };
> +
> +               ehci0: usb@5101000 {
> +                       compatible =3D "allwinner,sun50i-a100-ehci",
> +                                    "generic-ehci";
> +                       reg =3D <0x05101000 0x100>;
> +                       interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_OHCI0>,
> +                                <&ccu CLK_BUS_EHCI0>,
> +                                <&ccu CLK_USB_OHCI0>;
> +                       resets =3D <&ccu RST_BUS_OHCI0>,
> +                                <&ccu RST_BUS_EHCI0>;
> +                       phys =3D <&usbphy 0>;
> +                       phy-names =3D "usb";
> +                       status =3D "disabled";
> +               };
> +
> +               ohci0: usb@5101400 {
> +                       compatible =3D "allwinner,sun50i-a100-ohci",
> +                                    "generic-ohci";
> +                       reg =3D <0x05101400 0x100>;
> +                       interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_OHCI0>,
> +                                <&ccu CLK_USB_OHCI0>;
> +                       resets =3D <&ccu RST_BUS_OHCI0>;
> +                       phys =3D <&usbphy 0>;
> +                       phy-names =3D "usb";
> +                       status =3D "disabled";
> +               };
> +
> +               usb_otg: usb@5100000 {
> +                       compatible =3D "allwinner,sun50i-a100-musb",
> +                                    "allwinner,sun8i-a33-musb";
> +                       reg =3D <0x05100000 0x0400>;
> +                       clocks =3D <&ccu CLK_BUS_OTG>;
> +                       resets =3D <&ccu RST_BUS_OTG>;
> +                       interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "mc";
> +                       phys =3D <&usbphy 0>;
> +                       phy-names =3D "usb";
> +                       extcon =3D <&usbphy 0>;
> +                       dr_mode =3D "otg";
> +                       status =3D "disabled";
> +               };
> +
> +               ehci1: usb@5200000 {
> +                       compatible =3D "allwinner,sun50i-a100-ehci",
> +                                    "generic-ehci";
> +                       reg =3D <0x05200000 0x100>;
> +                       interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_OHCI1>,
> +                                <&ccu CLK_BUS_EHCI1>,
> +                                <&ccu CLK_USB_OHCI1>;
> +                       resets =3D <&ccu RST_BUS_OHCI1>,
> +                                <&ccu RST_BUS_EHCI1>;
> +                       phys =3D <&usbphy 1>;
> +                       phy-names =3D "usb";
> +                       status =3D "disabled";
> +               };
> +
> +               ohci1: usb@5200400 {
> +                       compatible =3D "allwinner,sun50i-a100-ohci",
> +                                    "generic-ohci";
> +                       reg =3D <0x05200400 0x100>;
> +                       interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_OHCI1>,
> +                                <&ccu CLK_USB_OHCI1>;
> +                       resets =3D <&ccu RST_BUS_OHCI1>;
> +                       phys =3D <&usbphy 1>;
> +                       phy-names =3D "usb";
> +                       status =3D "disabled";
> +               };
> +
>                 r_ccu: clock@7010000 {
>                         compatible =3D "allwinner,sun50i-a100-r-ccu";
>                         reg =3D <0x07010000 0x300>;
> --
> 2.47.0
>
>
