Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200422CA4
	for <linux-sunxi@lists.linux.dev>; Sat,  1 Apr 2023 16:31:34 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so11806210wms.5
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Apr 2023 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680366692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AH+0bN1WVMkRFsPVRu+iIPRXnwUZbJTtFLk6cby4eBE=;
        b=jpepsIRw3W6IDR7ifzEST4IQLONfqEXFBNsHDCkT667xCPSgqnKpS/8OLO5OK8e2iF
         utgZFEWgkcUBrj+W8YeiT4eGdW5h2hRQDKvm4ke4hipJBa7BsFILtoSztIolkU4r7fLf
         yfX1g5loE+mVSHpTYk8ExYQkuTyEMQBicrSO888NQEf5LfnkcC6sPcY1mcVmrds93zv5
         l6OGh3lBmjnEQmer9oxmib9wOfWzAYDDv2nShLa5buyZagYbHyflYzcmnX8kZUBdzBW6
         JMxvAqLI38lQYc2j9ZZQIFI8lNaluR1dy/aLas+2q2P3d7opycJvtT+66pKobZ5Is2VI
         7glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680366692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AH+0bN1WVMkRFsPVRu+iIPRXnwUZbJTtFLk6cby4eBE=;
        b=1dJ0dm/DE5dSWRI8J5GkNvyc5jqpSOuTXKVaa1Ilz3pMK4wiZjiO9Yt8pk+PXeVdPd
         Uya3A/Ifaq6wpfg37qhV4ddtvh+8wE3RI/0U1eNIyo6UIQGZVGID/DkaECdNOLJLaHrP
         ZseKmpDdpTo0dmETK54J415mbV90h5zAgRWtqCg3PItOGQbq8awTo55vn5j3+pu/nAh0
         IXTQ7n2yiC4OHpcz7CBzs0pSwk0g/fsiP7Fw8IhiYrQuPGOMjCdaCmGWcoPWFUSdJfP0
         66laTlHAhWJseFKVEEUvW905cxT+3wFJ7h+6b7tLCVbj/YT8YwE/plNT6WPRLxMRpMF3
         ww5Q==
X-Gm-Message-State: AAQBX9dVHRBJ5zNWESHPnwIYz/gmSAerxSpOKzzphFtv6jR/Ov8xOtHc
	8K4lkjJ+iZ8jUfUOnb2L/IjHlO9to8ZP8A==
X-Google-Smtp-Source: AKy350byHRXINA1w450E0QwNu7Ahu2wY0/s2pJ12q+ZhfS1Zs1qC/Svj5UvTIxX/n92vaCt+lRHr9Q==
X-Received: by 2002:a7b:cb58:0:b0:3f0:3ce6:9b0e with SMTP id v24-20020a7bcb58000000b003f03ce69b0emr5786431wmj.13.1680366692161;
        Sat, 01 Apr 2023 09:31:32 -0700 (PDT)
Received: from jernej-laptop.localnet ([209.198.137.155])
        by smtp.gmail.com with ESMTPSA id u17-20020a7bcb11000000b003ef5db16176sm6590622wmj.32.2023.04.01.09.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 09:31:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:
 Re: [PATCH 46/49] mtd: rawnand: sunxi: Convert to platform remove callback
 returning void
Date: Sat, 01 Apr 2023 18:31:30 +0200
Message-ID: <2676543.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230401161938.2503204-47-u.kleine-koenig@pengutronix.de>
References:
 <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230401161938.2503204-47-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sobota, 01. april 2023 ob 18:19:35 CEST je Uwe Kleine-K=F6nig napisal(a=
):
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


