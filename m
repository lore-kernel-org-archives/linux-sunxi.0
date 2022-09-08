Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB415CA6
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Sep 2022 20:01:04 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id d5so11585317wms.5
        for <linux-sunxi@lists.linux.dev>; Thu, 08 Sep 2022 13:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0ab0C3Pt3y+AUtGAmk+cGrgQVzgDrXyFcmGY9LIPg7I=;
        b=DE7ZxcwuTdu0khBFNHcr5Sc7L4fS7iVOBLTIvKCsgzyQlbNBXmHD9fZKJ/LXb7717t
         BoSkWRPMB8qtpvAyffGQYSKkcy8s9NphwB69i05tQNPEKvLiorY2ycNhuZBJ6dT+kERO
         O3Qjr/1sl+5MdNXrHu4qdApNHrU1GzImPv4lRGm4xkxXjhpDb8Eaz0qVqDsTXfJnsJbe
         9BHIknG9QpqZnmv7CvFxAacbOyhUwRH+6dqkk57ZS5itz8tETJi2gBDc2zpSEhYthSWw
         aMKTMYwh5jAloWEF1IhCrETkdTayr3vNqd88JyTv3bZL7f4G3Byq+ZGYnYrxK+xmg3Q0
         K+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0ab0C3Pt3y+AUtGAmk+cGrgQVzgDrXyFcmGY9LIPg7I=;
        b=qbwEFR6Fxzkl96Cnowk6CvMZovVkXPBvp0tZNrSQ/aQSseS9Q3rY82UpUYlfg1Sbq/
         m9nKRW3WNk5j/lyh/L0xKy2oRFlO14xCELdh0UnbPAxujgMhU7845ZDFicpxlslCVlr/
         E/OY0Iedc4PwzADfGFbV6Wat64aKcwYLYLOfGdCmpR0uEdhqfXY1Re225YWqmW1A1/Fp
         PxIkR5zIzqL7cq+krE/Dkasu7ZOp0PngrpLebW1EDEIXWurPvAhy1xvykAhImMyFkTmz
         hym3KmJBOPUtIF0g+RJOzMo8ihoJBktOFKsUI2T6tOrD9tx4whyFcn+KVUqu5HBUUCNA
         gmqw==
X-Gm-Message-State: ACgBeo08oQCq9lYnDwPhAccVbTKuwi/n5k/TBcuGrcY6KhJMbztAB9Mp
	GORslARs7sWmnnMq3bx8yC8=
X-Google-Smtp-Source: AA6agR4UVng5AUyO+Lb+M/d2q9vC91aXyrkT8ydz2RnziObmJg3cal0aghkmKspPlBplLPOjwPHi/w==
X-Received: by 2002:a05:600c:89a:b0:3a5:4ea9:d5ee with SMTP id l26-20020a05600c089a00b003a54ea9d5eemr3350715wmp.8.1662667262590;
        Thu, 08 Sep 2022 13:01:02 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b003a5b6086381sm4314038wmq.48.2022.09.08.13.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 13:01:02 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH 3/3] arm64: dts: allwinner: a100: Add I2C DMA requests
Date: Thu, 08 Sep 2022 22:01:01 +0200
Message-ID: <2079594.OBFZWjSADL@kista>
In-Reply-To: <22775214.6Emhk5qWAg@kista>
References: <20220830020824.62288-1-samuel@sholland.org> <20220830020824.62288-4-samuel@sholland.org> <22775214.6Emhk5qWAg@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 06. september 2022 ob 23:11:02 CEST je Jernej =C5=A0krabec napis=
al(a):
> Dne torek, 30. avgust 2022 ob 04:08:24 CEST je Samuel Holland napisal(a):
> > The I2C controllers in the A100 SoC are all connected to the DMA engine.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!

Best regards,
Jernej


