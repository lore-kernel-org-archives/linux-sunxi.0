Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDCF745C9
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Mar 2024 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710436863; cv=none; b=fU0UbffDi+HgP1tynk3dr5ew5iOIhvgcHv35kRSF29QlnvcN67uMRkmDd3wSed1Gae6urjbWWKoaLvKbgLhYGTCQBJqdp+3JXEsG24Yp+tA0F92dtX73OhbzZRsYef48VPThVFHaembcN+iKeIIj13e4eWxzHFz9ZxDf48BZrnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710436863; c=relaxed/simple;
	bh=uvthK6ZPHv9ziKLsWHO3MPl4ZybvCCopm0QV4LX8UkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXCSE0nveF1N1CU8n/mIC4CVrIn1ToChh5ghCazMWzOPN7XuEyySkrzWNK/QlV9w3MTMNWFYEymKHibLDcOkYYe0ojuG86hmJRD6o5p98YBikGq67Fw5llqiR6S0Bu8YIHkALSV+qh/iMxhJqPHrG5kxBe0Xec8s4NZordhcE6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdPlyGZl; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdPlyGZl"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a28a6cef709so163835066b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Mar 2024 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710436860; x=1711041660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvthK6ZPHv9ziKLsWHO3MPl4ZybvCCopm0QV4LX8UkQ=;
        b=CdPlyGZl781hlfCn8JaXHD5z2FxwX369/XlNq87pLVLca/7HN1xqZk5hF0ZgYyt89v
         FWjpyuJY9FO51cNgcyosOzlnYsVO8WCiGq1igBdxH/jOSeLw2WnYV1rexnp8kGV6ZJaS
         p6fQG/LFH1ityhHTEAhB/hiDpvR10l5wkIQZ4cM77t1dqhK8uZt/E3DQKpyP62EvmHVD
         2QQY1aeI7YW9WzhCOdmFKfuEmyxfjD1C5iYazd6U7LkoedgOBoV890yTklWip2qDLNLR
         6CryFljTi+KY5sJFGzRlZenawdXgecCJyEM0fDUHlS5Hf5EfZDMq+G9MjzcyodPbNzp1
         KCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710436860; x=1711041660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvthK6ZPHv9ziKLsWHO3MPl4ZybvCCopm0QV4LX8UkQ=;
        b=ZvoKfxWqrtS4WQQZtKrgf69ryR45QoSd3PWqlg9VRrOuCTOuKJwIYDBgn7zC+Iwu5r
         w68iIefdp9F0VNRGSCmx/uUWY0hMpSuOTfnbi6FwDaAMk1tZ43DmXm2iY7+UaMJukVnN
         6UhSs8DPo6tgdJ7iZ2Uper9USWw+7nAM84GY3X2Ta5O8tUwGMgzUzJkDJNGB12y8q4Fw
         MytpcHm3qHg9qHChYMl27v4s8vcG/GxCPdJQCNREqE+Cod8SAwsl7LHj2DrVa12x/P0I
         rTbu9Z3h4ZqNa6vyBiZ/Vqo/WSSVlF7UwIl0FCELGOsiFF/3roLF1ppIuOPkwZHm5F8P
         gOvw==
X-Forwarded-Encrypted: i=1; AJvYcCUi0VIAphZSNhOriP+BEldVO5hnnNU5z4NIkFGf7ysmuRUS5zT9+CjSVy7tC5zxUOwU6yTezMKj64efx0B8LiNkWuc/Q/1XR++g8LE=
X-Gm-Message-State: AOJu0YyTo3jYignuUI9FQ0ogUFZphYMrZfCb7qL/wK5kGwIlil0S39RY
	3svnoSfNP6yZlg5B6UTyZadfHpL13cqomrfr3QKd4atA3ZuAFK/M
X-Google-Smtp-Source: AGHT+IEwb/JV3ROy5jBsR2h0x53EOam5x48bXCQzKOeUat4Rg2BPQuqlegOQyDv9bGsdCWC9AfeGSw==
X-Received: by 2002:a17:907:2da1:b0:a45:ab9b:4a28 with SMTP id gt33-20020a1709072da100b00a45ab9b4a28mr552954ejc.60.1710436860023;
        Thu, 14 Mar 2024 10:21:00 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id o26-20020a17090608da00b00a461c637eddsm881549eje.223.2024.03.14.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 10:20:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Frank Oltmanns <frank@oltmanns.dev>, Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Icenowy Zheng <uwu@icenowy.me>, Ondrej Jirman <x@xnux.eu>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] drm/sun4i: tcon: Support keeping dclk rate upon ancestor clock
 changes
Date: Thu, 14 Mar 2024 18:20:58 +0100
Message-ID: <5448341.Sb9uPGUboI@jernej-laptop>
In-Reply-To: <20240314-careful-silky-bear-8ee43f@houat>
References:
 <20240310-tcon_keep_stable_rate-v1-1-0296b0a85c02@oltmanns.dev>
 <20240314-careful-silky-bear-8ee43f@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 14. marec 2024 ob 15:42:24 CET je Maxime Ripard napisal(a=
):
> Hi,
>=20
> On Sun, Mar 10, 2024 at 02:32:29PM +0100, Frank Oltmanns wrote:
> > Allow the dclk to reset its rate when a rate change is initiated from an
> > ancestor clock. This makes it possible to no longer to get an exclusive
> > lock. As a consequence, it is now possible to set new rates if
> > necessary, e.g. when an external display is connected.
> >=20
> > The first user of this functionality is the A64 because PLL-VIDEO0 is an
> > ancestor for both HDMI and TCON0. This allows to select an optimal rate
> > for TCON0 as long as there is no external HDMI connection. Once a change
> > in PLL-VIDEO0 is performed when an HDMI connection is established, TCON0
> > can react gracefully and select an optimal rate based on this the new
> > constraint.
> >=20
> > Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> > ---
> > I would like to make the Allwinner A64's data-clock keep its rate
> > when its ancestor's (pll-video0) rate changes. Keeping data-clock's rate
> > is required, to let the A64 drive both an LCD and HDMI display at the
> > same time, because both have pll-video0 as an ancestor.
> >=20
> > TCONs that use this flag store the ideal rate for their data-clock and
> > subscribe to be notified when data-clock changes. When rate setting has
> > finished (indicated by a POST_RATE_CHANGE event) the call back function
> > schedules delayed work to set the data-clock's rate to the initial value
> > after 100 ms. Using delayed work maks sure that the clock setting is
> > finished.
> >=20
> > I've implemented this functionality as a quirk, so that it is possible
> > to use it only for the A64.
> >=20
> > This patch supersedes [1].
> >=20
> > This work is inspired by an out-of-tree patchset [2] [3] [4].
> > Unfortunately, the patchset uses clk_set_rate() directly in a notifier
> > callback, which the following comment on clk_notifier_register()
> > forbids: "The callbacks associated with the notifier must not re-enter
> > into the clk framework by calling any top-level clk APIs." [5]
> > Furthermore, that out-of-tree patchset no longer works since 6.6,
> > because setting pll-mipi is now also resetting pll-video0 and therefore
> > causes a race condition.
>=20
> Workqueues don't have an upper boundary on when they execute. As we
> discussed multiple times, this should be solved in the clock framework
> itself, not bypassing it.

I think TCON code still needs to be touched due to clk_rate_exclusive_get()
calls which effectively lock whole chain. You can't have both TCONs locking
rate on A64 for this to work correctly.

What was original reason for clk_rate_exclusive_get()? I forgot already.

Best regards,
Jernej

>=20
> Maxime
>=20




