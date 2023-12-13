Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8454B1EB31
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 20:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncrrenJY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40c39ef63d9so48858435e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 12:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702499479; x=1703104279; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICD2CiUy2kPTcekej3mUTOtcpIsi95RwDi3MnmW2MN4=;
        b=ncrrenJYe6IVdAdwkGKV8knKn5QaZ4Re4ZOTLl4BCU5PU3oT4umAL/ja6MmnQe8sdz
         Wt9UUnCsbsA7aBM4A6Zk86kt/5a19b6y3gET6aBSdszLfh/SlFVpzU8XEfu9iVJckzPm
         poJW/I8Jer6MnQANuPbFoUzGGuLmP8wi9nJA7GF9jki6WH7wh4okivNnxw7Dj1N7QYUb
         SyDC5Y87dOkZphZhIaAQyj+eGnzCZOVGDttxY9C6aEdVhauVU3QvXFyd4Q16TRWB7SMX
         I79bNnAcNrIMbJjLO6+j4yhUFFtuvgS7Xlz4+9Dw5CFWiNCIxoTVXFivmhmiMVV49wOE
         4Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499479; x=1703104279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICD2CiUy2kPTcekej3mUTOtcpIsi95RwDi3MnmW2MN4=;
        b=I6VtdCQ7+S3ew3H4P/sJzKQv/NjI0PkbVqha2umHHyw1qKtSVAFYBYF90f1VbTKDLk
         W4B+lZrT3xXo930stI+dlZE4QTIi1b3ZA+efjgY3xV4AT1zP7UvzXuLVLlEJVyAQIHmN
         wKtseqvMDxY+9Ww4nzeAPmS1eMQE7y0Lnk0ZmoYxvR2M03o0OsCdisAlBp1+o5UFln5i
         nD6+Aa0Koxyi8KAvAC+LKpze0Pdo6xNsVFr+zZu3H6y3DQwH1tWPruVdqB2fZqYQjVl+
         scfAYpCL1NZRU+YyUESh3MIq2M3to8Bfg/5lZ16Wh3jYKT3ShMjiv/paO4pny6jrY7p7
         rZXg==
X-Gm-Message-State: AOJu0YxbzJaEtKfMgssnFtzMf7xtaKAE140amoyCx9AyCJv/6v8tIbUv
	yWPSly75v+9U554O7HtnCoY=
X-Google-Smtp-Source: AGHT+IH1E3dO9IYZc40hIHwrwd7KNGrYkdbH3kDyHBRsm4jzyoaYicZGuhxvorwUigigeqIpbl3/Sw==
X-Received: by 2002:a05:600c:2307:b0:40c:3915:be63 with SMTP id 7-20020a05600c230700b0040c3915be63mr4188911wmo.150.1702499478628;
        Wed, 13 Dec 2023 12:31:18 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c4eca00b0040c11fbe581sm21565084wmq.27.2023.12.13.12.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:31:18 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v4 097/115] pwm: sun4i: Make use of devm_pwmchip_alloc() function
Date: Wed, 13 Dec 2023 21:31:17 +0100
Message-ID: <9208689.CDJkKcVGEf@archlinux>
In-Reply-To:
 <c79e120b120df9eedddaaf70364d28e15df23d91.1701860672.git.u.kleine-koenig@pengutronix.de>
References:
 <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <c79e120b120df9eedddaaf70364d28e15df23d91.1701860672.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday, December 6, 2023 12:44:51 PM CET Uwe Kleine-K=F6nig wrote:
> This prepares the pwm-sun4i driver to further changes of the pwm core
> outlined in the commit introducing devm_pwmchip_alloc(). There is no
> intended semantical change and the driver should behave as before.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


