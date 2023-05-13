Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EB37E1
	for <linux-sunxi@lists.linux.dev>; Sat, 13 May 2023 06:37:01 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so95678505a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 12 May 2023 23:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683959819; x=1686551819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYFpbAhkvFBTjOnXoqutGtIEzJiI9XzWLyx/evSFRPs=;
        b=ZDwCPoKhDsaMVA4DZ28mz5uv7DdK9kqQIbuBPI5TTiGMn6p3f3usZotGU5qDDyqaIO
         ng0xO05Jd8LrdLvSkwQmRU5TPujOB8sxvBgIChoecRAcX/QSO3XWNN+IpRT6bh0q5+w+
         oXPKoIceDsgbWl7iPXcwMMQmvGmssj06/bnklDRL/wzCfK+TDuYK0AvSKhdS94L+yoKt
         iCpNIqfNeWQswOkoXX/ssGY4HoTRvjwmv7hine31YNafEsenfklnoLWuBIr95nLHmUJM
         dIx72fBXWOWigU1QSfejbLAJK0W0nwit3wMb6Cc63bAa5qnjrkDN0DY0EUw7f+b1EpkV
         Cx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683959819; x=1686551819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYFpbAhkvFBTjOnXoqutGtIEzJiI9XzWLyx/evSFRPs=;
        b=Me7eukPM+XjIR3OjWZKjIBpAYI8WP73vSYZHjGtxGgeHWBVSlyEtV+CHRVgl1k6cwf
         9q8dULl4KSExvy9TuC3MokasFgw7Qvk2RyZQ97w9+rmQnem/k+CHWPBwSogYDF3ieGdZ
         D7KV/3UuqlO0W6JRfHHEbybI4kZS+bOauazkZBktNT1FNz8uZMTC06O90yQfguqM6vc1
         fFQpR2tUGjaNh2LE8a6jHxweGmnlA5xo1NWVfj9FbKtJbNRwQMQuCZbzUScfN77uNTRD
         L2Utc0SXaE4SidOlDobtfdchbq3wRgJTFgme+0OaLK4Dt3gbbeeWI5fEFeOpCKuqr1Rh
         Xqhg==
X-Gm-Message-State: AC+VfDyQ0LnWDZqB5RIFYGIBYKpqwKszHw7eNdAR7V2KsdJfN0scTnzX
	OOxyfQSSmKSxMqstxepKStA=
X-Google-Smtp-Source: ACHHUZ6U/3VzZBDjJhchWHFsH0R1I/SSBEmKisnb8+MCxNQXGXdvu+WFC+oPYObLvSAMQjHue5mW8g==
X-Received: by 2002:a17:907:6e11:b0:96a:2210:7dd8 with SMTP id sd17-20020a1709076e1100b0096a22107dd8mr10416560ejc.38.1683959819039;
        Fri, 12 May 2023 23:36:59 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id d4-20020a170907272400b00965e9b435dfsm6425131ejl.65.2023.05.12.23.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 23:36:58 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:
 Re: [PATCH 17/19] can: sun4i_can: Convert to platform remove callback
 returning void
Date: Sat, 13 May 2023 08:36:57 +0200
Message-ID: <5672483.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230512212725.143824-18-u.kleine-koenig@pengutronix.de>
References:
 <20230512212725.143824-1-u.kleine-koenig@pengutronix.de>
 <20230512212725.143824-18-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne petek, 12. maj 2023 ob 23:27:23 CEST je Uwe Kleine-K=F6nig napisal(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To impr=
ove
> here there is a quest to make the remove callback return void. In the fir=
st
> step of this quest all drivers are converted to .remove_new() which alrea=
dy
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


