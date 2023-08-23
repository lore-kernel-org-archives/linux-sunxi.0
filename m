Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF1E947B
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 09:01:23 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-44d4a307d30so1064709137.0
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 02:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692781282; x=1693386082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtV842noA4k0ZIyALimzf7oD/qGOzDsyzAeC5Bbahhw=;
        b=fBOGXZnmW/Kj23Nmx2cQzT32KSnzn9aRoSakEpir4GBoECR+jx+WUnxz06F7S6kqf7
         ObAC1kd54n/7v+wWW6ckNf/RW9lR0nXY5Wj77r4ZxbfTSX8r6Josg1x58RuehZHCV3W+
         oaaEmPRD0TiqICdbjf8ui88vIgXu4ad/RXKV0DRIGWqGqVszrs/UZaEDFLJ5/Ij4N8VB
         pR3HHx8GFL1+ja7Hi4J8CDRbUdyiHt9bw6AP9gMcDmhqb4pQQ7mmIbqLnHzhj32LSpUP
         n6o0hjkWECUYjl9ptCpVf3aJWckRuVV1+YwLdv8JY9Vpg1Zqsji3LGc/XASPADtj9a0C
         P41w==
X-Gm-Message-State: AOJu0YzAVmZySjlX9aWoTGN/rrSKGx4kewTwmT3adU1/UBohtN7kov+X
	vodjnfrGkNOEBLuGp/UCmWIrhgIKCijb3w==
X-Google-Smtp-Source: AGHT+IGTwnWIXWVMzNIJRx0KGkRc/UAwfavcdw9AFzgV3ZZCBHx6kiiR6so+O4sQClEv1OomuVzHVQ==
X-Received: by 2002:a67:eb06:0:b0:44d:5298:5bfc with SMTP id a6-20020a67eb06000000b0044d52985bfcmr5382604vso.17.1692781281852;
        Wed, 23 Aug 2023 02:01:21 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id o62-20020a25d741000000b00d746487d6f7sm2324910ybg.35.2023.08.23.02.01.20
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 02:01:20 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d746d030a86so4196174276.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 02:01:20 -0700 (PDT)
X-Received: by 2002:a25:cad7:0:b0:d12:46b1:4459 with SMTP id
 a206-20020a25cad7000000b00d1246b14459mr12184522ybg.6.1692781280284; Wed, 23
 Aug 2023 02:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230823085146.113562-1-krzysztof.kozlowski@linaro.org> <20230823085146.113562-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823085146.113562-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Aug 2023 11:01:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7Gk5jTkD_hc_BAK0caQjzTBWrXedV+5rYrMRiZF1EAw@mail.gmail.com>
Message-ID: <CAMuHMdU7Gk5jTkD_hc_BAK0caQjzTBWrXedV+5rYrMRiZF1EAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: use capital "OR" for multiple licenses in SPDX
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 10:52=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  arch/arm64/boot/dts/renesas/r8a77980a.dtsi                     | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi           | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779f0-spider.dts                | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m0.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts           | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts               | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts                  | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m1.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m2.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dts           | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts               | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts                  | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m3.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m4.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dts           | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m5.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m6.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m7.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m8.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779mb.dtsi                      | 2 +-

Mea culpa

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
