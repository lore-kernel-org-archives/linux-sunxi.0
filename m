Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D597C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 20:32:34 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id d20so17529413edn.0
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 12:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTQXUN+wCe+JcbeHhRBc8YaP/cWNJYqc3/JHgweB/7s=;
        b=eJbMydvvO3awrVg4S0NKuHBUTa464s6VAuVN0K9UYGOZJVtoM2FRo11yyVUVa/xMCv
         y1bPEUT5JL3DamSuImf0+xJ2eDGiDArAqLeA+xqiGbRo9Dj80PIwmLDo0JkK6DO9tUfe
         /Cy+Z3MyKBNWjGAZKoAoTQxa92FMBExLydUqRUynRTr8bCkRuFF3WoXNjrvdRbGAke3v
         9J7+rZvAXlsQSkRPNcw/u5Gy94kZAagNzLPmSOkOCyIlGKu1rPjzy+TT9FrmA1MgX1EF
         ix479cb9iolG/9gV194NtIjOPvMvJAgVqgc5zcCShEhgXwRqEJY9SLFLNzzgpU/WIKQz
         ZcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTQXUN+wCe+JcbeHhRBc8YaP/cWNJYqc3/JHgweB/7s=;
        b=Q65zPuIwl4iP3sayyyum56uncBhXCyhwN8ixUoWmaRawUTNJjq+qp0slXlGmCmrrkM
         32x0bPga7PtOfY0ZOw/S1jHr6DOgDl0JtpJ9oHh0xhTUvvl8psJGP1Tyc+OuKvZmN3PK
         ZHVyP4kq8EptnRl1EHMrshZGUVzeZm4j6VITWhPkApD2UfP1R0uoAMIHLSw6Lxgrm+OM
         dRfkjgApIjmhI2qFp/f/xvCdmBgiSDpnc+9uJ94HstiW74CIX1AT4z8rwZ7gYyOKwsaS
         4xp84TtuAo6XiW8jYfsh9ZSALymjApTrZyOU0lG5ffsjmw625Ogu26rkAzIhrNW92y+h
         64EA==
X-Gm-Message-State: ANoB5pnNwoyPnqI3d9KCm1lgvDJM8mLtVs6pRj9CpSEl4rRIn2Al7Zyw
	BFnom4WdRm21elO3RrlWZxQ=
X-Google-Smtp-Source: AA0mqf60d6jUSas5D6q/PR4Q7d6BaJJbLfeHZDdlbJ89AgCKuzGTDZEoy0HPtGTgbqM+7C33Ydhz0Q==
X-Received: by 2002:aa7:cc12:0:b0:462:79ec:55eb with SMTP id q18-20020aa7cc12000000b0046279ec55ebmr2675878edt.151.1670272352519;
        Mon, 05 Dec 2022 12:32:32 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id n13-20020a05640204cd00b004615f7495e0sm209632edw.8.2022.12.05.12.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:32:32 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 05/12] riscv: dts: allwinner: Add MangoPi MQ devicetree
Date: Mon, 05 Dec 2022 21:32:30 +0100
Message-ID: <1912378.PYKUYFuaPT@kista>
In-Reply-To: <20221125234656.47306-6-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-6-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 26. november 2022 ob 00:46:49 CET je Samuel Holland napisal(a):
> The MangoPi MQ is a tiny SBC built around the Allwinner D1s. Its
> onboard peripherals include two USB Type-C ports (1 device, 1 host)
> and RTL8189FTV WLAN.
> 
> A MangoPi MQ-R variant of the board also exists. The MQ-R has a
> different form factor, but the onboard peripherals are the same.
> 
> Most D1 and D1s boards use a similar power tree, with the 1.8V rail
> powered by the SoC's internal LDOA, analog domains powered by ALDO,
> and the rest of the board powered by always-on fixed regulators. To
> avoid duplication, factor out the regulator information that is
> common across boards.
> 
> The board also exposes GPIO Port E via a FPC connector, which can
> support either a camera or an RMII Ethernet PHY. The additional
> regulators supply that connector.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


