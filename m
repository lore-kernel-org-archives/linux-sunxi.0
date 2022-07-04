Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3429017DD
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Jul 2022 20:43:21 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id eq6so12942165edb.6
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Jul 2022 13:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5SgkUXQH5l8cW8OkSfWR9KslLQ4DlsgBpNjjffiER3I=;
        b=G5JeOSwftEpRaQHoM3zNdpWmB53p11R6ye5SAmUaG0t64gGczOXb8JX0/cvnrbyPDK
         bW5yI4qVLwNBgbvDpRuIpZzGhgei9QRBXlQWbD/mzd/GRVvowPzcmzENa2QZXmWxFXNG
         hEe239MMoOHdpRoPuNq5A+DYWgNqOSQrTmJCTAPMgvzStxpm9XGyC6eFOIkCwQl4Dsik
         sEPquI/IdCvtqMkZ5mKOBretHBoGHHFeVyR50zE5xU/cNvw4pURPJZMpQAE8bRUFfV3H
         4PBzZ8uwgZSt78DxKTcGHwghm2GYm82DqTS2JjzyNBE5UJeLfjb1kZe44KnORfB/LMbF
         VL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5SgkUXQH5l8cW8OkSfWR9KslLQ4DlsgBpNjjffiER3I=;
        b=vNQB8IaImAfqbFiLfNQ5M0mB2YiOvd7MreJURvKI8PpdxhAo8pPmxLED7eOazkVIw2
         uqP20uf5UlUxAftXXYhsbOMKSMf4deurFqheYQjPG95LRKI9sXndLr8RQik94n/5oon3
         1rbPND8p3kYAtFFdvSlMQA1o+gyp99ndLQZaFwHB09NHQZdngCSUuzrbn3O3luhbx/BA
         X2ihBELtGf/S7pZEfHHsKvbvqpK3F6GQYEfSioR7C7Wq2PCxlerAQxVWElJ+UNTinM/+
         GIOgNcgwPxl4cSp+PuM8qSwurXV3Fv5xnMkFOgaXobBVs81raFPR61G9eonOuz5p6xWe
         MU9w==
X-Gm-Message-State: AJIora/dDwIgvSM8+MAWE9wwYDzkQikqyUiscgGYnNg5huo9Lto5Qy3Y
	1KmHA5OAzBxZU9HWZpkHMjY=
X-Google-Smtp-Source: AGRyM1uJg4JOYffjRpUlVFqnzKqPG26lAaeyXLKWrPya/IwhyIWItUAKp+GOUw6YxqxgzPLtmlb1FQ==
X-Received: by 2002:a05:6402:40c3:b0:439:6b72:483e with SMTP id z3-20020a05640240c300b004396b72483emr28796701edb.154.1656967399526;
        Mon, 04 Jul 2022 13:43:19 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id f3-20020a170906494300b007262b9f7120sm14644879ejt.167.2022.07.04.13.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 13:43:19 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH] dt-bindings: display: sun4i: Fix D1 pipeline count
Date: Mon, 04 Jul 2022 22:43:17 +0200
Message-ID: <110465686.nniJfEyVGO@kista>
In-Reply-To: <3674367.kQq0lBPeGt@jernej-laptop>
References: <20220702032921.22433-1-samuel@sholland.org> <3674367.kQq0lBPeGt@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sobota, 02. julij 2022 ob 21:06:07 CEST je Jernej =C5=A0krabec napisal(=
a):
> Dne sobota, 02. julij 2022 ob 05:29:21 CEST je Samuel Holland napisal(a):
> > When adding the bindings for the D1 display engine, I missed the
> > condition for the number of pipelines. D1 has two mixers, so it
> > will have two pipeline references.
> >=20
> > Fixes: ae5a5d26c15c ("dt-bindings: display: Add D1 display engine
> > compatibles") Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!

Best regards,
Jernej


