Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2E07C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 20:33:10 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id vv4so1364343ejc.2
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 12:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1y4+o5+3VTQ2cJHFB9l2XaUG0/wHW8D/s+vsN99BVaE=;
        b=iOXDEcLuqwSherSXE4U5w9gQCgyvR2cm/LugX2hw47DYz1qiypw3Az7NEAsK9etGZ1
         R9Wc7jHvQ1EDOovASiJdlnEZGoS+sZ55uSBB0iBfoFUKeUQsE1Co9JftkJgDgt+zhpVp
         A9TV6HOF3p7oJWQ8fnSast3ZANpdE1lqxkLUJZGE4YaIktmGrooce/zw3aTJCl9ZR/Aw
         +Iy2UZXquCzjBtHeODlWshoR6nVHh0cUPm9VnYmACQXSHaMbg7muAuZnY/P5n1J35DfT
         PmM405Xz/pL16rowVhHyRjWe2vqChetT73pJ564SYg1ChclWQJG080/7wX6OPnvshXWS
         nuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1y4+o5+3VTQ2cJHFB9l2XaUG0/wHW8D/s+vsN99BVaE=;
        b=SsvmcAbdn427XdQjsH7gj89famG7fcvvX5wuYn08xUoBpVyvdhRedvlf7TeKdUcyKd
         u1pzgkV4nqV8AnHh7aHUFfYJHKr2f+SYKdjpEGQT9kd49/9rKFykBoNap8ckHTYbetg2
         ViL2ZzlYinbnNzTnkjxYfIDcVcohJ0vacgNIrfmyxsSQMJTttBLLoIsQr9aki2JpC4x4
         BBc+Bv8X1ZhsQzCh2tbkzcA4CTTWYWfxq3+KGp5lkEqubkQjgV2HnosmL+zBWf/GF2nW
         F9az+2fOTcYok9rqDFt7/ACxdn2WHVPhas7nM4a/lthjFBKQbBrofktUTkoAsuYbzdj6
         /BAw==
X-Gm-Message-State: ANoB5plMaXcEGbJXp1eFu7OlfqIgAYBC2BVpWtVtbcQ5D8MA6RKFc29P
	3UQfzFkaobiHrmNmrYMxHLI=
X-Google-Smtp-Source: AA0mqf7L5DepZPykpakDz8MEhCAqHhMgcvBT0fnFKGlH2luNDKCM3xQ0hRd5HOR5Fvc1yUeli+Pdog==
X-Received: by 2002:a17:906:3da2:b0:7ac:a2b7:6c96 with SMTP id y2-20020a1709063da200b007aca2b76c96mr68446980ejh.412.1670272388905;
        Mon, 05 Dec 2022 12:33:08 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r1-20020a1709061ba100b00779a605c777sm6581013ejg.192.2022.12.05.12.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:33:08 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 06/12] riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
Date: Mon, 05 Dec 2022 21:33:07 +0100
Message-ID: <7457885.EvYhyI6sBW@kista>
In-Reply-To: <20221125234656.47306-7-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-7-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 26. november 2022 ob 00:46:50 CET je Samuel Holland napisal(a):
> "D1 Nezha" is Allwinner's first-party development board for the D1 SoC.
> It was shipped with 512M, 1G, or 2G of DDR3. It supports onboard audio,
> HDMI, gigabit Ethernet, WiFi and Bluetooth, USB 2.0 host and OTG ports,
> plus low-speed I/O from the SoC and a GPIO expander chip.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


