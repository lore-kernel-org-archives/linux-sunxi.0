Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D819123BDF
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Aug 2023 14:30:11 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-52222562f1eso1353237a12.3
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Aug 2023 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691073010; x=1691677810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TLGQIBcmnPlkP1H90L4arPiKiIXchPemEGcuJPAOma0=;
        b=V+wQrfpbow5/ttxZyUaV1RdKWQBC7AlUZ+3pcXXgdBtzPOqOmhWAJj48MQ2U9Uu1Uh
         0hnPC98eznmSl92mH0pwquOMr4wm2BVnKGHKU9b6cP2b9g0NzW5jsIZ9WigeqeG5wMpP
         WAKPsyO7mcI6WXaLmxpP13y2dwywJxIuOQbO7Voz9sPm7KK4bdzTpEhKCamLxREpsZDK
         u/s1C64p5ogdHE6+0YMBAlD+f1hiY6xh6x+Xg65Erhk9UkBCxZ+pqKQXXIjXy4r9pHOR
         XC/z3K4SP2DpXMumtmvd5xcVevAlg0cNvG7rQ2ljBVr6wsL9uq222QCYvEBiUnzG3gyA
         Xx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691073010; x=1691677810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TLGQIBcmnPlkP1H90L4arPiKiIXchPemEGcuJPAOma0=;
        b=Tq1TnVURgk2fN2F+ivG5hpVnh6tTFWFs5kDrmVRWAhPiqowTcYCR+m+kvzJDOszHlg
         d+S8TUppqUoyAr1KBziToXRWlEJD6I4wa50duFbDyE4kwEdhCPbWdKxLnoE7FwcSxwRZ
         RV95/7SkgVJ3KAr/IXIkdkquv0/AVCAYiRRdIxfT1RG7Tf03p6wNLCdtvCOwuN171rHU
         tCp/YyEPcm/TxmCCSf5XkZJZBjRdJVxYqqYIaONgAhrXhs9BGERixGhyzqw4gEwnNAPJ
         ds9QCLXkBMNqEQXsXGqKjx982xOnKKYnyBpVfZ1fHRBL+CrvdpPBPyHFOdX0eDCp72UE
         kToQ==
X-Gm-Message-State: ABy/qLaWunuJ7Fe8vTjbrOgzz2GMpJHORWLLfXD0HLFlmyfnAS0N1rZU
	XlN270v8nuZSvYexHTKktHDScA==
X-Google-Smtp-Source: APBJJlHOlI75QhDtYFAg9HERhBvyV2JLY/tIUjauBt+B1yJGtKwFW58txzygi3y9gEXeh2orqraKGw==
X-Received: by 2002:aa7:d705:0:b0:521:e502:baf8 with SMTP id t5-20020aa7d705000000b00521e502baf8mr7841254edq.11.1691073009875;
        Thu, 03 Aug 2023 07:30:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id d7-20020a056402078700b005221ce96801sm10344275edy.35.2023.08.03.07.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 07:30:09 -0700 (PDT)
Message-ID: <17dec3fb-1bce-77ff-9917-7f565049954d@linaro.org>
Date: Thu, 3 Aug 2023 16:30:06 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v1 6/6] arm64: dts: allwinner: h616: Add BigTreeTech Pi
 support
Content-Language: en-US
To: Martin Botka <martin@biqu3d.com>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
 Icenowy Zheng <uwu@icenowy.me>, Ludwig Kormann <ludwig.kormann@ict42.de>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230802220309.163804-1-martin@biqu3d.com>
 <DFE9B2F1349F69AE+20230802220309.163804-7-martin@biqu3d.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DFE9B2F1349F69AE+20230802220309.163804-7-martin@biqu3d.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/08/2023 00:02, Martin Botka wrote:
> The BigTreeTech Pi is an H616 based board based on CB1.
> Just in Rpi format board.
> 
> It features the same internals as BTT CB1 but adds:
>     - Fan port
>     - IR receiver
>     - 24V DC power supply via terminal plugs
>     - USB to CAN module connector (The actual USB to CAN happens on the external module)
> 
> List of currently working things is the same as BTT CB1.
> 
> Signed-off-by: Martin Botka <martin@biqu3d.com>
> ---
>  .../allwinner/sun50i-h616-bigtreetech-pi.dts  | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> new file mode 100644
> index 000000000000..05f39b3606ba
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2023 Martin Botka <martin@biqu3d.com>.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616-bigtreetech-cb1.dtsi"

If this is using CB1 DTSI, does it mean it uses CB1 SoM? If so, I think
this should be reflected in the compatibles.

It's a bit confusing because in previous patch you call it "CB1 board"
but then with name "Manta"... So what is CB1?

Best regards,
Krzysztof

