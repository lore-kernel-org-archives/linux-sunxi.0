Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E29F15C8B
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 20:22:43 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id m19so17401363edj.8
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 12:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dkl0GaWgeqVQmFYobiRcFtfUz3ufHqhTS+/iP5/CmzY=;
        b=b2zK3kxwbCERv7eiKN8zG2OpB/f3DOYQlaYVNclSh7psvFOndpURX2gBPS7wIUTzVP
         klxZ6VI6nnErkb2f+B/jUZylC/c/Aq+B8Z38vBEU0TlHSK4wvAqR12UeEmrIcL3a5dHE
         WdltyzxWxKtBcOhMl2zaV6JgO4PKSAUnkKmH6B1HGGe41iezzP0OVh+KgQCs/tnz/UnG
         nQgrGyCLV1JmDpEXUSOFrY/B7pYg8e7JCaZMmfY4PS7Ma4VRcC9hEd5j5e9eJzZnkWtY
         W9KO+tJm+gpFTy/o1PLnHD8TP4GyXCc9lfa6f0lqbIJgepsJoYcxQFs24WuHTgRFnhCS
         viHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dkl0GaWgeqVQmFYobiRcFtfUz3ufHqhTS+/iP5/CmzY=;
        b=dsf5RvXs1RDTIgw3XotMsn7GQCD6b3emDi8es0JCU+y0y3kONbVMElToFq5tCfpTOm
         n5pYRTBBcfVHdjxBePqlF6xdYZ1ykdM3rag2TTze4dV/au1z/Q88g5RtM8MMRep+8pGb
         fM6XLZbgrsi5IZ8+/nKaVEfTABv96Ihcw65uWzYmGzHRC/eTi7t8kKkaDb+QTCvl7DTw
         O4+y9pRWS7zYsW0wPw6DEmmRPQN3vk+vMPYNldQGdEP+xWweCwN37ijRlOSbULiScI50
         hNyry5nHk2n3niy1jAM+9JGbQIdvqjenjE/8oZRE7Eozyyx3pohA6ACaxGk7R8qgfaK3
         PZzg==
X-Gm-Message-State: ANoB5pln5XWruFMo2vd87TMyD5N+6Fqg8Vq+rcwo7SC+D2i9scXZmIai
	ahNqQgMSwyxzYQvLz1p7yz0=
X-Google-Smtp-Source: AA0mqf6OusveNiyokREy9CpPUEzcYnrvTHBiSncuuqjcAmK6ab/MZsPZLAbESEuZEGGmnGGJ5ab0WQ==
X-Received: by 2002:a05:6402:28c9:b0:469:ba7c:bc75 with SMTP id ef9-20020a05640228c900b00469ba7cbc75mr1454416edb.286.1670271762323;
        Mon, 05 Dec 2022 12:22:42 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id fe17-20020a1709072a5100b007be301a1d51sm6546663ejc.211.2022.12.05.12.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:22:42 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 01/12] MAINTAINERS: Match the sun20i family of Allwinner SoCs
Date: Mon, 05 Dec 2022 21:22:40 +0100
Message-ID: <3201066.aeNJFYEL58@kista>
In-Reply-To: <20221125234656.47306-2-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 26. november 2022 ob 00:46:45 CET je Samuel Holland napisal(a):
> Allwinner sunxi SoCs with a RISC-V CPU use the sun20i designator. Match
> that pattern in addition to the designators for 32 and 64-bit ARM SoCs.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


