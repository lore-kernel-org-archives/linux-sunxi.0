Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF323BFE22
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Feb 2026 17:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038967; cv=none; b=ERsSrb+QDho/tLRA87NBhx/Y9GH7o7tx0aiE4fL9Iokv+7/oeBrQSHf3ROrXqcSRV12GiOoBffMHJUCbgRqhto1YldmVsrfDeSPy/VQWJ1ET3Jw8CxkrOaXdyip/2+gBf/QhK6Q/8V2JSArwYk0rsX/2rFgC92K2f6VfbNKewpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038967; c=relaxed/simple;
	bh=E6Ehhu/p48I8BFank35i0jRWbnO3y+NJ7AuacIynifc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WpkyHr3S0bk6r6oWjHG5d3rFObar3MJMydhopiNOoIun/Arq+v8EKYZ8e3s0MQqvBPdGTjiyRcqTXeJ+otU+3zLPHDpvWMDpORQIivhusXjnMLHa2HmsdJvLCd6fL97FBb9WpupsrTcI5JZlAueYIp5r8CRXHWkqdiUd1doaOGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EO0BlQp8; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EO0BlQp8"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65c01595276so10782303a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Feb 2026 09:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772038965; x=1772643765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6Ehhu/p48I8BFank35i0jRWbnO3y+NJ7AuacIynifc=;
        b=EO0BlQp8etcYWsEWjSGMhYLNcy2MY5olGLJka/9rxB046dbRa37amAPib9MzL6QUIt
         /HIwi1WuFUxa8N/ixhb7IVfJ8SmeyPFYfuR2Og1kdY9cvXTk2DyI/eT7kY+aAtdmcFta
         mP7leazdhCZS4QxMzxWZn54y/B9/so/RF9KlYFLJSMdF01cVnfkKNYLLq5ijek8WxQEy
         iS0kmDr+aQX24Cg5CxpivYbQjpcqir0aXKErfAY1yfthi7cEdAlVeqiJqRm3746uk/1m
         5t53WReMgBiI9Q8hH9zkZa788HBh8Jb5bQ+OLPiJ+u+nRGRgxrYr0UdD0ZtZjYKnPPFH
         A7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772038965; x=1772643765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6Ehhu/p48I8BFank35i0jRWbnO3y+NJ7AuacIynifc=;
        b=K+OPPTGUntwKEFj1X7DSb+KZj6d2ltUM0L407VjZNdsNPb4GAXUj1j4OIQJ41E8te6
         w73rkfnZjaKRu+QNPBZ65t4iQlGWkHlMu/CrJ9JnYuMu4iRJsSwvxZkVgTWvNg060ZHv
         tibHCYHfJeAyKVmMg3eHsCOq6gPqhhUAI+XwYnx+XikMuroMD0ESgiwIdo8xkCeO/T9s
         +FKqejQfUcIsTAqI0bIJpyAsV+Q5LaI4QCIgDwuFWkzmlO8HltVvQgX4ovIAqC+NGdTP
         7X6/wNu5AvqEmdPlLPcZgN3ifxYt6DFbwuFGMwk5KJFaIIxGHlfBEOpSbpuM+y2tKume
         Je9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7/JmbwddF5oNcsprvL3PGqrggr+juipC6Pnxkxel5k4vigG72TeV3pEV2+hVEU2fbacfwZxaeFa5u8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVLP3fzUq+jFRjesnqd6P2wtwY1NRqh6g77rzPg9gFONO1Cdq7
	RP4gttNDCytarmSgwTYhHE5A50AInpuJe16/G+vzlOneJ8Y83iKAivUx
X-Gm-Gg: ATEYQzws9ybCYa3DI+21kUAvNRYhOCDxG8//OuQrYsYEfQ5wsoPx0w0P7FDkrUOyjRx
	sqH4tumzlOxkX+UBsrj9+b3cRU2VXIbuNoIHz/KZy91rKEvfJ2LWdfH7Mlzr2/XJwE6qFjquHil
	BqdI1O+0T7XvTlA11xbxPdqZ3Ct5s/VBbPxcNoJYI6tLv7F+KfWUxeWMu6P7FSmfzaEZRj6IMSA
	KWhUT/P+pvnLWhHtB95Lm08/7NU/mQFpqABSY1NfM+4XeLfHkmN1liv2bJnPZmc+Dmv/DpaXBGF
	LUA3bogutW3yqH/mdyKxCsD7InB7MA4tIqrZ9G6Ib3N/KwAcVqHJQHpXysGHrnBrC1nu+DMBSQf
	mr2dSJBOVk1Jl5PsmDPA8MQbbB6KZ/u0/8J+sbk41uakH31LVuwgOGZDKwpTgPCSWeuKmwq/ob1
	RZckzY6xRVwKbIsjATt7o8b5Lms3+r4JKsN2dvYICscWRNkgFZw+Lt2BwdfbIf5c7CFrpRrnLLk
	0adLZQYjwmU9tv9vQ==
X-Received: by 2002:a17:907:3ea4:b0:b87:7042:9aea with SMTP id a640c23a62f3a-b935153e459mr63561566b.18.1772038964791;
        Wed, 25 Feb 2026 09:02:44 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9fb2sm35504200f8f.1.2026.02.25.09.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:02:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject:
 Re: [PATCH 3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
Date: Wed, 25 Feb 2026 18:02:41 +0100
Message-ID: <4714447.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20260225160828.1687643-4-wens@kernel.org>
References:
 <20260225160828.1687643-1-wens@kernel.org>
 <20260225160828.1687643-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 25. februar 2026 ob 17:08:26 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> The Avaota A1 board features 4 RGB LEDs in a string connected to the
> SoC's LED controller.
>=20
> Enable the LED controller and add device nodes for them. The timings
> were copied from the downstream vendor DTS. The design does not specify
> what these LEDs are for, nor are there any markings on the board for
> them, so just use them as indicators.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


