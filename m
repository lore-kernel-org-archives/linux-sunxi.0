Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283BC12294
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 18:03:49 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id v27so18894171eda.1
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 10:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZR5zfjSiAmXCO6kzpyVLCVBd540rTqhTnPKKui0SCQ=;
        b=TDmmI0uPUe+Vb4w7gQrvJGTlfd9HoHWgnSupc4eYc2lS0G92gqIlJJrL0RRSQy5RUz
         AP+ndcgQMLPQGjxxQ42h01tRkViSBgM0/klbeMxuEsFP6xhelxHnFmkP5g90XGv1aZdC
         fxUH+jSBjJwyWulH7WaKNssF36R7pV/tOfKCfhEzLEoaAFGv2mJHIydWOIvSF4B7JrS1
         cO6H3nR07BEViqWLBoGiwmzi0TxW+RvtlKpYmpnvZj6QKqcvfuhAgHPCDVrTPM9NDhgC
         ZiZBLXicXmSwdZeIskPbZw8sDhhOIobUlWtajgLzmMYQkvaFaECz10wz0F8d3sXo2H+O
         BHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZR5zfjSiAmXCO6kzpyVLCVBd540rTqhTnPKKui0SCQ=;
        b=XkoSNN6jNP/FtV/7l+9vmhqLeEORhLyD1Tfx8lGJtB8V1ksaDu224DO0Q5fWqjAF1M
         xiW6wcUaZ/QgM8zmEO6zIF50Y/iUm8vx9zTLJBm5qglxJ0wwzjED9m+eGIrVzaQOlbgn
         HFvY2DrnsLK6KI3ZR4Gzv0fqwD5PfQsceEndhtITIUElFN4f28jPry7Z+HKUCU8Pgh7D
         NBd2v4aGJ4AX0i4I/9ZP4clGvXE6u2tGJYdPooonOfC1RcEQ5zv9vWUJnE9l05eYppPN
         XJQBGKAaXRBpF/V93DNs+yAu0VtGkPWOh8xINtOFXFNa6I75d/5bzbFUDx9+QP48kMOi
         J5cg==
X-Gm-Message-State: ACrzQf3pWXJWNA5rRvrE6t1DiJVxKw1LQoTokBI4Y9RH/2KMSb7I33/T
	x7J+fqfQNW/TGYAOePoasxk=
X-Google-Smtp-Source: AMsMyM4ZdFtKiADHcMDRjo9ryfcRpyCpU3hx2nNzMJ9tRG9PPFT6XvEWgIiclIkQvANSy9IQVzjiwg==
X-Received: by 2002:a05:6402:606:b0:463:bef9:b64a with SMTP id n6-20020a056402060600b00463bef9b64amr774172edv.422.1667844227353;
        Mon, 07 Nov 2022 10:03:47 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id i15-20020a17090671cf00b0078d76ee7543sm3660432ejk.222.2022.11.07.10.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 10:03:47 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Cc: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 10/10] ARM: dts: suniv: Add Lctech Pi F1C200s devicetree
Date: Mon, 07 Nov 2022 19:03:45 +0100
Message-ID: <1740432.VLH7GnMWUR@kista>
In-Reply-To: <20221107005433.11079-11-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com> <20221107005433.11079-11-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. november 2022 ob 01:54:33 CET je Andre Przywara 
napisal(a):
> The Lctech Pi F1C200s (also previously known under the Cherry Pi brand)
> is a small development board with the Allwinner F1C200s SoC. This is the
> same as the F1C100s, but with 64MB instead of 32MB co-packaged DRAM.
> 
> Alongside the obligatory micro-SD card slot, the board features a
> SPI-NAND flash chip, LCD and touch connectors, and unpopulated
> expansion header pins.
> There are two USB Type-C ports on the board: One supplies the power, also
> connects to the USB MUSB OTG controller port. The other one is connected
> to an CH340 USB serial chip, which in turn is connected to UART1.
> 
> Add a devicetree file, so that the board can be used easily.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


