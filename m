Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535431FC1
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Jun 2022 20:29:12 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id eo8so5036219edb.0
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Jun 2022 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aRjb3jd1aQaLkq/z5sj77GhYqe2JvAPzVwwOMMfP38E=;
        b=K2N4aGCv4zNeMOd2yGAV7ZteJENWlMQgdsiYFaolNK+bkH7DEmbuYt/AslWT/HocXR
         mjkp9xGKv7oGtT+u2defmr8V9/RJSsYBuPdA+LTb9VMZ9oSVHcUSHgX/LZ4H1tHMPsA7
         0FSvpeIvmwqUYrrzc4IBXExEwWdEjH/RCWvjXmgWBiJX8fri2mtQ/fj1cFcBqs5WnBnz
         +HjCzkVYGrA+b6clPD9Uwi0qGmHWjoXgnbDNEvQOvovTeZVkTiA2e39bKmSeLatM1x6c
         ONzaCqcyXiLjYOdrqRQ0ruIfl1eGvxCbooXQaKR6/FSl0Cqh9hVx4S+9GFIeyImTXP3W
         gy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aRjb3jd1aQaLkq/z5sj77GhYqe2JvAPzVwwOMMfP38E=;
        b=DvGEWDeTkw6+1EbY/RXFaNNhV0A6Q7vvfIP34h9DhEPFxK5mhmyzJ8P80baOkohL+t
         g6tX3cD2WMrtWbLoJxQuQ+OxcxvHjEFp/QjEpi6Ef28BbwSZbJOg+mR584fxivSpRS6T
         k3QILm/pieD05gHtR+VHVaaFPKwA/eHsGayyG+UOakj8DWq3XYz/5ffNBi8YaHjIZalM
         s0KPOB7QoDmowoFGADPzs0Zm8zZaMwIBpF3pk+8c1hYS8JoDcWZTmnjJwwMMZENDLHFt
         0XVXadmj7ONoqB6ZN00yUOUUCLNEaRtXAymq25XKcMTiATwUDmeVIO8eU52MLTt4ebS3
         VUIw==
X-Gm-Message-State: AOAM532bh/fogC4LgcHR22mU1B0yW3dBexZT7jexU0RkGEmjeq54m5kY
	1pc5cvRN2O15eePhqNHyDwY=
X-Google-Smtp-Source: ABdhPJwkmm9/r74/oo/mg4CEbzb7CSnzzm/yuMLEXu/YYGuNTmplbjVAPd146zBa1fc16wAv5FKfUw==
X-Received: by 2002:a05:6402:1914:b0:430:b941:2c44 with SMTP id e20-20020a056402191400b00430b9412c44mr8400109edz.77.1655238550743;
        Tue, 14 Jun 2022 13:29:10 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id oq13-20020a170906cc8d00b006feb047502bsm5394863ejb.151.2022.06.14.13.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 13:29:10 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: Re: [PATCH v2 05/48] arm64: dts: allwinner: align gpio-key node names with dtschema
Date: Tue, 14 Jun 2022 22:29:09 +0200
Message-ID: <21497739.EfDdHjke4D@kista>
In-Reply-To: <5574044.DvuYhMxLoT@kista>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609113911.380368-4-krzysztof.kozlowski@linaro.org> <5574044.DvuYhMxLoT@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 13. junij 2022 ob 23:00:02 CEST je Jernej =C5=A0krabec napi=
sal(a):
> Dne =C4=8Detrtek, 09. junij 2022 ob 13:39:07 CEST je Krzysztof Kozlowski=
=20
> napisal(a):
> > The node names should be generic and DT schema expects certain pattern
> > (e.g. with key/button/switch).
> >=20
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!
=20
Best regards,
Jernej


