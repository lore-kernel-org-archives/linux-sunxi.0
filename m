Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D9C3C3A
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Mar 2023 18:18:37 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id er18so15850173edb.9
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Mar 2023 11:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3d3GBP63oeY5CzEIXPrG304fdCBV11eQVRKEbz9r7vk=;
        b=bH4rB3XManAOHePfddG6K/ColVPCvDRV9OhQCxuup92eGMOO6i1BJJ6QLHC7drxOwE
         s2loik1eGaYx/0tgjP1ySqpVScaZRG9XNmBq4UDZOdOgrpH63dvxZuI75bAzpusqwr5/
         dLIB/ggNiC/TLhebyjisnb5CXDu8OmtC6zs/4/yBGafXvB4z736/P70i2sQFFnrPPmhJ
         XU5ZFmLgOzov6VBaKpn749F8gdvPIR4IhlAzIG38qvc9rZbAaF31JasV7lER3eV4aPQr
         jE9q2xKMAboZRFhhz0ZHyZbZer42rGhGass/UDtDHEZwWrQH4DGsJoaO39gO/cQHQ/wD
         i9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3d3GBP63oeY5CzEIXPrG304fdCBV11eQVRKEbz9r7vk=;
        b=uuc9pbtbAJi1TZ1FVy3YaRElubEUx/u25no+7dYygHr6ZUodzcHuJBmcrC28C69clo
         rRtl52B34SMetjDh3yfBPGjOUBsnBJVTQYOTZAyETXvH9ml4ZzP+9Lk/x0Bpt+oN+N4D
         ioce8JqNOEDWhqD2Ytdu5fucL4oy2hY7Gs5z0M+2+BYi4M9dMsV+XtIUBzvtoDo4UORh
         oUKQ6DdbxGA13D260HTIYQJ/N1If0nKB1xMWgkliCxyBbwG2jgeszKqW/cP8WntbWmT6
         cQHRC59IKRgPnio4SgcFczLmyPp7AEXq3kZXXNnxIPtaQWsBsfRTEroIsdKnu1OFTbbO
         OaEg==
X-Gm-Message-State: AAQBX9dDmwidr9KrVXf1s34qQ6cu6cuvDXCr9jeQ9Nw8q8GiEz6BopTm
	zzUnQTOjsBFo410MhrctmPE=
X-Google-Smtp-Source: AKy350a1ZJMqrhifvE9tEgG/vklWWad5WqbXPGZyYdXvzLFocNJZQQrG23Va7ImyqyLK0OjpCg2gqQ==
X-Received: by 2002:a17:907:174f:b0:7e0:eed0:8beb with SMTP id lf15-20020a170907174f00b007e0eed08bebmr9772534ejc.41.1679854715421;
        Sun, 26 Mar 2023 11:18:35 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id kn6-20020a1709079b0600b0093f2e69c715sm2517920ejc.110.2023.03.26.11.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:18:34 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 080/117] media: sun6i_mipi_csi2: Convert to platform remove
 callback returning void
Date: Sun, 26 Mar 2023 20:18:33 +0200
Message-ID: <1943376.usQuhbGJ8B@kista>
In-Reply-To: <20230326143224.572654-83-u.kleine-koenig@pengutronix.de>
References:
 <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-83-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 26. marec 2023 ob 16:31:47 CEST je Uwe Kleine-K=F6nig napisal(=
a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


