Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D03EC2
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Oct 2023 07:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BX/aE0Ri"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-307d58b3efbso1066665f8f.0
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Oct 2023 00:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697874585; x=1698479385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Snj2KeXDsSL53Uv3CH8zb5HpzphBdqjbUmhWNuzCpic=;
        b=BX/aE0Ri2svJEpHsWwXK7naPA7v2/oMwtbUCxlWwL/BrRKkRw+4JOwokmHweUNCbA3
         Qer4drhUlrWkZHY/ILbP2kkkNlLNn2nvuSfJq3Q+nzVdfQVP31KzS0NNGcw0dkizhROV
         l0xsQaMAHPhka+5Z9GDTeNiBQswRZWdMGBCTbunNS+TnX0WPWZ9w2FFLH9U/jz2ALw3b
         RgNHYnHDGa3tb8NH/fSVPC6vd9TdVLV0ZdZsHfG6wCYW0hyArlnt/2Tk9qsWEp9YwO1E
         JPRP2cYzrzP0UOQffVkl29jvDBrYMVX/Rc4UHJ+9p6jPUMjKdWdeFj9xfDCAqP2jouQc
         qzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697874585; x=1698479385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Snj2KeXDsSL53Uv3CH8zb5HpzphBdqjbUmhWNuzCpic=;
        b=cZX9KjaBPxqz/N0rIyu9oJ4tWtIYaCTAro29VMlYg/J1y6Qm8Wde0E7h7kYiZMQa9Q
         PR2cEvYaZd8i043qduCOTXinAhWVQKrWtN/Kn0ZveABTqp8iqKImh0+LmNPg/TdJtR80
         rowk/nlW/rP2iWdZN0cpWgLo+SejIVu5EVjvnTBArppyQfVXG2teZ1drIjS9lTK4bGJ2
         TcmfsjC/alNNy8yieeXUKgmJ4VH5qP/hPSuto8tdPsJEJ+OYOEnJo/r1T+wgSxNerMnI
         H14nfJKhwlrwdo7zSr+XJRN3scj/QfeFoC6IscMmEeIqENGaTaJ4UExTQOEEXoAFEthV
         EISA==
X-Gm-Message-State: AOJu0YwsIWLCQunY85/WvEWaBzQMmE150MWsphJ5h7L45Nut9gqwH15H
	b8ePXpSVgp5QnRA4R0vlpw4=
X-Google-Smtp-Source: AGHT+IGBYZv4LUHNATIISevLF3YsrZTYhCik2oskPpPsJp4XteMFzPd+P6oHn8SXAtayxtHcSRgKDA==
X-Received: by 2002:adf:f68f:0:b0:32d:9e13:1bca with SMTP id v15-20020adff68f000000b0032d9e131bcamr2987259wrp.27.1697874584486;
        Sat, 21 Oct 2023 00:49:44 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id f1-20020adff8c1000000b0032da75af3easm3201937wrq.80.2023.10.21.00.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 00:49:43 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>, Ludwig Kormann <ludwig.kormann@ict42.de>
Subject: Re: [PATCH 0/3] sunxi: devicetree updates from Linux v6.6
Date: Sat, 21 Oct 2023 09:49:42 +0200
Message-ID: <1912282.taCxCBeP46@archlinux>
In-Reply-To: <20231020002608.18606-1-andre.przywara@arm.com>
References: <20231020002608.18606-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, October 20, 2023 2:26:05 AM CEST Andre Przywara wrote:
> This updates the devicetree files to match the Linux kernel repository
> as of v6.6-rc6.
> Mostly cosmetic changes, but we gain some new board files and the T113s
> board .dtsi files, which are needed for the pending U-Boot patches.
> 
> Split per architecture, with the T113s being separate due to its RISC-V
> relationship.
> 
> Andre Przywara (3):
>   sunxi: dts: arm64: update devicetree files from Linux-v6.6-rc6
>   sunxi: dts: arm: update devicetree files from Linux-v6.6-rc6
>   sunxi: dts: arm: add T113s/D1 DT files from Linux-v6.6-rc6

