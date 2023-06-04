Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCA8101FE
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Jun 2023 20:20:57 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-973f8dbcc02so688942566b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 04 Jun 2023 13:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685910056; x=1688502056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pc901lSB1t/5njyHaOGc8Szlz99xchoB9LNubqrB9pc=;
        b=DoNX4mNR4KsN0iXSQQhd4DQCDKAy/YiYQuMQD6ru8VRddZ5HU9qYoL1jaIugifNuZq
         7hZI3Fc7GCBMSXoxGBPUIekHPqx6cxXD+ifUYBWCSSi1VxGnmjlKDVzY3Yvqt0gsz7by
         B2jj1+gU6W63y37bzdsUk55TL10jVRoYRWDmsiD4IE/iyREUrHeUWdo8ZdmSmYW9byyP
         o2kUCLPpNeIMZDxH6g03V2Zx2o13q5xifpMdawywWXXZV1tF8ye3f/8BbGvMrNCYwByX
         WBLHgmVUNzFsAOQHrT9LEk6onwWScg0UncK9BSgbit/tQBh0JmLCWszHpOpeYgs7u2fl
         BSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685910056; x=1688502056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pc901lSB1t/5njyHaOGc8Szlz99xchoB9LNubqrB9pc=;
        b=PP2wPIiOFWjeQFAjLAPq1p5Yu1WXFrpV1qQPpn/fCau4HKlnCBUO6rCKXhXK5XGyYu
         Wybqg8ZyZcIfm8mpGi1FmVDF7Wtsq1dkebIyedzUXDrxv+VyY4FyqJGn8pMSipAWh8wl
         fWtzVPan9dVzQYS3KeJr496SHtYNA26ooWZURkrEPddyQATUFNYYmqiDBnnIwicm9Kyj
         QwArlFzNAfa/FWKkNBikMqDqUUqZae2qW+O9KICD2mIqBynEguBWQAfi6JD6YIJFLdor
         Rsr2w/3lx6ECiqSqo3GNVoEv/tqLejVybGg6ieoSN0Mo0ctVMbU9YpqI/UrE2MOFICWg
         Jh/g==
X-Gm-Message-State: AC+VfDzjxdCdOMIRHm77ObWXw0kR7NSJ/xlKzns0KYZBwcsq1RctZlWl
	nIyvStIZ5QU1WUnTG9ezrqHbaRX52UrhcssR5Fw=
X-Google-Smtp-Source: ACHHUZ7HJh+h9S1Y+0QLnh+mPkHQqhlWKeX5TeLGIsBww9yr2NxJpXCvJ2n+CmB71U+vMZhwSkpXWhlo0NM6x+JnCj0=
X-Received: by 2002:a17:906:730b:b0:970:132f:698f with SMTP id
 di11-20020a170906730b00b00970132f698fmr5945181ejc.2.1685910055898; Sun, 04
 Jun 2023 13:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
 <20230601223104.1243871-3-bigunclemax@gmail.com> <fbcc5688-387c-32fb-edac-17848c92b936@linaro.org>
In-Reply-To: <fbcc5688-387c-32fb-edac-17848c92b936@linaro.org>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 4 Jun 2023 23:20:43 +0300
Message-ID: <CALHCpMizv52yj0rw0pR8pYjSys2UivS4L4GkWLgc-d91bdmDCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav <demonsingur@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	William Breathitt Gray <william.gray@linaro.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, ChiYuan Huang <cy_huang@richtek.com>, 
	Ramona Bolboaca <ramona.bolboaca@analog.com>, Ibrahim Tilki <Ibrahim.Tilki@analog.com>, 
	Caleb Connolly <caleb.connolly@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 2 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 11:38, Krzy=
sztof Kozlowski
<krzysztof.kozlowski@linaro.org>:
Hi Krzysztof,
>
> On 02/06/2023 00:30, Maksim Kiselev wrote:
> > From: Maxim Kiselev <bigunclemax@gmail.com>
> >
> > Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
> > This ADC is the same for all of this SoCs. The only difference is
> > the number of available channels.
>
> Except that it wasn't tested...

Yes, you are right. I tested it only on the T113s board. And I will be glad=
 if
someone tests it on another SoC.

...

> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.

I got a warning about required maintainer property. Should I do
anything with this?
If yes, then who should be a maintainer?

...

> Hm? So you do not allow anything from adc.yaml related? Are you sure
> this is your intention?

I'm not sure about it. I looked at other ADC bindings and didn't find
another driver with 'additionalProperties: true'
