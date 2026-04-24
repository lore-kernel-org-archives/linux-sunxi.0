Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97033DA7CC
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Apr 2026 13:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038922; cv=pass; b=hB9MSkwFZnwi0eGkiJCG0kLnOoRtOCEekewH2XT4Pbod9sElNNqjtarIoCCV4XxootHxukuxe5qd0KfJjWbIJM+Xk64mevliz0T7tCzpc5groiHpp0JPQzjRe4jgMHH6W1ePe/zERkpc0ZQmSaeAjrk6VcozxhozZjDx/k5XQp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038922; c=relaxed/simple;
	bh=F2Sfgreqd140b+7/7jU7cKPSDXMhHuQeiyipDJjiIos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j0MJj+TbMak73e1zJOK6q3fSKRLJ0fJ9WTIOeHdY0wY4sN0g4C7CW22EJrl8hL1XIPJMMiYTqafdr+p1BfmFZaIi/8eh9jQUI0v0veshE50O7slRrVo+9ulZ766hs0WOZjTgsMvpXhvuk3VLkR00moeLaWYethG4CCIqCyQQoLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0t3DCLx; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0t3DCLx"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-694885bf090so2978302eaf.0
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Apr 2026 06:55:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777038910; cv=none;
        d=google.com; s=arc-20240605;
        b=Hzfhl0fKi7SOp+JZs261Qfb9x8regJbst0zzkuIptU2nE180xGPF8GQqSE8l86V/ME
         f6y/wfAbKhgztQsRO7du/OJkFMXrQuFLQ85Hs9TcNrtC24Dmia5Z8dH/O/Jk7CJBfHWR
         phoqUdBTCMyPSwVQBoRf9T8jiLONPD4nkx/FsSNI1NyurPfbHeNNNVuTl2rIBoKKHKJR
         icMP8VMNcwHFsc+O0Q5dr4SNSoshMXaIaUTL1j8CXPBx7PgQv5ooCBgVEcA3jpVKH4fH
         pnAPfgUi1Yc52S8nuFxHFMvq6cCAcZxfzkG8eimAv9GP8wSYqzyTLbyKbEiLOocEFI42
         V5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yw39fPCT3qzGj5AIQ5F5EFjcjfDzFEDb1o1Zmyb9i38=;
        fh=mdREzSpudGAzhv6JPypAXPRA6y2zdQcN1flijp8Holk=;
        b=SS5hPPvtnDZlMBYc6P5wLsMLgDPknInrvTSrspTxxI/IAPQQbLeD2R3MCvLNGLnM7E
         3JG4q7hK735duF6W4n3HRmjo9WDGboRHaBHiGXwJ8cV+WyC6662r55/Lavg7gmPeY+P2
         NWvB2SSmQEKiHmte5AcJpK5tJkXWC0wiJ0IVZincYVFk3SpYvC3FUfv61e05naDFNED4
         VM3Eqwg6mrPpCcMDVQSOgqFiNVqxTHFUA77ewWj3tHnb11qCHpbHktXXxi5nsdF15otA
         b30YO/RaR3ejZ7imKsncEFDug4EhMxtnqcqxRRJbUNqiJDz4095ynroE2sL8ZlFmdtUm
         GKXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777038910; x=1777643710; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yw39fPCT3qzGj5AIQ5F5EFjcjfDzFEDb1o1Zmyb9i38=;
        b=U0t3DCLx1gWUUhWQuH69MyxNL39JWK4Nh8S57XRDcBsq/qqmg9CjardsQfroShXzw8
         7ReJzsc4gfhd0aJcWsJ8KSKNbUIkMXtnpwzQZP5+3dPEmncZTaGXQuYzbnSONnTxlwQF
         ciAILT+i+Zs9cZ0oZl1Ic8FUsb7U9Q6stuiVBJ4SxSc5d70eb6idJjWQTDDhZwxnG3Pu
         JDHC/EhIkEMKLcp7V2q6YxL9Tp/T0yaFK9eUoPxqil02bSWLduw/xROjon59Sz4FotDn
         Qz1ynytPAepFhSCXf6/V7+MDRbUmtrk0XPifaBB/ATBYRB6wTUa3KcehOxhT+zhNy/qW
         l+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038910; x=1777643710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yw39fPCT3qzGj5AIQ5F5EFjcjfDzFEDb1o1Zmyb9i38=;
        b=MPORrajdrotszRQrC5ENWyz/bR9JGHdjZA+pOc70+CTKuMQirDL61xrun8P3Aiyqnd
         Zyfs8pkwnRsdyOZ2elO/Jzk9hLKoPlfphHEWyLpjvI5uL0JthN7GZXVcPwHNIgr/zYNW
         SFCHYY8932X2TSekMBKeMoZ0Xti0UQELNOqtP63k3oHUIrSXlOEjtlVLx80oHgxXTxkK
         6dJ6A0b7fnSru26FMCzZ9ZFBO0V7exmto7yJcZVga/24HHcjfaFLoOoPaOktomfNivxG
         IUV8/NiMmoqVk+K8Obqlm3qtiXUaUrcmKqBBH6TfQp+Q6ZRu/caQqkqIpyN8UKjHaAyo
         hzIw==
