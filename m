Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C4128E01
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Dec 2023 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNzl1ITA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3367903b4dcso2003649f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Dec 2023 09:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703267696; x=1703872496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oj0ljpZLwr9kojU6Bm2y0A367iD4r4CItsptTMa/Oic=;
        b=SNzl1ITAaKckDk6u6Q+dzyRJz0+wQyIYFCEzHguGcHWXfSPnvSe60NGDAeo7S70KXD
         aqoGA0UBkrKi0/E/nw0/hGmqL/45mMiVUnuF28zIy0k6P2yesGw9cZiiAn7pKYxvoKVR
         dLYQ8NuZyOjc/Xt2C2BLYlCUKDanfNJ+3pvb4NddTCacrzG16e0O8mGLIWolHq2Gb5p1
         8hTeDAQjeaHIoXRufj0X3TGmi3YPVIBgVvN2ZL8SFtCqNM/ttlDwgpe392rIxQ7D9uJI
         BSRW2BHH9/1yXmm64x29kLfy38bqvrbnLh7phbwIo5ifXow6sc9BJI465+TzYEkYlTkR
         pH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703267696; x=1703872496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oj0ljpZLwr9kojU6Bm2y0A367iD4r4CItsptTMa/Oic=;
        b=V7Zm+evWYd+e4i1fPcltMetYR2RFz/mlNZs/BM0wREwu+SrABFAXa2qW0/onol+7HC
         Q21BhOuFYHX3/HhKvWDBy0Y5UMmLT5Nl/D2btgY6hsKPPUeeiZP1W9dlrCxEpc681Sdr
         Y4pLnv/AT5EKoffsfncndFbmJfSghDthE8VpDfk3YoMqk56UsRTw+EZ4cUPDVmMebNAA
         cjqjcntpjlVMiSULH1momeqV5o21+BGyZ3O3PpmOG0LMerImitBk+X81RsgbCxqNNOBp
         xZJ5/PwNlC3c2PXSWjH4ALhB4CqsldtDaSOkaS46R0kU75zJr8qEafMJ6HRSzVaftO7G
         bVZQ==
X-Gm-Message-State: AOJu0YyQ/x2uLlFg/DV1DHE1YwCTtgwWwqRrdrMlMBQLx9h8a536A+6N
	rjYZ+LIdemrQXZpYr7GBMoY=
X-Google-Smtp-Source: AGHT+IE6/WJXh8sGkbCJYkrbDuO3jlBRsiAC2Kk2c4CASZhaBVu6YzVdo/PYMaOpVujDGHZzrmeYcg==
X-Received: by 2002:adf:f78f:0:b0:336:6e22:672c with SMTP id q15-20020adff78f000000b003366e22672cmr1029458wrp.88.1703267695558;
        Fri, 22 Dec 2023 09:54:55 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id d17-20020adfe2d1000000b0033673ddd81csm4801113wrj.112.2023.12.22.09.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 09:54:55 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>
Cc: fuyao <fuyao1697@cyg.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 maijianzhang <maijianzhang@allwinnertech.com>
Subject:
 Re: [PATCH RESEND] iio: adc: sun4i-gpadc-iio: adaptation interrupt number
Date: Fri, 22 Dec 2023 18:54:53 +0100
Message-ID: <4953611.0VBMTVartN@jernej-laptop>
In-Reply-To: <20231221152553.GM10102@google.com>
References:
 <YxmR5SPPY18O7LaG@google.com>
 <20231220115412.65bbc8c7@donnerap.manchester.arm.com>
 <20231221152553.GM10102@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 21. december 2023 ob 16:25:53 CET je Lee Jones napisal(a):
> On Wed, 20 Dec 2023, Andre Przywara wrote:
>=20
> > On Wed, 20 Dec 2023 15:23:17 +0800
> > fuyao <fuyao1697@cyg.com> wrote:
> >=20
> > Hi,
> >=20
> > > __platform_get_irq_byname determinies whether the interrupt
> > > number is 0 and returns EINVAL.
> >=20
> > can you please say what this fixes, exactly? Is something not working at
> > the moment? Can you please provide parts of the error message?
> >=20
> > And maybe expand the explanation a bit more? For instance mention that =
the
> > identifiers are used as IRQ resource numbers, where 0 is treated specia=
lly.
> >=20
> > Cheers,
> > Andre
> >=20
> > >=20
> > > Signed-off-by: fuyao <fuyao1697@cyg.com>
>=20
> You have to use your full real name as well.

Isn't that enough after
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dd4563201f33a022fc0353033d9dfeb1606a88330 ?

Best regards,
Jernej

>=20
> > > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > >  include/linux/mfd/sun4i-gpadc.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/include/linux/mfd/sun4i-gpadc.h b/include/linux/mfd/sun4=
i-gpadc.h
> > > index ea0ccf33a459..021f820f9d52 100644
> > > --- a/include/linux/mfd/sun4i-gpadc.h
> > > +++ b/include/linux/mfd/sun4i-gpadc.h
> > > @@ -81,8 +81,8 @@
> > >  #define SUN4I_GPADC_TEMP_DATA				0x20
> > >  #define SUN4I_GPADC_DATA				0x24
> > > =20
> > > -#define SUN4I_GPADC_IRQ_FIFO_DATA			0
> > > -#define SUN4I_GPADC_IRQ_TEMP_DATA			1
> > > +#define SUN4I_GPADC_IRQ_FIFO_DATA			1
> > > +#define SUN4I_GPADC_IRQ_TEMP_DATA			2
> > > =20
> > >  /* 10s delay before suspending the IP */
> > >  #define SUN4I_GPADC_AUTOSUSPEND_DELAY			10000
> >=20
>=20
>=20




