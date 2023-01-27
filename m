Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DF4290D
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Jan 2023 21:00:25 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id m2so16498640ejb.8
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Jan 2023 13:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djfs4PGRa1CvWKMLKsAcAD0oTIU9m9WrTGUWf83xgvI=;
        b=Mlt+GejfxFYxZRl4TgvhYecgrJ7r2Z/6dau1C24sH4c46kceboL/nH+nWnN6RlgrFJ
         VB8FfyGN8cGJ2t9ZGriQMRFP7KJZbMs6nGXCO4GLPzCeQhqOW9ryzkFfeUz1z+hYlju9
         wnFbobDIj1inUwhY6JmubqeuqazZ8/UdoGrfEUPS8iv7h/lay3vPdX5+KY8T6QfRUlT9
         /YZFl6vckk81awOTrHMUrS6VlQkVVcf6hOUuyMzrfkdOCJr/Cx/y6AyFPYhSSrDSvfZ5
         67kGKmZ3clK9LS8mlz+sCvvhUlojrnyWwpMs64/CMIPbtRnsfBraSAi7BqKRTfF3tKOZ
         TFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djfs4PGRa1CvWKMLKsAcAD0oTIU9m9WrTGUWf83xgvI=;
        b=EqDJ7wLD7dUWUgw4Gvqrl4IhHpN1fFeZ7H4JE60Pe4yR96c7cfO3JwHi+J281bO8PC
         69iYniGFhqINXb7bHOYjgLi0pHK3r1o2gwEmcK0lc6X3dlN35EGI6xX5ol9UMjuHGCGk
         aU32W/KSj+N1suxL8M0XaDpzDgkuWH2LenhYfcuFVm2x6L1H0XcTmFGpav6o90AWJz8o
         j4sgSmPjNFon8J1/ABNCqCJNninaGOU/9iHrBGtmn5M8PkP8dHNNN3j36Z2ItKwZ0k6V
         eXoXZZYoHAqxDtgee/cKLCwS0wVnO8SnHYZaDInCm7vjBt3UtZgqu+2JOT3x+HTjdRV8
         flRA==
X-Gm-Message-State: AO0yUKWxOHbPrArYNUBu3oGmu5gA16tr8mU73D0jy91w6MwmJRqS6GmN
	7nh34/70R/CZfRh6sqe/kJ8=
X-Google-Smtp-Source: AK7set9mMQd5iBzzeDEzNyKR84lEscSavBnXhcfmZFSjVpVHw7P6HLc90KeABnq34XLhOwJnQtSZqA==
X-Received: by 2002:a17:907:3e90:b0:87b:dacb:f0a4 with SMTP id hs16-20020a1709073e9000b0087bdacbf0a4mr3910174ejc.62.1674853223478;
        Fri, 27 Jan 2023 13:00:23 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id t17-20020aa7d711000000b0049dc0123f29sm2876394edq.61.2023.01.27.13.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 13:00:22 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject:
 Re: [PATCH] ARM: dts: sun8i: a83t: bananapi-m3: describe SATA disk regulator
Date: Fri, 27 Jan 2023 22:00:19 +0100
Message-ID: <5899301.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20230120012616.30960-1-andre.przywara@arm.com>
References: <20230120012616.30960-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 20. januar 2023 ob 02:26:16 CET je Andre Przywara napisal(a):
> The Bananapi-M3 has a SATA connector, driven by a USB-to-SATA bridge
> soldered on the board. The power for the SATA device is provided by a
> GPIO controlled regulator. Since the SATA device is behind USB, it has
> no DT node, so we never described this regulator. Instead U-Boot was
> turning this on in a rather hackish way, which we now want to get rid of.
> On top of that it seems fragile to leave this GPIO undescribed, as
> userland could claim it and turn the disk off.
> 
> Add a fixed regulator, controlled by the PD25 GPIO, and mark it as
> always-on. This would mimic the current situation, but in a safer way,
> and would allow U-Boot to drop the CONFIG_SATAPWR enable hack.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied, thanks!

Best regards,
Jernej


