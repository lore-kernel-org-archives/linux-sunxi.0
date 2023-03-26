Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C75A3C3A
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Mar 2023 18:18:07 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id i5so27271132eda.0
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Mar 2023 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0z4RFfHMU2/2ypHnwqYv9UkrMQizv56zWHHQEZYoBs=;
        b=PBRl+QMRtnW+66ZegD3hEojjApkC581cvyTRGma0sYDQfntinWgs1WFyi3BoMyZznl
         AC1PqgI4mDH+MCe9RPzRUYKCJ6EyPiexunfThXwEa8Q37xTQhJIR1ydxBXtoEdRYx+3y
         rsg8fkZ31shhrtsniXcAzwv72wcqU2m3MfWTK+KumrEwNeyNIegPQ47dar1vtnRjitHP
         Dw0tbsgMflubVd1Fu03PP3bwte918kDg2UIrsmXNVGYd2PVjMlWaGZKcSejUT/M5ynfn
         GRfz9yw2e+ra97uVR5XofdOO5njFSSkdLsU1vu9RiYF/yJZDTt38XUeuBZUsEyFortyT
         AEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0z4RFfHMU2/2ypHnwqYv9UkrMQizv56zWHHQEZYoBs=;
        b=KXPpS2o1Jzp7ojHozv0cDMH79ndZZQ34O7NsPklU5YkppcLdFI0WgSwriTyMyVBNkm
         3XvW2TjQPjUCyQx3aU9rQqX7ZjYzqWDOaCDa1WzCW4vU6Z5X/GLadIFmNKUVCkCOhxzv
         okiyQMkw1m8RkhPXnJFJ4bI+azP9ZWgKfbrlStECr97caGKimVglePFsuqwJN53mKel5
         9RGM9Qfio1KlebwofjFCFm/1AXlWtOWwkiqRuOYQuHsSzI30tk2Nmng27TI/M/kCyjlD
         5+m3qkoxBVnqZk19FqGIpyZe7xJizFcNIRUFnB6DwyA9rlSzuhpRdDMarnCzVEsSjCNt
         R85A==
X-Gm-Message-State: AAQBX9c9R/Y9Hc4Ii9yrDmkX6CjM+Jkm2ccm66G8h0j6JC4FemNg3i5L
	VHoW+s+a1gGvzDXwHz1Kg0A=
X-Google-Smtp-Source: AKy350bM+W0iHPGBqU64BeruoxvXdP0Tu5+EEI5wHVp4ul8K5rTA+zXmxhljNjruKkvq0osXCSY+dw==
X-Received: by 2002:a17:907:3e09:b0:93e:82d1:9ae0 with SMTP id hp9-20020a1709073e0900b0093e82d19ae0mr9841254ejc.49.1679854686887;
        Sun, 26 Mar 2023 11:18:06 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id z1-20020a1709064e0100b00931baabe36csm13128167eju.63.2023.03.26.11.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:18:06 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 083/117] media: sun8i_rotate: Convert to platform remove callback
 returning void
Date: Sun, 26 Mar 2023 20:18:05 +0200
Message-ID: <3153045.5fSG56mABF@kista>
In-Reply-To: <20230326143224.572654-86-u.kleine-koenig@pengutronix.de>
References:
 <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-86-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 26. marec 2023 ob 16:31:50 CEST je Uwe Kleine-K=F6nig napisal(=
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


