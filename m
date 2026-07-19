Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DCC2512C8
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784467791; cv=none; b=RaGCVKA4OJP2Qxmo2LdtBEWy7UUeQ2OMB6KkEs8DqVuL1r574Evr9XL7TC9Y3f93qs4nN3X391EiYhpQ3W/opFZWtvqUAhkU+fBP7OQhio2KOqy6lkst7ZvZtNckx+Zufnxzrmv3sbyvZlyaRyMzWsXENuxxizZW2/uNXWttbEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784467791; c=relaxed/simple;
	bh=Xaq7RQ3DmIHqyyvVvwMjeuLuuIAP7Ugenr1ER60EbtM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FYWqS+uXEEIoXddhpqoQ8GNKUzx05cjM1y9MYdqBlrpyqOntZsZBbHH/cvctFbTfpQ6oeKDJVbY+xDcJLXieBIB4aObOLisujSYkc8aRubRIDHaD7Z2RaT6b86yTaRBoVNRmxUTLYlhffT7CBrcY10Ve0wruUwM5db3XlSrHx9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=E0/PUhhO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="E0/PUhhO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso8213735e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784467787; x=1785072587; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oTTnLvB5EKr1ilWHZeKrVDJrENmEbx/nOStJCKmeMiQ=;
        b=E0/PUhhOOvprbWLyMn8aQ3ljzv4LJuSfhZfr2INBDRBn/a4CwXtz/04FmQ+A3iRPgi
         mgDCQXEynaebk70oxlOUIJEF+hSIOO/ksZUXmAY/rgkPnV3q46HqYCV5vQvJ9HQ0P2qf
         XaAMI5iiwdmxAneOlzbqxUKBrBOwuNOAFaWrZa7vMWWLy2EOmyNTsTAqkZgR8bBZERn6
         h/VCyjSs3hgVwtcVMbpe21SqeGt0C1Y7e2AYJI+Y8OnMgQcByOL9OOxnOqBsbmIDeY86
         M2RdTAtVNcmpJxbUmzl+h5W0z8i4k6+78C5TmW82ywEpTWAnz1GopW3IV/Lg9iyzYm13
         GhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784467787; x=1785072587;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTTnLvB5EKr1ilWHZeKrVDJrENmEbx/nOStJCKmeMiQ=;
        b=XcRZNrcTf9YSFzjdp302eTCRi/yHGJvSikfe+N7EoNET0uMsC9mZ/WXsED333aR8jn
         x4buvsytqmac2JRqCD0Q9F6PKVf0WLWWysPej4Xm0hyenYOmdY6Vd6v/2Kyvk+mdziun
         cVjNWWHREduobYaGOu3gVZWGzDIPx/dixNw8fQbmKGCDZET2Wqm9ZT5Aj/iJTPzs07dh
         2fgeAH3VXMfPv3GT1z2YT/oLo5ehcNz5eqCXVu58c7Y+FdHi0VSAv/xY3izA/S5fkUwY
         ngCmXO+irUFTlLo3scLhfS10MG+/gTcrTseVur30Nwg+3fW+gkr/4YWO9k8Rj5eXPa/K
         MQJw==
X-Forwarded-Encrypted: i=1; AHgh+Rqvx9nvTfRNrq5qfRayyVldy2utIyMaiqHkkc+a1KAVKFqPmwGkgeGZX2FhBsls+UXBwsRbskM1I8v2zg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFVQjZNuebKshp8FioWJseEk/YQRYZd92tWAstwwemdWbjhbIe
	x18fy2etzfmllKTv5bTnahyOU2OffFLpXUynz2kjAWvmhydRmkAzhmQZfef3/l3B0Vz1UaWby/6
	+5r50
