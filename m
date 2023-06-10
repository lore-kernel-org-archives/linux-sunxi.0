Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2AEC8E3
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 15:48:22 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-977d55ac17bso506182366b.3
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686412101; x=1689004101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+PV93m/s/NOXGrP+XMGqPRSJ4bMSqkEUav/3Sp/SUo=;
        b=Q34XAtI54cIkhZYDotBTosBNKqeEtdaBGe/lHaZqbJ89DP58Z/qRC8OTHcB46m0Kz6
         tYZDXB+eN1elN5uNcii6qfMo6QKRIew8HjOzxQnKjwfYtI8QH1TzeUvWXuWVjRKibAo5
         oVqMa4yTNjPEnNLgASQGu+aEY31Mbd917fBUDjhMO0Jmw5zvHhRIwxxFUd6iayTCvK9d
         2vdziEGtDX7yJ1vOOUw2skkhT6BdgQ8ZbyeDMLE9Qj8kL9nHchSq7AQxBYFVVRWghCFM
         YkRPhqh9GgQAtJhC/Q9VULCI/TWMOpYGFRb/+xGzdTsj4a39ByFyLMzf8KrZU7Lyb0SW
         OxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686412101; x=1689004101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+PV93m/s/NOXGrP+XMGqPRSJ4bMSqkEUav/3Sp/SUo=;
        b=kgcch54iu7F3oaw56E6zZPkaIy5B3O/vfA0h92Y8WoBd8tCKes/s/1bFwrf5CyQh/d
         BVYtefntyygUoS7YKm3uJRNZI2JMKb4fLMRvj3+qcTiDkNvWfRlKbYRYQo3lhQnOeAPZ
         HnRZHq9FmZIgA3WPvMtx0qNxXzh5jMPJCWJMfEyfRCjZOunf7S54B5iSwum832CVMSq6
         q4GPeiZfFaOrDc/UY6jsfPQ+o6tTmEHtU0r2JCovhrDGphkyAsYr/dejq0q7TTdFaiW8
         JIizvHWZr9E8ElDjB0TdUipw9T+R2iSeWyGXnoLbzcRn8tV0K1UH9tRXzFN8q7bmvK1Y
         WWdg==
X-Gm-Message-State: AC+VfDztgde16ja9inxwMcRkkJQTEoGziazlbVKZrrxuVlK7U3JP0hXQ
	Wp5ci2WKiVQj6FAEIfuO3cgs4mkmJz+ZmGntjgM=
X-Google-Smtp-Source: ACHHUZ4+yt8TVxdmv/KLF0owdyYhjmUilZj8tEPlviShNxjxsyve8eoayZ040B9uZ/VhtH2U+1jPZUtc7w/UhVrwtao=
X-Received: by 2002:a17:907:728d:b0:96b:6fb:38d6 with SMTP id
 dt13-20020a170907728d00b0096b06fb38d6mr6295931ejc.65.1686412100664; Sat, 10
 Jun 2023 08:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230610122934.953106-1-bigunclemax@gmail.com>
 <20230610122934.953106-3-bigunclemax@gmail.com> <20230610-ranged-outboard-2aaa0cc36cbd@spud>
In-Reply-To: <20230610-ranged-outboard-2aaa0cc36cbd@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 10 Jun 2023 18:48:08 +0300
Message-ID: <CALHCpMhHxAdDMGmpD9i2Kt93XqyrW_ABzr7FZSE-0+54LwgzPw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
To: Conor Dooley <conor@kernel.org>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav <demonsingur@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, William Breathitt Gray <william.gray@linaro.org>, 
	ChiYuan Huang <cy_huang@richtek.com>, Ramona Bolboaca <ramona.bolboaca@analog.com>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Haibo Chen <haibo.chen@nxp.com>, 
	=?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

=D1=81=D0=B1, 10 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 18:06, Con=
or Dooley <conor@kernel.org>:

...

> >+
> >+    required:
> >+      - reg
> >+
> >+    additionalProperties: false
> >+
> >+required:
> >+  - "#io-channel-cells"
> >+  - clocks
> >+  - compatible
> >+  - interrupts
> >+  - reg
> >+  - resets
> >+
> >+unevaluatedProperties: false
>
> How come this one changed to unevaluatedProperties: false?
> Wasn't it for the ADC that we previously discussed whether
> additionalProperties: false was correct or not?

Hmm, I changed it to `unevaluatedProperties: false` as you suggested
in this message
https://lore.kernel.org/lkml/20230604-afternoon-frighten-42222010557b@spud/
