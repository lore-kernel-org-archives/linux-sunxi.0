Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA255321E
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 21:43:24 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id d26so14732ejc.8
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 14:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSR0kvjvmEqbQfDoKZndqnOBhufMXT1kC7pzqNRekuM=;
        b=Cczg+iY0sDVNdN0/8ztZx7DLdZa9ZD0PzklI8yniRZc8gucVB5FfazlAhH+3fiahXp
         8FYqN0gBQx249Mjl8ni20Ob8WIg3746wmz96k+R6eiv/Lko7T6lWqn9VyDU4PLqfzcGZ
         QfBEPAGrHnADQlrq9BamH8JCTnIJ5/zei5siEDhunYzDbVsutc1BordyBg92U1U7MTNk
         B2cwOfcCyz3DSAX2CQo18uPILX5b1OEJ/0y+1/8rFIjAZ+f4+fSXG/412Go/4/bUPiLg
         GCdPaB9KfwS/p944iW586ixAbu7QwZ8n/mqbB8N0KGvrAFxmPFx7CTib5AYHJrLq7F00
         9f+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSR0kvjvmEqbQfDoKZndqnOBhufMXT1kC7pzqNRekuM=;
        b=LKmxgtbDGLAi4hv6ydYf6arZtZipEvPQNNQI8Cc4RBu/eQwKwhXJQedgt9wDD9jtnZ
         PWxUkbR8KZ2rJPU45tiQdMqYWc+lw+z/bcElIm43DlY9uMJbnH3JQcVGiQ++VdbFKYvB
         WpKg/CvYk/g9sS+K76yLazJPWwxoHYWoDnjL+zxCNy4UeXrsqOZj/8+H2KrnnfP2h77p
         jng+uH0fP1A318c/MmqJ3fgkAtQjud9Bz7PEL+g7GhBtCsCdfoNYdsvEtTequ23xpBF0
         7dPlXcCYeB/++Vm+jtheguC8ZJpSDL5OBDcE5vdO5zQogS5z4Z42tBpkn3GFvpk9MFQo
         aj8w==
X-Gm-Message-State: ACrzQf3Slx14kPs0YMXk7yZKPJclmCEe7O0GJVItePkTA+/BY9sYwpX3
	wKI/5ie28FEpWJQmViJRg4o=
X-Google-Smtp-Source: AMsMyM5W+i+DnwHKCU3Y89ydQCj0/uS0LCvRxvCng5SwyA8/C4CGKAooIJ1HpH6+LpKl2JLtGn5OWQ==
X-Received: by 2002:a17:907:3f0f:b0:782:395f:cd69 with SMTP id hq15-20020a1709073f0f00b00782395fcd69mr24418429ejc.406.1665611003253;
        Wed, 12 Oct 2022 14:43:23 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id b17-20020a50b411000000b00454546561cfsm11976755edh.82.2022.10.12.14.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 14:43:22 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Jesse Taube <mr.bossman075@gmail.com>, Yifan Gu <me@yifangu.com>, Giulio Benetti <giulio.benetti@benettiengineering.com>, George Hilliard <thirtythreeforty@gmail.com>, Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/6] sunxi: f1c100: dtsi: add UART1 pins
Date: Wed, 12 Oct 2022 23:43:21 +0200
Message-ID: <2147678.NgBsaNRSFp@kista>
In-Reply-To: <20221012163458.1968900-6-andre.przywara@arm.com>
References: <20221012163458.1968900-1-andre.przywara@arm.com> <20221012163458.1968900-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre,

Dne sreda, 12. oktober 2022 ob 18:34:57 CEST je Andre Przywara napisal(a):
> The F1Cx00 SoCs connect the first PortA pins to UART1.
> 
> Add this to the SoC .dtsi, so boards can reference UART1 pins.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/dts/suniv-f1c100s.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/dts/suniv-f1c100s.dtsi
> b/arch/arm/dts/suniv-f1c100s.dtsi index 0edc1724407..bc563c12e95 100644
> --- a/arch/arm/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/dts/suniv-f1c100s.dtsi
> @@ -175,6 +175,11 @@
>  				pins = "PE0", "PE1";
>  				function = "uart0";
>  			};
> +
> +			uart1_pa_pins: uart1-pa-pins {
> +				pins = "PA2", "PA3";
> +				function = "uart1";
> +			};
>  		};
> 
>  		timer@1c20c00 {
> --
> 2.25.1