I compared all DTs and they are identical, except r_intc, as mentioned.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
>  arch/arm/dts/axp209.dtsi                      |   7 +
>  arch/arm/dts/sun50i-a64.dtsi                  |   3 +-
>  arch/arm/dts/sun50i-h6-pine-h64-model-b.dts   |   2 +-
>  arch/arm/dts/sun50i-h616-orangepi-zero.dtsi   | 134 +++
>  arch/arm/dts/sun50i-h616-orangepi-zero2.dts   | 121 +--
>  arch/arm/dts/sun50i-h616-x96-mate.dts         |   2 +-
>  arch/arm/dts/sun50i-h618-orangepi-zero3.dts   |  94 ++
>  arch/arm/dts/sun5i-r8-chip.dts                |   6 +
>  arch/arm/dts/sun5i.dtsi                       |  11 +-
>  arch/arm/dts/sun7i-a20-icnova-a20-adb4006.dts | 137 +++
>  arch/arm/dts/sun7i-a20-icnova-a20.dtsi        |  62 ++
>  arch/arm/dts/sun8i-a23-a33.dtsi               |   2 +-
>  arch/arm/dts/sun8i-a83t.dtsi                  |   2 +-
>  .../arm/dts/sun8i-t113s-mangopi-mq-r-t113.dts |  35 +
>  arch/arm/dts/sun8i-t113s.dtsi                 |  59 ++
>  arch/arm/dts/sun8i-v3s.dtsi                   |   2 +-
>  arch/arm/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi | 126 +++
>  arch/riscv/dts/sunxi-d1-t113.dtsi             |  15 +
>  arch/riscv/dts/sunxi-d1s-t113.dtsi            | 927 ++++++++++++++++++
>  include/dt-bindings/clock/sun20i-d1-ccu.h     | 158 +++
>  include/dt-bindings/clock/sun20i-d1-r-ccu.h   |  19 +
>  include/dt-bindings/clock/sun50i-h6-ccu.h     |   2 +-
>  include/dt-bindings/clock/sun50i-h616-ccu.h   |   2 +-
>  include/dt-bindings/clock/sun6i-rtc.h         |   2 +-
>  include/dt-bindings/reset/sun20i-d1-ccu.h     |  79 ++
>  include/dt-bindings/reset/sun20i-d1-r-ccu.h   |  16 +
>  include/dt-bindings/reset/sun50i-h6-ccu.h     |   2 +-
>  include/dt-bindings/reset/sun50i-h6-r-ccu.h   |   2 +-
>  include/dt-bindings/reset/sun50i-h616-ccu.h   |   2 +-
>  29 files changed, 1899 insertions(+), 132 deletions(-)
>  create mode 100644 arch/arm/dts/sun50i-h616-orangepi-zero.dtsi
>  create mode 100644 arch/arm/dts/sun50i-h618-orangepi-zero3.dts
>  create mode 100644 arch/arm/dts/sun7i-a20-icnova-a20-adb4006.dts
>  create mode 100644 arch/arm/dts/sun7i-a20-icnova-a20.dtsi
>  create mode 100644 arch/arm/dts/sun8i-t113s-mangopi-mq-r-t113.dts
>  create mode 100644 arch/arm/dts/sun8i-t113s.dtsi
>  create mode 100644 arch/arm/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi
>  create mode 100644 arch/riscv/dts/sunxi-d1-t113.dtsi
>  create mode 100644 arch/riscv/dts/sunxi-d1s-t113.dtsi
>  create mode 100644 include/dt-bindings/clock/sun20i-d1-ccu.h
>  create mode 100644 include/dt-bindings/clock/sun20i-d1-r-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun20i-d1-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun20i-d1-r-ccu.h