X-Forwarded-Encrypted: i=1; AFNElJ/hbA6xkczIr/qkwiNXcE4eaqZ72Yd3RcPgM3tb+P8818guPlC0mgOyEV1Ul78qnXcVn+DzOWYTXGfeGA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0g3uxOloRgP7629V6Ms879mHOkfFaA9wTq4pcJY0r19i7lWDz
	WPgrt92KdJuszSevj8VD3QcDl4iXNLVn6nmyR6rR9I+iwmkvFsOycK2YvZjPrp/3YHhcg+U4AbX
	CGjjTh7yIg7TFDQOWO+FM4KjuwPFwCSo=
X-Gm-Gg: AeBDietOuPpq7+/zurPG6SKv5L8iBDG4LfIsVrPcX8tUoVTdK2j1og6lXjF5x3CnLF/
	oPtWkNogAnO0HOvKcljKXxdbKFjAwvHioRJLQbwnw9LmsA5SIUQ5D0Y7Ae/yqiRT1xBfltLcbw5
	byUhT8mHJKjnrTQMso1DVsToQQcVdRayGZGVHc5frBxQSHfphWMk+34KrZcNUiLrzfrhRZJ9Bmc
	OXW+XsLX0XYHt/vjdAuBc2/JY3Jnx4m3ZHzBxlx9J8InmTqHCof7FUSTBJsI0vxVrjSjcNRQHvg
	/K6luHAMBYE9kw1smWg8m7Cn4Y5tqQ74AbYJOscHn8DZNAY0yPpSvzWQWo597E6V7Bh5ewkkgFF
	Np4RJSuRc9JNUdw==
X-Received: by 2002:a05:6820:4de7:b0:694:9a67:edf6 with SMTP id
 006d021491bc7-6949a67fadcmr9420043eaf.17.1777038910195; Fri, 24 Apr 2026
 06:55:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260217064050.18388-1-arash.golgol@gmail.com>
In-Reply-To: <20260217064050.18388-1-arash.golgol@gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Fri, 24 Apr 2026 17:25:23 +0330
X-Gm-Features: AQROBzCawSZU9BOdYpPlI1AqZnivVmdDHQlwin0eS1mu9a_t4eRrabSdWe-hL9g
Message-ID: <CAMxPZkgOGY+yaLUmFQ-mkF-qUJd6r0BKi7gf47_nALvrCR5JbA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sun6i-csi: Convert to active state and
 improve MC support
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com, linux-sunxi@lists.linux.dev, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This is a gentle ping on the series.
Link to series:
https://patchwork.kernel.org/project/linux-media/list/?series=3D1054768

--=20
Regards,
Arash Golgol

On Tue, Feb 17, 2026 at 10:11=E2=80=AFAM Arash Golgol <arash.golgol@gmail.c=
om> wrote:
>
> Hi,
>
> This series modernizes the sun6i-csi driver by aligning the bridge and
> capture components with the V4L2 subdev active state API and improving
> media controller integration.
>
> The first patch migrates the bridge driver to the V4L2 subdev active
> state framework. The private mbus_format field and its associated lock
> are removed, with the framework-managed state becoming the single
> source of truth. As part of this change, the capture driver no longer
> accesses bridge-private data directly and instead resolves the active
> format through the subdev pad API. Since the hardware does not perform
> format conversion, identical formats are enforced on both pads.
>
> The second patch implements vidioc_enum_framesizes for the capture
> device, reporting a stepwise range of even frame sizes within the
> hardware limits.
>
> The final patch adds MC-centric format enumeration support by filtering
> pixel formats based on the provided mbus code and advertises
> V4L2_CAP_IO_MC to reflect the intended usage within a media graph.
>
> Hardware testing performed on LicheePi Zero Dock (Allwinner V3s):
>
>   - Parallel pipeline (csi1):
>     ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture
>
>   - MIPI pipeline (csi0):
>     ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture
>
>
> Arash Golgol (3):
>   media: sun6i-csi: bridge: Use V4L2 subdev active state
>   media: sun6i-csi: capture: Implement vidioc_enum_framesizes
>   media: sun6i-csi: capture: Support MC-centric format enumeration
>
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 154 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  87 ++++++++--
>  3 files changed, 142 insertions(+), 108 deletions(-)
>
> --
> 2.34.1
>
