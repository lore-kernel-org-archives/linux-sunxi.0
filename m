Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C7F7C
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Jan 2023 12:57:46 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id j5so1151866pjn.5
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Jan 2023 04:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pHDwofD6SNKiSG9J7TUSJkrmFZQrL5w821eu/p8EPRU=;
        b=iPN6ih9dkMLk+5Z2aO/raD5la104GDCNl3CCUgRjXeNfrMc1eRRQLX+rW/a5QmZO+m
         B5bXAwh1T1YLSp3rlbm8FEnva/gJP3n3OZYoMOG77PVmiWJagWclMj6tHYAK+pMUsXE6
         +CjNrIrurjl+60nhpqO6rp6LooQAlirhjPvvmRM3LPQ4rAOOyT2ZBxeOjwqYIlfhL4lE
         CDYW1321n16C9CBrp3BhFS1Jp1ctyQTPyCxk6dKfdcYO6VyAQqB06pX4VPHDdtvEHyJp
         6Q3bbPNirD14g9/iLGGTr5bZQBj6ZQGdhdG6dDIzD6wr1RuFw1GLdUgOA8PWfnMm1Ojg
         KrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHDwofD6SNKiSG9J7TUSJkrmFZQrL5w821eu/p8EPRU=;
        b=H8uEmX3x5Fk0m9Jjr5174al7J6qeN4EOna7uNw5OFwBx+2LoiYbeFdmwANFST62zjp
         Aqw/aBpG4juDfw5f0B1fFPxZPmYylAEhrFI/9z9n6b338sxWmIPZTFqQh7vA2r2dPJVd
         d/AAUKYFO4v/2FhrAcY25jrCGNcR62zVZwweO0IQ+OA6QUIUwejrVF0GNY33wpgCk2rl
         VLk/o5p9cjnGWp/mQxVs/C2tLNBw1z/tZS07uLGGII6pCBlhZ4GbUPEofmSs0R+U2Hx2
         w1VyKiXUIYC0c1vYt2VplEqO1COvyga6++shtt+82XPRCgNuiWHIJZ0AlxV8j8vWLM9i
         hVng==
X-Gm-Message-State: AFqh2kraY1tk488QZbyfN2wLmXRsC+ShJdcbfxAqBNBM6nVCf9LGflBA
	CJFw0msWn3u44KTVgfa2IWHcjSSvtqeCYJu+vaCj/w==
X-Google-Smtp-Source: AMrXdXsXrzgXKblU35lGXnG8geMzqwtmylKWGg/S46lL+qzXF/CIo+TO3fVEgZ6gox2a0BBdn7y53nUVeSWujIcNZtM=
X-Received: by 2002:a17:90a:730a:b0:229:7d95:a476 with SMTP id
 m10-20020a17090a730a00b002297d95a476mr3744415pjk.84.1674565066523; Tue, 24
 Jan 2023 04:57:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org> <20230120085722.171965-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120085722.171965-2-krzysztof.kozlowski@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Jan 2023 13:57:09 +0100
Message-ID: <CAPDyKFraR3BNa4874S4ZVHxTQNZWuSVOOpbGZ_Vnzfwe3ik7=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: mmc: correct pwrseq node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tony Huang <tonyhuang.sunplus@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Markus Pargmann <mpa@pengutronix.de>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Jan 2023 at 09:57, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Node names should be generic and should not contain underscores.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml   | 2 +-
>  Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml | 2 +-
>  Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
> index 911a5996e099..588be73168fa 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
> @@ -41,7 +41,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> -    sdhci0_pwrseq {
> +    pwrseq {
>        compatible = "mmc-pwrseq-emmc";
>        reset-gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
>      };
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
> index 3397dbff88c2..b35e00e8c65e 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
> @@ -35,7 +35,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> -    wifi_pwrseq: wifi_pwrseq {
> +    pwrseq {
>        compatible = "mmc-pwrseq-sd8787";
>        powerdown-gpios = <&twl_gpio 0 GPIO_ACTIVE_LOW>;
>        reset-gpios = <&twl_gpio 1 GPIO_ACTIVE_LOW>;
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
> index 64e3644eefeb..00feaafc1063 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
> @@ -55,7 +55,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> -    sdhci0_pwrseq {
> +    pwrseq {
>        compatible = "mmc-pwrseq-simple";
>        reset-gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
>        clocks = <&clk_32768_ck>;
> --
> 2.34.1
>
