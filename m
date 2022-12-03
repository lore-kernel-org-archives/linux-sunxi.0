Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871B323B9
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Dec 2022 09:50:13 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id d14so4481551edj.11
        for <linux-sunxi@lists.linux.dev>; Sat, 03 Dec 2022 01:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKoltGC5ckQWo5BiboUaLB5iAME4tB65clkoM0oEHcg=;
        b=h6dUD67vquHbmPgmHoNF3BOb+l8o5ggMnEOVhLjx1fn+5TL+D7YI6EIz+cJ8TyADBC
         QMFicDeDKirXMuYXDVisaijeLIK+QkKXdoD5bl83VGWDxAILefl2+EmDjB0DU1DwYEiC
         fJInYweXJ29/BR09WIL4Okv63iRAwCD2DyV3s3fFS83/4eHFZKswkJKmybe+cMIR8IjK
         4j9NGUL4lqQThbP4UPLaw83IPR9uzExrwlSICvd1mqCwiopgoSSljYq9qtIoST8ZFPfu
         kWCFMn6JaVEs2g4Usq6m/oab4yz4Iu1kIW1SyqyXocE71wlVKsJJIkyR1aHFbW18kUyM
         a28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKoltGC5ckQWo5BiboUaLB5iAME4tB65clkoM0oEHcg=;
        b=I8smKgw7favfz+TBJNKaDqeh7AJOh2t8pnsgVEKSm+8aGt4buaI3B1w215tFwPgjXL
         9x0smazHni0lKWbgA54Fx9JXvrNTIatZdnLJMcwB6ewYvGfOJtzwG8/dS9XWy3sSdLiE
         ZFrfl8gucN7lT0vTXUdWSngj8kGTkefieN+pFI4r8ASbZtTfautO+6o67zqbtprD1o+9
         lahMS6FRslkiuJDumDbqcdJsq9vSFqXtCu529zmPfJHn0HAu9LriFPuhBHUz2Ex5Mrcj
         riBrEoNGTbfdHbH9DSjxTXXkOlX3OQT2iC2UP1ZwO69jvDEWGo/fvdw5Rxg+fjBtJtAi
         b2lA==
X-Gm-Message-State: ANoB5plQDZw13SFZUio/sYCjkqoNUpf+B71O9cjCsi7oFL4wRGbAH+fP
	OddrqDyK3nXRsVmNPEEO8v8=
X-Google-Smtp-Source: AA0mqf6J+m150CNoI5DgQbApXyAZL3nNTnv0RzKOkbOv7RUuirKufT3KcLNr3BaaEs2QCVel1ifT/A==
X-Received: by 2002:a05:6402:5406:b0:467:4b3d:f2ed with SMTP id ev6-20020a056402540600b004674b3df2edmr50133008edb.101.1670061011692;
        Sat, 03 Dec 2022 01:50:11 -0800 (PST)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id by15-20020a0564021b0f00b0046ae912ff36sm3861099edb.84.2022.12.03.01.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 01:50:11 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>, Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] pwm: sun4i: Propagate errors in .get_state() to the caller
Date: Sat, 03 Dec 2022 10:50:10 +0100
Message-ID: <5623993.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20221201152223.3133-1-andre.przywara@arm.com>
References: <20221201152223.3133-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 01. december 2022 ob 16:22:23 CET je Andre Przywara napis=
al(a):
> .get_state() can return an error indication now. Make use of it to
> propagate an impossible prescaler encoding, should that have sneaked in
> somehow.
> Also check the return value of clk_get_rate(). That's unlikely to fail,
> but we use that in two divide operations down in the code, so let's
> avoid a divide-by-zero condition on the way.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


