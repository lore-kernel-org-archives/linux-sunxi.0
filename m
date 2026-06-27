Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB11373C00
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Jun 2026 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542456; cv=none; b=BJhLKmz/pB1IHNYRlJJHy+w1le1RKElyZvZegWfVq/Y4IQHsGWZKUhfP6onRlFGW/2cEDko5VJ+oQMno9iPqR46MWtmTiLp7mOqD63VfydSNk54Qi9xj530Yy/qJfkonD0IbJZ7Ic5h7zWAjyqQXcOsoDYr3gQX8Re9/LJnvWRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542456; c=relaxed/simple;
	bh=4lxEbe1Kcf5HJ3vZXPZHCnhc+3o+B9n10H9oF7tgbYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RNwyOGecGEu8AXgIYJKp6cffNzi9IB03xiavBf+Gp92oU/Qq6wQcFxBn+LbRfY90DWAJ7tgGBKTXT45kAcCCNHKoFuJa3R8SQjcYOC6sTSnkWgwKnyrqauAAWLxB/1b4YSc+GEz3TIb9xBhcK32Iux+Hmqi8XO97uwpPXB3zh0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAWUVuPi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAWUVuPi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49222fb062bso18112035e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Jun 2026 23:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782542454; x=1783147254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lxEbe1Kcf5HJ3vZXPZHCnhc+3o+B9n10H9oF7tgbYE=;
        b=UAWUVuPi4TjNQgvlZV9uOmbdpreeNZ1i8JlvU6E9d9UlBAxgBuz1BjrwHta/xncA4p
         VTgDWi08a2jxVC6JbpIbw1ih4gzYEnuappVzjwmCecmY47S8Ks7mZJVlsahIjCFaj6mp
         wWen6y60ssDeFUHH6BQpqVx2ikJy+aiG97JlVE9IFg7svd75Aox7dpH6LwUoWWLf2p5+
         Magiw+80u86A29r4Y1g057kq8nQWShMvsbCc2W/hQtCG4dKV9Wrqh2whWFnZzD5Fae0r
         lEdvG5DrO26ceJWvi9MCL00wwbageAw194u1ZlnDH7VjsAKwg1XlgRXIWxT6kM6FNecO
         f6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542454; x=1783147254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lxEbe1Kcf5HJ3vZXPZHCnhc+3o+B9n10H9oF7tgbYE=;
        b=ZldjffxrHPzyvnfyzVyNP09igTKllsX2ZiM2iotffmK8rk1EY3NckjrohPg9M5/JjU
         svXKWDT2GajZdjfVu9AFKXn/yqM1a92iGJC1r25kRa12dTuAfBzC3r8gxJQfU63wx9WA
         cDOyqVKBS/3C2M+4ZL5c5jSJ4lrWE6xCfaHs2MRpEOF8UJdr6YHc8F7JXynm7CeKShoN
         DXcJsWrGotyRvz5SuQu0fuLsq7LCy7jQYYjjBEyh+OqTJ4qrKDCjC8TrR8Hksl8is4m+
         xXjlosA73sdV6T7uQmxENQYCOzkpAqU0OUo/z31mCbfrkpTAsHTvSNI0Cccxu8v7bhcV
         pkxA==
X-Forwarded-Encrypted: i=1; AFNElJ+LfLJacVkve8FnK75zmBttWygJu3IKXcZcR7Iy2EA/mglHJzSQVXHNVWvI/4B1kjUKDTRpFrNNjGbonA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8Vya2wTavzCeMDv9d0pxVDIbmdPxgXL3NhjU7DLU2MxbafpNH
	BLIzbKEs9QtqoH2SkvedOxY2R0jj+PE/ejUJx1O0moKspn2S/WMD5zH9
X-Gm-Gg: AfdE7cm0ieO+ov1zxp1m0NvgPmX89ohCXp+gjJjd7q3RuHfp8dUscXejQkT28W/8QZ9
	c3+9xbiWG7hvnm0yKpmkThJn9CaeETE8QhH2UjKirEKdj/XPmEtxfokLH3V4sJU1Rr3Sa1BV49R
	5Rpd7qv87hQhGXvuLsxHW2wI3NaUSHDLHe0s7I5foMHlAqSYNGfK3f6KnjVCi3IZqnVfS5iS1c+
	ZKJ9mBxvCUgAknpt9hO6r9NsBSG4QmhKHoO6jijjXRV5JE5nefwCaCMGZ5sLcPMBp+iqlZ2KJSj
	LARX0SnaZAqt7o0jgr98We2wDD/SkrRzzsZ0qgLN3YMcUW29PNw9mp1t+Dgtv+syYKxgMOw2Yor
	e+ThQcxnDKSHrVIi5oe7EbE2/M/5qaQGLFw9x+8f+tw0opRvQPSKWilaLTQeoXzlTuDqQsAQHT9
	UHZmbVCEHGjpAR4j1Tuj5wlkRDOZUj89fvZUXSxmUb6KN/Y5ssdPJ60ONvR/gc3FO99N6l0xGKS
	Xub
X-Received: by 2002:a05:600d:6454:10b0:490:e243:4806 with SMTP id 5b1f17b1804b1-49266866378mr115051425e9.9.1782542453864;
        Fri, 26 Jun 2026 23:40:53 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm131006755e9.8.2026.06.26.23.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:40:53 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: pengpeng@iscas.ac.cn, Samuel Holland <samuel@sholland.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: sunxi-rsb: fail hardware init on soft-reset timeout
Date: Sat, 27 Jun 2026 08:40:52 +0200
Message-ID: <xeoeYUbJQDS7SBkqsEa63Q@gmail.com>
In-Reply-To: <20260625003416.15841-1-pengpeng@iscas.ac.cn>
References: <20260625003416.15841-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. junij 2026 ob 02:34:16 Srednjeevropski poletni =C4=8D=
as je Pengpeng Hou napisal(a):
> sunxi_rsb_hw_init() issues a controller soft reset and waits for the reset
> bit to clear, but it ignores readl_poll_timeout()'s return value.
>=20
> If the controller never leaves reset, probe can continue to publish child
> devices and system resume can report success without a usable RSB
> controller.
>=20
> Return the timeout error, assert reset again, and disable the clock before
> leaving the hardware-init path.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