X-Gm-Gg: AfdE7cnEStpOSG0rVsRRJCXRjFDakQr/HTs7e1S3CTSlSCiuAtdHbH5xaRguvRMc3Rr
	hlWg/UYLF4p8eQFduDvz1lrhEdyUoQ05OFSIxvPrmOZTiWuWXDJawYeSaSgy2eouaoXTtJkQlLJ
	RD7WBxPs4ZCedcmh2tZhVCUanuWzdTxd6FmmsU5otPg3/cab8NBJlXFPYiej74hPoO7ONK0Tw8N
	n5LA7WgbqdFrOa9gX2D6UfXY4ZYkOFdNXVIt7imxqr7VLR+wawvnrYoQ4lLW+OoQABPQSjmjP23
	aLWZXDkljWeRwx3461rjns8OZpgZ/g4RPyNs9EPrimlVIoNdKl6LUnS1jHpYx0380AgjYnJoICu
	1mR3NlhVeXj4XGr9ZebL/hrxmlE/6bBoX9SuR2IBuoKmIp1/Ni0TtI1Ufn1J5gczZ9mikMUInzd
	M=
X-Received: by 2002:a05:600c:4743:b0:493:bc4a:fb55 with SMTP id 5b1f17b1804b1-4954a508d60mr115272795e9.38.1784467786385;
        Sun, 19 Jul 2026 06:29:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9a7:ef90:b513:8cdd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2b87c6sm353074595e9.7.2026.07.19.06.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 06:29:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,  robh@kernel.org,
  linux-rtc@vger.kernel.org,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  linux-sunxi@lists.linux.dev,  Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  linux-clk
 <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v5 2/4] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <CAGb2v65PmMnm=gusbVRJqwHkMFAdKpFyk8coXK=pf0-dBgv8kw@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sun, 19 Jul 2026 18:59:33 +0800")
References: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
	<20260717-a733-rtc-v5-2-3874cc26abf7@baylibre.com>
	<20260717154005.444E41F000E9@smtp.kernel.org>
	<CAGb2v65PmMnm=gusbVRJqwHkMFAdKpFyk8coXK=pf0-dBgv8kw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sun, 19 Jul 2026 15:29:43 +0200
Message-ID: <1jqzkzds54.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 19 juil. 2026 at 18:59, Chen-Yu Tsai <wens@kernel.org> wrote:

>
>> > +
>> > +     } else {
>>
>> [ ... ]
>>
>> > @@ -143,3 +157,15 @@ const struct clk_ops ccu_div_ops =3D {
>> >       .set_rate       =3D ccu_div_set_rate,
>> >  };
>> >  EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
>> > +
>> > +const struct clk_ops ccu_rodiv_ops =3D {
>> > +     .disable        =3D ccu_div_disable,
>> > +     .enable         =3D ccu_div_enable,
>> > +     .is_enabled     =3D ccu_div_is_enabled,
>> > +
>> > +     .get_parent     =3D ccu_div_get_parent,
>> > +
>> > +     .determine_rate =3D ccu_div_determine_rate,
>> > +     .recalc_rate    =3D ccu_div_recalc_rate,
>> > +};
>>
>> [Severity: High]
>> Could the missing .set_parent callback in ccu_rodiv_ops lead to a silent
>> desynchronization between the software clock tree and the hardware?
>>
>> The struct provides reparenting capabilities via .get_parent and
>> .determine_rate, but omits .set_parent. If a rate request causes
>> ccu_mux_helper_determine_rate() to evaluate and select a new parent, the
>> Common Clock Framework will apply this new parent in software but skip
>> updating the hardware since .set_parent is NULL.
>
> This is an issue. I'm not sure if what Sashiko says actually happens.

I think it could. I've defenitely made a mistake here.

> But 1. this is "read-only divider", not "read-only mux & divider",

The correct way to choose between the 2 is CLK_SET_RATE_NO_REPARENT I think.

> so the .set_parent callback should be provided. And 2. this is using
> the ccu_mux_determine_rate_helper, so it's possible a clk_set_rate()
> call is going to cause a reparent.
>
> I can add it while applying if there are no other issues.

As you prefer, I don't mind sending another version in a few days
(giving some review time to patch #1)

>
> ChenYu
>
>> This would leave all downstream clock rate calculations incorrect.
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-a733-rt=
c-v5-0-3874cc26abf7@baylibre.com?part=3D2
>>

--=20
Jerome
