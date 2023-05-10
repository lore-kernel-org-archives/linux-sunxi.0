Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9709014A81
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 19:03:23 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so14152749a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 12:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683745402; x=1686337402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUm1RseG4gL1lkYyVQ+0Gcvm9e1117RvbwpOaGA4O7s=;
        b=XPz/s4HTgv63jYJh8z3f7SS/1iAoLoxJtMzBarJSI+t5sOgKgifmZAMtKXWud6JXVZ
         wLCJOLkW/n3ss06Igw+XlIhRQwemvnf18H0mWifAhu4YRO7AvJK3CeReQzb/jRiMN2eZ
         Hs2WYNu5hIAbWMHUtmyiCmbvP6W6ubNR+9V+gaZPdbYyDLFCs5A4UjqAxi+Xc0rZ2Ink
         VXkVCxn7/Az1K1jBItqDqKOD9QL18cMtCemNi6istCKx2DK3OwVMG0R83C06Vu0aUz5j
         +CWXQYnmFTo9jfIo8SjRIkZO12XcyWOdh2kd+lseeFhaySun9TL84b32Hl5PqmDlcJVn
         nHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683745402; x=1686337402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUm1RseG4gL1lkYyVQ+0Gcvm9e1117RvbwpOaGA4O7s=;
        b=RqjVyK32O52z4nyYngWL1uCz3xyR3Wc4z6WpPyzgiXl91EFSKQmmZrkEuvDc7OpIS0
         Q7BhLwjJKcJetlCg2XsfF/sutmN1RITaFavLXaMWgA4c9T0m/3GE+hupduTQRJLZod+r
         z5uVlJTp8IJbag9kj4ykeNnoHWlwC3A7qzXmYBSRss6Wk3UkjFNddw1CQwscpUuaOT+X
         +xDA348znJ3xl/HXcLnDl57HAOsUm3v2Gu0uXLw4aJQ37SRTDjkNiWiYgXicYhyert/h
         f63XJZeV+GPihxiVTbfty4DCiAiBLqPl0xhHVYU2BP6PSJ5kTCAPyBUMcZnTEvYuXREB
         zJ+A==
X-Gm-Message-State: AC+VfDwkmo8EMc2YVaCiA1WinPJMI1G6pnKyf+W4qtmhrnooNivJK93/
	JIdXSBKQmVz9GV7fZyPQqgw=
X-Google-Smtp-Source: ACHHUZ6BFE4NR5OmqK9DHzA38atpHNyNW6749lGSKxskq0PTDosCWiIzwlxIOkNSaqAx8IVLf5bL5g==
X-Received: by 2002:a05:6402:48f:b0:506:9220:b149 with SMTP id k15-20020a056402048f00b005069220b149mr14073920edv.26.1683745401705;
        Wed, 10 May 2023 12:03:21 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id k23-20020a05640212d700b0050c0b9d31a7sm2185149edx.22.2023.05.10.12.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 12:03:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Wolfram Sang <wsa@kernel.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 71/89] i2c: sun6i-p2wi: Convert to platform remove callback
 returning void
Date: Wed, 10 May 2023 21:03:19 +0200
Message-ID: <1854054.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20230508205306.1474415-72-u.kleine-koenig@pengutronix.de>
References:
 <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-72-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne ponedeljek, 08. maj 2023 ob 22:52:48 CEST je Uwe Kleine-K=F6nig napisal=
(a):
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


