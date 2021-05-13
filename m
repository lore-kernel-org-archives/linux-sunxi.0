Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6CF71
	for <linux-sunxi@lists.linux.dev>; Thu, 13 May 2021 19:31:08 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id s20so35906077ejr.9
        for <linux-sunxi@lists.linux.dev>; Thu, 13 May 2021 12:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sIneDrztHlzfZDsDoR1ltUw2NBHkYDwnKGPP0MESg80=;
        b=Iw6gkgJs7644L2zzeRk5yF/j4VObMdQwuxqK3iE9uQrmyxGnPXKPx8H7V813PkZkgB
         yePu9rPJLQShTS9i5QDMAHXtZZ42WeO5em87tqSl0sIg1yamNyjPT2Yll+aOgxFzk1Qc
         zfcYuTis5Sd1B+aS7TOTMn3rxg0m/FJa9NF1B2rboVLfNkceVf+JMtMqrcU92U0DqQkx
         4iK9SLQvQDDZfyqdwps9p68jovyLqVmqLN4VMcrj4Q++Tepb5VhxzheRuKVP2pQaoLO4
         oyMtyJDL3msiMoRy6cpk295t0USEF6iQ+6czlahpwOvZlUF/C1My7IRfLx3xs3/Dh85m
         Ugxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sIneDrztHlzfZDsDoR1ltUw2NBHkYDwnKGPP0MESg80=;
        b=sq0fuOvINn822dtcNRjKHeYOxI9wj3h2g8jNBbhyi+a4FYEnrKEfrXYNIvb4Zqtkt8
         ueK29TD6rsvFHwgFwtJsVswnFo0T8tC6hQIrXxZxE9MjknR/zZ2nLC3ZV+DWsjejT2fT
         B90Lr4L/hJjzYimBkcjfw9hPg1UEqBdjDDHrvvMsgF4rSc74pe9BsvVMDqhBPIYTAqD5
         CqHc4eJgecRYy30IWn5IXU+Nsl+8qaVS3QRqqkT0OB0Ko0odb59DbB1UvqEuwR+6ong9
         RNL5MQLrdXckY3lQiOjOoYtVC1dnQequVg+QHx9Y7ULE7Me//MFspSXoi6TTpzT+neIx
         ZlcQ==
X-Gm-Message-State: AOAM533io69uwSaae2Pt9xRt86yRdqONoCon5v3VbiMp7EgwQu+uequf
	mP38vJPyNw3V7ur1pRvQOTw=
X-Google-Smtp-Source: ABdhPJxqA6G2A+/c9u5jQZTer9Dbo34u82WiGTbxaJZC5nht1fmqkJIs06E81t1e1YvC4eZN2NAZzg==
X-Received: by 2002:a17:906:17cc:: with SMTP id u12mr44465742eje.170.1620934267291;
        Thu, 13 May 2021 12:31:07 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id eb9sm2267116ejc.96.2021.05.13.12.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 12:31:06 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Tobias Schramm <t.schramm@manjaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Tobias Schramm <t.schramm@manjaro.org>
Subject: Re: [PATCH] ARM: dts: sun8i: v3s: add pwm controller to v3s dts
Date: Thu, 13 May 2021 21:31:05 +0200
Message-ID: <1631853.U6U3tl3vTp@kista>
In-Reply-To: <20210513182000.2068223-1-t.schramm@manjaro.org>
References: <20210513182000.2068223-1-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi!

Dne =C4=8Detrtek, 13. maj 2021 ob 20:20:00 CEST je Tobias Schramm napisal(a=
):
> The Allwinner V3s and V3 SoCs feature a pwm controller identical to the
> one used in the Allwinner A20.
> This commit adds it to the V3s dtsi.
>=20
> Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
> ---
>  arch/arm/boot/dts/sun8i-v3s.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-
v3s.dtsi
> index 770f5a25ab4c..22bc5ab4c3ca 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -433,6 +433,14 @@ wdt0: watchdog@1c20ca0 {
>  			clocks =3D <&osc24M>;
>  		};
> =20
> +		pwm: pwm@1c21400 {
> +			compatible =3D "allwinner,sun7i-a20-pwm";

Add V3s fallback compatible (as a first one) here and document it.

Best regards,
Jernej

> +			reg =3D <0x01c21400 0xc>;
> +			clocks =3D <&osc24M>;
> +			#pwm-cells =3D <3>;
> +			status =3D "disabled";
> +		};
> +
>  		lradc: lradc@1c22800 {
>  			compatible =3D "allwinner,sun4i-a10-lradc-
keys";
>  			reg =3D <0x01c22800 0x400>;
> --=20
> 2.30.1
>=20
>=20
>=20


