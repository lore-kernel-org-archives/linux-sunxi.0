Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6211B20F5
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Apr 2023 06:09:23 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id ew6so105288073edb.7
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Apr 2023 23:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680415761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6rTS/ruyRiwSLe4zYoc3zyVGgTu2JSYGkMmye5BXjHs=;
        b=smGyXUIaAoA8OJGocwzcM0y9/IxVILfiLvoW7HVlGG6NzqHg9umHwp2Pwu2S9p5TRN
         PJQ8wepGndx+PC6XCCldA3v9yoNyIA+nfhuz1BWQ/ZxuF8TmIzr6YazXWZvo6tc3npl0
         p1v2nlSPkI61IxUbB+3DcdmH6HNivGlBdnabPmF7NKtTFE3EIELevw6yuNdb+5HE3o03
         YiBQ63j6FleceWGS4f/4gGLNf00DMe9HsugynLQ9Ten6LPZDlr45BXEHPeaJN2djLO0G
         Dlh/l/w+fZbS1imYQqJ6IkNy+9y00/jc+em+oUSvkSSWvEjztc1rbrt7Og0xyhkIpKcl
         CNXA==
X-Gm-Message-State: AAQBX9cauKFSwdzulihl1AqIDWwS/jo2hztIgN3w/uZkPuXaZp7WaEtB
	Nh1AQeYOyEXp8nl/NK48d/3nXv3nXu23+Q==
X-Google-Smtp-Source: AKy350aWaup+e+30eLd1uxcpqTd/3bJp432FOJvZK/QVpz2/uviMisazPFtZi0Fp9PG/bkQaCDmZVg==
X-Received: by 2002:a50:fb11:0:b0:4fb:5291:13bb with SMTP id d17-20020a50fb11000000b004fb529113bbmr33195104edq.39.1680415761262;
        Sat, 01 Apr 2023 23:09:21 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id z16-20020a5096d0000000b00501d51c23fbsm2917046eda.6.2023.04.01.23.09.20
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 23:09:20 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id l27so26208885wrb.2
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Apr 2023 23:09:20 -0700 (PDT)
X-Received: by 2002:adf:efc8:0:b0:2e6:e4df:a7bd with SMTP id
 i8-20020adfefc8000000b002e6e4dfa7bdmr646032wrp.7.1680415760483; Sat, 01 Apr
 2023 23:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401001850.4988-1-andre.przywara@arm.com> <20230401001850.4988-2-andre.przywara@arm.com>
In-Reply-To: <20230401001850.4988-2-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 2 Apr 2023 14:09:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v65t1bsfvg8WhfcuwsnAnbq4tXKz1YCKL719VHDd2D=8pg@mail.gmail.com>
Message-ID: <CAGb2v65t1bsfvg8WhfcuwsnAnbq4tXKz1YCKL719VHDd2D=8pg@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: mfd: x-powers,axp152: Document the
 AXP313a variant
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com, 
	Shengyu Qu <wiagn233@outlook.com>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 1, 2023 at 8:19=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> From: Martin Botka <martin.botka@somainline.org>
>
> The X-Powers AXP313a is a PMIC used on some devices with the Allwinner
> H616 or H313 SoC.
> According to the datasheet, the DC/DC converter PWM frequency is fixed
> (to 3 MHz), so disallow the property that lets us set this frequency
> for the other PMICs.
>
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
