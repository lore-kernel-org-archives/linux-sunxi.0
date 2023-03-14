Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474AFA939
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 20:05:02 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id cn21so36714201edb.0
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 13:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678824300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XGXvs0ITat1ZXax2nuiG9HnqxC3NFYEPJinGjqM7Qo=;
        b=FHwqi6k2Pbfwxlx87QG3Ul5Kd7sv0X9DI/oWX9lF6BGIQtxxqDiC2xnXtWFFF/hcnr
         n9zCFNL6Pu35FbRP9YiNTKstbgw+SEkjdv1Y5a0JhFF5ZGmlkWgNr7X3kA+lJZjqVeFJ
         Mm6GGMFgs4/5qJgKpQmfvpJUTVEbM6TsRJjaa6s3JoExg0x9bEK6NjpK/yyFjNN9Oak3
         Bwm/5MXDIvov+RLli8egLCBLc4ioN0if2kTIejiBVHfr7PlLJcVSP0n1oUPSidAKyYKk
         D2gQNAY6DHFIRDEht3GyasELTUino2LDeX409tM9uUF6Iq2wObfLtxxUJhAYud7h/hRl
         xGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XGXvs0ITat1ZXax2nuiG9HnqxC3NFYEPJinGjqM7Qo=;
        b=q4GeZOsAU5DQOI+D2xyYMVRYBuhgyiIkYVXYWGupOdUiUK7nYbOqfyHuyBl6Mte/d/
         +Tfkk+zW/1evoTK3vwZMgA5TmPZlfjNaKzs8giimPzHdrTjb3Lv32nzoQRSCTNTmOkXS
         BrdIAgyZTF4bsl2GKOsyH8ub8QR/Agr99Om4cXT9rrPi05Fw/T3rEyjmO1QA4602qPFU
         cEHdk+RzV0oj5YkAdoxUYM3MLwyeVf4I8seCT9lqEvqzbBuVW1Hv7yc2eHu6XyVno024
         9BZuAHY9pcIQgdD/DffW9spZvEjlZM8XoGliB6kgmZtLezKbcAYKu1X+uKjOLbS6tJWO
         isUg==
X-Gm-Message-State: AO0yUKWIrBp/z0MQ30KDvM5jSqIDxXXs4pDoGzL+QQIMlSCiU0aVMOin
	FZbyUcNJOT01Rre9orPhY6Y=
X-Google-Smtp-Source: AK7set8hUj4QjdDm+ijiDf9LUnE1MtORn47ZJsuHaWn6Joj/taxgFTUrG3jHA4aN+kKHh+wc/HvpYQ==
X-Received: by 2002:a17:906:1f51:b0:928:ace8:9f07 with SMTP id d17-20020a1709061f5100b00928ace89f07mr3060748ejk.12.1678824300526;
        Tue, 14 Mar 2023 13:05:00 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id e23-20020a170906375700b008cff300cf47sm1534950ejc.72.2023.03.14.13.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:05:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/4] Input: sun4i-ts: drop of_match_ptr for ID table
Date: Tue, 14 Mar 2023 21:04:58 +0100
Message-ID: <21805180.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20230312131514.351603-3-krzysztof.kozlowski@linaro.org>
References:
 <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>
 <20230312131514.351603-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne nedelja, 12. marec 2023 ob 14:15:13 CET je Krzysztof Kozlowski napisal(=
a):
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
>=20
>   drivers/input/touchscreen/sun4i-ts.c:392:34: error: =E2=80=98sun4i_ts_o=
f_match=E2=80=99
> defined but not used [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/input/touchscreen/sun4i-ts.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> diff --git a/drivers/input/touchscreen/sun4i-ts.c
> b/drivers/input/touchscreen/sun4i-ts.c index 1117fba30020..577c75c83e25
> 100644
> --- a/drivers/input/touchscreen/sun4i-ts.c
> +++ b/drivers/input/touchscreen/sun4i-ts.c
> @@ -400,7 +400,7 @@ MODULE_DEVICE_TABLE(of, sun4i_ts_of_match);
>  static struct platform_driver sun4i_ts_driver =3D {
>  	.driver =3D {
>  		.name	=3D "sun4i-ts",
> -		.of_match_table =3D of_match_ptr(sun4i_ts_of_match),
> +		.of_match_table =3D sun4i_ts_of_match,
>  	},
>  	.probe	=3D sun4i_ts_probe,
>  	.remove	=3D sun4i_ts_remove,




