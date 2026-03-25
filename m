Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0580C43147
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 00:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398545; cv=none; b=HF5awYkZ/fDL5LNMTJRP5AXBlaVJrKQjxQNa5899ktmApX1sXQKZNelQn4o/IMLTbAYPV0F8Uytcc/1R0f1R0rrGTCdetTM2oXEgxSTZKMhaOsOfe862GomuqdYcW8buOlTFgCpLtcPIul/CpbTdhgu//XZgHBtSPIoY8PfIU1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398545; c=relaxed/simple;
	bh=+W2l6HF6dMk2sjxzN6yjkAVU0JUCRJ2zSiQX38l0Uk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BvlHnm4qy1CsMPkaog3BWTVOBP8W0bYbcUSAgiZ3zXe9nQxrv3fipoHWyT0LuOx22zzuseysb3rccaPti2I/oJJ0YU5WMVdZpNvZN/7XnxgRxbznFdx7MKh0hUgPvHP9u0LlMn2PcO6ZWDtUrY5Ifu5mo19xM/Esl1dIT4Bt0Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Np0Bihxg; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Np0Bihxg"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8d006a80ccbso1142085a.2
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 17:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398543; x=1775003343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+W2l6HF6dMk2sjxzN6yjkAVU0JUCRJ2zSiQX38l0Uk8=;
        b=Np0Bihxg91MtdC/X9Yv9NeifVmotJZxV8FLqDhtZbtOHtjRRpN9YnFUMMsvkRJxwrH
         PxHGkKtJUWGDJFmib2XvHY1gdkJpnZs27SAV+lazVxGaU4uunVgwCmjBNAwPtWr+tI6y
         wFpJGpR0YqVEoepc1SMIEBMJAxziDBLNA5U+01eoogQoTp7LPE27etUJ8VYXPSGPNKwi
         oK27KmlnLP15N2+QkQwxkUwS03YQ8xO3qyfmUqfLPYYzKG3gdNrYiqvFyZHq8g87+0Bv
         a9G6fK6u+EP3gmjHXkFhJHoj2Ea/7XXQO/SMNZjeQU5O7xbQ5vayfp8dFlt8ie0ENats
         eEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398543; x=1775003343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+W2l6HF6dMk2sjxzN6yjkAVU0JUCRJ2zSiQX38l0Uk8=;
        b=R5YfOA/qKUBCapDDRQ/4i164INMqoxwtuostmzzDflTLTL7NT2toaeBkN3Rgl5IzQE
         bgBD06e+pb6l6svOOtEi2ZWM0a4r0CCnu8io3vAZpheaFG8fGGPGrS2cF1i7cTcpC9E6
         Jg24CARKkJgRaYelO4NvUpH2Je9IuXlxYJ8leMzZK3r9mtYDPbHyseF2GcdCM3QxHGYK
         ICY1LrOTMJgRIuxhiiwHIPRwRkPTMjV7/hI0iq1248SSzPGbqG1lJujm7KqlnZ8DPlDC
         gg5UShmMbqEyQq3feBvr71E6ejTikad8DuzBcxvR9QfY3/eRQSo1pEBzKWNqLXQJhmz5
         9l9A==
X-Forwarded-Encrypted: i=1; AJvYcCWMN4jgOgMRb533j9jqtGHkKtIvncXnW5EjHJxcOP7aRgPWSAg4yg1yn25OEGiLL3rs8ugVTM7RaUam3A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2J1PhfSfTYR3gTAOwle8p0fbjYcHtAYER1CMZBWhruA/UqwAj
	k2WmYdovXxaiafqpXV/dXXvHR6O8SfgwRs6cDqEjGuHQpVMT90juoWgT
X-Gm-Gg: ATEYQzwqrBGtTpWoxIHh3YAHkkkjmVmQKN4m5mBMElrbuicqRSaWbQIAhoMNkOtXT9W
	ehqUhIfDDsXv3kHzbfUX0blzXo77b+0TfIbmUahnCFdjU5T6tdbKCxTUjZXZGmVx3UkpxGxIsmv
	nhglpTJ+9hFybRVsPpnEHVHJWDNVo+0cmymR1YG4atiEK6X3ak2EFCICVJ5VVwt/dye/X4GpJUs
	QUzIW1uledkvTdPXk445QoXP7Oa1a0fL3oeV1cdTteZqj167CiUODJ6msvv4jFBkNuE9hloLKZm
	SbWbsKo9vdnwhQwktIKlbFK/qabMVLavDdrIDwZFzSg51jFdQnsNaglNYDnRsCxYjGHXq64uqoC
	MZNiPbbIzLvXJ9PCLvH1S8YaRer/K8UOHJq7Ad4xjG/kDRf6LDk77OsTael0TQ9QHKi9LON1yt5
	7wUVN7DAx57ZAeSprri8BYY7pncmu3hw7/yO24orJjNPCVtuFhCLP/fBloQjwU+8J+Umie0r0eQ
	2BDVI5XPZu9nw==
X-Received: by 2002:a05:620a:1788:b0:8cf:b7c2:fd20 with SMTP id af79cd13be357-8d000ed1743mr238935385a.11.1774398542974;
        Tue, 24 Mar 2026 17:29:02 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90bb7f0sm1172723985a.38.2026.03.24.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:29:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 5/7] soc: sunxi: sram: Support claiming multiple regions per
 device
Date: Wed, 25 Mar 2026 01:28:59 +0100
Message-ID: <7923014.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20260324164357.1607247-6-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:53 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> On the H616, the video engine needs to claim two SRAM regions.
>=20
> Support claiming multiple regions per device.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


