Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E0C3C3A
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Mar 2023 18:19:19 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id i5so27279677eda.0
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Mar 2023 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRsdmVEmkxcp3g4ZbMN6Afce7+HfUPfqF6kGvf5nBhg=;
        b=Ys/WIc2tT3SpQOxjP2ekhZiOsQc1XgzldyHwX8iBX3A0TrIxjtvW6Ky9thPOlY1b8w
         YAIbiVjo4nbHjicHsETpZB4kTTSN4229zKctq4cuv64rjmIIQRoFjEZ3f0YQgWAyNdNC
         keURJRgEvdYeWWbooqBuVipAjeajDFt1Pvrm1E4GRFNjWXzE0lOcuqye+57Gz6+bIjyU
         oGUHIVSMuMHnv01ikTWLF2gasvQPacKlnmHIumJ/2C11GnwdxUSrmTw0cMjkhDLHuhKF
         qmfJSJbvr6/o1plGsIYuqamXCUj569zCCk9c9nzh1fi/Kb9Jsrb7ZalPMJbM2et5VAQr
         WV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRsdmVEmkxcp3g4ZbMN6Afce7+HfUPfqF6kGvf5nBhg=;
        b=sQWPLP8SjpIWbuQPe/1+CYzFIgZL3O2zIB2zYjHxeGangz0lgcy7oHQFqkFLs4wpY8
         cRsNu8P/vRaU/q4bGUeqCFBG6vX+FEtvVRvYtAkgjCBxMRl1BOPK04TqQCz87ZXsr6ID
         /uasHlo1OQvBzfplFphNdTn2kOiMCYeRdScEy7sM9HMqJKT8Zkq2d3zYhW4nm/UoI05A
         t+Zgo1rC0idQTB+zmz5I7PViLiAjIMLi1GVZ4tgjhCGVO5dcMxUBEW7V2nWyBER141Cj
         vUzth1AP1XOQTFKL2kyF35se0Uc6E/kMJ8sB3PvMCZIVuoPpyUUI8sOqMIskvqnfbeUC
         OVCg==
X-Gm-Message-State: AAQBX9f8L94MflAzHuXh6JK40O5rP0d5zwmZITjR571bNaaDKgyze5Le
	q/rpj4qn7/ln5CoqdmFrrJ4=
X-Google-Smtp-Source: AKy350ZAFybFuC6UV5o+Av2B3qaWvPelSXC1+yQkwDZDZrxwesjGUcFtJ/jkq2lGEmn6lg1APX5eIw==
X-Received: by 2002:a17:907:c710:b0:8b1:806b:7dbb with SMTP id ty16-20020a170907c71000b008b1806b7dbbmr10225413ejc.51.1679854757904;
        Sun, 26 Mar 2023 11:19:17 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id ja21-20020a170907989500b0093338259b2bsm11671117ejc.207.2023.03.26.11.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:19:17 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 110/117] media: sunxi-cir: Convert to platform remove callback
 returning void
Date: Sun, 26 Mar 2023 20:19:16 +0200
Message-ID: <2550444.Lt9SDvczpP@kista>
In-Reply-To: <20230326143224.572654-113-u.kleine-koenig@pengutronix.de>
References:
 <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-113-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 26. marec 2023 ob 16:32:17 CEST je Uwe Kleine-K=F6nig napisal(=
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


