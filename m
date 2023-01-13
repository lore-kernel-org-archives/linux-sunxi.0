Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504C0640
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Jan 2023 05:08:12 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id vm8so49703582ejc.2
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Jan 2023 21:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtw4WHGu+OATpWcU0u4H+R8E0E8xhz+D1fXiT2aRITI=;
        b=dMQBkDVowPjcnzuTiFHOBWCdCct36UMtona+WrSRnGFGrA1UjMiZnmb4LXbxIskScC
         k7ehagq9WRleuolKvqfIrm2N0FLPuUeaqmil0cE3RV01+Si74LUV3OC4Sbx2xUW4E3NI
         1OWO2m2ZhnH9yz885DRuAZJH+gHW506l1PXNVxwA2sr7QJUz04Viis+tpIphUzqmNFzA
         zq5MT+Cg1tv97F38aQv+ZSULw576vUtxEbzVq1/lZ/EJP4Mj06Gia+fncyYB6zOkBvHZ
         xpgUhENRnLaUq6QsN+jNdLKSn55TWkSpjHkfemUs3RLm6vxkfAlDtSwS+Tf30pLF3RT8
         CXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtw4WHGu+OATpWcU0u4H+R8E0E8xhz+D1fXiT2aRITI=;
        b=V/+uxGgmWJ5/THMRmK0CYvKhXTwURlra4T9lp+cB3ag7OjDuGHTWmjmJMuQRmOGXhl
         1jcRmQEX8N/IIcrpkHkVBAexgmSYdRW0KseSs0VGVJnYq+6I8ECiJ/9ejjOo2ESUME9L
         GPaOq3hYdhpIMtU8UlAXqU41StfFnrCT2Kilj5MDcS5DQyQEdewNGb657mtJNinK3ctt
         u3cUTUjZgoQPpgLTjt1VQKJshdE1QMrjY1vj7X8z4H+7meDFX/G7knG0oGImwJfGoRvU
         D2MZD4eMoPk/elgr4epOtweaOAWs+bDzUO1D71v79llpCNi+rFUw4dUq6DF0DVwpiKc2
         TnHQ==
X-Gm-Message-State: AFqh2krw+psj25mPByHTLFrTJqbiYzUwV+8z53xqppFCUqIN65nOmdmq
	VGkUYsbm50EgwJ+4uCqhr/g=
X-Google-Smtp-Source: AMrXdXteEP5DXH8667AQDCEZztPHXS5s+cR8cR1LVXg6WWAFS+f9RCRnqMToHs/+vv/OKYDslxBaEg==
X-Received: by 2002:a17:907:62a9:b0:85d:dd20:60a2 with SMTP id nd41-20020a17090762a900b0085ddd2060a2mr13187213ejc.7.1673586490507;
        Thu, 12 Jan 2023 21:08:10 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id b1-20020a1709063ca100b007af0f0d2249sm8146059ejh.52.2023.01.12.21.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 21:08:10 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v5 2/4] regulator: sun20i: Add Allwinner D1 LDOs driver
Date: Fri, 13 Jan 2023 06:08:08 +0100
Message-ID: <5906718.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20221208084127.17443-3-samuel@sholland.org>
References:
 <20221208084127.17443-1-samuel@sholland.org>
 <20221208084127.17443-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 08. december 2022 ob 09:41:25 CET je Samuel Holland napis=
al(a):
> D1 contains two pairs of LDOs, "analog" LDOs and "system" LDOs. They are
> similar and can share a driver, but only the system LDOs have a DT
> binding defined so far.
>=20
> The system LDOs have a single linear range. The voltage step is not an
> integer, so a custom .list_voltage is needed to get the rounding right.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


