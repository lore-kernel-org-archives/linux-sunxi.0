Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E032F361F
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997827; cv=none; b=E4wbUGXpyVdRD26rZlhx20Z3BpWVElFSahy66W/U/w/WYy3z2bxhaueHaliK3KK35R5lp/3BbJHzQ/5DytYiGTXYBLQzQo5iYfG+Sjd1hVtw7Xeg3QkWVvrbqCbOGgKEPBaLdOVrMziVi8M2XyFR6TsNyE/mWgI6uBBaCjS+rR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997827; c=relaxed/simple;
	bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mymEybHaH3V0hKKWv4Nmclcd5yJMRfcI0WFPNSZZjHBkajB46AvuJUUjU/6U/4+M7vBk0nZwVE8R8URC/lIYLQHoRR1JNLENtOu6RKi+rrqzbYotzmAdudPRAd9tBD+W17jk1I1/owSqJdhcGsE8E+Kxh4bRRaCMGCwwXOwtbp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+0IrwBL; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+0IrwBL"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so7403247a12.3
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 09:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997821; x=1778602621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
        b=D+0IrwBLgfSHeXKrJhH+l3SZDnv2dhsJ+IBSybX/AeJMoj2XW8pHOquodtW+iV2XzW
         77F9yWTI9P+1OAZf2pjKH56Uxi+1PNOoBOwj3yAUzCOOlB5E4k3gaVaytuSRdlP15CFL
         RoiWcI937J3WxTjO03EHqUHUAT/UIbdWlzss/ZCTLmjTUckAlBU2uxAlOjgLCGOXMs9J
         dInFJ3yMdP0BJwSn1u5BhoWjwta9xWlhfvyqHkAKV9JgwLTj4d3mv6wHbE8emr5IgScx
         LveqY0tQ5LD9FtYUxbPYSzc9zWVA6KMe6UDJudJJSeqVT3G2ySBuwM51NCuQ0feuzAg5
         6hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997821; x=1778602621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
        b=cLnJ6v8synD9TvuHp759EFvze0r2f+9krB8KBIqY7kt3gwKyhxPXm9q1UpgCM6Sqe+
         BHfRL2rLx2dorO1ZkQLrbScWsb9DLGJpGxx62tgd78qJf2FPJfUlBiiCUhEsfhjq4XwP
         5285oV8mJAn/7GLZGFbq8GoGIaSC2You4QKVgu8oOvG871Ry+YPWIuo8yxgBMYjxgmP3
         vMfb13lxdl/xNnAqPzNs53ETFB9rlE0ZkgEDmj7aOR4C+dLt2IPbYN+p3tE8wnV080vs
         42kdLHmk0065g+DGc6fbWjUlTQFwhZjPt2EJsEzhYrqld3dzadmXdmH7b6tgvSWWkRVQ
         H/9A==
X-Forwarded-Encrypted: i=1; AFNElJ/+xYvpWax1K2Q7kF6ivAl+UjLyCOtS2PUB+v19I48PrPupl0FnoTXkzsVgkfaoAp9AzxzUH6WaVVfMtw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8Lhfm/oJOmmzb7zhLKGmlnqgEUu09Smceygnfun0wZu1kVYOk
	yfGYMK7L4dLsEl3tHqw2dI3cLVTeuN4qFJXIH7Eg1+grpDAp6L8qpj0m
X-Gm-Gg: AeBDiet8AckSdKh82NSOj9hI4/n7LRSYKhN69L75Tzv3toxABe8oy//Kfx6XUXqBZ+H
	sOJTY/+XDNhRU2J50AyxfHEUbeafauN1AP98uo1Vm8FR6igd6nbZFnhzWmYnACM6QggZtY/Hat/
	u9QWMx78/theksCGh/GeYYWFLDh5LYKhV317pNsTb1VectUzia+fP3G4vza2syeL9Ez7GeYQ8KI
	8/pCTVVaw1hgBfKOwL014dZmbTXuW67jnOHSizF35zt1IYi2R235EERFKQH8J4337RoGYzKZtN+
	WlK1t0swU0X372032y041icgX8N3pfbjBZ0l4g0RzTZQSJe3+ijbczTbyDFETv1L1lBosWxqnrg
	AJq4kQjJVC36kK30M7dVzdDU7kHiUOb4UUiFoCMUIjowajubj3OQR0wshTKimc1rV/+wAPvtWCi
	s9g3NDYTi/Vyh54cJteYhFL8ec0X7xTHYVbkohMN/vyey6nd7RY5HkNiuyC+O/ViwVfer7HbM7H
	tj0+ZuSddrDwotbmWk=
X-Received: by 2002:aa7:d319:0:b0:677:866c:6bb2 with SMTP id 4fb4d7f45d1cf-67c1a2e5f85mr5124227a12.16.1777997820593;
        Tue, 05 May 2026 09:17:00 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91d5727sm554894a12.29.2026.05.05.09.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:16:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616
 compatible
Date: Tue, 05 May 2026 18:16:56 +0200
Message-ID: <GgrksnDEQem0uehnTU2lzw@gmail.com>
In-Reply-To: <20260505134812.408316-4-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:07 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The H616 contains a video engine similar to past SoCs.

Maybe add that it's first to support VP9?

>=20
> Add a new compatible for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Either way:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


