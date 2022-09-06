Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AB486E2
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 19:10:44 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id gb36so25420140ejc.10
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 12:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=w/ZOd8w9PpfH0PoP4VeEmJ6xZfMkRuDkUmQ7u7OOSbI=;
        b=oYm3QwusiprapdZgx34JgD15YXVl+0e25+F+6mUrTli6IPDa+bMXDhGUoyw6Iwo/Kv
         Vdlic0olw6Sky94t7Kx/GETDzah7M+tvgPlH6ZqJd1oL3TTOyNY/DXzfD5CErsy0tqLk
         W592WP0k+fS6kPfYk3EoaE3EXMod5fA0VyJmmPvfcCr6OKTLYsPj7YmMfeuHxlNVYmo+
         4Cy052KhsUtLHk3deXW+LKk2jyfERjdC4GUrNJXhu5jROJ1daMrdDubsIT2a8DGF6cFx
         lPsftlm1GUt761wyza6CRZ2snjPgJvoRml2/X3HdQixGvWLqjK9HTRVzW6vDHoBD6H3E
         i5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=w/ZOd8w9PpfH0PoP4VeEmJ6xZfMkRuDkUmQ7u7OOSbI=;
        b=gw6TH+Ymr076E9Syb1lOeFl5WVwN44IlwsJpJS7IusOOQQjhOS9jSaqSd3UtAsxHa1
         vH8t4qVQcatwWbiujY5HeQVu+MmrEkSbkFISUiLFTqUjCYWxwsSbEn+oRAH6SYxsRj7a
         +FOsfq0Sr82XBYc823wGqkxy66buIi0qdkBJrpotXvaVvehkgsN32okaSCo/NVk+VFON
         F3FzEeZwjcb2Ey0QWaYW7yhNhINt9sjRBJi1c5zL4mE6ixAWUW/FPOg7tY0x/jx1B/KS
         Uh8/Uf/6cJ3yLX/9X1roHB7gn1IjFJjvMiV4H6fjImCwEwbf8UA/7x5MUqHqusl2o2f7
         JSsA==
X-Gm-Message-State: ACgBeo2Rsa8wQBtW+Vv1YQ7d04cysLQWUiMkOF1rt5cB1/FylBMk9/+v
	p5ou1302DXGeTA1j/lXbXpo=
X-Google-Smtp-Source: AA6agR5o/hB8ODtHH/gpw6zFvP+JmOgSI2ED73R2uoqAFYkPfIPG8L9e/o3qsvEJU6l4v+KqU6WtBg==
X-Received: by 2002:a17:907:2c75:b0:741:5871:4318 with SMTP id ib21-20020a1709072c7500b0074158714318mr31694444ejc.532.1662491442690;
        Tue, 06 Sep 2022 12:10:42 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id r16-20020a50c010000000b00447bd64d4f6sm9045994edb.73.2022.09.06.12.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 12:10:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 3/5] arm64: dts: allwinner: h6: Add GPU OPP table
Date: Tue, 06 Sep 2022 21:10:40 +0200
Message-ID: <12048299.O9o76ZdvQC@kista>
In-Reply-To: <20220906153034.153321-4-peron.clem@gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com> <20220906153034.153321-4-peron.clem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne torek, 06. september 2022 ob 17:30:32 CEST je Cl=E9ment P=E9ron napisal=
(a):
> Add an Operating Performance Points table for the GPU to
> enable Dynamic Voltage & Frequency Scaling on the H6.
>=20
> The voltage range is set with minimal voltage set to the target
> and the maximal voltage set to 1.2V. This allow DVFS framework to
> work properly on board with fixed regulator.
>=20
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  .../boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi new file mode 1006=
44
> index 000000000000..b48049c4fc85
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2022 Cl=E9ment P=E9ron <peron.clem@gmail.com>
> +
> +/ {
> +	gpu_opp_table: opp-table-gpu {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-216000000 {
> +			opp-hz =3D /bits/ 64 <216000000>;
> +			opp-microvolt =3D <810000 810000 1200000>;
> +		};
> +
> +		opp-264000000 {
> +			opp-hz =3D /bits/ 64 <264000000>;
> +			opp-microvolt =3D <810000 810000 1200000>;
> +		};

As mentioned in clock patch review, rates below 288 MHz are deemed unstable=
 on=20
GPU PLL by vendor GPU kernel driver. At least in the BSP version that I hav=
e.=20
Did you test these points? If not, better to drop them.

Best regards,
Jernej

> +
> +		opp-312000000 {
> +			opp-hz =3D /bits/ 64 <312000000>;
> +			opp-microvolt =3D <810000 810000 1200000>;
> +		};
> +
> +		opp-336000000 {
> +			opp-hz =3D /bits/ 64 <336000000>;
> +			opp-microvolt =3D <810000 810000 1200000>;
> +		};
> +
> +		opp-360000000 {
> +			opp-hz =3D /bits/ 64 <360000000>;
> +			opp-microvolt =3D <820000 820000 1200000>;
> +		};
> +
> +		opp-384000000 {
> +			opp-hz =3D /bits/ 64 <384000000>;
> +			opp-microvolt =3D <830000 830000 1200000>;
> +		};
> +
> +		opp-408000000 {
> +			opp-hz =3D /bits/ 64 <408000000>;
> +			opp-microvolt =3D <840000 840000 1200000>;
> +		};
> +
> +		opp-420000000 {
> +			opp-hz =3D /bits/ 64 <420000000>;
> +			opp-microvolt =3D <850000 850000 1200000>;
> +		};
> +
> +		opp-432000000 {
> +			opp-hz =3D /bits/ 64 <432000000>;
> +			opp-microvolt =3D <860000 860000 1200000>;
> +		};
> +
> +		opp-456000000 {
> +			opp-hz =3D /bits/ 64 <456000000>;
> +			opp-microvolt =3D <870000 870000 1200000>;
> +		};
> +
> +		opp-504000000 {
> +			opp-hz =3D /bits/ 64 <504000000>;
> +			opp-microvolt =3D <890000 890000 1200000>;
> +		};
> +
> +		opp-540000000 {
> +			opp-hz =3D /bits/ 64 <540000000>;
> +			opp-microvolt =3D <910000 910000 1200000>;
> +		};
> +
> +		opp-576000000 {
> +			opp-hz =3D /bits/ 64 <576000000>;
> +			opp-microvolt =3D <930000 930000 1200000>;
> +		};
> +
> +		opp-624000000 {
> +			opp-hz =3D /bits/ 64 <624000000>;
> +			opp-microvolt =3D <950000 950000 1200000>;
> +		};
> +
> +		opp-756000000 {
> +			opp-hz =3D /bits/ 64 <756000000>;
> +			opp-microvolt =3D <1040000 1040000 1200000>;
> +		};
> +	};
> +};
> +
> +&gpu {
> +	operating-points-v2 =3D <&gpu_opp_table>;
> +};
> --
> 2.34.1


