Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B053D57B
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jan 2024 20:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSdQy3aW"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33765009941so2789942f8f.3
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Jan 2024 12:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704831354; x=1705436154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQBuQHYjeBWmqCwTGH4YkN69mVB+VC/t7tF3wqgLXWM=;
        b=FSdQy3aWrDEkG+Jgc63gfgrim8vvuAR+R9+/To571ZKrNCjbpYMRca32ne95BjhGrK
         QClywI0Iy0CIqAKAhkXqldgt6Du+PnNl7PapT8e+1PhQBHOGEGBIhIv/4iwf3SEm53tl
         wdiykuGeaclwecCJ/GJvnH3gV+ScuuXbxRDXlH2UFT9FdiW4khfWm54Hxc3lfZdoTK5D
         BEfzLcciRSihBQ0oBv7k3LavPU8I8C2DF73Py3NfAfKRY3QckeNUPb1PGWKf/Ghchcfp
         erH7J/Pmw2bP2d52JaTFdHL+bA2qmy8Cpaj7ACbExp1p/MzEqFsPz7MHwz1i9vpjdQtR
         1c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704831354; x=1705436154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQBuQHYjeBWmqCwTGH4YkN69mVB+VC/t7tF3wqgLXWM=;
        b=LUL0L0bx3g6SvER6mLJ6Who1gVR1ZV7KaDjM9EobZAf2EpSkXcLFi5QS2h+ZhnNYlP
         kcT5yT+Q5C8oCjkM8fmkBnt4kOqdmS5T5rq6LvdL2J2ykcuJ9tCMRJRa+uAVx0HiP4oT
         A9IBWr3kKOQ+VJonksCzsOB/I+7SlviIyF78MMfF9evGO5KlLe1uifV1FG7SM/ZIaUgX
         wJn/eD5nJEMdQ4ni5afiW1y83jeD2HcILiTttAT8D8MFDiFl5k1qCilS2PMVPUPm4j+Y
         6oCPWNzSt/3DWaHlvSO/IJJqw3P4ZY3WtCZRAI5kf9k8pcuQAipzNjIms0WMmi2RnkLC
         B/8w==
X-Gm-Message-State: AOJu0YwGKFvnztNgz60BJR/Z5UrKvly1BNKN/EC72+k023KAfcNbMTf/
	d0hG6vBWT9yI4z+HS3lUxTg=
X-Google-Smtp-Source: AGHT+IE4R7zgERsrbs9fWbJ69vzmnx8iBlzpLeYPnFGrt0JnjOw8UGQcz7XjE6871uIgRVOA/YyG7Q==
X-Received: by 2002:a05:6000:543:b0:336:ec62:ea8b with SMTP id b3-20020a056000054300b00336ec62ea8bmr841769wrf.63.1704831354380;
        Tue, 09 Jan 2024 12:15:54 -0800 (PST)
Received: from jernej-laptop.localnet (213-161-3-116.dynamic.telemach.net. [213.161.3.116])
        by smtp.gmail.com with ESMTPSA id cr8-20020a05600004e800b00336673a4153sm3191685wrb.80.2024.01.09.12.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 12:15:54 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 10/12] mailbox: sun6i-msgbox: Convert to platform remove callback
 returning void
Date: Tue, 09 Jan 2024 21:15:52 +0100
Message-ID: <3783111.kQq0lBPeGt@jernej-laptop>
In-Reply-To:
 <2db7ef94aa35587980697405ec373e0b7bb70466.1703710628.git.u.kleine-koenig@pengutronix.de>
References:
 <cover.1703710628.git.u.kleine-koenig@pengutronix.de>
 <2db7ef94aa35587980697405ec373e0b7bb70466.1703710628.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 27. december 2023 ob 22:02:38 CET je Uwe Kleine-K=F6nig napisal(=
a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


