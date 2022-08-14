Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D995A4C
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 18:33:02 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id b96so7221996edf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 11:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zaD0QsHlBYtf4Ki9lXXQFpBLOd/Qqq44+HllUIDIkU0=;
        b=oCiFQIT1Wesz8V7dSxhqQbEwbmJR+fK2wVw0hctE+UEAryjXq/+gO/cSLwToXPio0x
         jlEXAHEhuOb4SqTxleUL9VUJvMdTvR8N7ubImSbDPNVzJl+/OhhVkNS8YODSqZ5OVv1g
         9OSOdVcufKjvFLnEkbj1eb9eNHpfFEb1y1zDl3/nMAmUN7GBDw/cNcibI5Vvxxy/6C0L
         1VOn0KkuHe2Bq0if6AcS93RMbOYPGWP/5XKaDe1p/Kj8yXjqVLZJtIDjAHNwxiZFAZYw
         RrK1Wro9aYjybAowQqlp6nqXJUCoVBdCobybcKBzeNRoXOmSyuGG9ivbOYqxeRyZVtbr
         NguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zaD0QsHlBYtf4Ki9lXXQFpBLOd/Qqq44+HllUIDIkU0=;
        b=tLSbpd8mvWHI6St7VBOS0aBf/7abDE79N7/GwbQCPsbwAYhz0FH2EuP0/9/GJCQ64x
         jf9jnB7J3lPZX4j7ZJrNoVt7WNvuGrPK9AdcUYVMF/TChqIW/p+8yLFRNBswgru7vzEF
         wWnUKNfdoLwx+gv/JnO3v9FfvBObCcsTr01zCXVD2gHg1zS7s8q51xmV5kpyFrPvn79r
         umRJCvuJmitwwx0leUZsJtIicPH/xCVM35+8bxRdzszTBqVJXcnnYMbXBMWA0GOLjLPb
         /w9ELxyOYGJCbxv/JdL4GU6/cn+winS7nioTp0E6YRpi7CNhFxJvKIqMF4djaZaCZeiJ
         to2A==
X-Gm-Message-State: ACgBeo2pxiRA2T+I2ch1zV6oNsr8O/qIebj1PUy5ovCc5h1//tjzYeqr
	fPy7g8GrZ7OPU9Z0nuX2bPk=
X-Google-Smtp-Source: AA6agR4FTYkP7bDcMcKlD4vH5lBr7LzdSZfS1wAeR+eLXj3Wi3XFrs97S7PTb85MzYLV6lEkkZw/Vw==
X-Received: by 2002:a05:6402:4301:b0:43e:4d31:6ec0 with SMTP id m1-20020a056402430100b0043e4d316ec0mr11827309edc.69.1660501980722;
        Sun, 14 Aug 2022 11:33:00 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id e12-20020a056402088c00b0043a43fcde13sm5155615edy.13.2022.08.14.11.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 11:33:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Icenowy Zheng <icenowy@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 8/9] soc: sunxi: sram: Export the LDO control register
Date: Sun, 14 Aug 2022 20:32:59 +0200
Message-ID: <110700941.nniJfEyVGO@jernej-laptop>
In-Reply-To: <20220801030509.21966-9-samuel@sholland.org>
References: <20220801030509.21966-1-samuel@sholland.org> <20220801030509.21966-9-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 01. avgust 2022 ob 05:05:08 CEST je Samuel Holland napisal(a):
> Some newer Allwinner SoCs contain internal LDOs managed by a register in
> the system control MMIO space. Export this from the regmap in addtion to
> the EMAC register.
> 
> Use generic names now that the regmap is no longer EMAC-specific.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


