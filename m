Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E82B63D6
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 18:18:51 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id f3so11904494pgc.2
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 10:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+on0BIC3CWKsQ/zQgT7Zq7kaAAA97DJzG1xxvLCYCd0=;
        b=Y2s0QwXYrb3JZrFrFOem8gxmiYnaXcD53JwjtTM5LgVmhPSgCom9h6ZoSMmFC8EWVX
         ydMHZcweTpXZyt2CHQhQ40CDwQNLJs70jFsGZlp9wzZ17FSg0DZtTdWCvNXTJQ43Xc6Z
         qHp6p6sn1SOzrTC1s+ktxqpx28mB7O3KrQ5t7/2JEMdXCQw/ucP5sYtbUxudMJtvR/2x
         xvDIz3Y9dTEPRVM2McBBEfPfpnvb2rGw2w0pc2p8DRQwML8/0yk9rvpR6QGB+IOq7plS
         2krvaNLFAOfEsiW8MP1iLUyRS+OgM4z2RhvigUKReEn3dHZ9JJ4kQHRUsrFeyBp8cD7F
         NEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+on0BIC3CWKsQ/zQgT7Zq7kaAAA97DJzG1xxvLCYCd0=;
        b=H04gOQCygIcxlFskuOp7P7T7iB5jwZ1FZ/B4rohDuAzJ2Y/9HAnqjHYXVc9K6ygpST
         Y6qmVpef4EYc7k1EA1Pl/OKSgfSUUWpjfsE3PFpqeDA4LUVbeWu0Mn2BWJSmkWm4tHNA
         MwMloFFc++gZVPs/dWieODsaqG2896Xq2Ghs+H5PsQUPVvQzANsryta8LSNDozFMQjdk
         a0sLV1pQ9SME16+8TxXRY0TXcSuOhX+hQRfdMA4lqR469Z56PIpG6djIX9Dw63CnDj8s
         Jir8yH5Kk11V20FICYkisD6gNZ0ozyhfIxK4wou7AmfF26AUKgCEF9bsrJbEsZYsRhNA
         2Xfg==
X-Gm-Message-State: ANoB5pk7Z34Dl/2XJ45HX9aG/20MA1Icell+euq9lkH67/sBhxpdciAX
	d6FangzN58LPGAYC+oLFzslk6kfHuLzDECc9qIQ=
X-Google-Smtp-Source: AA0mqf7LqN1T/OFto2jVhaNxZ2yGDqc/xRjAOptQIyQmYXhv8nQeAlkd38TMX7ofEDomjM8uh4mAaGxiaYXcFihRecU=
X-Received: by 2002:a63:2f46:0:b0:477:4a13:f38e with SMTP id
 v67-20020a632f46000000b004774a13f38emr2304423pgv.131.1669054730967; Mon, 21
 Nov 2022 10:18:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221103-upstream-goodix-reset-v2-0-2c38fb03a300@theobroma-systems.com>
 <20221103-upstream-goodix-reset-v2-5-2c38fb03a300@theobroma-systems.com>
In-Reply-To: <20221103-upstream-goodix-reset-v2-5-2c38fb03a300@theobroma-systems.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Nov 2022 15:18:32 -0300
Message-ID: <CAOMZO5BzWsHAy7KjZe+KEiXVq-Mfpggqjk0vswuzx7nkups3gA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/7] arm64: dts: imx: fix touchscreen reset GPIO polarity
To: Quentin Schulz <foss+kernel@0leil.net>, "Angus Ainslie (Purism)" <angus@akkea.ca>, 
	David Jander <david@protonic.nl>
Cc: Shawn Guo <shawnguo@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Samuel Holland <samuel@sholland.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Bastien Nocera <hadess@hadess.net>, Chen-Yu Tsai <wens@csie.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>, 
	Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	NXP Linux Team <linux-imx@nxp.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[Adding Angus and David]

On Mon, Nov 21, 2022 at 3:12 PM Quentin Schulz <foss+kernel@0leil.net> wrote:
>
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> The reset line is active low for the Goodix touchscreen controller so
> let's fix the polarity in the Device Tree node.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts         | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts b/arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts
> index 9fbbbb556c0b3..df7e5ae9698e1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts
> @@ -107,7 +107,7 @@ touchscreeen@5d {
>                 interrupt-parent = <&gpio1>;
>                 interrupts = <8 IRQ_TYPE_NONE>;
>                 irq-gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
> -               reset-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
> +               reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
>         };
>
>         temp-sense@70 {
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> index 6445c6b90b5bb..b038300812b1e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> @@ -542,7 +542,7 @@ touchscreen@5d {
>                 pinctrl-0 = <&pinctrl_ts>;
>                 interrupt-parent = <&gpio3>;
>                 interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> -               reset-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
> +               reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
>                 irq-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
>                 touchscreen-size-x = <720>;
>                 touchscreen-size-y = <1440>;
>
> --
> b4 0.10.1
