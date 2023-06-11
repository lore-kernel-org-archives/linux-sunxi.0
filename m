Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF8915C4
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 08:02:10 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-977c88c9021so549670666b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686470529; x=1689062529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKObufiJaJTeq7fGpjaIRGbwXaTH9GVmjYgQdGAz6pk=;
        b=QOMnm1A0pEkSVJI0SrtwyUDPwz/GuPP+G3hnOTHQpF3CuucjlNN/HqGM7Flr1GpDBX
         4okirRSt4FqCzNBTHdy2/0tDoIwQ8sLKg9M01pq6T2Wd4IEmdtqyGDRqPEImct/mSd8j
         2jRPLNfsdsCi/0NubYx18UwVtNsZKMHSi29Puw6Prf7CyiWaH7W5pEJtShO3L4LAZXyk
         dbgEhwlJaIRWKC+V5G/HPnCH8httnbg6sbV6rYmUWk1hxLlYJp2nker1CX+cYbe+sndZ
         K18KKX4tax+gNolkhAYjqv8f39hXLeRW/bYfY8eSaoQbWTHOH28tbXCwacUQ7BiYOBrF
         nHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686470529; x=1689062529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKObufiJaJTeq7fGpjaIRGbwXaTH9GVmjYgQdGAz6pk=;
        b=YoJ6fGORDmpcbDhEW5ysFqhtynErSbUAEvMsHm4r2/b7PsR0vmN5ZUWN7Q7Iup5m66
         O2r/Szgy77LJ5caz0hbtzg1DZv8HbyHBG2+lfehLdfOPzQd7szSNSewQsIJJhHcNeUyI
         DQ5Pcf2Jt0faeCERpp9+TKJsXU5uAlNDHJPUX/jvK0W/uS4aNQcmq/PhCBs6CSfJ2EnY
         2RQ1v2jO99euoWesCfQSCWry3K8DYstF0Okv2St613nARJA7LJXz7w5x3+MT9LtUNyFC
         7IwhtYaz6r5EgRbHSz+3rZl7CJVYxvP/aNECGcDQL34UlQUIAvvA81LJhj1ZSkuSG56j
         VRKA==
X-Gm-Message-State: AC+VfDzaXNTffMZi04RvRZrMF/Y3YE2ne/2tQKyzaQCyieRzTDEBg0fx
	PM5bVqJJMlcO1Mb+I2TklhP0ms+ch6QnfkfvFBA=
X-Google-Smtp-Source: ACHHUZ6NjQzgb76bcbhBYj8nK9a65jeRLHSFzppdF5FKxr8dY54Z+i7w+9LyA079iQisCTQ2sCwWWevYb7QwyN5bDhA=
X-Received: by 2002:a17:907:7244:b0:974:55a2:cb0b with SMTP id
 ds4-20020a170907724400b0097455a2cb0bmr6593282ejc.55.1686470528985; Sun, 11
 Jun 2023 01:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230610202005.1118049-1-bigunclemax@gmail.com>
 <20230610202005.1118049-3-bigunclemax@gmail.com> <20230610-thinner-sector-795141d97f40@spud>
In-Reply-To: <20230610-thinner-sector-795141d97f40@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 11 Jun 2023 11:01:56 +0300
Message-ID: <CALHCpMhnVOt_H0VXNcbrt+53SkWsR6ZMNsmWyGw47JGUgePKzg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
To: Conor Dooley <conor@kernel.org>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav <demonsingur@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, ChiYuan Huang <cy_huang@richtek.com>, 
	Ramona Bolboaca <ramona.bolboaca@analog.com>, 
	William Breathitt Gray <william.gray@linaro.org>, =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	Caleb Connolly <caleb.connolly@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=81, 11 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 01:17, Con=
or Dooley <conor@kernel.org>:

...

> btw, do you intend coming along later and adding some of the other ones,
> or do you only have the d1 yourself?

At the moment I have only the T113s, which shares most of the periphery and=
,
accordingly, devicetree with the D1.
