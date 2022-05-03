Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801933CA
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 20:00:47 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id bv19so35442688ejb.6
        for <linux-sunxi@lists.linux.dev>; Tue, 03 May 2022 13:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uxaT5a9mxFo9vHNrfWPQOIvrWpFwZ29kzFdHY5abTLk=;
        b=SudvmlcWADSJQkKpoHHqF0lk+miCNeKd36HwnL4xED11ceBjqenq4OyQD8FJDOEqda
         piJ3iYeVFonfKEFWO8oI7GvHW4+KhKI+AgzGJD44ArTrmuNV6jiyzKw1n+WVlz3DmdFK
         3db6plX+sCWyJffcuwUzfEKxBZWtdwKtd8NgI/OeDqNmxli/usCnWEdloXZBPeJJHD9Z
         CsyUabIpRY5DQvfzEVjxrpL7dJh1Tguk+xFr3V2hHS4tqGShmljvUiIAJXRObJo1lW6H
         txq8sDJei57ibuqbrE03/ru9Mel3b1He3kMyuvUw/rSWJA94uGl9Yzrp+rTRMZs6eKDx
         bz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uxaT5a9mxFo9vHNrfWPQOIvrWpFwZ29kzFdHY5abTLk=;
        b=HzEXGEoBPzPiZZ1RTfRKSL2evOfedH0k+DLB2kP0miqvdAFP/gGBIPC42gf35k3KgD
         HVDmSY2EU4z/lx5oMWblAlgvFF4COctG9hDLnxiMjDyTkLLGoVkY8JTjINHObmPuwW9P
         jGN7WoV+WBUWpmeO+Ktz6GPDRoAoG1KBL7hSPi8AeIu+D8eFAm+WQLmgj8q31EnWCCof
         KfuW8QGX1xAzIuhvNcvSpuxKM3lvc2AA6aV5GRaaQDw3yZNq7fNxbDNcV4htGxxTGhyS
         9TG2Ny5tM2nRNGwQz/P/ulRR/akW2dkM0tBQttGsRRsvYHo+QH/xCucaWTKOgkXvLD7n
         45Sw==
X-Gm-Message-State: AOAM530Rf0Axn+qjuzV1bRAsC2kU5uN6uJDBxPs7N7CnAlPWMgpUjs6v
	2AYYhYk6IGQlggenn7ktGyQ=
X-Google-Smtp-Source: ABdhPJzfrMrzIlChURZtsBvey/f1dntHqFDytb5e+YSbS0KU0oan+7WxNSX9HDWcYqkPKf3yjCYFOg==
X-Received: by 2002:a17:906:99c4:b0:6f4:56d2:4bbd with SMTP id s4-20020a17090699c400b006f456d24bbdmr10109597ejn.754.1651608046101;
        Tue, 03 May 2022 13:00:46 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id hz12-20020a1709072cec00b006f3ef214dcbsm4945057ejc.49.2022.05.03.13.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 13:00:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: Re: [PATCH] arm64: dts: allwinner: define USB3 Ethernet on NanoPi R1S H5
Date: Tue, 03 May 2022 22:00:44 +0200
Message-ID: <1818121.CQOukoFCf9@kista>
In-Reply-To: <4393725.LvFx2qVVIh@kista>
References: <20220502144009.44575-1-amadeus@jmu.edu.cn> <4393725.LvFx2qVVIh@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 03. maj 2022 ob 19:54:34 CEST je Jernej =C5=A0krabec napisal(a):
> Dne ponedeljek, 02. maj 2022 ob 16:40:09 CEST je Chukun Pan napisal(a):
> > The NanoPi R1S H5 has a Realtek RTL8153B USB 3.0 Ethernet chip
> > connected to the USB 2.0 port of the Allwinner H5 SoC.
> >=20
> > Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts =
b/
> arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
> > index 55b369534a08..dd655a491549 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
> > @@ -21,7 +21,8 @@ / {
> > =20
> >  	aliases {
> >  		ethernet0 =3D &emac;
> > -		ethernet1 =3D &rtl8189etv;
> > +		ethernet1 =3D &rtl8153;
> > +		ethernet2 =3D &rtl8189etv;

Additionally, it's not a good idea to change order of ethernet nodes. It ca=
n=20
affect mac address assigning procedure in bootloader.

Best regards,
Jernej

> >  		serial0 =3D &uart0;
> >  	};
> > =20
> > @@ -116,6 +117,11 @@ &cpu0 {
> > =20
> >  &ehci1 {
> >  	status =3D "okay";
>=20
> You need to add #address-cells and #size-cells properties, otherwise "mak=
e=20
> dtbs_check W=3D1" generates warnings.
>=20
> Best regards,
> Jernej
>=20
> > +
> > +	rtl8153: device@1 {
> > +		compatible =3D "usbbda,8153";
> > +		reg =3D <1>;
> > +	};
> >  };
> > =20
> >  &ehci2 {
> > --=20
> > 2.25.1
> >=20
> >=20
>=20
>=20
>=20


