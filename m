Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47DC21CE1
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 18:28:07 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5184abe9e86so1013274a12.0
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 11:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686594486; x=1689186486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4agcRs13sbq0fH6nM511QGzLPmuFdZA0cppyFltK+ps=;
        b=VkkQGM9ZGvbJWrYQfpqn7L4k1h2dVUd/QoFfSAOnwXq1NTAWfNLA3YHD5IxwQ92QCA
         A9ggeOYq2NycUNAKSOu5nBuvFvtL9R0CG33IOp/m5zsGRpPGzfyrgBrQUCYPFKu6VvNb
         xKNPNR6FW8aXs844q/tb+nWHXh/0+WFrJHj8AaCVH3O6afT1XeHx9ClTFZtS6DJZsCz6
         9/TL553Qr7Tf4XGCUfuGag5kTVokRLN7X8IeuroC/x57w2lOlcHOM+r70jdTgmQSTvVr
         uW4E67rNyYhxZVU8D7vyoRkPZ4e/U0AMzC08n0lj55BFmbM6CZMiUVq3XrlETAFAcIl6
         M17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594486; x=1689186486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4agcRs13sbq0fH6nM511QGzLPmuFdZA0cppyFltK+ps=;
        b=BmTNJU/ASfku0PpfqmRVJ6eIrxJm8A7wPPsMR1Ysufv0Z9P8ySHf31S3JRUkct6I4Q
         6Sd7ZEjf3rpI4f7MvTnFZl40q1Xart/+C1UVVRUUr5kQ8rxuSlW33hsQIiFR1KlO8gzQ
         Djhaj7odO+vPBuY0lXNiV21R40N4mRZl9LLgHjBn6FH7/I9nvH/Mn5lKnoR2qvrUGx4d
         87iMUFvh/kZmhcolht27dEOf2ylGSxEPCc3WEA8Gr1o9I18MBwmkQ8lpOnMDPLpNuNr2
         F8vxElvrm+lCNXaxSafeiA97SN6Rq7dG/Z5KkXV6Hq0h8hTuT1IW8ymcTBesevziWNmh
         prcg==
X-Gm-Message-State: AC+VfDxM5Kq5+GH5ye5LGjFaxd3vgG0rCdaVZBBAlrf92ZbLF0ZJo8to
	wLpQG5PX5ayuWkCsQwNyCzg=
X-Google-Smtp-Source: ACHHUZ60yZJ9QPJzqKwozXYJ/sqa9Zy/f+rn7T6IW6OI+RSRCBLxL2MW5KoChkvUBMzrAVZixMKaqQ==
X-Received: by 2002:a17:907:7249:b0:973:dd5b:4072 with SMTP id ds9-20020a170907724900b00973dd5b4072mr8579667ejc.53.1686594485690;
        Mon, 12 Jun 2023 11:28:05 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906489a00b0097d7924b4edsm4012765ejq.168.2023.06.12.11.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:28:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add D1/T113s thermal sensor controller support
Date: Mon, 12 Jun 2023 20:28:03 +0200
Message-ID: <3232828.aeNJFYEL58@jernej-laptop>
In-Reply-To: <13282074.uLZWGnKmhe@jernej-laptop>
References:
 <20230610203549.1127334-1-bigunclemax@gmail.com>
 <13282074.uLZWGnKmhe@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 12. junij 2023 ob 20:22:43 CEST je Jernej =C5=A0krabec napi=
sal(a):
> Dne sobota, 10. junij 2023 ob 22:35:41 CEST je Maksim Kiselev napisal(a):
> > This series adds support for Allwinner D1/T113s thermal sensor controll=
er.
> > THIS controller is similar to the one on H6, but with only one sensor a=
nd
> > uses a different scale and offset values.
> >=20
> > v2:
> > - Fixed SoB tag
>=20
> It doesn't seems you fixed that.

Sorry, too many revisions in short time. Wait until discussion is finished.

Best regards,
Jernej
>=20
> > - Moved binding patch before driver changes
> >=20
> > v1:
> > - Initial version
> >=20
> > Maxim Kiselev (3):
> >   dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
> >   thermal: sun8i: Add D1/T113s THS controller support
> >   riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
> >=20
> >  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 +++++++++++++-
> >  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
> >  drivers/thermal/sun8i_thermal.c               | 13 ++++++++++
> >  3 files changed, 58 insertions(+), 1 deletion(-)
> >=20
> >=20
>=20
>=20
>=20
>=20
>=20




