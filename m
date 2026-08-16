Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122283A1A23
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Aug 2026 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786906803; cv=none; b=LsjkV8S59OtprOfCXQgumX/ZxlEDaU4WGYrwEIDFTqjeK8iwADWC+IYugEPW/s7ay6MWufhERByE5dl9d1LnkvZpCwicN3Ao9wY1dz+0Q3LTGTDOxPtTG3SKifJHHbUj/DFOCgjrAt2tQoKgaenlSrGVgVw9qrRNLjdxOGQtR7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786906803; c=relaxed/simple;
	bh=nNF0ZohFHrdNjPFvzMMf9M0Qx1wQqpUmQ72xm+Xx+Js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BZHbNT4nXirSRln2HWQhLQWlqEJJJQPnnH3lJAyYN2OIqsKxy6O0fDr8QpVjGWIbrIEzdCRI5e4Cqq3cPIL5C/MiAj4vzNgLr0BZl8tA7kfz9cYNLobPXsPcY9SFFWakB5di7Esu/6wTAci51PTI4xxNgwn23N0vXUt04QGzfuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXG8+kV8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXG8+kV8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so13536735e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Aug 2026 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786906800; x=1787511600; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNF0ZohFHrdNjPFvzMMf9M0Qx1wQqpUmQ72xm+Xx+Js=;
        b=bXG8+kV8U+zaZqoDTHE4gKfoF1E+YjtlhQ94IWza4eAS7S0T5/O0RCse/sry0k4aqP
         Gsrt8SeyVoDGR6QCwW/usZjq3FOEH1aVBnk4YLbbW/wPSUCLqVGZ75FWuaOUgXpuiPwU
         uY4rn8RXYN9f3tcOVbCaOnF7ynlnHtbtwwrF2j9s6SESav3mVYK//5xND0IdrWoXcq4R
         35Fx2sevvLRnCTadgfxXEBVUX72sVJGyzwP0gH6k3qDwzTbJLdmXpGj96WM8/3UdN31i
         uKZP7ZtOfE7MYz49Mn3XNS5zvg+tpvG707N6LCCND0Jv9sb8FXeQ3HyLIJQoiygqjkBA
         5j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786906800; x=1787511600;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNF0ZohFHrdNjPFvzMMf9M0Qx1wQqpUmQ72xm+Xx+Js=;
        b=pOnMJHqi/jXjun4BcSLPtfQ7Y25u6WJ8VUl3jTes4x8aP6uqMVrFFPDhQBHZNd8RV3
         5mWJIC9jvSfcpL2nykHh4V0EdVHK5XxBrhT10xoYemsFzxmCyzW69Ow/AW0S4qe9glzQ
         rEBtkr8phOgt4cr7OhpZ74Osm+rI8mirE1vkNMbukibgoRLGKK5cGLkaBbTDZBLGvKs8
         5He5z1QmbPCSGR3h9pauzdGHBvh+NLJH/K9gl00L5OlWfTyRs4ngQLSnW6MdiZNMqx+F
         kP4bvu9psRtjXgqO2wAtDdZw5s5ofM3x5eW7ZNBmAr0tDlJrJWOOBLQkj0ppzEHlmwIt
         bUjg==
X-Forwarded-Encrypted: i=1; AHgh+RpZ/d5WIOCdprK0lDpqnCCLjF5QgBiOaL5IqVPcHeSGs/Wt8tx3IMDneNj3jucTClQSoVlQyJL8SndJbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9R5CHDQpzFRdOhdQjCxwfoXW+qDNgS/3yx/Xa5khHbpGJwav5
	C47YF24hYBp6tCNonveIEm2x2MNrtuqJAF6QyV4oLJsNt0xFtO2FRxLa
X-Gm-Gg: AR+sD13EZwPjNOxWpoLgWApW0LZkmgAb0Tq/XxjV6Fv9OcOmFd1CovnP/vY2OtEplzZ
	dryeqeT82imlf0jTVTxKsJmp4tQPdPiucxgs3OGiRi5Sfs7MewHvn9tAPIFxQklRcA8dxNOj2Mh
	/8yCheJRQ6fH9YmEXfQiGAgKgPAZrQJvtrlAvj4+bnlDcL+wZ9b4ejQEDFDGUBZji+6g2QpX59K
	Jski88pyepBAv4AFrpkNuoSfecF1lxQI8SkEIFxoxayFrHiYIFvsezMZic8MTxB1T1IFKbo3yAJ
	h93+4agkugi9zy88OTXEiSaqxoquerNwK1IWkuvbHPhPgQljOuo0ATfgNg5vkknTQk3c6Ur12Kw
	p8cHnSGtltmQD9SyTp3wWumLQUY9k/gyTgVBnYzOmFhMh0gW/jZVyPAFZbYUzeCHGbOAm5c6Klu
	+uaawPSrY1NCGDeRje6B6kUWPzqqnoAfYJjwFf+UYrPRcOOGpmnuDBV+Isp1WJ4iM/U8b9OaTmh
	Ux/WcxJ1P4d432rNYHjvYl34pA3hxQkCDlAQBd5p02iCWv4u5zcewJcpQkAlGuMx++GhTsEnwfR
	G74pszvUlkaWO9678xMZ+kWaxnckrF7ACU5pVR3AwKaeQMi1AbFJnjItqpgZt6/N6s6vuwvfme3
	lAAgFT+gm4lc8A4okj3sWOaR8jQqo7NV7xcIN624VZ/Z3Z7ptNXZSZ7hFN/04LIhc8K+Isgm9P/
	DBo7pQAyF/4w43kHe0KF2lAsk=
X-Received: by 2002:a05:600c:1c21:b0:499:90f3:13b8 with SMTP id 5b1f17b1804b1-49990f315e9mr145661775e9.12.1786906800076;
        Sun, 16 Aug 2026 12:00:00 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-100-59-gprs.simobil.net. [46.122.100.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996100184sm105325425e9.1.2026.08.16.11.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 11:59:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, samuel@sholland.org, Roman Riabenko <roman@riabenko.com>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Roman Riabenko <roman@riabenko.com>
Subject: Re: [PATCH] arm64: dts: allwinner: sun50i-a64-olinuxino: Add RX delay
Date: Sun, 16 Aug 2026 20:59:57 +0200
Message-ID: <n0N02vZgTVK3duHBgrvA0w@gmail.com>
In-Reply-To: <20260815005316.28998-1-roman@riabenko.com>
References: <20260815005316.28998-1-roman@riabenko.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 15. avgust 2026 ob 02:53:16 Srednjeevropski poletni =C4=8Das je=
 Roman Riabenko napisal(a):
> The Ethernet on Olimex A64-OlinuXino computers requires an RX delay
> greater than 0. If the value is not set or is 0, packet loss in the
> downlink direction is severe enough to interfere with downloads and
> disrupt software installation.
>=20
> The range of acceptable values is wide. The vendor has been applying
> 200 ps in its downstream DTs since 2021. This patch matches that
> common practice.
>=20
> Signed-off-by: Roman Riabenko <roman@riabenko.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


