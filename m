Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533ED250E1
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 19:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwF/ln5P"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4064867903cso29057455e9.2
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 12:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697226638; x=1697831438; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qx1cUFmw1hK7yZ7GcQrEKkBst8WaqJrLkeTkGMOaiTk=;
        b=bwF/ln5PmiFevkxyxoabv0fuTEPPOh41XSfEAERlwUwMFfd07JlDp+SHK2f2IDh8xy
         1BSiMfnpPgUglWmgnh7zyxBjKeu+MUHG7cAN/dIkkeROT3XEkNQdO3Gq9faHRR+qhTJu
         iXRhWUo3KC/q/9We9S+qsUnrhl67VH22XGOky532q1eSnZt/2PidoqTuNlvTlHVus4s3
         smzvyfJnjWVEgksjGFsvwzjQNQxJvULCBvTI1GMgJK5/l/9UGMEi83+JxWB2hxGECCab
         fyc6+YaV+IQzDcN3H5R+7BcCAb0vahgUWvEwgXkFNjgEi17RRw+2YNNHZkN+G5ugOcvL
         cXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697226638; x=1697831438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qx1cUFmw1hK7yZ7GcQrEKkBst8WaqJrLkeTkGMOaiTk=;
        b=twd5+EQQvi+l10w0bYNFs9KBihUHpXksuVlXKkklrYJhcnA/VXSzi1vx+l+YDjnFIe
         /EM2R7toGU8Q42rV+tb5KhwLkBGpWnT89/BTaXwIQ1IfHBc8EO45a6UmUaE69aQOpH+Q
         7oJZGyVsyA08CAeC6nTuHcPljHaj72ZA1kJDU7vaySEbkYSltBtTxgR4NIe8nf2MTOvy
         XIFRcCoJyIJrpokO64oNZ1SAACK4aCZbtJcYefldw6ltz7PXEcd+w21NXhx2piI5CTzL
         bfusWBqO/1oZ00ZWlGyozbg6qaa9N6a4//T1C349L4Hm75NVjRdOHTmpFWrMOdJre8Uo
         flvg==
X-Gm-Message-State: AOJu0YzNyu5gGXzcmPv0GxfiIYvVsPPQ7x2Y98LtohaoFfBsvsr0OgqG
	zxX1ReimE9R6kZpVwWaIAoI=
X-Google-Smtp-Source: AGHT+IEDQAlSWc+A/u62V+MvHuimTiaN8lp/uhK9NO20sm2kLcoQiI7ALC/bz4SdK9FhClHxBkqvfQ==
X-Received: by 2002:a05:6000:128b:b0:32d:9d92:481a with SMTP id f11-20020a056000128b00b0032d9d92481amr2005733wrx.39.1697226638285;
        Fri, 13 Oct 2023 12:50:38 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id w16-20020adf8bd0000000b0032d81837433sm8698668wra.30.2023.10.13.12.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:50:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: wens@csie.org, airlied@gmail.com, daniel@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
Date: Fri, 13 Oct 2023 21:50:36 +0200
Message-ID: <1773349.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <3cwcfx7fvtr75j6musdqttn6oto4wemsx7lh664gu3run6wxnz@5o5vao4wibm5>
References:
 <20230924192604.3262187-1-jernej.skrabec@gmail.com>
 <3441738.QJadu78ljV@jernej-laptop>
 <3cwcfx7fvtr75j6musdqttn6oto4wemsx7lh664gu3run6wxnz@5o5vao4wibm5>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 05. oktober 2023 ob 10:43:14 CEST je Maxime Ripard napisa=
l(a):
> On Mon, Sep 25, 2023 at 05:07:45PM +0200, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 25. september 2023 ob 09:47:15 CEST je Maxime Ripard na=
pisal(a):
> > > On Sun, Sep 24, 2023 at 09:26:02PM +0200, Jernej Skrabec wrote:
> > > > There is no reason to register two drivers in same place. Using mac=
ro
> > > > lowers amount of boilerplate code.
> > >=20
> > > There's one actually: you can't have several module_init functions in
> > > the some module, and both files are compiled into the same module.
> >=20
> > Yeah, I figured as much. However, I think code clean up is good enough =
reason
> > to add hidden option in Kconfig and extra entry in Makefile (in v2).
> >=20
> > Do you agree?
>=20
> Yeah, I don't know. Adding more modules makes it more difficult to
> handle (especially autoloading) without a clear argument why.
> Module_init is simple enough as it is currently, maybe we should just
> add a comment to make it clearer?

I'll just drop this patch then. While I think autoloading works pretty good
these days and cleaner code is nice, it can certainly cause some issues whi=
le
packaging.

Best regards,
Jernej



