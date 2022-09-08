Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2693D65
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Sep 2022 16:22:52 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso2157221wmc.0
        for <linux-sunxi@lists.linux.dev>; Thu, 08 Sep 2022 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BGJkDCrH9LUETLojStwhWIkhR+B86SO7RtaDm8mEauY=;
        b=RwwiQVwY3vPDuBMeJPweBE13KC2iNRsTP4Vym9M1/Csm0+yjy39dSZH1eRmMJQ7DPf
         X1W0LL7pZBiVEjDYb8rni6zFiWXk6JPpre+OPuSyyTGKG2J2Lnw2ZZ/DiioV2puNrvxe
         lgJKA6xkp4yD0gVlJsyYmJT98qPycD9g3d8Ef3nRiaS4pnFgg/9+NXbuH2wplSNb3PLX
         5iwiYkF0c//LMUt89PSWwemaaMg+fpQPqjwinnhTywaw5UFB7ztNNK95XEVRyiqkvweg
         A2pWaONnp6dXB4FXxNq+2FnCwhN57frNVkLEhERdAExAlMezKX2Dll3/t0Lx5pi82Cj9
         iRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BGJkDCrH9LUETLojStwhWIkhR+B86SO7RtaDm8mEauY=;
        b=MEOb5cQiYBplSjLUqIdfoFWcsWJa298j8Jz/hYGXFMkmWWzSMCfqqWVvLaQNjyBkUW
         HZ12e3tfbJ7Md1xdCYxhV9FrQ8Jt9glOLQjpsyWW7HEMgvsgXhZWndBuUB1LLOeI7e/d
         FwIZQIpdhulyDuRCHXZ0WktA4kthRK+VO0EceXTmPluJyqJQ0qiTGk+jF0jyW7cCiSWp
         UHgiy4Do6EhYUc9mcVGHutSvuDrUw0k8Kinka5CI2c2v3Pr3LMvc03ZFS4ndKFG9/nmD
         eISeFJ0MslxKJi8K7R/Kz6z9AYddZkHMdNkafBKbkNSY7sh7eJ7Wazp3KOigQq2/qZKL
         fAAg==
X-Gm-Message-State: ACgBeo3FjQkZabxl6eCBTHBl87dxdcSWOKnh6ldUBqQCIkNflcWkG87z
	vjbK8dJYYajaEVBE4rI5Fq8=
X-Google-Smtp-Source: AA6agR6pbG+z44fWrfFFIpuYP73XS0I+jlnQ3zyiFTQUkL9ZblBelz2Ua8uw4IiIH1knjpm6bfYGuA==
X-Received: by 2002:a05:600c:a199:b0:3a5:dddf:ac6d with SMTP id id25-20020a05600ca19900b003a5dddfac6dmr2795265wmb.44.1662654170957;
        Thu, 08 Sep 2022 09:22:50 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c4f1500b003a607e395ebsm4357001wmq.9.2022.09.08.09.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 09:22:50 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: dts: allwinner: h6: Add cooling map for GPU
Date: Thu, 08 Sep 2022 18:22:49 +0200
Message-ID: <3508969.R56niFO833@kista>
In-Reply-To: <20220906153034.153321-3-peron.clem@gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com> <20220906153034.153321-3-peron.clem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne torek, 06. september 2022 ob 17:30:31 CEST je Cl=E9ment P=E9ron napisal=
(a):
> Add a simple cooling map for the GPU.
>=20
> This cooling map come from the vendor kernel 4.9 with a
> 2=B0C hysteresis added.
>=20
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


