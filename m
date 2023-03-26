Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EC23C3A
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Mar 2023 18:19:38 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b20so27163061edd.1
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Mar 2023 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSqxuyfEke81j3er0Go/DK/4bC3kWSK22YBA8/AvV4U=;
        b=Y5gYxjKDM6nDVlxy9wV8DDJ0v3+laD4XdKX7h308JBH93asCCHbFaOJiDig1tS1Vtx
         Tp/Svx5uA29CcVPWGl9MQBzDoUsnJJwbYlUWXgMBmY3AHpxmsFzslWdqEtw9h+sWce9f
         TScRafAYujNinL4ymkOyIDDvM+kHi2mHNbpi7I8AvJ0wMsOaLgQ6INo0nnRvpL5e7E4F
         +0seYkgiwEGpCL3J6n73NwxaG2apUJSlU75EN+FyXylquHplj/y+3BPtSIzKF3TB0DYv
         7XObNhRMJ+NK3ZjVcxREVzUOOwc8frMwwrs+hlbfKb6DIeiuFL4mDBmFV++rawK3e+Lp
         mERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSqxuyfEke81j3er0Go/DK/4bC3kWSK22YBA8/AvV4U=;
        b=ClQePJ7Top5nzohURY4+3Lb68n9UuH2Li447D4iEDgqQqQwoLp4A/DbWfACGiKUH+N
         lU4tz1IiowomysNIF5jbLliTpsQxFnMkiUQmgGqDhHvQRRrCOe9w4SdUE3yh2DOUozwf
         GPtHTz3pEeXsWswEYU4A4BoFBBa6+63cwpynXqdK0cqvvRr2Owt96lr8BFM1zajCfuyp
         I0X5YXiQBLUubllBvs2uNo3nTdhODETvF+8H+hTHfZyhlvoYWHTMbODthunC+63zJ2Hc
         r4HvBs2mifsJrCrw/2QlT5nOMqq08ai/iTBtbdXvUarTBqGYFkdLVPch7tkSQTUuzM8C
         Z+zQ==
X-Gm-Message-State: AAQBX9dvR7UPtopbO7KaRjKcHBq4Ax/WUPSBbVfUtaNy3GprMZgJEfrm
	i+V2asyHtpTyYxAgrwfjePg=
X-Google-Smtp-Source: AKy350b5DXHhyU94C4UF+pOzVUUSUq6TDLMXboWN7jxjGnv4nSKPxGzBca6EDPRG7oQLbPTEtr/lww==
X-Received: by 2002:a17:906:524a:b0:931:7709:4c80 with SMTP id y10-20020a170906524a00b0093177094c80mr9117307ejm.71.1679854776718;
        Sun, 26 Mar 2023 11:19:36 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id o2-20020a170906774200b009273859a9bdsm13100901ejn.122.2023.03.26.11.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:19:36 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 079/117] media: sun6i_csi: Convert to platform remove callback
 returning void
Date: Sun, 26 Mar 2023 20:19:35 +0200
Message-ID: <2144019.Mh6RI2rZIc@kista>
In-Reply-To: <20230326143224.572654-82-u.kleine-koenig@pengutronix.de>
References:
 <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-82-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 26. marec 2023 ob 16:31:46 CEST je Uwe Kleine-K=F6nig napisal(=
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


