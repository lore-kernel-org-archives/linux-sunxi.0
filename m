Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55064A0A
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Jul 2022 20:06:00 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id fw3so18280166ejc.10
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Jul 2022 13:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aZEfm8OgA9a8APggMVbXRa6KOD2e0raMcZC/Lo67ezY=;
        b=kDbYoPRMPnJY4F43ynxUS7bOlPI+9tgrMccJAY3tWYxFqE34Jix0e6P+69Q6ghduI7
         ummaw3aH8l/y6Zl0QWsC2XSbpnqh/LfNpOQ7L89WKeC5z2KALLCJAQJ+2wDlHEs10qby
         T48pmfvcFE73nQUnTa4USOEknxkxqqnbyPx0CA24XCbCgfSxyOlQNM6jm4c6VPbsriba
         tsG9fWKjgc1CCrTC2H9j/X+0b8zgVoBPQQlLKa43Vkr0d/E9vqvzQ+Y0suSWR9QuBSwV
         qROK2TjwLqqGQn/2PKZim11d9Gcqt5mzSHQrNbUr9mYdnS4lqvo20mSpnTkXb66WZ4vm
         zLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aZEfm8OgA9a8APggMVbXRa6KOD2e0raMcZC/Lo67ezY=;
        b=gzxcjXtzKzRwOTgoWBpzMnos+zWwgEWnTQ+t7qQ5+vuj3hJD6CuYJrysp6mRxmlLJP
         1mnelDlkY5b0s5E114ZoIddfoqF0Sr0aHjy5JcZ1ZMx10TFofUK5ohRjRa+4B3M50onM
         TImyNH5X4zNq007JEu81XOnn0MlwP97o9og/1sdenZcg2wWJQw/o0706mh8WJ4Tsato1
         F4joOkn+tbYMMeD3+E6HOnNMjIyX/gpyXFisb+uxipSfEFoibFS4Jirs25t3ENTtXCfX
         pbPoSO+zRTsMgMhNQNOjlaNN8sHMlzbNcGsIrWrHL6fAyPZ7gxtmldPN8v2IbRYHZ8BT
         N3Wg==
X-Gm-Message-State: AJIora/ALky3Y0kZCtZaCb4gjEBE0i/VHV0/5hfZT01gt11P/c8id6hv
	ItOrg2RCyM4BU18kka9nXJ8=
X-Google-Smtp-Source: AGRyM1soYWQRElaa4bKg07yrmpQSLf+0z38tMffHvSF+UC5jmKc27NSdJAUqiu/Dt70DCxYeFU0dmQ==
X-Received: by 2002:a17:906:844a:b0:72a:392d:4c3 with SMTP id e10-20020a170906844a00b0072a392d04c3mr27765840ejy.379.1656965158956;
        Mon, 04 Jul 2022 13:05:58 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id s15-20020a170906500f00b00722dceb3f8bsm14686851ejj.151.2022.07.04.13.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 13:05:58 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH 1/2] clk: sunxi: Limit legacy clocks to 32-bit ARM
Date: Mon, 04 Jul 2022 22:05:57 +0200
Message-ID: <4196041.ejJDZkT8p0@kista>
In-Reply-To: <8956393.CDJkKcVGEf@jernej-laptop>
References: <20220702190135.51744-1-samuel@sholland.org> <8956393.CDJkKcVGEf@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sobota, 02. julij 2022 ob 21:09:18 CEST je Jernej =C5=A0krabec napisal(=
a):
> Dne sobota, 02. julij 2022 ob 21:01:34 CEST je Samuel Holland napisal(a):
> > The sunxi legacy clocks were never compatible with any 64-bit SoC,
> > so there is no point in building them as part of a 64-bit ARM kernel.
> > They make even less sense being built in to a 64-bit RISC-V kernel.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied both, thanks!
=20
Best regards,
Jernej


